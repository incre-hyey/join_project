package join.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import join.service.UserService;


@Controller
public class PlanControl{
	@Resource(name="userService")
	UserService userService;
	
	@RequestMapping("/plan")
	public ModelAndView list(){
		
		//DAO 로직
		System.out.println("####"+userService.toString());
		userService.getTotal();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("plan/plan");//뷰 지정
		//바꿈 테스트sdfjsdkfjsdlkfj
		return mv;
	}

}






