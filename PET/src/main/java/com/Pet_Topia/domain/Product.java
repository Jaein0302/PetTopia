package com.Pet_Topia.domain;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int ITEM_ID					;
	private String ITEM_NAME				;
	private String ITEM_CATEGORY			;
	private int	   ITEM_PRICE				;
	private String ITEM_CONTENT				;
	private String ITEM_IMAGE_ORIGINAL		;
	private String ITEM_IMAGE_FILE			;
	private String ITEM_REG_DATE			;
	private String ITEM_RSV_DATE			;
	private int    ITEM_SCORE				;
	private String ITEM_SEX					;
	private String ITEM_WEIGHT				;
	private String ITEM_SPECIES				;
	
	private MultipartFile uploadfile		;

	public int getITEM_ID() {
		return ITEM_ID;
	}

	public void setITEM_ID(int iTEM_ID) {
		ITEM_ID = iTEM_ID;
	}

	public String getITEM_NAME() {
		return ITEM_NAME;
	}

	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}

	public String getITEM_CATEGORY() {
		return ITEM_CATEGORY;
	}

	public void setITEM_CATEGORY(String iTEM_CATEGORY) {
		ITEM_CATEGORY = iTEM_CATEGORY;
	}

	public int getITEM_PRICE() {
		return ITEM_PRICE;
	}

	public void setITEM_PRICE(int iTEM_PRICE) {
		ITEM_PRICE = iTEM_PRICE;
	}

	public String getITEM_CONTENT() {
		return ITEM_CONTENT;
	}

	public void setITEM_CONTENT(String iTEM_CONTENT) {
		ITEM_CONTENT = iTEM_CONTENT;
	}

	public String getITEM_IMAGE_ORIGINAL() {
		return ITEM_IMAGE_ORIGINAL;
	}

	public void setITEM_IMAGE_ORIGINAL(String iTEM_IMAGE_ORIGINAL) {
		ITEM_IMAGE_ORIGINAL = iTEM_IMAGE_ORIGINAL;
	}

	public String getITEM_IMAGE_FILE() {
		return ITEM_IMAGE_FILE;
	}

	public void setITEM_IMAGE_FILE(String iTEM_IMAGE_FILE) {
		ITEM_IMAGE_FILE = iTEM_IMAGE_FILE;
	}

	public String getITEM_REG_DATE() {
		return ITEM_REG_DATE;
	}

	public void setITEM_REG_DATE(String iTEM_REG_DATE) {
		ITEM_REG_DATE = iTEM_REG_DATE;
	}

	public String getITEM_RSV_DATE() {
		return ITEM_RSV_DATE;
	}

	public void setITEM_RSV_DATE(String iTEM_RSV_DATE) {
		ITEM_RSV_DATE = iTEM_RSV_DATE;
	}

	public int getITEM_SCORE() {
		return ITEM_SCORE;
	}

	public void setITEM_SCORE(int iTEM_SCORE) {
		ITEM_SCORE = iTEM_SCORE;
	}

	public String getITEM_SEX() {
		return ITEM_SEX;
	}

	public void setITEM_SEX(String iTEM_SEX) {
		ITEM_SEX = iTEM_SEX;
	}

	public String getITEM_WEIGHT() {
		return ITEM_WEIGHT;
	}

	public void setITEM_WEIGHT(String iTEM_WEIGHT) {
		ITEM_WEIGHT = iTEM_WEIGHT;
	}

	public String getITEM_SPECIES() {
		return ITEM_SPECIES;
	}

	public void setITEM_SPECIES(String iTEM_SPECIES) {
		ITEM_SPECIES = iTEM_SPECIES;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	
	
	
}