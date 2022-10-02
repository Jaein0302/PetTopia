package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.Product;

public interface AskService {

	public int insertAsk(ItemAsk itemask);
	
	public int getListCount(Product product);

	public List<ItemAsk> getAskList(int page, int limit, Product product);

}
