package com.Pet_Topia.mybatis.mapper;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Cart;
import com.Pet_Topia.domain.Product;

@Mapper
public interface ProductMapper {

	public List<Product> getSearchList(Map<String, String> map);
	
	public List<Product> getListAjax(Map<String, String> map);
	
	public int insertProduct(Map<Object, Object> map);

	public Product getDetail(int ITEM_ID);
	
	public int getListCount();

	public List<Product> getProductList(HashMap<String, Object> map);
 
	public int productUpdate(Product product);
	
	public int productDelete(int ITEM_ID);
	
	public int OrderInsert(HashMap<String, Object> map);
	
	public int CartInsert(HashMap<String, Object> map);
	
	public List<Cart> getCartList(String member_id);
	
	public Cart checkCart(int ITEM_ID);
	
	public int getmyListCount(String member_id);

}
