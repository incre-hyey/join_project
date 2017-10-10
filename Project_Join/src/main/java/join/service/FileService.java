package join.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("fileService")
public class FileService {
	
	@Autowired
	private String fileUploadPath;

	/**
	 * 서버에 파일 저장 / 리턴 : 저장된 파일 경로+이름
	 * @param upload
	 * @param name
	 * @return
	 */
	public String uploadFile(MultipartFile upload, String name) {
		String fullPath = null;
		if(upload.getSize() > 0){
			String fileName = upload.getOriginalFilename(); //파일명
			
			// 경로 : upload/YYYY/MM/dd/
			// 파일 이름 : HHmmss+파일명 ( 올리는 초단위 + 사용자ID -> 중복 가능성X )
			fullPath = getFullPath() + name;
			
			try {
				upload.transferTo(new File(fullPath));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return fullPath;
	}
	
	/**
	 * 파일 fullPath 생성/리턴
	 * @return
	 */
	public String getFullPath(){
		Date date = new Date();
		String sep = System.getProperty("file.separator");
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY/MM/dd/");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HHmmss");
		String str1 = sdf.format(date);
		String str2 = sdf2.format(date);
		
		File f = new File(fileUploadPath+str1.replace("/",sep));
		if(!f.exists())
		{
			f.mkdirs();
		}
		
		return f.getAbsolutePath()+sep+str2;
	}
	
	
	/**
	 * (중복 확인 후) 저장될 파일명 세팅
	 *  사용 X
	 */
	public String settingFileName(String path , String fileName){
		int period = fileName.lastIndexOf(".");
		
		String f_name = fileName.substring(0, period);//test
		String suffix = fileName.substring(period);//.txt
		
		
		//fullPath
		String saveFileName = path + System.getProperty("file.separator") + fileName;
		
		File f = new File(saveFileName);
		int idx = 1;
		while(f != null && f.exists()){
			//같은 이름의 파일이 있는 경우!!
			
			//파일명 변경!
			StringBuffer sb = new StringBuffer();
			sb.append(f_name);
			sb.append(idx++);
			sb.append(suffix);
			
			fileName = sb.toString();// test1.txt
			
			//다시 존재여부 확인을 위해 전체경로를
			// 다시 만들자!
			saveFileName = path +
			  System.getProperty("file.separator") + fileName;
			
			
			//새로 만들어진 파일명과 경로를 이용하여
			// 새로운 경로를 위에서 생성했으니 다시
			// File객체를 생성하여 반복문을 수행하도록 한다.
			f = new File(saveFileName);			
			
		}// while문의 끝
		
		return fileName;
	}
	
	
	public void viewFile(HttpServletResponse response, String Filestr){
		FileInputStream fis = null;
		BufferedOutputStream bos = null;
		byte[] buf = new byte[1024];
		
		
		try {
			File file = new File(Filestr);
			fis = new FileInputStream(file);
			bos = new BufferedOutputStream(response.getOutputStream());
			response.flushBuffer();
			
			int readLength = 0;
			while((readLength = fis.read(buf)) != -1){
				bos.write(buf,0,readLength);
			}
			bos.flush();
			
			
			
			
		} catch(Exception e){
			e.printStackTrace();
		}
		finally {
			try {
				if(fis !=null) fis.close();
				if(bos != null) bos.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			// TODO: handle finally clause
		}
	}
}
