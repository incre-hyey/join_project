package join.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import join.dao.UserDAO;

@Transactional
@Service("userService")
public class UserService {

	@Autowired
	UserDAO userDAO;
	public void getTotal(){
		userDAO.getList();
		System.out.println("**********************");
	}
}
