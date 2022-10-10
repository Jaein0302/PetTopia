package com.Pet_Topia.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.service.AskService;

@Controller
@RequestMapping(value = "/ask")
public class AskController {
	
	private static final Logger logger = LoggerFactory.getLogger(AskController.class);
	
	private AskService askService;
	
	@Autowired
	public AskController(AskService askService) {
		this.askService = askService;
	}
	
	@PostMapping(value = "/add")
	public String ask_add(Model mv,
						  RedirectAttributes rattr,					
						  ItemAsk itemask,
						  HttpServletRequest request,
						  @RequestHeader(value = "referer") String beforeURL)throws Exception {
		
		logger.info("referer:" + beforeURL);
		
		int result = askService.insertAsk(itemask); 
		
		if(result == 0) {
			logger.info("상품문의 등록실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("message", "상품 문의 실패");
			return "error/error";
		}
		
		logger.info("상품 문의 성공");		
		rattr.addFlashAttribute("result","addSuccess");
		
		return "redirect:" + beforeURL;		
	}
	
	@PostMapping(value = "/update")
	public String updateAsk(
							 ItemAsk itemask,
							 RedirectAttributes rattr,
							 @RequestHeader(value = "referer") String beforeURL)throws Exception {
		
		int result = askService.updateAsk(itemask); 
		logger.info("result=" + result);
		
		if (result == '1') {
			rattr.addFlashAttribute("result", "updatesuccess");
		}		

		return "redirect:" + beforeURL;		
	}
}
	
	
