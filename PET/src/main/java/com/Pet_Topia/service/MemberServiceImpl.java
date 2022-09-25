package com.Pet_Topia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Member;
import com.Pet_Topia.mybatis.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	  
    @Autowired
    private PasswordEncoder passwordEncoder;
	
	private MemberMapper dao;

	@Autowired
	public MemberServiceImpl(MemberMapper dao) {
		this.dao = dao;
	}

	@Override
	public int isId(String member_id) {

		Member rmember = dao.isId(member_id);
		return (rmember == null) ? -1 : 1; // -1은 아이디가 존재하지 않는 경우
										   //1은 아이디가 존재하는 경우
	}
	

	@Override
	public int isId(String id, String password) {
		Member rmember = dao.isId(id);
		int result = -1; // 아이디가 존재하지 않는 경우- rmember가 null인 경우
		if (rmember != null) { // 아이디가 존재하는 경우
			//passwordEncoder.matches(rawPassword,encodedPassword)
			//사용자에게 입력받은 패스워드를 비교하고자 할 때 사용하는 메서드입니다.
			//rawPassword : 사용자가 입력한 패스워드
			//encodedPassword : DB에 저장된 패스워드
			if (passwordEncoder.matches(password,rmember.getMember_password())) {
				result = 1; // 아이디와 비밀번호가 일치하는 경우
			} else
				result = 0; // 아이디는 존재하지만 비밀번호가 일치하지 않는 경우
		}
		return result;
	}

	@Override
	public int insert(Member m) {
		return dao.insert(m);
	}

	@Override
	public String find_id(String member_name, String member_email) {
		return dao.find_id(member_name, member_email);
	
	}

	@Override
	public int find_pass(String member_id, String member_name, String member_email) {
		Member rmember = dao.find_pass(member_id, member_name, member_email);
		return (rmember == null) ? -1 : 1;
	}

	@Override
	public void update_pass(String str, String member_id) {
		dao.update_pass(str, member_id);
	}

	@Override
	public int mail_code(String member_email) {
		Member rmember = dao.mail_code(member_email);
		return (rmember == null) ? -1 : 1;
	}

}

