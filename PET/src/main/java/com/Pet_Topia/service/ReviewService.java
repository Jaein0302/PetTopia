package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Review;

public interface ReviewService {

	void insert(Review review);

	int getListCount(int ITEM_ID);

	List<Review> getBoardList(int ITEM_ID, int page, int limit);

	int mygetListCount(String member_id);

	List<Review> mygetBoardList(String member_id, int page, int limit);

	Double starAVG(int review_item_id);

	void starUpdate(int review_item_id);

}
