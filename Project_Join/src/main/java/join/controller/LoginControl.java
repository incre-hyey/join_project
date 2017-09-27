package join.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
								UserVO userVO){
		
		request.getSession().setAttribute("loginyn", "Y");
		request.getSession().setAttribute("userVO", userVO);
		
		//DAO 로직
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");//뷰 지정
		//바꿈 테스트sdfjsdkfjsdlkfj
		return mv;
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response){
		request.getSession().setAttribute("loginyn", "N");
		request.getSession().setAttribute("userVO", null);
		
		return "index";
	}
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






