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
	public int insertMsgRcv(List mapList) throws Exception{
		Map param = new HashMap();
		param.put("list", mapList);
		int result = sqlSession.insert("msg.insertRcv", param);

		return result;
		
	}
	
	public List getSendList(Map map){
		List<MsgVO> list = (ArrayList) sqlSession.selectList("msg.getSendList",map);

		return list;
	}
	public int getSendTotal(Map map){
		return sqlSession.selectOne("msg.totalSendList",map);
	}
	
	public List getRcvList(Map map) {
		List<MsgVO> list = (ArrayList) sqlSession.selectList("msg.getRcvList",map);
		
		return list;
		
	}
	public int getRcvTotal(Map map) {
		return sqlSession.selectOne("msg.totalRcvList",map);
	}
	
	public void delMsg(Map map){
		sqlSession.delete("msg.deleteRcv", map);
	}
	public List<MsgVO> selectMsg(Map map){
		return sqlSession.selectList("msg.getMsg", map);
	}
	
	public void updateSendDate(Map map){
		sqlSession.update("msg.sendDateUpdate",map);
	}
	
	public int getRcvMsgCount(String userid) {
		return sqlSession.selectOne("msg.getRcvMsgCount",userid);
	}
	
}
