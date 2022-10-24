package com.Pet_Topia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;

@Service
public interface AdminService {

	//////////////////////////////// 기능에 대한 설명은 맵퍼에 있음 //////////////////////////////
	//////////////////////////////// 기능에 대한 설명은 맵퍼에 있음 //////////////////////////////
	//////////////////////////////// 기능에 대한 설명은 맵퍼에 있음 //////////////////////////////
	
	
	// 회원목록 기능 

	public List<Member> getSearchMemberList(int index, String search_word, int page, int limit);
	public int getSearchMemberListCount(int index, String search_word);
	public List<Member> listAll();
	public int deleteMember(String member_id);
	
	//////////////////////////////////////////////////////////회원 목록 기능 끝.
	
	// 기능 2 . 공지사항

	List<Abn> getDivisionMain(String division); 

	int getDivisionCount();

	List<Abn> getdivision(String division);

	public List<Abn> getAdminNoticeList(int page, int limit, String division);

	public int admin_write_notice_update(Abn abn);

	public int deleteNotice(int num);

	public int getAdminListCount();

	public int admin_write_notice(Abn abn);

	public Abn getNoticeDetail(int num);


}
