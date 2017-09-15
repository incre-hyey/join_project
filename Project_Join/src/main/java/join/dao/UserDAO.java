package join.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;


public class UserDAO {
	@Autowired
	SqlSession sqlSession;
	
	public void getList(){
//		Map<String,String> list = (Map<String, String>) sqlSession.selectList("user.totalUser");
		List<HashMap> list = (ArrayList) sqlSession.selectList("user.totalUser");
		for(HashMap<String,String> map : list){
			
		}
		
		System.out.println(list.size());
		
	}
	
	
}
