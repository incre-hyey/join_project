package join.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import join.service.ProfileService;
import join.vo.UserVO;

@Controller
public class ProfileControl {

	@Autowired
	ProfileService profileService;
	
	@RequestMapping("/profile")
	public ModelAndView list(){
		
		//DAO 로직
		ArrayList<UserVO> list = (ArrayList<UserVO>)profileService.getTotal();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("us/profile");//뷰 지정
		mv.addObject("list", list);
		
		return mv;
	}
}
