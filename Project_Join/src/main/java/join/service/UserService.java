package join.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import join.dao.UserDAO;
import join.vo.UserVO;

@Transactional
@Service("userService")
public class UserService {

	@Autowired
	UserDAO userDAO;
	
	
	public void getTotal(){
		
		userDAO.getList();
		
		
		System.out.println("**********************"+ userDAO.toString());
	}
	public void addUser(UserVO userVO){
		userDAO.insertUser(userVO);
	}
	
	public UserVO getUser(String id){
		UserVO userVO = userDAO.getUser(id);
		return userVO;
	}
	public UserVO loginUser(String id, String pwd, String ip) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		List<UserVO> list = userDAO.getUserList(map);
		UserVO vo = null;
		if(list.size() == 1) {
			vo = list.get(0);
			vo.setLoginyn("Y");
			vo.setLogin_date(new Date());
			vo.setIp(ip);
			//login 정보 update
			userDAO.updateLoginYn(vo);
		}
		
		return vo;
	}
	
	

}
