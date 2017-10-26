package join.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import join.dao.ProfileDAO;
import join.vo.UserVO;

@Service("profileService")
public class ProfileService {

	@Autowired
	ProfileDAO profileDAO;
	
	
	public List<UserVO> getTotal(){
		return profileDAO.getProfile();
	}


	public List<UserVO> getProfile(String userid, String type){
		HashMap<String,String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("targettype", "PROFILE");
		map.put("type", type);
		return profileDAO.getUserList(map);
	}
}
