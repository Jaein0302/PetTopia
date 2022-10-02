package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.domain.Review;
import com.Pet_Topia.mybatis.mapper.OrderMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private OrderMapper dao;
	
	@Autowired
	public ReviewServiceImpl(OrderMapper dao) {
		this.dao = dao;
	}

	@Override
	public void insert(Review review) {
		dao.insert(review);
		
	}

	@Override
	public int getListCount(int index, String search_word) {
		Map<String, String> map = new HashMap<String, String>();
		if(index!=-1) {
			String[] search_field=new String[] {"commu_subject", "commu_content", "commu_name"};
			map.put("search_field", search_field[index]);
			map.put("search_word","%"+search_word+"%");
		}
		return dao.getListCount(map);
	}

	@Override
	public List<Review> getBoardList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(index!=-1) {
			String[] search_field=new String[] {"commu_subject", "commu_content", "commu_name"};
			map.put("search_field", search_field[index]);
			map.put("search_word","%"+search_word+"%");
		}
		
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getBoardList(map);
	}


}
