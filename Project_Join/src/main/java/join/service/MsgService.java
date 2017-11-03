package join.service;

import java.util.ArrayList;
import java.util.Date;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import join.dao.MsgDAO;
import join.dao.UserDAO;
import join.vo.MsgVO;
import join.vo.UserVO;

@Transactional
@Service("msgService")
public class MsgService{

	@Autowired
	MsgDAO msgDAO;
	
	public void getTotal(){
		System.out.println("**********************"+ msgDAO.toString());
	}	
	/**
	 * 메세지 발송-메세지 저장
	 * @param msgVO
	 * @throws Exception 
	 */
	public void addMsg(MsgVO msgVO, String userid) throws Exception{
		
		String[] rcvStr = msgVO.getRcvList().split(";");
		
		//1.  message테이블 insert
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("idx", UtilService.makeKey());
		map.put("title", msgVO.getTitle());
		map.put("sender", userid);
		map.put("content", msgVO.getContent());
		map.put("status", "1");
		map.put("rcv", rcvStr[0]);
		map.put("rcv_cnt", rcvStr.length);
		msgDAO.insertMsg(map);
		
		//2. msg_rcv 테이블 insert
		ArrayList<Map> rcvList = new ArrayList<Map>();
		int chk=0;
		for(String rcv:rcvStr) {
			HashMap<String,Object> map_rcv = new HashMap<String,Object>();
			map_rcv.put("idx", UtilService.makeKey());
			map_rcv.put("m_idx", map.get("idx"));
			map_rcv.put("sender", userid); //발신자 (session)
			map_rcv.put("userid", rcv); //수신자
			map_rcv.put("status", "1");
			chk++;
			rcvList.add(map_rcv);
		}
		int result = msgDAO.insertMsgRcv(rcvList);
		if(chk != result)
			throw new Exception("###### chk : " + String.valueOf(chk) +" , result :" + String.valueOf(result));
		
	}
	
	public void delMsg(String idx, String userid){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("idx", idx);
		map.put("userid", userid);
		msgDAO.delMsg(map);
	}
	
	public List<MsgVO> getSendList(String userid, String search, int paging, int listPerPage) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userid", userid);
		map.put("search", search);
		map.put("begin", (paging-1) * listPerPage +1);
		map.put("end", paging * listPerPage);
		return msgDAO.getSendList(map);
	}
	public int getSendTotal(String userid,String search){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("userid", userid);
		map.put("search", search);
		return msgDAO.getRcvTotal(map);
	}
	
	public List<MsgVO> getRcvList(String userid,String search, int paging, int listPerPage){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userid", userid);
		map.put("search", search);
		map.put("begin", (paging-1) * listPerPage +1);
		map.put("end", paging * listPerPage);
		return msgDAO.getRcvList(map);
	}
	public int getRcvTotal(String userid,String search){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("userid", userid);
		map.put("search", search);
		return msgDAO.getRcvTotal(map);
	}
	
	public List<MsgVO> getMsg(String idx, String userid, String type){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("type", type); // 1: RCV , 2:SEND ( 쪽지함 별 select )
		map.put("userid", userid);
		map.put("idx", idx);
		return msgDAO.selectMsg(map);
	}
	public void updateSendDate(String userid, String idx){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("userid", userid);
		map.put("idx", idx);
		msgDAO.updateSendDate(map);
	}
	
	public int msgCheck(String userid){
		return msgDAO.getRcvMsgCount(userid);
	}
	
}
