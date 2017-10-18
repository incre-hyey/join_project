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
					editor_code, // editor API
					content, //내용-에이터
					status , //플랜상태
					tnop, //모집인원수
					writer, //작성자
					file_id, //이미지파일id
					date_status,
					p_sttus;
			Date reg_date, //작성일자
				mod_date,  //수정일자
				start_date,// 플랜일정시작
				end_date; //플랜일정종료	 
	
	private MultipartFile upload; //파일첨부 저장할곳
	
	private int nowPage; //현재페이지
	private String latitude, longitude; //지도api 위도,경도
	
	private List<UserVO> u_list;//참여 인원
	
	
	public List<UserVO> getU_list() {
		return u_list;
	}
	public void setU_list(List<UserVO> u_list) {
		this.u_list = u_list;
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
	public String getEditor_code() {
		return editor_code;
	}
	public void setEditor_code(String editor_code) {
		this.editor_code = editor_code;
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

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public void setEnd_date(Date end_date) {
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
	public Date getReg_date() {
		return reg_date;
	}
	public Date getMod_date() {
		return mod_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}	
	
	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	public String getDate_status() {
		return date_status;
	}
	public void setDate_status(String date_status) {
		this.date_status = date_status;
	}
	public String getP_sttus() {
		return p_sttus;
	}
	public void setP_sttus(String p_sttus) {
		this.p_sttus = p_sttus;
	}
	public String getDateStr(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
		
		return sdf.format(date);
	}
	
}
	
	