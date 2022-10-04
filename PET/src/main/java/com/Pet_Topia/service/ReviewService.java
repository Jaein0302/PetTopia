package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Review;

public interface ReviewService {

	void insert(Review review);

	int getListCount(int index, String search_word);

	List<Review> getBoardList(int index, String search_word, int page, int limit);

}
