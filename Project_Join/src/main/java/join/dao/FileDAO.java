package join.dao;

import java.util.List;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import join.vo.FileVO;


public class FileDAO {
	@Autowired
	SqlSession sqlSession;
	public void insertFile(FileVO fileVO){
		
		sqlSession.insert("file.insert", fileVO);
	}
	public FileVO getFile(String id, String module){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("idx", id);
		map.put("module", module);
		return sqlSession.selectOne("file.getFile", map);
	}
}
