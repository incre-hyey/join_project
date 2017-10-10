package join.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import join.service.UserService;
import join.vo.UserVO;


@Controller
public class ChatControl{
	@Resource(name="userService")
	UserService userService;
	
	@RequestMapping("/chatList")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		
		System.out.println(((UserVO)request.getSession().getAttribute("userVO")).getJsonStr());
		//DAO 로직
		
		int page=1;
		if(request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("page",page);
		mv.setViewName("chat/chatList");//뷰 지정
			
		return mv;
	}
	@RequestMapping("/chatHistory")
	public ModelAndView history(HttpServletRequest request, HttpServletResponse response){
		//DAO 로직
		System.out.println(((UserVO)request.getSession().getAttribute("userVO")).getJsonStr());
		int page=1;
		if(request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("page",page);
		mv.setViewName("chat/chatHistory");//뷰 지정

		return mv;
	}

}






