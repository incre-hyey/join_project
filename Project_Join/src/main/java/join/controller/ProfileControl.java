package join.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import join.service.LikeService;
import join.service.ProfileService;
import join.service.UtilService;
import join.vo.LikeVO;
import join.vo.UserVO;

@Controller
public class ProfileControl {

	@Autowired
	ProfileService profileService;
	
	
	@Autowired
	LikeService likeService;
	
	@RequestMapping("/profile")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		
		String useridx = "";
		if(request.getSession().getAttribute("USER") != null) {
			UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
			useridx=userVO.getIdx();
		}
		
		//DAO 로직
		String type = UtilService.getValue((String)request.getParameter("type"), "1");
		ArrayList<UserVO> list = (ArrayList<UserVO>)profileService.getProfile(useridx,type);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("us/profile");//뷰 지정
		mv.addObject("list", list);
		mv.addObject("MENU" , "US");
		mv.addObject("paging", UtilService.getValue((String)request.getParameter("paging"),"1"));
		mv.addObject("type", type);
		mv.addObject("m_m","PROFILE");
		return mv;
	}
	
	
	
	@RequestMapping("/usLike")
	@ResponseBody
	public String usLike(HttpServletRequest request, HttpServletResponse response){
		
		String userid = request.getParameter("userid");
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		if(userVO == null)
			return "/afterSession";
		//DAO 로직
		//1. T_LIKE에 저장되었는지 확인 
		String type ="";
		LikeVO likeVO = likeService.getLike(userVO.getIdx(), userid, "PROFILE");
		type = (likeVO==null)?"0":"1";
		//2. insert or delete 처리
		int result = 0;
		switch(type){
		case "1" :
			result = likeService.deleteProfile(userVO.getIdx(), userid, "PROFILE");
			break;
		case "0" : 
			result = likeService.addProfile(userVO.getIdx(), userid, "PROFILE");
			break;
		}
		return String.valueOf(result);
	}
}
