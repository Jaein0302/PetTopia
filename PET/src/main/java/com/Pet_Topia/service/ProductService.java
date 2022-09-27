package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Product;



public interface ProductService {

	public List<Product> getSearchList(String category);
	
//	public Product getDetail(int product_num);


}
