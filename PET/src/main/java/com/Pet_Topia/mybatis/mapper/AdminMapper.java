package com.Pet_Topia.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Aac;
import com.Pet_Topia.domain.Aam;
import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;

@Mapper
public interface AdminMapper {

	//기능 1. 회원목록 (AdminService)
	
	//맵핑:/admin_list
	public int getSearchMemberListCount(Map<String, String> map); //회원수 카운팅
	
	public List<Member> getSearchMemberList(Map<String, Object> map); //검색(회원 이름, 아이디)
	
	//회원정보 조회는 mservice에서 가져옴.
	
	public int deleteMember(String member_id); //멤버 삭제
	
    public List<Member> listAll(); ///회원목록 excel , pdf 명단을 가져옴
	
    /////////////////////////////////////////////////////////////////////////////////////////////// 기능 1. 회원목록 끝.
          
   //기능2 공지사항  (AdminService)
    
   public int getAdminNoticeListCount(); //공지사항 카운트
   
   public int admin_write_notice_update(Abn abn); // 공지사항 수정

   public Abn getNoticeDetail(int num); //공지사항 조회

   public List<Abn> getDivisionMain(String division); //공지사항 중요 가져오기.

   public int getDivisionCount(); //공지사항 일반 카운팅

   public List<Abn> getdivision(String division); //카테고리 일반,중요 검색

   public List<Abn> getadminNoticeList(Map<String, Object> map); //공지사항 검색 페이징 처리

   public int deleteNotice(int num); //공지사항 삭제

   public int admin_write_notice(Abn abn); //공지사항 삭제


   ///////////////////////////////////////////////////////////////////////////////////////////////// 기능 2 공지사항.
   
   //기능 3. 1:1문의
   
   public List<Aam> getAskColumnList(Map<String, Object> map); //1:1문의 조회

   public int getAskColumnListCount(Map<String, Object> map); //1:1문의 카운팅
   
   public int getAskMemberOwnListCount(String ask_member); //1:1문의 보기(고객)

   public List<Aam> getAskMemberOwnList(Map<String, Object> map); //1:1문의 카운팅
   
   public Aam ask_to_admin_view(int num); //1:1문의 상세보기

   public Aac getComent(int num); //코멘트 가져오기

   public int AnswerUpdate(int num); //1:1문의 업데이트

   public int write_to_admin_form(Aam aam); //글쓰기

   public int Admin_ask_comment(Aac aac); //어드민 답글달기

   public int Admin_ask_comment_update(Aac aac); //답변

}