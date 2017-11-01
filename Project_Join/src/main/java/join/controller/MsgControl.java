package join.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import join.dao.MsgDAO;
import join.service.MsgService;
import join.service.UserService;
import join.vo.UserVO;
import join.vo.MsgVO;


@Controller
public class MsgControl{
	
	
	@Resource(name="msgService")
	MsgService msgService;
	
	@Autowired
	HttpSession session;
	

	@RequestMapping("/messageMain")
	public ModelAndView messageMain(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute MsgVO msgVO) {
		
		//String importUrl = (String)request.getAttribute("importUrl");
		String menu = (String)request.getParameter("menu");
		
		ModelAndView mv = new ModelAndView();
		switch(menu) {
		case "WRITE":
			mv.addObject("importUrl", "/views/msg/message.jsp");
			break;
		case "ADD" :
			mv = msgSend(request, response, mv, msgVO);
			break;
		case "RCV" :
			mv = getRcvList(request, response, mv);
			break;
		case "SEND" :
			mv = getSendList(request, response, mv);
			break;
		case "DEL" :
			//mv = msgDel(request, response, mv, msgVO);
			break;
		}
		mv.setViewName("msg/messageBtn");
		mv.addObject("menu", menu);
		return mv;
	}
	
	
	public ModelAndView getSendList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		UserVO userVO = (UserVO)session.getAttribute("USER");
		
		ArrayList<MsgVO> list = (ArrayList<MsgVO>)msgService.getSendList(userVO.getId());
		
		//ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("importUrl","/views/msg/sendmessage.jsp");
		//mv.setViewName("msg/sendmessage");
		
		return mv;
		
	}
	/**
	 * 받은 편지함
	 * @param request
	 * @param response
	 * @param mv
	 * @return
	 */
	public ModelAndView getRcvList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv)  {
		
		UserVO userVO = (UserVO)session.getAttribute("USER");
		
		ArrayList<MsgVO> list = (ArrayList<MsgVO>)msgService.getRcvList(userVO.getId());
		
		mv.addObject("list",list);
		mv.addObject("importUrl","/views/msg/receivemessage.jsp");
		
		return mv;
		
	}
	
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, ModelAndView mv){
		
		int page=1;
		if(request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		
//		ModelAndView mv = new ModelAndView();
		//mv.addObject("page",page);
		mv.addObject("importUrl","/views/msg/message.jsp");
		//mv.setViewName("msg/message");//뷰 지정
			
		return mv;
	}
	/**
	 * 메세지 발송
	 * @param request
	 * @param response
	 * @param mv
	 * @param msgVO
	 * @return
	 */
	public ModelAndView msgSend(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			MsgVO msgVO){
		
		System.out.println("msgVO.getTitle() : " + msgVO.toString());
//		String rcvStr = (String)request.getAttribute("rcvList");
		UserVO userVO = (UserVO)session.getAttribute("USER");
		
		try {
			msgService.addMsg(msgVO,userVO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return getSendList(request, response, mv);
	}
	
	public ModelAndView msgDel(HttpServletRequest request, HttpServletResponse response,ModelAndView mv,
			 MsgVO msgVO) {
				
		msgService.delMsg(msgVO);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("msg/sendmessage");
		return mv;
		
	}
}






