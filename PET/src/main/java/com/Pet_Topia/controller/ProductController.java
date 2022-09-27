package com.Pet_Topia.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Pet_Topia.domain.Product;
import com.Pet_Topia.service.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	private ProductService productService;
	
	@Autowired
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	@RequestMapping(value ="/product_list")
	public ModelAndView productlist(
			@RequestParam(value="item_category")String category,
			ModelAndView mv
			) {
		logger.info("item_category=" + category );
		List<Product> list = productService.getSearchList(category);
		
		logger.info("list=" + list);
		mv.addObject("productlist", list);
		mv.setViewName("product/treat_list");
		return mv;
	}	
	
	@RequestMapping(value ="/detail")
	public ModelAndView productdetail(
//			int product_num,
			ModelAndView mv			
			) {
//		Product product = productService.getDetail(product_num);
		
//		if(product == null) {
//			logger.info("상세페이지 보기 실패");
//			mv.setViewName("error/error");
//			mv.addObject("message", "상세보기 실패입니다.");
//		} else {
			logger.info("상세페이지 보기 성공");
			mv.setViewName("product/product_detail");
//			mv.addObject("productdata", product);
//		}
		return mv;
		
	}
	
//	@RequestMapping(value ="/add") {
//		public String ask_add(//		
//	}	

	@RequestMapping(value ="/wish")
	public String wish_list() {	
		return "product/wish_list";
	}	
	
	@RequestMapping(value ="/cart")
	public String cart_list() {	
		return "product/cart_list";
	}	
}
	
	
