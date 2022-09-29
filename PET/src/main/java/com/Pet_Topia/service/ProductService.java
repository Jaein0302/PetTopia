package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Product;



public interface ProductService {

	public List<Product> getSearchList(String category,int index,String search_word);
	
	public List<Product> getListAjax(String sex, String weight, String species);
	
	public int insertProduct(Product product) ;
	
	public Product getDetail(int ITEM_ID);

	public int getListCount();
	
	public List<Product> getProductList(int page, int limit);
	
	public int productUpdate(Product product);

	public int productDelete(int ITEM_ID);




}
