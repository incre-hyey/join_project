package join.vo;

import java.util.Date;

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
	file_name,
	ori_name,
	intro_content,
	ip,
	status,
	loginyn;
	Date reg_date,login_date;
	MultipartFile upload;
	
//	String jsonObj;
//	public void setJsonObj(String jsonObj) {
//		this.jsonObj = jsonObj;
//	}
	public String getJsonStr() {
		String parseFilename= this.file_name.replace("\\", "\\\\");
		StringBuffer sb = new StringBuffer();
		sb.append("{\"id\":\"").append(id).append("\", "); 
		sb.append("\"name\":\"").append(name).append("\", ");
		sb.append("\"nickname\":\"").append(nickname).append("\", ");
		sb.append("\"phone\":\"").append(phone).append("\", ");
		sb.append("\"email\":\"").append(email).append("\", ");
		sb.append("\"age\":\"").append(age).append("\", ");
		sb.append("\"file_name\":\"").append(parseFilename).append("\"} ");
		
				// 문자열 추가시
				//"key : '"+ value + "', "+
		return sb.toString();
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

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
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

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
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
	
	
}
