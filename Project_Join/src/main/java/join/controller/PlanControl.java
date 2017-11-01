package join.controller;



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
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");	
		// 유저정보 가져오기
		
		//DAO 로직
		PlanVO[] ar = planservice.getList(userVO.getIdx());		 
		ModelAndView mv = new ModelAndView();		
		
		mv.addObject("list", ar);		
		mv.addObject("userVO",userVO);		
		mv.setViewName("plan/plan");//뷰 지정		
		
		return mv;
	}
	

	@RequestMapping(value="/plan_write",method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {	
		// 처음 '글쓰기'버튼을 눌렀을때 오는 곳
		
		//DAO 로직				
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		String nickName = userVO.getNickname();	
		//System.out.println(nickName);
	
		ModelAndView mv = new ModelAndView();	
		mv.addObject("userVO", userVO);
		mv.setViewName("plan/plan_write");//뷰 지정
		
		return mv;			
	}	
	
	@RequestMapping(value="/plan_write",method=RequestMethod.POST)
	public ModelAndView write_ok(HttpServletRequest request, @ModelAttribute PlanVO planVO) throws ParseException{	
		//'글쓰기'화면에서 '저장'을 눌렀을때 오는 화면		
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");	
		//System.out.println(userVO.getFile_id());
		FileVO fileVO = fileService.uploadFile(planVO.getUpload(),"PLAN");
		
		//System.out.println(fileVO.getFile_name());	
		
		planVO.setWriter_idx(planVO.getWriter_idx());
		planVO.setFile_id(fileVO.getIdx());	// 파일의 id가져옴			
		planVO.setContent(planVO.getContent());
		planVO.setTitle(planVO.getTitle());  		
		planVO.setLocation1(planVO.getLocation1());
		planVO.setLocation2(planVO.getLocation2());
		planVO.setWriter(planVO.getWriter());
		planVO.setIdx(UtilService.makeKey()); //plan_idx키 발생
		planVO.setStatus("1");
		planVO.setLongitude(planVO.getLongitude());
		planVO.setLatitude(planVO.getLatitude());
		planVO.setTnop(planVO.getTnop());
		planVO.setPlan_kind(planVO.getPlan_kind());
		planVO.setStart_date(planVO.getStart_date());
		
		// '일정' 구하기
		String stringEnd  = request.getParameter("enddate");		
		String finaldate = stringEnd+"00";
		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-ddhhmmss");
		SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = null;
			try{
			date = fmt.parse(finaldate);
		//	System.out.println("========>"+date);
			}catch(Exception e){
				e.printStackTrace();
			}
		String d_date = fmt1.format(date);
		//System.out.println(d_date+"d_date 두번째 String");
		
		planVO.setEnd_date(d_date);	
		
		//DAO 로직
		planservice.addPlan(planVO);	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userVO", userVO);		
		mv.setViewName("redirect:/plan");//뷰 지정	
		 
		return mv;
	}

	@RequestMapping("/plan_view")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PlanVO planVO){	
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		//System.out.println(userVO.getNickname());
		
		//DAO 로직		
		String idx = request.getParameter("idx");
		PlanVO pvo = planservice.viewPlan(idx, userVO.getIdx());				
		
		ModelAndView mv = new ModelAndView();	
		
		mv.addObject("vo", pvo);
		mv.addObject("userVO", userVO );		
		mv.setViewName("plan/plan_view");//뷰 지정			
		return mv;
	}
	
	@RequestMapping(value="/appPeople",method=RequestMethod.GET)
	public ModelAndView appPeople(HttpServletRequest request, HttpServletResponse response){
		
		Map<String, String> map = new HashMap<String, String>();
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		String u_idx = userVO.getIdx();
				System.out.println(u_idx+"poepleeeeeeeee");
		String plan_idx = request.getParameter("idx");
				System.out.println(plan_idx+"선택된 plan idx 값/////");
		String status = "0";
		//String idx = UtilService.makeKey();

		map.put("u_idx",u_idx);
		map.put("plan_idx", plan_idx);
		map.put("status",status);
		//map.put(idx, "idx");
		
		planservice.appPoeple(map);				
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);
		mv.addObject("userVO", userVO);
		mv.setViewName("redirect:/plan_view?idx="+plan_idx);	
		
		return mv;
	}
	
	@RequestMapping("/planEdit")
	public ModelAndView planEdit(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PlanVO planVO){
		
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		
		String u_idx = userVO.getIdx();

		
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
}






