package join.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
		
		//FileVO fileVO = fileService.uploadFile(planVO.getUpload(),"PLAN");
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		//DAO 로직
		PlanVO[] ar = planservice.getList();
		//if(ar != null && ar.length > 0)
		//System.out.println(ar.length);
		ModelAndView mv = new ModelAndView();
		//request.setAttribute("list", ar);
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
		//String nickName = userVO.getNickname();	
	
		ModelAndView mv = new ModelAndView();	
		mv.addObject("userVO", userVO);
		mv.setViewName("plan/plan_write");//뷰 지정
		
		return mv;			
	}	
	
	@RequestMapping(value="/plan_write",method=RequestMethod.POST)
	public ModelAndView write_ok(HttpServletRequest request, @ModelAttribute PlanVO planVO){	
		//'글쓰기'화면에서 '저장'을 눌렀을때 오는 화면		
		
/*		String longitude  = request.getParameter("longitude");
		String latitude   = request.getParameter("latitude");
		System.out.println("위도:"+latitude+"경도"+longitude);*/
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");			
		FileVO fileVO = fileService.uploadFile(planVO.getUpload(),"PLAN");
		//System.out.println(fileVO.getFile_name());		
		
		planVO.setFile_id(fileVO.getIdx());	// 파일의 id가져옴			
		planVO.setContent(planVO.getContent());
		planVO.setTitle(planVO.getTitle());
		//System.out.println(planVO.getTitle());
		planVO.setLocation1(planVO.getLocation1());
		planVO.setLocation2(planVO.getLocation2());
		planVO.setWriter(planVO.getWriter());
		planVO.setIdx(UtilService.makeKey()); //plan_idx키 발생
		//planVO.setLocation1(request.getRemoteAddr());
		planVO.setStatus("1");
		planVO.setLongitude(planVO.getLongitude());
		planVO.setLatitude(planVO.getLatitude());
		planVO.setTnop(planVO.getTnop());

		
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
		PlanVO pvo = planservice.viewPlan(idx);				
		
		ModelAndView mv = new ModelAndView();	
		
		mv.addObject("vo", pvo);
		mv.addObject("userVO", userVO );		
		mv.setViewName("plan/plan_view");//뷰 지정			
		return mv;
	}

	
}






