package com.Pet_Topia.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Product;
import com.Pet_Topia.domain.Review;

@Mapper
public interface OrderMapper {

	void insert(Review review);

	int getListCount(int ITEM_ID);

	List<Review> getBoardList(Map<String, Object> map);

	int mygetListCount(String member_id);

	List<Review> mygetBoardList(Map<String, Object> map);

	Double starAVG(int review_item_id);

	void starUpdate(Product p);

	List<Review> getPhoto(int ITEM_ID);


}
