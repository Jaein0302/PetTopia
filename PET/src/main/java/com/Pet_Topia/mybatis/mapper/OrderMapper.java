package com.Pet_Topia.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Review;

@Mapper
public interface OrderMapper {

	void insert(Review review);

	int getListCount(Map<String, String> map);

	List<Review> getBoardList(Map<String, Object> map);


}
