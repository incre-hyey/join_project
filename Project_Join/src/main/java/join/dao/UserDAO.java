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
import join.vo.PlanVO;
import join.vo.UserVO;


public class UserDAO{
	@Autowired
	SqlSession sqlSession;
	
	public List getList(){
//		Map<String,String> list = (Map<String, String>) sqlSession.selectList("user.totalUser");
		List<UserVO> list = (ArrayList) sqlSession.selectList("user.getUser");
//		for(HashMap<String,String> map : list){
//			
//		}
		
		System.out.println(list.size());
		return list;
	}
	
	public void insertUser(UserVO userVO){
		
		sqlSession.insert("user.insert", userVO);
	}
	

	public UserVO getUser(String id){
		return sqlSession.selectOne("user.getUser", id);
	}
	public List<UserVO> getUserList(Map<String, String> map){
		return sqlSession.selectList("user.getUserList", map);
	}
	
	public void updateLoginYn(UserVO userVO) {
		
		sqlSession.update("user.loginyn" , userVO);
	}
	
	public List<PlanVO> getMyPlanList(String id){
		return sqlSession.selectList("user.getMyPlanList", id);
	}
	public List<HashMap> getPlanReq(String id){
		return sqlSession.selectList("user.getPlanReq", id);
	}
}
