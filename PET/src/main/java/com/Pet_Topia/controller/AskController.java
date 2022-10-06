package com.Pet_Topia.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.ItemAsk;
import com.Pet_Topia.domain.MySaveFolder;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.service.AskService;
import com.Pet_Topia.service.ProductService;

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
	
	@GetMapping(value = "/detail")
	public String modifyView(int ITEM_ASK_NUM,
							 Model mv,
							 @RequestHeader(value = "referer") String beforeURL)throws Exception {
		
		ItemAsk itemask = askService.getaskDetail(ITEM_ASK_NUM); 		
		logger.info(itemask.getITEM_ASK_SUBJECT());		
	
		mv.addAttribute("itemask",itemask);

		return "redirect:" + beforeURL;		
	}

}
	
	
