package com.Pet_Topia.service;

import com.Pet_Topia.domain.Member;

public interface MemberService {
	public int isId(String id, String pass);

	public int insert(Member m);

	public int isId(String id);
	
	public int isRegnum(String member_regnum);

	public String find_id(String member_name, String member_email);

	public int find_pass(String member_id, String member_name, String member_email);

	public int update_pass(String newpass, String member_id);

	public int mail_code(String member_email);
	
	public Member member_info(String id);
	
	public int update(Member m);

	public Member Id_pw_check(String id, String password);

	public void Delete_user(String id);

	public Member getMemberdata(String id);


}
