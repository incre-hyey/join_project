package join.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import join.service.FileService;
import join.service.UserService;
import join.service.UtilService;
import join.vo.UserVO;


@Controller
public class LoginControl{
	@Resource(name="userService")
	UserService userService;
	
	@Resource(name="fileService")
	FileService fileService;
	
	@Autowired
	HttpSession session;
	
	/**
	 * 로그인
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/loginAjax", method=RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response){
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String ip = request.getLocalAddr();
		//DAO 로직
		UserVO userVO = userService.loginUser(id, pwd, ip);
		String viewMsg = "";
		if(userVO != null) {
			session.setAttribute("USER", userVO);
			session.setAttribute("LOGINYN", "Y");	
		}else
		{
			viewMsg = "아이디와 비밀번호를 확인 바랍니다.";
		}
		
		return viewMsg;
	}
	
	/**
	 * 로그아웃
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response){
		request.getSession().invalidate();
//		request.getSession().setAttribute("loginyn", "N");
//		request.getSession().setAttribute("userVO", null);
		
		return "index";
	}
	/**
	 * 세션체크후 로그인 페이지 메시지와 함께 이동
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/afterSession")
	public String afterSession(HttpServletRequest request, HttpServletResponse response){
		
		request.getSession().invalidate();
		request.setAttribute("msgClose", UtilService.getValue((String)request.getParameter("msgClose"), ""));
		request.setAttribute("viewMsg", "로그인을 해주세요");
		return "index";
	}


}






