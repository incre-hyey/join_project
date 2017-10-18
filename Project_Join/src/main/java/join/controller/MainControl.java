package join.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import join.service.UserService;
import join.service.UtilService;
import join.vo.UserVO;


public class MainControl implements Controller{

	public MainControl() {
		System.out.println("****MainControl****");
	}
	
	// /index로 들어올때
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println(((UserVO)request.getSession().getAttribute("userVO")).getJsonStr());
		//페이지 유효성을 위해 TOKEN 생성 추가
		
		String Token = UtilService.makeKey();
		request.getSession().setAttribute("TokenKey", Token);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		
		
		return mv;
	}
	
}






