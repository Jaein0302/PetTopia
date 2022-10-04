package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Product;
import com.Pet_Topia.mybatis.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
    
	private ProductMapper dao;
	
	@Autowired
	public ProductServiceImpl(ProductMapper dao) {
		this.dao = dao;
	}
	
	
	@Override
	public List<Product> getSearchList(String category,int index,String search_word) {
		Map<String, String> map = new HashMap<String, String>();
		
		if(index == 1) {
			map.put("search_word", search_word);
		}
		
		map.put("category", category);
		
		return dao.getSearchList(map);
	}
	
	@Override
	public List<Product> getListAjax(String sex, String weight, String species) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sex", sex);
		map.put("weight", weight);
		map.put("species", species);
		
		return dao.getListAjax(map);
	}
	
	@Override
	public int insertProduct(Product product) {
		return dao.insertProduct(product);		
	}

	
	@Override
	public Product getDetail(int ITEM_ID) {
		return dao.getDetail(ITEM_ID);
	}
	
	@Override
	public int getListCount() {
		return dao.getListCount();
	}

	@Override
	public List<Product> getProductList(int page, int limit) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getProductList(map);
	}
	
	@Override
	public int productUpdate(Product product) {
		return dao.productUpdate(product);
	}
	
	@Override
	public int productDelete(int ITEM_ID) {
		return dao.productDelete(ITEM_ID);		
	}
}
