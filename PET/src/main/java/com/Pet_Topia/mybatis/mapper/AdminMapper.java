package com.Pet_Topia.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;

@Mapper
public interface AdminMapper {
	
	//회원정보 수정 + 검색 
	
	//회원명단 카운트임.. 이건 매개변수 쓰고 아래껏은 왜안쓰는지 생각?
	
	public int getSearchListCount(Map<String, String> map) ;

	public List<Member> getSearchList(Map<String, Object> map) ;
	
	public List<Member> listAll();
	
	public int getAdminNoticeListCount();

	public List<Abn> getadminNoticeList(HashMap<String, Integer> map);
	
	
}
