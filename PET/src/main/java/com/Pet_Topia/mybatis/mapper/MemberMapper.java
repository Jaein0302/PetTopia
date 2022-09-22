package com.Pet_Topia.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Member;

@Mapper
public interface MemberMapper {
	
	public Member isId(String id);
	
	public int insert(Member m);
	
	public int update(Member m);
	
	public void delete(String id);
	
	public int getSearchListCount(Map<String,String> map);
	
	public List<Member> getSearchList(Map<String,Object> map);

	
}
