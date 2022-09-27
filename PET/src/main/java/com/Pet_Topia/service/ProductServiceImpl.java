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
	
    @Autowired
    private PasswordEncoder passwordEncoder;
    
	private ProductMapper dao;
	
	@Autowired
	public ProductServiceImpl(ProductMapper dao) {
		this.dao = dao;
	}
	
	
	@Override
	public List<Product> getSearchList(String category) {
		
		return dao.getSearchList(category);
	}
	
//	@Override
//	public Product getDetail(int product_detail) {
//		return dao.getDetail(product_detail);
//	}
}
