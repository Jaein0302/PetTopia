package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.ItemAnswer;
import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.mybatis.mapper.AskMapper;

@Service
public class AskServiceImpl implements AskService {
	
    
	private AskMapper dao;
	
	@Autowired
	public AskServiceImpl(AskMapper dao) {
		this.dao = dao;
	}
	
	
	@Override
	public int insertAsk(ItemAsk itemask) {
		return dao.insertAsk(itemask);		
	}
	
	@Override
	public int getListCount(Product product) {
		return dao.getListCount(product);
	}
	
	@Override
	public List<ItemAsk> getAskList(int page, int limit, Product product) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("product", product);
		return dao.getAskList(map);
	}
	
	@Override
	public int updateAsk(ItemAsk itemask) {
		return dao.updateAsk(itemask);
	}
	
	@Override
	public int askDelete(int ITEM_ASK_NUM) {
		return dao.askDelete(ITEM_ASK_NUM);
	}	
	
	@Override
	public int getAnswerCount(int ITEM_ID) {
		return dao.getAnswerCount(ITEM_ID);
	}
	
	@Override	
	public List<ItemAsk> getAnswerList(int ITEM_ID) {
		return dao.getAnswerList(ITEM_ID);
	}
	
	@Override	
	public int addAnswer(ItemAnswer answer) {
		return dao.addAnswer(answer);
	}
	
	@Override	
	public List<Integer> answerCheck(int ITEM_ID) {
		return dao.answerCheck(ITEM_ID);
	}
	
	@Override	
	public List<ItemAnswer> answerlist(int ITEM_ID) {
		return dao.answerlist(ITEM_ID);
	}
	
	@Override	
	public int updateAnswer(int ITEM_ANSWER_NUM, String ITEM_ANSWER_CONTENT){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ITEM_ANSWER_NUM", ITEM_ANSWER_NUM);
		map.put("ITEM_ANSWER_CONTENT", ITEM_ANSWER_CONTENT);
		
		return dao.updateAnswer(map);
	}

}
