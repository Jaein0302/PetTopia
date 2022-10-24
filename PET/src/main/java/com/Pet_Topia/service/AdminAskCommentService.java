package com.Pet_Topia.service;

import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Aac;

@Service
public interface AdminAskCommentService {


	//////////////////////////////// 기능에 대한 설명은 맵퍼에 있음 //////////////////////////////
	//////////////////////////////// 기능에 대한 설명은 맵퍼에 있음 //////////////////////////////
	//////////////////////////////// 기능에 대한 설명은 맵퍼에 있음 //////////////////////////////
	
	
	public int Admin_ask_comment(Aac aac);

	public int Admin_ask_comment_update(Aac aac);

	public Aac getComment(int num);

}