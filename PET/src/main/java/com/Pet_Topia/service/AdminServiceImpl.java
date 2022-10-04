package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;
import com.Pet_Topia.mybatis.mapper.AdminMapper;
import com.Pet_Topia.mybatis.mapper.MemberMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
	 @Autowired
		private AdminMapper dao;
	 
	
	 
	 
	@Override
	public List<Member> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		//http://localhost:8088/myhome4/member/list로 접속하는 경우
		//select를 선택하지 않아 index는 "-1"의 값을 갖습니다.
		//이 경우 아래의 문장을 수행하지 않기 때문에 "search_field" 키에 대한
		//map.get("search_field")의 값은 null이 됩니다.
		if(index != -1) {
			String[] search_field = new String[] {"id", "name", "age", "gender"};
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getSearchList(map);
	}

	@Override
	public int getSearchListCount(int index, String search_word) {
		Map<String, String> map = new HashMap<String, String>();
		if(index != -1) {
			String[] search_field = new String[] {"id", "name", "age", "gender"};
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		return dao.getSearchListCount(map);
	}
	
	//파일 출력 메서드
	public List<Member> listAll(){
		return dao.listAll();
	}
	
	public int getAdminListCount() {
		return dao.getAdminNoticeListCount();
	}

	
	
	//공지사항 게시물 관련 메서드
	public List<Abn> getAdminNoticeList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getadminNoticeList(map);
	}

	
	
	
	
	
	

}

