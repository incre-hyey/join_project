package join.service;

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
}
