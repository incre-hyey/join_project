package join.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import join.dao.LikeDAO;
import join.vo.LikeVO;
import join.vo.UserVO;

@Transactional
@Service("likeService")
public class LikeService {

	@Autowired
	LikeDAO likeDAO;
	
	/**
	 * 
	 * @param userId : 사용자 idx
	 * @param target :찜 타겟 idx  
	 * @param type : 타겟 타입
	 */
	public int addProfile(String userId, String target, String type){
		HashMap<String,String> map = new HashMap<>();
		map.put("idx", UtilService.makeKey());
		map.put("userid", userId);
		map.put("targetid", target);
		map.put("targettype", type);
		return likeDAO.insertLike(map);
	}
	public int deleteProfile(String userId, String target, String type){
		HashMap<String,String> map = new HashMap<>();
	//map.put("idx", UtilService.makeKey());
		map.put("userid", userId);
		map.put("targetid", target);
		map.put("targettype", type);
		return likeDAO.deleteLike(map);
	}
	public LikeVO getLike(String userid, String target, String type) {
		HashMap<String,String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("targetid", target);
		map.put("targettype", type);
		return likeDAO.getLike(map);
		
	}
}
