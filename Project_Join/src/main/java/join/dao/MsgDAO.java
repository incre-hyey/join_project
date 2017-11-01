package join.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import join.service.FileService;
import join.service.UtilService;
import join.vo.MsgVO;
import join.vo.UserVO;


public class MsgDAO{
	@Autowired
	SqlSession sqlSession;
	
	public void insertMsg(Map map){

		sqlSession.insert("msg.insert", map);
		
	}
	public int insertMsgRcv(List mapList){
		Map param = new HashMap();
		param.put("list", mapList);
		return sqlSession.insert("msg.insertRcv", param);
		
	}
	
	public List getSendList(Map map){
		List<MsgVO> list = (ArrayList) sqlSession.selectList("msg.getSendList",map);

		return list;
	}
	
	public List getRcvList(Map map) {
		List<MsgVO> list = (ArrayList) sqlSession.selectList("msg.getRcvList",map);
		
		return list;
		
	}
	
	public void delMsg(MsgVO msgVO){
		sqlSession.delete("msg.del", msgVO);
	}
	
	
	

}
