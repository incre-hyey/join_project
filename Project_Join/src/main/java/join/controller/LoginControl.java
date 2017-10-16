package join.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			request.getSession().setAttribute("userVO", userVO);
			request.getSession().setAttribute("loginyn", "Y");	
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
	 * 회원가입
	 * @param request
	 * @param response
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/register")
	public String userRegister(HttpServletRequest request, HttpServletResponse response,
						@ModelAttribute UserVO userVO){
		//userVO 세팅
		String uploadFile = fileService.uploadFile(userVO.getUpload(), userVO.getId());
		
		userVO.setOri_name(userVO.getUpload().getOriginalFilename());
		userVO.setFile_name(uploadFile);
		userVO.setIdx(UtilService.makeUID(userVO.getId()));		
		userVO.setIp(request.getRemoteAddr());
		userVO.setStatus("1");
		userVO.setReg_date(new Date());
		//DAO 로직
		userService.addUser(userVO);
		
		
		return "redirect:index";
	}

}






