package join.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("utilService")
public class UtilService {
	
	@Autowired
	int keyLenth;

	/**
	 * 키값 랜덤 생성하기
	 * @param id
	 * @return
	 */
	public static String makeUID(String id){
		String uid = "";
		if(id != null){
			uid = (UUID.nameUUIDFromBytes(id.getBytes())).toString();
		}else
			uid = UUID.randomUUID().toString();
		
		return uid;
	}
	/**
	 * MD5알고리즘으로 만드는 key
	 * @param id
	 * @return
	 */
	public static String makeKey(String id) {
		String key="";
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(id.getBytes());
			
			key = toHex(md5.digest());
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		return key;
	}
	private static String toHex(byte[] digest) {
		StringBuffer buf = new StringBuffer();
		for(int i=0;i<digest.length;i++) {
		buf.append(Integer.toHexString((int)digest[i] & 0x00ff));
		}
		return buf.toString();
	}
	/**
	 * 토큰키 확인/발급
	 */
	public static boolean checkToken(HttpServletRequest request) {
		boolean flag = false;
		String sessionToken = (String)request.getSession().getAttribute("TokenKey");
		if(sessionToken == null) {
			String token = makeKey(getFormatDate("YYYYMMDDHHmmss",new Date()));
			request.getSession().setAttribute("TokenKey", token);
			request.setAttribute("TokenKey", token);
			flag = true;
		}else {
			String reqToken = (String)request.getAttribute("TokenKey");
			if(sessionToken.equals(reqToken))
				flag = true;
		}
		//결국. 세션과 리퀘스트에 토큰이 둘다 존재하고, 두 개가 일치하지 않을 때 false
		// false를 받아 잘못된 경로의 요청을 알리면 된다.
		return flag;
	}
	
	
	
	/**
	 * 원하는  포맷으로 날짜 문자열 리턴
	 */
	public static String getFormatDate(String format, Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

}
