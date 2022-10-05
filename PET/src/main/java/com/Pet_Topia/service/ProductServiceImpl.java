package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Cart;
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
	
	@Override
	public int OrderInsert(int order_id, int item_id, String member_id, int order_amount, int order_price) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order_id", order_id);
		map.put("item_id", item_id);
		map.put("member_id", member_id);
		map.put("order_amount", order_amount);
		map.put("order_price", order_price);
		
		return dao.OrderInsert(map);
	}
	
	@Override
	public int CartInsert(Product productdata, int amount, String member_id) {
		
		int ITEM_ID = productdata.getITEM_ID();
		String CART_ITEM_NAME = productdata.getITEM_NAME();
		String CART_ITEM_IMAGE = productdata.getITEM_IMAGE_FILE();
		int CART_ITEM_PRICE = productdata.getITEM_PRICE();
		
		HashMap<String, Object> map = new HashMap<String, Object>();		
		
		map.put("CART_ITEM_ID", ITEM_ID);
		map.put("CART_MEMBER_ID", member_id);
		map.put("CART_ITEM_NAME", CART_ITEM_NAME);
		map.put("CART_ITEM_IMAGE", CART_ITEM_IMAGE);
		map.put("CART_AMOUNT", amount);
		map.put("CART_ITEM_PRICE", CART_ITEM_PRICE);
		
		return dao.CartInsert(map);
	}
	
	@Override
	public List<Cart> getCartList(String member_id) {
		return dao.getCartList(member_id);		
	}
	
	@Override
	public Cart checkCart(int ITEM_ID) {
		return dao.checkCart(ITEM_ID);
	}

}
