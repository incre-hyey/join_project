package com.company3.joinapp;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Config {

	@Bean
	public String fileUploadPath() {
		return "C:/Users/3-18/git/join_project/Project_Join/src/main/webapp/WEB-INF/upload/";
	}
	
	@Bean
	public int keyLenth(){
		return 40;
	}
	
}
