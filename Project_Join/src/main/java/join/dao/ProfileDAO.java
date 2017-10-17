package join.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import join.service.FileService;
import join.service.UtilService;
import join.vo.UserVO;


public class ProfileDAO{
	@Autowired
	SqlSession sqlSession;
	
	public List getProfile(){
		List<UserVO> list = (ArrayList) sqlSession.selectList("user.getProfile");

		System.out.println(list.size());
		return list;
	}
	
	public void insertUser(UserVO userVO){
		
		sqlSession.insert("user.insert", userVO);
	}
	

	public List<UserVO> getUserList(Map<String, String> map){
		return sqlSession.selectList("user.getUser", map);
	}
	
	public void updateLoginYn(UserVO userVO) {
		
		sqlSession.update("user.loginyn" , userVO);
	}
}
