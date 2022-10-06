package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Cart;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.domain.Wish;



public interface ProductService {

	public List<Product> getSearchList(String category,int index,String search_word);
	
	public List<Product> getListAjax(String sex, String weight, String species);
	
	public int insertProduct(Product product) ;
	
	public Product getDetail(int ITEM_ID);

	public int getListCount();
	
	public List<Product> getProductList(int page, int limit);
	
	public int productUpdate(Product product);

	public int productDelete(int ITEM_ID);

	public int OrderInsert(int order_id, int item_id, String member_id, int order_amount, int order_price);
	
	public int CartInsert(Product productdata, int amount, String member_id);
	
	public List<Cart> getCartList(String member_id);
	
	public Cart checkCart(int ITEM_ID);

	public Wish checkWish(int iTEM_ID, String member_id);

	public int WishInsert(Wish newWishItem);


}
