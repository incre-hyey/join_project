package join.controller;



import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import join.dao.PlanDAO;
import join.dao.UserDAO;
import join.service.FileService;

import join.service.PlanService;
import join.service.UserService;
import join.service.UtilService;
import join.vo.FileVO;
import join.vo.MsgVO;
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
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PlanVO planVO){		
		
		String useridx = "";
		if(request.getSession().getAttribute("USER") != null) {
			UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
			useridx = userVO.getIdx();
		}
		String search = UtilService.getValue(request.getParameter("search"), "");
		String paging = UtilService.getValue(request.getParameter("paging"), "1"); 	
		String pagingHtml = "";
		
		int total = planservice.getTotalPlan(search);
		
		PlanVO[] ar = planservice.getList(useridx, Integer.parseInt(paging), 5, search);		
		if(paging != "")
			pagingHtml = UtilService.pagingHTML(total, Integer.parseInt(paging), 10, 5);
		
		ModelAndView mv = new ModelAndView();		
		
		mv.addObject("list", ar);		
		mv.addObject("search", search);
		mv.addObject("userVO",useridx);		
		mv.setViewName("plan/plan");//뷰 지정
		mv.addObject("pagingHtml" , pagingHtml);
		mv.addObject("paging" , paging);
		
		return mv;
	}
	
	// 처음 '글쓰기'버튼을 눌렀을때 오는 곳
	@RequestMapping(value="/plan_write",method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {	
		
		
		//DAO 로직				
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		String nickName = userVO.getNickname();	
		
	
		ModelAndView mv = new ModelAndView();	
		mv.addObject("userVO", userVO);
		mv.setViewName("plan/plan_write");//뷰 지정
		
		return mv;			
	}	
	
	// '글쓰기' 저장을 눌렀을때 post방식
	@RequestMapping(value="/plan_write",method=RequestMethod.POST)
	public ModelAndView write_ok(HttpServletRequest request, @ModelAttribute PlanVO planVO) throws ParseException{	
		//'글쓰기'화면에서 '저장'을 눌렀을때 오는 화면		
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");		
		FileVO fileVO = fileService.uploadFile(planVO.getUpload(),"PLAN");		

		
		planVO.setWriter_idx(planVO.getWriter_idx());
		if(fileVO != null)
			planVO.setFile_id(fileVO.getIdx());	// 파일의 id가져옴		

		planVO.setIdx(UtilService.makeKey()); //plan_idx키 발생
		planVO.setStatus("1");		
		
		// '일정' 구하기
		String stringEnd  = request.getParameter("enddate");	
		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy/MM/dd");
		
		Date date = null;
			try{
			date = fmt.parse(stringEnd);
	
			}catch(Exception e){
				e.printStackTrace();
			}
		String d_date = fmt1.format(date);
		planVO.setEnd_date(d_date);	
	
		
		//DAO 로직
		planservice.addPlan(planVO);	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userVO", userVO);		
		mv.setViewName("redirect:/plan");//뷰 지정	
		 
		return mv;
	}

	// plan 상세보기
	@RequestMapping("/plan_view")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PlanVO planVO){	
		
		String useridx = "";
		if(request.getSession().getAttribute("USER") != null) {
			UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
			useridx = userVO.getIdx();
		}
		
		String paging = request.getParameter("paging");		
		String idx = request.getParameter("idx");
		PlanVO pvo = planservice.viewPlan(idx, useridx);				
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", pvo);
		mv.addObject("paging", paging);
		mv.addObject("userVO", useridx );		
		mv.setViewName("plan/plan_view");//뷰 지정		
		
		return mv;
	}
	
	// '참가신청'을 눌렀을때
	@RequestMapping(value="/appPeople",method=RequestMethod.GET)
	public ModelAndView appPeople(HttpServletRequest request, HttpServletResponse response){
		
		Map<String, String> map = new HashMap<String, String>();
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		
		String u_idx = userVO.getIdx();				
		String plan_idx = request.getParameter("idx");				
		String status = "0";
		String paging = request.getParameter("paging");		

		map.put("u_idx",u_idx);
		map.put("plan_idx", plan_idx);
		map.put("status",status);		
		
		planservice.appPoeple(map);				
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);
		mv.addObject("userVO", userVO);
		mv.addObject("paging", paging);
		mv.setViewName("redirect:/plan_view?idx="+plan_idx);	
		
		return mv;
	}
	
	// '수정하기'버튼을 눌렀을때 
	@RequestMapping(value="/planEdit", method=RequestMethod.GET)
	public ModelAndView planEdit(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PlanVO planVO) throws Exception {
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		String writer_idx =userVO.getIdx();
		String idx = request.getParameter("idx");
		String p_pwd = request.getParameter("p_pwd");
		String paging = request.getParameter("paging");			
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("writer_idx", writer_idx);
		map.put("idx", idx);
		map.put("p_pwd", p_pwd);

		
		PlanVO planvo = planservice.editPlan(map);		
		
		String  file_id = planvo.getFile_id();		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", planvo);
		mv.addObject("paging", paging);
		mv.addObject("file_id", file_id);
		mv.setViewName("plan/plan_Edit");
		
		return mv;
	}
	
	// '수정하기' 저장 버튼을 눌렀을때 
		@RequestMapping(value="/edit_OK", method=RequestMethod.POST)
		public ModelAndView edit_OK(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PlanVO planVO){
			
			// 파일을 업로드 했는지 확인하기
			String isFileChg = request.getParameter("isFileChg");
			String paging = request.getParameter("paging");		
			if(isFileChg.equals("Y")){				
				//fileVO
				FileVO fileVO = fileService.uploadFile(planVO.getUpload(),"PLAN");
				
				//planVO 의 file_id에 새로운 file_id담기
				planVO.setFile_id(fileVO.getIdx());	// 파일의 id가져옴	
				
			}else{
				String ori_fileid = request.getParameter("ori_fileid");
				planVO.setFile_id(ori_fileid);
			}
			
			//planvo update
			planVO.setWriter_idx(planVO.getWriter_idx());
			planVO.setContent(planVO.getContent());
			planVO.setStatus("1");
			
			// '일정' 구하기
			String stringEnd  = request.getParameter("end_date");				
			
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy/MM/dd");
			
			Date date = null;
				try{
				date = fmt.parse(stringEnd);		
				}catch(Exception e){
					e.printStackTrace();
				}
			String d_date = fmt1.format(date);
			
			planVO.setEnd_date(d_date);	
			
			int cnt = planservice.editOK(planVO);
			
			ModelAndView mv = new ModelAndView();
			
			if(cnt == 0)
				cnt = 1;
			mv.addObject("paging", paging);
			mv.setViewName("redirect:/plan");			
					
			return mv;
		}
		
		//삭제하기
		@RequestMapping(value="/delete", method=RequestMethod.POST)
		public ModelAndView delete(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PlanVO planVO){
			
			String paging = request.getParameter("paging");			
			planservice.delete(planVO);			
			
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("paging", paging);
			mv.setViewName("redirect:/plan");
			
			return mv;
		}	
		
}






