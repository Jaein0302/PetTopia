package com.Pet_Topia.mybatis.mapper;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.Product;

@Mapper
public interface AskMapper {

	public int insertAsk(ItemAsk itemask);
	
	public int getListCount(Product product);
	
	public List<ItemAsk> getAskList(HashMap<String, Object> map);
	
	public int updateAsk(ItemAsk itemask);

}
