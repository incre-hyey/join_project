package join.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import join.service.FileService;
import join.service.UserService;
import join.service.UtilService;
import join.vo.UserVO;


@Controller
public class ChatControl{
	@Resource(name="userService")
	UserService userService;
	@Resource(name="fileService")
	FileService fileService;
	
	@RequestMapping("/chatList")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		
		if(request.getSession().getAttribute("USER") == null){
			mv.setViewName("redirect:afterSession");
		}
		//System.out.println(((UserVO)request.getSession().getAttribute("USER")).getJsonStr());
		//DAO 로직
		int page=1;
		String category = "0";
		String search = "";
		
		if(request.getParameter("type") != null && request.getParameter("type").equals("NODE")){
			//노드로 부터 요청받았을 경우 ( paging , search )
			//histoList.ejs 페이지 내에서 보내주는 값이 있음
			page = Integer.parseInt(request.getParameter("page"));
			category = request.getParameter("category");
			search = request.getParameter("search");
		}
			
		
		mv.addObject("page",page);
		mv.addObject("category",category);
		mv.addObject("search",search);
		mv.setViewName("chat/chatList");//뷰 지정

		return mv;
	}
	@RequestMapping("/chatHistory")
	public ModelAndView history(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mv = new ModelAndView();
		if(request.getSession().getAttribute("USER") == null){
			mv.setViewName("redirect:afterSession");
		}
		
		int page=1;
		String category = "0";
		String search = "";
		String in_start = "";
		String in_end = "";
		String out_start = "";
		String out_end = "";
		
		if(request.getParameter("type") != null && request.getParameter("type").equals("NODE")){
			page = Integer.parseInt(request.getParameter("page"));
			category = request.getParameter("category");
			search = request.getParameter("search");
			in_start = request.getParameter("in_start");
			in_end = request.getParameter("in_end");
			out_start = request.getParameter("out_start");
			out_end = request.getParameter("out_end");
		}else{
			Calendar c = Calendar.getInstance();
			String defaultEndDate = UtilService.getFormatDate("YYYY-MM-dd", c.getTime());
			c.add(Calendar.MONTH, -1);
			String defaultStartDate = UtilService.getFormatDate("YYYY-MM-dd", c.getTime());
			in_start = defaultStartDate;
			in_end = defaultEndDate;
			out_start = defaultStartDate;
			out_end = defaultEndDate;
		}
		
		
		mv.addObject("page",page);
		mv.addObject("category",category);
		mv.addObject("search",search);
		mv.addObject("in_start",in_start);
		mv.addObject("in_end",in_end);
		mv.addObject("out_start",out_start);
		mv.addObject("out_end",out_end);
		mv.setViewName("chat/chatHistory");//뷰 지정

		return mv;
	}

	
	@RequestMapping("/chatUserImg")
	public ModelAndView chatUserImg(HttpServletRequest request, HttpServletResponse response){

		String fileid = (String)request.getParameter("file_id");
		//fileStr = fileStr.replaceAll("\\\\", "\\");
		fileService.viewFile(response, fileid, "USER");
		
		ModelAndView mv = new ModelAndView();
		//mv.addObject("page",page);
		mv.setViewName("userImg");//뷰 지정

		return mv;
	}
}






