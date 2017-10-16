package join.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import join.dao.PlanDAO;
import join.dao.UserDAO;
import join.service.FileService;
import join.service.PlanService;
import join.service.UserService;
import join.service.UtilService;
import join.vo.PlanVO;
import join.vo.UserVO;


@Controller
public class PlanControl{

	@Resource(name="planService")
	PlanService planservice;
	
	@Resource(name="fileService")
	FileService fileService;
	
	//'join.plan'버튼을 눌렀을 때 게시판에 나열 될 것들
	@RequestMapping("/plan")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){		
		
		//DAO 로직
		PlanVO[] ar = planservice.getList();
		if(ar.length > 0)
		System.out.println(ar.length);
		ModelAndView mv = new ModelAndView();
		//request.setAttribute("list", ar);
		mv.addObject("list", ar);
		
		mv.setViewName("plan/plan");//뷰 지정		
		
		return mv;
	}
	
	@RequestMapping(value="/plan_write",method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {	
		// 처음 '글쓰기'버튼을 눌렀을때 오는 곳
		
		//DAO 로직		
		String userid = "aaaa";
		//String userid = request.getParameter("idx");
		ModelAndView mv = new ModelAndView();	
		mv.addObject("userid", userid);
		mv.setViewName("plan/plan_write");//뷰 지정
		return mv;
		
		//mv.addObject("w_idx", idx);
				
	}	
	@RequestMapping(value="/plan_write",method=RequestMethod.POST)
	public ModelAndView write_ok(HttpServletRequest request, @ModelAttribute PlanVO planVO){	
		//'글쓰기'화면에서 '저장'을 눌렀을때 오는 화면
		
		//UserVO userVO = (UserVO) request.getSession().getAttribute("userVO");
		
		String uploadFile = fileService.uploadFile(planVO.getUpload(),planVO.getWriter());
		
		planVO.setOri_name(planVO.getUpload().getOriginalFilename());
		planVO.setFile_name(uploadFile);
		//planVO.setIdx(UtilService.makeUID(userVO.getId()));
		planVO.setLocation1(request.getRemoteAddr());
		planVO.setStatus("1");
		//planVO.setReg_date(new Date());
		
		//DAO 로직
		planservice.addPlan(planVO);		
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("redirect:/plan");//뷰 지정	
		 
		return mv;
	}

	@RequestMapping("/plan_view")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response){	
		
		//DAO 로직
		//String content = request.getParameter("content");
		//System.out.println(content.toString());
		String idx = request.getParameter("idx");
		PlanVO pvo = planservice.viewPlan(idx);		
		ModelAndView mv = new ModelAndView();		
		mv.addObject("vo", pvo);
		mv.setViewName("plan/plan_view");//뷰 지정			
		return mv;
	}
}






