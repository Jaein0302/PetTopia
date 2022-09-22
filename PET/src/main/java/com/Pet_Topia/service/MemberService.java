package com.Pet_Topia.service;

import com.Pet_Topia.domain.Member;

public interface MemberService {
	public int isId(String id, String pass);

	public int insert(Member m);

	public int isId(String id);

	public Member member_info(String id);

	public int update(Member m);


}
