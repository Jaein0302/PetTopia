package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.mybatis.mapper.AskMapper;

@Service
public class AskServiceImpl implements AskService {
	
    
	private AskMapper dao;
	
	@Autowired
	public AskServiceImpl(AskMapper dao) {
		this.dao = dao;
	}
	
	
	@Override
	public int insertAsk(ItemAsk itemask) {
		return dao.insertAsk(itemask);		
	}
	
}
