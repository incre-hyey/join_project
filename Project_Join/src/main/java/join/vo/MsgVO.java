package join.vo;

import java.sql.Date;

/**
 * Message VO : message, receive 테이블 공용
 * @author com
 *
 */
public class MsgVO {
	String idx, title, sender, content, send_date, 
	userid, status, read_date, rcv, rcv_cnt;
	
	//받는사람 List (delimeter : ';')
	String rcvList;
	
	//date Str
	String send_date_str, read_date_str;
	
	
	
	public String getSend_date_str() {
		return send_date_str;
	}

	public void setSend_date_str(String send_date_str) {
		this.send_date_str = send_date_str;
	}

	public String getRead_date_str() {
		return read_date_str;
	}

	public void setRead_date_str(String read_date_str) {
		this.read_date_str = read_date_str;
	}

	public String getRcvList() {
		return rcvList;
	}

	public void setRcvList(String rcvList) {
		this.rcvList = rcvList;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRead_date() {
		return read_date;
	}

	public void setRead_date(String read_date) {
		this.read_date = read_date;
	}

	public String getRcv() {
		return rcv;
	}

	public void setRcv(String rcv) {
		this.rcv = rcv;
	}

	public String getRcv_cnt() {
		return rcv_cnt;
	}

	public void setRcv_cnt(String rcv_cnt) {
		this.rcv_cnt = rcv_cnt;
	}
	
	

}
