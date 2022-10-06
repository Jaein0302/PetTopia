package com.Pet_Topia.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Cart;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.domain.Wish;

@Mapper
public interface ProductMapper {

	public List<Product> getSearchList(Map<String, String> map);
	
	public List<Product> getListAjax(Map<String, String> map);
	
	public int insertProduct(Product product);

	public Product getDetail(int ITEM_ID);
	
	public int getListCount();

	public List<Product> getProductList(HashMap<String, Integer> map);
 
	public int productUpdate(Product product);
	
	public int productDelete(int ITEM_ID);
	
	public int OrderInsert(HashMap<String, Object> map);
	
	public int CartInsert(HashMap<String, Object> map);
	
	public List<Cart> getCartList(String member_id);
	
	public Cart checkCart(int ITEM_ID);

	public Wish checkWish(int iTEM_ID, String member_id);

	public int WishInsert(Wish newWishItem);


}
