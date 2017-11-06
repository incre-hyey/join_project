package join.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
import join.vo.PlanVO;
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
		if( fileVO != null )
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
	 **/
	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest request, HttpServletResponse response){
		//
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		
		//DAO 로직
		HashMap map = new HashMap();
		map.put("idx", userVO.getIdx());
		UserVO vo = userService.getUser(map);
		
		request.setAttribute("vo", vo);
		return "user/userInfo";
	}
	
	/**
	 * user 정보 수정
	 * @param request
	 * @param response
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/modifyUser")
	public String modify(HttpServletRequest request, HttpServletResponse response,
						@ModelAttribute UserVO userVO){
		String isFileChange = request.getParameter("isFileChange");
		//userVO 세팅
		if(isFileChange.equals("Y")){
			FileVO fileVO = fileService.uploadFile(userVO.getUpload(),"USER");
			if( fileVO != null )
				userVO.setFile_id(fileVO.getIdx());
			else
				userVO.setFile_id("");
		}
		else
		{
			userVO.setFile_id(request.getParameter("orifile"));
		}
		
		//DAO 로직
		userService.modifyUser(userVO);
		
		
		return "redirect:index";
	}
	/**
	 * MY PLAN
	 * @param request
	 * @param response
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/myPlan")
	public String myPlan(HttpServletRequest request, HttpServletResponse response){
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		if(userVO == null)
			return "/afterSession";
		//DAO 로직
		List<HashMap> list = userService.getMyPlan(userVO.getIdx());	
		request.setAttribute("list", list);
		request.setAttribute("m_m","LOG");		
		return "user/myPlan";
	}
	
	/**
	 * 신청자 수락/거절
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/userReqResAjax")
	@ResponseBody
	public String userReqResAjax(HttpServletRequest request, HttpServletResponse response){
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		if(userVO == null)
			return "/afterSession";
		
		String idx = request.getParameter("idx");
		String status = request.getParameter("status");
		//DAO 로직
		int result = userService.planReqUpdate(idx,status);
		String str = "";
		if(result==1){
			str = status;
		}
		
		return str;
	}
	/**
	 * 신청자 정보 상세 보기
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/userView")
	public String userView(HttpServletRequest request, HttpServletResponse response){
		
		String idx = request.getParameter("useridx");
		HashMap map = new HashMap();
		map.put("idx", idx);
		UserVO userVO = userService.getUser(map);
		request.setAttribute("userVO", userVO);
		request.setAttribute("m_m","LOG");
		return "user/userView";
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/myReq")
	public String myReq(HttpServletRequest request, HttpServletResponse response){
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		if(userVO == null)
			return "/afterSession";
		//DAO 로직
		List<HashMap> list = userService.getMyReq(userVO.getIdx());	
		request.setAttribute("list", list);
		request.setAttribute("m_m","LOG");
		return "user/myReq";
	}
	@RequestMapping("/myReqCancelAjax")
	@ResponseBody
	public String myReqCancelAjax(HttpServletRequest request, HttpServletResponse response){
	
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		if(userVO == null)
			return "/afterSession";
		
		String idx = request.getParameter("idx");
		//DAO 로직
		int result = userService.myReqCancel(idx);
		String str = "";
		if(result==1){
			str = "OK";
		}
		
		return str;
	}
	
}
