package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Override
	public int getListCount(Product product) {
		return dao.getListCount(product);
	}
	
	@Override
	public List<ItemAsk> getAskList(int page, int limit, Product product) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("product", product);
		return dao.getAskList(map);
	}
	
	@Override
	public int updateAsk(ItemAsk itemask) {
		return dao.updateAsk(itemask);
	}

}
