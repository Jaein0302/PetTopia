package com.Pet_Topia.domain;

import org.springframework.web.multipart.MultipartFile;
public class Abn {
	
	private String admin_content;
	private String ADMIN_SUBJECT;
	private String ADMIN_MAIN_COLUMN;
	private String ADMIN_WIRTER;
	private MultipartFile uploadfile;
	private String ADMIN_BOARD_ORIGINAL; //첨부될 파일 이름
	private String ADMIN_BOARD_DATE;
    private String ADMIN_BOARD_FILE;
	
    
    
	public String getADMIN_SUBJECT() {
		return ADMIN_SUBJECT;
	}
	public void setADMIN_SUBJECT(String aDMIN_SUBJECT) {
		ADMIN_SUBJECT = aDMIN_SUBJECT;
	}
	public String getADMIN_MAIN_COLUMN() {
		return ADMIN_MAIN_COLUMN;
	}
	public void setADMIN_MAIN_COLUMN(String aDMIN_MAIN_COLUMN) {
		ADMIN_MAIN_COLUMN = aDMIN_MAIN_COLUMN;
	}
	public String getADMIN_WIRTER() {
		return ADMIN_WIRTER;
	}
	public void setADMIN_WIRTER(String aDMIN_WIRTER) {
		ADMIN_WIRTER = aDMIN_WIRTER;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getADMIN_BOARD_ORIGINAL() {
		return ADMIN_BOARD_ORIGINAL;
	}
	public void setADMIN_BOARD_ORIGINAL(String aDMIN_BOARD_ORIGINAL) {
		ADMIN_BOARD_ORIGINAL = aDMIN_BOARD_ORIGINAL;
	}
	public String getADMIN_BOARD_DATE() {
		return ADMIN_BOARD_DATE;
	}
	public void setADMIN_BOARD_DATE(String aDMIN_BOARD_DATE) {
		ADMIN_BOARD_DATE = aDMIN_BOARD_DATE;
	}
	public String getADMIN_BOARD_FILE() {
		return ADMIN_BOARD_FILE;
	}
	public void setADMIN_BOARD_FILE(String aDMIN_BOARD_FILE) {
		ADMIN_BOARD_FILE = aDMIN_BOARD_FILE;
	}
	public String getAdmin_content() {
		return admin_content;
	}
	public void setAdmin_content(String admin_content) {
		this.admin_content = admin_content;
	}

	
	

}
