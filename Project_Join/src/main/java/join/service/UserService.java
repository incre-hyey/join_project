package join.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import join.dao.UserDAO;
import join.vo.PlanVO;
import join.vo.UserVO;

@Transactional
@Service("userService")
public class UserService {

	@Autowired
	UserDAO userDAO;
	
	
	public void getTotal(){
		
		userDAO.getList();
		
		
		System.out.println("**********************"+ userDAO.toString());
	}
	public void addUser(UserVO userVO){
		userDAO.insertUser(userVO);
	}
	public void modifyUser(UserVO userVO){
		userDAO.updateUser(userVO);
	}
	
	public UserVO getUser(Map map){
		UserVO userVO = userDAO.getUser(map);
		return userVO;
	}
	public UserVO loginUser(String id, String pwd, String ip) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		List<UserVO> list = userDAO.getUserList(map);
		UserVO vo = null;
		if(list.size() == 1) {
			vo = list.get(0);
			vo.setLoginyn("Y");
			vo.setLogin_date(new Date());
			vo.setIp(ip);
			//login 정보 update
			userDAO.updateLoginYn(vo);
		}
		
		return vo;
	}
	/**
	 * myPlan 작성내역
	 * @param id
	 * @return
	 */
	public List<HashMap> getMyPlan(String id){
		List<HashMap> planList = userDAO.getMyPlanList(id);
		return planList;
	}
	/**
	 * myplan 신청현황
	 * @param id
	 * @return
	 */
	public List<HashMap> getMyReq(String id){
		List<HashMap> reqList = userDAO.getPlanReq(id);
		return reqList;
	}
	
	/**
	 * 사용안함..
	 * @param id
	 * @return
	 */
	public List<String> getPlanReq(String id){
		List<HashMap> planList = userDAO.getPlanReq(id);
		//idx, plan_idx, status, useridx, to_char( req_date ,'YYYY-MM-DD HH24:MI' ) req_date,
		//to_char( res_date ,'YYYY-MM-DD HH24:MI' ) res_date, b.id userid, b.nickname, b.age, b.gender
		List<String> tdList = new ArrayList<String>();
		if(planList.size() > 0 ){
			for( HashMap<String,String> map : planList){
				String idx = map.get("idx");
				String plan_idx = map.get("plan_idx");
				String useridx = map.get("useridx");
				String status = map.get("status");
				String userid = map.get("userid");
				String nickname = map.get("nickname");
				String gender = map.get("gender");
				String age = map.get("age");
				StringBuffer sb = new StringBuffer();
				sb.append("<td></td><td>").append(userid).append(" (").append(age).append("/").append(gender).append(") ").append("</td>");
				sb.append("<td>").append("수락/거절").append("</td>");
				tdList.add(sb.toString());
			}
		}
		return tdList;
	}
	
	public int planReqUpdate(String idx, String status){
		Map<String, String> map = new HashMap<String, String>();
		map.put("idx", idx);
		map.put("status", status);
		return userDAO.updatePlanReq(map);
	}
	
	public int myReqCancel(String idx){
		return userDAO.deletePlanReq(idx);
	}

}
