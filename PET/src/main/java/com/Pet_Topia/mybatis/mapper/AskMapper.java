package com.Pet_Topia.mybatis.mapper;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.ItemAnswer;
import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.Product;

@Mapper
public interface AskMapper {

	public int insertAsk(ItemAsk itemask);
	
	//ask list
	public int getListCount(Product product);
	
	public List<ItemAsk> getAskList(HashMap<String, Object> map);
	
	
	public int updateAsk(ItemAsk itemask);
	
	public int askDelete(int ITEM_ASK_NUM);
	
	//answer list
	public int getAnswerCount(int ITEM_ID);	
	
	public List<ItemAsk> getAnswerList(int ITEM_ID);
	
	
	public int addAnswer(ItemAnswer answer);
	
	public List<Integer> answerCheck(int ITEM_ID);
	
	public List<ItemAnswer> answerlist(int ITEM_ID);
	
	public int updateAnswer(HashMap<String, Object> map);


}
