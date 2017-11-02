package join.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
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
		char ch = (char)((Math.random() * 26) + 65);
		
		Long id = System.currentTimeMillis()*(new Random().nextInt(123)+ch);
		
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(id.byteValue());
			
			key = toHex(md5.digest());
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		System.out.println("########## "+key+" ###########");
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
	/**
	 * null 방지용
	 * @param str
	 * @param def
	 * @return
	 */
	public static String getValue(String str, String def) {
		if(str == null || str.equals(""))
			str = def;
		return str;
	}
	/**
	 * 페이징 HTML 만들기
	 ****리스트 페이지에서 pagingFunc() 구현하기!
	 * @return
	 */
	public static String pagingHTML(int totalSize,int cur, int block , int listPerPage){
	    //int block = 10; // // 범위 한 칸당 페이지 수 
	    int totalPage = (int) Math.floor(totalSize/listPerPage); // 한페이지에 게시물 10개씩
	    if(totalSize % listPerPage >0) // 한페이지에 게시물 10개씩
	        totalPage += 1;
	    int start = (int) (Math.floor(cur/block) * block) ; // 0, 10, 20...
	    if(start==cur)
	        start = start - block;
	    int end = start + block; // 10, 20, 30 ,40...
	    start += 1; //1,11,21...
	    
	    String str = "";
	    if(totalPage <= block){ // 전체 페이지 block 보다 작을때
	        for(int i=1;i<=totalPage;i++){
	            str += "<a ";
	            if(i==cur)
	                str+="class=active ";
	            str += "onclick=pagingFunc('"+i+"')>"+i+"</a>";
	        }	
	    }
	    else{
	        if(start > 1){ // << 가 있음
	            str += "<a onclick=pagingFunc('"+(start-1)+"')>&laquo;</a>";
	        }
	        if(end < totalPage) { // >> 가 있음
	            for(int i=start;i<(start+block) ;i++){
	                str += "<a ";
	                if(i==cur)
	                    str+="class=active ";
	                str += "onclick=pagingFunc('"+i+"')>"+i+"</a>";
	            }
	            str+= "<a onclick=pagingFunc('"+(start+block)+"')>&raquo;</a>";
	        }else{
	            for(int i=start;i<=totalPage ;i++){
	                str += "<a ";
	                if(i==cur)
	                    str+="class=active ";
	                str += "onclick=pagingFunc('"+i+"')>"+i+"</a>";
	            }
	        }
	    }
	    
	    return str;
	}    
	    

}
