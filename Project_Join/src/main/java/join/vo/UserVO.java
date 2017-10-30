package join.vo;

import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	String idx, id,
	pwd,
	name,
	nickname,
	phone,
	email,
	age,
	gender,
	addr1,
	addr2,
	blood,
	file_id,
	intro_content,
	ip,
	status,
	loginyn;
	Date reg_date,login_date;
	MultipartFile upload;
	// 우편번호, 프로필노출여부 컬럼 추가 - 10.16 hycho
	String addr3, us_viewyn;
	
	//찜 목록 추가 - 10.20 hycho
	List<LikeVO> likeList;
	String likeyn;
	
	
	public String getLikeyn() {
		return likeyn;
	}

	public void setLikeyn(String likeyn) {
		this.likeyn = likeyn;
	}

	public String getJsonStr() {
		String parseFileid= this.file_id.replace("\\", "\\\\");
		StringBuffer sb = new StringBuffer();
		sb.append("{\"id\":\"").append(id).append("\", "); 
		sb.append("\"name\":\"").append(name).append("\", ");
		sb.append("\"nickname\":\"").append(nickname).append("\", ");
		sb.append("\"phone\":\"").append(phone).append("\", ");
		sb.append("\"email\":\"").append(email).append("\", ");
		sb.append("\"age\":\"").append(age).append("\", ");
		sb.append("\"file_id\":\"").append(parseFileid).append("\"} ");
		
				// 문자열 추가시
				//"key : '"+ value + "', "+
		return sb.toString();
	}
	
	public List<LikeVO> getLikeList() {
		return likeList;
	}

	public void setLikeList(List<LikeVO> likeList) {
		this.likeList = likeList;
	}

	/*
	 * 연령, 성별, 혈액형에 대한 파싱 제공
	 */
	public String getAgeStr(){
		String str = "";
		switch(this.age){
			case "1":
				str = "20대";
				break;
			case "2":
				str = "30대";
				break;
			case "3":
				str = "40대";
				break;
			case "4":
				str = "50대";
				break;
		}
		return str;
	}
	public String getGenderStr(){
		String str = "";
		switch(this.gender){
			case "1":
				str="남자";
				break;
			case "2":
				str="여자";
				break;
		}
		return str;
	}
	public String getBloodStr(){
		String str="";
		switch(this.blood){
			case "1":
				str="A형";
				break;
			case "2":
				str="B형";
				break;
			case "3":
				str="O형";
			case "4":
				str="AB형";
		}
		return str;
	}
	
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public void setLogin_date(Date login_date) {
		this.login_date = login_date;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getBlood() {
		return blood;
	}

	public void setBlood(String blood) {
		this.blood = blood;
	}

	public String getIntro_content() {
		return intro_content;
	}

	public void setIntro_content(String intro_content) {
		this.intro_content = intro_content;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLoginyn() {
		return loginyn;
	}

	public void setLoginyn(String loginyn) {
		this.loginyn = loginyn;
	}

	public String getUs_viewyn() {
		return us_viewyn;
	}

	public void setUs_viewyn(String us_viewyn) {
		this.us_viewyn = us_viewyn;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public Date getLogin_date() {
		return login_date;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getFile_id() {
		return file_id;
	}

	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	
	
}
