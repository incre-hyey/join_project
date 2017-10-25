package join.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import join.service.FileService;
import join.service.UserService;
import join.service.UtilService;
import join.vo.FileVO;
import join.vo.UserVO;

@Controller
public class UserControl {

	@Resource(name="userService")
	UserService userService;
	
	@Resource(name="fileService")
	FileService fileService;
	
	
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
		FileVO fileVO = fileService.uploadFile(userVO.getUpload(),"USER");
		
		userVO.setFile_id(fileVO.getIdx());
		userVO.setIdx(UtilService.makeKey());	
		userVO.setIp(request.getRemoteAddr());
		userVO.setStatus("1");
		userVO.setReg_date(new Date());
		//DAO 로직
		userService.addUser(userVO);
		
		
		return "redirect:index";
	}
	
	/**
	 * 정보 수정 페이지
	 * @param request
	 * @param response
	 * @param userVO
	 * @return
	 
	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest request, HttpServletResponse response){
		//
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		//DAO 로직
		UserVO vo = userService.getUser(userVO.getId());
		
		request.setAttribute("vo", vo);
		return "redirect:index";
	}
	*/
	/**
	 * user 정보 수정
	 * @param request
	 * @param response
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/modify")
	public String modify(HttpServletRequest request, HttpServletResponse response,
						@ModelAttribute UserVO userVO){
		
		//userVO 세팅
		FileVO fileVO = fileService.uploadFile(userVO.getUpload(), "USER");
		
		userVO.setFile_id(fileVO.getIdx());
		userVO.setIdx(UtilService.makeKey());		
		userVO.setIp(request.getRemoteAddr());
		userVO.setStatus("1");
		userVO.setReg_date(new Date());
		//DAO 로직
		userService.addUser(userVO);
		
		
		return "redirect:index";
	}
	
}
