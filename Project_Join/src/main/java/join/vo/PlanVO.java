package join.vo;

import org.springframework.web.multipart.MultipartFile;

public class PlanVO {
	
	private String idx, //기본키
				title, 	// 플랜제목
				location1, // 플랜장소
				location2, // 장소API
				m_image, //메인이미지
				content, //내용-에이터
				status , //플랜상태
				tnop, //모집인원수
				writer, //작성자
				reg_date, //작성일자
				mod_date,  //수정일자
				start_date,// 플랜일정시작
				end_date;//플랜일정종료	 
	
	private MultipartFile upload; //파일첨부 저장할곳
	
	private int nowPage; //현재페이지
	
	private double latitude, longitude; //지도api 위도,경도
	
	
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

	public String getM_image() {
		return m_image;
	}

	public void setM_image(String m_image) {
		this.m_image = m_image;
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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getMod_date() {
		return mod_date;
	}

	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	


}
