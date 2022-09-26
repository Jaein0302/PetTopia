package com.Pet_Topia.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Member;

@Mapper
public interface MemberMapper {
	
	public Member isId(String id);
	
	public Member isId(String id, String pass);
	
	public int insert(Member m);

	public String find_id(String member_name, String member_email);

	public Member find_pass(String member_id, String member_name, String member_email);

	public void update_pass(String str, String member_id);

	public Member mail_code(String member_email);

	public int update(Member m);

	
}
