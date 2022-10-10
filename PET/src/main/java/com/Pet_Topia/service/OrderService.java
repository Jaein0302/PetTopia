package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.OrderInfo;

public interface OrderService {

	int OrderListCount(String member_id);

	List<OrderInfo> OrderList(String member_id);

	int LastCount(String member_id);

	List<OrderInfo> Lastlist(String member_id, int page, int limit);

	int order_delete(int order_id);

	List<OrderInfo> findScheduleListBySeller(String seller_id);

	OrderInfo order_info(int order_id);

	OrderInfo order_info_last(int order_id);



}
