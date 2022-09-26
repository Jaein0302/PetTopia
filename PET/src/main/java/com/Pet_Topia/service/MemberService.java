package com.Pet_Topia.service;

import com.Pet_Topia.domain.Member;

public interface MemberService {
	public int isId(String id, String pass);

	public int insert(Member m);

	public int isId(String id);

	public String find_id(String member_name, String member_email);

	public int find_pass(String member_id, String member_name, String member_email);

	public void update_pass(String str, String member_id);

	public int mail_code(String member_email);
	
	public Member member_info(String id);
	
	public int update(Member m);

}
