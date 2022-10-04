package com.Pet_Topia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.mybatis.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	private OrderMapper dao;
	
	@Autowired
	public OrderServiceImpl(OrderMapper dao) {
		this.dao = dao;
	}


}
