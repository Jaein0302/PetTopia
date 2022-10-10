package com.Pet_Topia.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.OrderInfo;
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

	Review getDetail(String review_num);

	int review_del(String review_num);

	int OrderListCount(String member_id);

	List<OrderInfo> OrderList(String member_id);

	int LastCount(String member_id);

	List<OrderInfo> LastList(Map<String, Object> map);

	int order_delete(int order_id);

	List<OrderInfo> findScheduleListBySeller(String seller_id);

	OrderInfo order_info(String order_id);

	OrderInfo order_info_last(String order_id);




}
