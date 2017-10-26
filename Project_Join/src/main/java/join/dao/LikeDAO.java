package join.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import join.vo.LikeVO;
import join.vo.UserVO;

public class LikeDAO {
	@Autowired
	SqlSession sqlSession;
	

	public int insertLike(Map<String,String> map){
		
		return sqlSession.insert("like.insert", map);
	}
	public int deleteLike(Map<String,String> map){
		
		return sqlSession.delete("like.delete", map);
	}
	public LikeVO getLike(Map<String,String> map){
		
		return (LikeVO)sqlSession.selectOne("like.select", map);
	}
}
