package join.service;

import java.util.Base64;
import java.util.UUID;

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
}
