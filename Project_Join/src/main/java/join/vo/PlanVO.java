package join.vo;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PlanVO {
	
	private String idx, //기본키
					title, 	// 플랜제목
					location1, // 플랜주소
					location2, // 상세주소
					content, //내용-에이터
					status, //플랜상태
					tnop, //모집인원수
					writer, //작성자
					file_id, //이미지파일id						
					latitude, 
					longitude,
					plan_kind,
					p_pwd;
			String 
				start_date,// 플랜일정시작							
				end_date; //플랜일정종료	
			Date reg_date, //작성일자
				mod_date;  //수정일자
			//종료 확인 플래그 추가
			String exp_yn, userStat;
			//writer_idx
			String writer_idx;
	
			
	private MultipartFile upload; //파일첨부 저장할곳
	
	private int nowPage; //현재페이지
	
	
	private List<UserVO> u_list;//참여 인원
	
	public String getPeople(){
		if(this.userStat == null)
			this.userStat = "2";
		String str= "";
		switch(this.userStat){
		case "0":
			str = "참여요청중";
			break;
		case "1":
			str = "참여중";
			break;
		default :
			str = "참가 가능 ";
			break;
		}
		return str;
	}
	
	public List<UserVO> getU_list() {
		return u_list;
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


	public String getLocation1() {
		return location1;
	}


	public void setLocation1(String location1) {
		this.location1 = location1;
	}


	public String getLocation2() {
		return location2;
	}


	public void setLocation2(String location2) {
		this.location2 = location2;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getTnop() {
		return tnop;
	}


	public void setTnop(String tnop) {
		this.tnop = tnop;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getFile_id() {
		return file_id;
	}


	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}


	public String getLatitude() {
		return latitude;
	}


	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}


	public String getLongitude() {
		return longitude;
	}


	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}


	public String getPlan_kind() {
		return plan_kind;
	}


	public void setPlan_kind(String plan_kind) {
		this.plan_kind = plan_kind;
	}


	public String getP_pwd() {
		return p_pwd;
	}


	public void setP_pwd(String p_pwd) {
		this.p_pwd = p_pwd;
	}


	public Date getReg_date() {
		return reg_date;
	}


	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


	public String getStart_date() {
		return start_date;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public Date getMod_date() {
		return mod_date;
	}


	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public MultipartFile getUpload() {
		return upload;
	}


	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}


	public int getNowPage() {
		return nowPage;
	}


	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}


	public void setU_list(List<UserVO> u_list) {
		this.u_list = u_list;
	}

	public String getExp_yn() {
		return exp_yn;
	}

	public void setExp_yn(String exp_yn) {
		this.exp_yn = exp_yn;
	}

	public String getUserStat() {
		return userStat;
	}

	public void setUserStat(String userStat) {
		this.userStat = userStat;
	}

	public String getWriter_idx() {
		return writer_idx;
	}

	public void setWriter_idx(String writer_idx) {
		this.writer_idx = writer_idx;
	}
	
	
}
	
	