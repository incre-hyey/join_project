package join.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
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
	 * MD5알고리즘으로 만드는 key : 키값 랜덤 생성하기
	 * @param id
	 * @return
	 */
	public static String makeKey() {
		String key="";
		Long id = new Date().getTime()*(new Random().nextInt(99)+1);
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(id.byteValue());
			
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
			String token = makeKey();
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
	/**
	 * Map을 JSON 문자열로 리턴
	 * @param strArr
	 * @return
	 */
	public static String getJsonData(Map<String,String> map){
		
		StringBuffer sb = new StringBuffer();
		Iterator it = map.keySet().iterator();
		sb.append("{");
		while(1==1){
			String key = (String) it.next();
			sb.append("\""+key+"\":\"").append(map.get(key));
			if(it.hasNext())
				sb.append("\", ");
			else{
				sb.append("\"} ");
				break;
			}
		}
		return sb.toString();
	}

}
