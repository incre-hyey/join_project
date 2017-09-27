package join.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import join.dao.PlanDAO;
import join.dao.UserDAO;
import join.service.PlanService;
import join.service.UserService;
import join.vo.PlanVO;


@Controller
public class PlanControl{

	@Resource(name="planService")
	PlanService planservice;
	
	@RequestMapping("/plan")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){	
		
		//DAO 로직
		PlanVO[] ar = planservice.getList();
		ModelAndView mv = new ModelAndView();
		//request.setAttribute("list", ar);
		mv.addObject("list", ar);
		mv.setViewName("plan/plan");//뷰 지정
		//바꿈 테스트sdfjsdkfjsdlkfj
		
		return mv;
	}
	
	@RequestMapping(value="/plan_write",method=RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response){	
		// 처음 '글쓰기'버튼을 눌렀을때 오는 곳
		//DAO 로직
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("plan/plan_write");//뷰 지정
		
		
		return mv;
	}
	
	@RequestMapping(value="/plan_write",method=RequestMethod.POST)
	public ModelAndView write_ok(PlanVO pvo){	
		//'글쓰기'화면에서 '저장'을 눌렀을때 오는 화면
		
		//DAO 로직
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/plan");//뷰 지정
	
		
		return mv;
	}

	@RequestMapping("/plan_view")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response){	
		
		//DAO 로직
		
		
		ModelAndView mv = new ModelAndView();	
	
		mv.setViewName("plan/plan_view");//뷰 지정
		
		
		return mv;
	}
}






