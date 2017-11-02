package join.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import join.service.FileService;
import join.service.PlanService;
import join.service.UserService;
import join.service.UtilService;
import join.vo.FileVO;
import join.vo.PlanVO;
import join.vo.UserVO;


@Controller
public class MainControl{
	
	@Resource(name="fileService")
	FileService fileService;
	
	@Resource(name="planService")
	PlanService planService;
	
	public MainControl() {
		System.out.println("****MainControl****");
	}
	
	// /index로 들어올때
	@RequestMapping("/index")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//
		//페이지 유효성을 위해 TOKEN 생성 추가
//		String Token = UtilService.makeKey();
//		request.getSession().setAttribute("TokenKey", Token);
		
		
		//1. 최신 플랜 리스트 
		List<HashMap> planList = planService.getMainPlan();
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("mainPlanList", planList);
		mv.setViewName("index");
		
		
		return mv;
	}
	
	@RequestMapping("/viewImg")
	public void viewImg(HttpServletRequest request, HttpServletResponse response){
		String fileid = (String)request.getParameter("fileid");
		String module = (String)request.getParameter("module");
		//fileStr = fileStr.replaceAll("\\\\", "\\");
		fileService.viewFile(response, fileid, module);
	}
	

	@RequestMapping("/summerFileUpload")
	@ResponseBody
	public HashMap<String, Object> summerFileUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("upload") MultipartFile upload) {
		FileVO fileVO = fileService.uploadFile(upload, "SUMMER");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("url", fileVO.getUrl());
		map.put("fileid", fileVO.getIdx());
		map.put("src", request.getContextPath()+"/viewImg?fileid="+fileVO.getIdx()+"&module=SUMMER");

		return map;
	}
	
}






