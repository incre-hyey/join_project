package join.controller;

import java.util.ArrayList;
import java.util.Base64.Encoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import join.dao.MsgDAO;
import join.service.MsgService;
import join.service.UserService;
import join.service.UtilService;
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
		
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("USER") == null){
			mv.setViewName("redirect:afterSession?msgClose=y");
			return mv;
		}
		
		String menu = (String)request.getParameter("menu");
		
		switch(menu) {
		case "WRITE":  
			String receiver = UtilService.getValue(request.getParameter("reply"), "");
			String content = UtilService.getValue(request.getParameter("content"), "");
			mv.addObject("userid",receiver);
			mv.addObject("content",content);
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
			mv = msgDel(request, response, mv);
			break;
		case "VIEW" :
			mv = viewMsg(request, response, mv);
			break;
		}
		mv.setViewName("msg/messageBtn");
		mv.addObject("menu", menu);
		mv.addObject("m_m","LOG");
		return mv;
	}
	
	/**
	 * 보낸 쪽지함
	 * @param request
	 * @param response
	 * @param mv
	 * @return
	 */
	public ModelAndView getSendList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		
		UserVO userVO = (UserVO)session.getAttribute("USER");
		
		String search = UtilService.getValue(request.getParameter("search"), "");
		String paging = UtilService.getValue(request.getParameter("paging"), "1"); 
		
		int total = msgService.getRcvTotal(userVO.getId(), search);
		ArrayList<MsgVO> list = (ArrayList<MsgVO>)msgService.getSendList(userVO.getId(),search,Integer.parseInt(paging), 10);
		String pagingHtml = "";
		if(paging != "")
			pagingHtml = UtilService.pagingHTML(total, Integer.parseInt(paging), 10, 10);
		
		mv.addObject("list",list);
		mv.addObject("importUrl","/views/msg/sendmessage.jsp");
		mv.addObject("search" , search);
		mv.addObject("pagingHtml" , pagingHtml);
		mv.addObject("paging" , paging);
		
		return mv;
		
	}
	/**
	 * 받은 쪽지함
	 * @param request
	 * @param response
	 * @param mv
	 * @return
	 */
	public ModelAndView getRcvList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv)  {
		
		UserVO userVO = (UserVO)session.getAttribute("USER");
		String search = UtilService.getValue(request.getParameter("search"), "");
		String paging = UtilService.getValue(request.getParameter("paging"), "1"); 
				
		int total = msgService.getRcvTotal(userVO.getId(), search);
		ArrayList<MsgVO> list = (ArrayList<MsgVO>)msgService.getRcvList(userVO.getId(),search,Integer.parseInt(paging), 10);
		String pagingHtml = "";
		if(paging != "")
			pagingHtml = UtilService.pagingHTML(total, Integer.parseInt(paging), 10, 10);
		
		mv.addObject("list",list);
		mv.addObject("importUrl","/views/msg/receivemessage.jsp");
		mv.addObject("search" , search);
		mv.addObject("pagingHtml" , pagingHtml);
		mv.addObject("paging" , paging);
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
	/**
	 * 쪽지 삭제
	 * @param request
	 * @param response
	 * @param mv
	 * @return
	 */
	public ModelAndView msgDel(HttpServletRequest request, HttpServletResponse response,ModelAndView mv) {
		String idx = request.getParameter("idx");
		UserVO userVO = (UserVO)session.getAttribute("USER");
		msgService.delMsg(idx, userVO.getId());
		
		return getRcvList(request,response,mv);
		
	}
	/**
	 * 쪽지 상세 
	 * @param request
	 * @param response
	 * @param mv
	 * @return
	 */
	public ModelAndView viewMsg(HttpServletRequest request, HttpServletResponse response,ModelAndView mv) {
		String idx = request.getParameter("idx");
		UserVO userVO = (UserVO)session.getAttribute("USER");
		String type = request.getParameter("type");
		String search = UtilService.getValue(request.getParameter("search"), "");
		String paging = UtilService.getValue(request.getParameter("paging"), "1");
		
		List<MsgVO> voList = msgService.getMsg(idx,userVO.getId(),type);
		List<MsgVO> rcvList = new ArrayList<MsgVO>();
		switch(type) {
		case "RCV":
			//읽음처리
			msgService.updateSendDate(userVO.getId(), idx);
			break;
		case "SEND":
			for(MsgVO vo : voList) {
				rcvList.add(vo);//수신자
			}
			break;
		}
		
		mv.addObject("importUrl","/views/msg/viewmessage.jsp");
		mv.addObject("list",voList);
		mv.addObject("type" , type);
		mv.addObject("vo", voList.get(0));
		mv.addObject("rcvList", rcvList);
		mv.addObject("search" , search);
		mv.addObject("paging" , paging);
		return mv;
		
	}
	@RequestMapping("/userMsgCheckAjax")
	@ResponseBody
	public int userMsgCheck(HttpServletRequest request, HttpServletResponse response){
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("USER");
		
		int result = msgService.msgCheck(userVO.getId());
		
		return result;
	}
}






