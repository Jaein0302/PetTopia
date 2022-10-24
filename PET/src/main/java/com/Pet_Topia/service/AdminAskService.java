package com.Pet_Topia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Aac;
import com.Pet_Topia.domain.Aam;

@Service
public interface AdminAskService {


	//////////////////////////////// 기능에 대한 설명은 맵퍼에 있음 //////////////////////////////
	//////////////////////////////// 기능에 대한 설명은 맵퍼에 있음 //////////////////////////////
	//////////////////////////////// 기능에 대한 설명은 맵퍼에 있음 //////////////////////////////
	
	
	public List<Aam> getAskColumnList(int page, int limit, int search_field_one, int search_field_two,
			String search_word);

	public int getAskColumnListCount(int search_field_one, int search_field_two, String search_word);

	public List<Aam> getAskMemberOwnList(int page, int limit, String login_id);

	public int getAskMemberOwnListCount(String login_id);

	public int getAskMemberListCount(String ask_member);

	public Aac getComent(int num);

	public int AnswerUpdate(int num);

	public int write_to_admin_form(Aam aam);

	public Aam ask_to_admin_view(int num);

}