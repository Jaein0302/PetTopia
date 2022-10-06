package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Cart;
import com.Pet_Topia.domain.Product;



public interface ProductService {

	public List<Product> getSearchList(String category,int index,String search_word);
	
	public List<Product> getListAjax(String sex, String weight, String species);
	
	//상품 등록
	public int insertProduct(Product product, String member_id) ;
	
	public Product getDetail(int ITEM_ID);

	public int getListCount();
	
	//상품 조회
	public List<Product> getProductList(int page, int limit, String member_id);
	
	public int productUpdate(Product product);

	public int productDelete(int ITEM_ID);

	public int OrderInsert(int order_id, int item_id, String member_id, int order_amount, int order_price);
	
	public int CartInsert(Product productdata, int amount, String member_id);
	
	public List<Cart> getCartList(String member_id);
	
	public Cart checkCart(int ITEM_ID);
	
	public int getmyListCount(String member_id);

}
