package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.mybatis.mapper.CommunityMapper;

@Service
public class CommunityServiceImpl implements CommunityService {

	private CommunityMapper dao;
	
	@Autowired
	public CommunityServiceImpl(CommunityMapper dao) {
		this.dao = dao;
	}
	
	@Override
	public int getListCount() {
		return dao.getListCount();
	}

	@Override
	public List<Community> getBoardList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getBoardList(map);
	}

}
