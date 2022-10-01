package com.Pet_Topia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.mybatis.mapper.OrderMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private OrderMapper dao;
	
	@Autowired
	public ReviewServiceImpl(OrderMapper dao) {
		this.dao = dao;
	}


}
