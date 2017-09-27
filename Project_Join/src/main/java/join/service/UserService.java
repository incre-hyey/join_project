package join.service;

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


}
