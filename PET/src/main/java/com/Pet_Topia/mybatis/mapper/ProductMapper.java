package com.Pet_Topia.mybatis.mapper;

import java.lang.System.Logger;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Product;

@Mapper
public interface ProductMapper {

	public List<Product> getSearchList(String category);
	
 	
//	public Product getDetail(int product_num);
 

}
