package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.ItemAnswer;
import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.Product;

public interface AskService {

	public int insertAsk(ItemAsk itemask);
	
	//ask list
	public int getListCount(Product product);

	public List<ItemAsk> getAskList(int page, int limit, Product product);
	
	
	public int updateAsk(ItemAsk itemask); 
	
	public int askDelete(int ITEM_ASK_NUM);
	
	//answer list
	public int getAnswerCount(int ITEM_ID);	
	
	public List<ItemAsk> getAnswerList(int ITEM_ID);
	
	
	public int addAnswer(ItemAnswer answer);
	
	public List<Integer> answerCheck(int ITEM_ID);
	
	public List<ItemAnswer> answerlist(int ITEM_ID);
	
	public int updateAnswer(int ITEM_ANSWER_NUM, String ITEM_ANSWER_CONTENT);
	
	
	
	
}
