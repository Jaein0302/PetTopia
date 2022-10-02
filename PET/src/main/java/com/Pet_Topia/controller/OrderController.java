package com.Pet_Topia.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Pet_Topia.domain.Product;
import com.Pet_Topia.service.OrderService;
import com.Pet_Topia.service.ReviewService;

@Controller
@RequestMapping(value = "/order") 
public class OrderController {
	// import org.slf4j.Logger;
	// import org.slf4j.LoggerFactory;
	private static final Logger Logger = LoggerFactory.getLogger(OrderController.class);

	
	private OrderService oservice;
	private ReviewService rservice;
	
	@Autowired
	public OrderController(OrderService oservice,ReviewService rservice) {
		this.oservice = oservice;
		this.rservice = rservice;
		
	}
	
	// 예약내역
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv) {
		mv.setViewName("order/list");
		return mv;
	}
	
	// 내가 남긴 후기
	@RequestMapping(value = "/myreview", method = RequestMethod.GET)
	public ModelAndView myreview(ModelAndView mv) {
		mv.setViewName("order/review_mylist");
		return mv;
	}
	
	// 내가 남긴 후기
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public ModelAndView review(ModelAndView mv) {
		mv.setViewName("order/review_write");
		return mv;
	}
	
}
