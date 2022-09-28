package com.Pet_Topia.mybatis.mapper;

import java.lang.System.Logger;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Product;

@Mapper
public interface ProductMapper {

	public List<Product> getSearchList(Map<String, String> map);
	
	public List<Product> getListAjax(Map<String, String> map);
	
	public int insertProduct(Product product);

	
	public Product getDetail(int ITEM_ID);
 

}
