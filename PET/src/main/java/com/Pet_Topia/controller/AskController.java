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

import com.Pet_Topia.domain.ItemAnswer;
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
		
		if (result == 1) {
			rattr.addFlashAttribute("result", "updateSuccess");
		}		

		return "redirect:" + beforeURL;		
	}
	
	@GetMapping("/delete")
	public String delete(int ITEM_ASK_NUM,
						 Model mv, 
						 HttpServletRequest request,
						 RedirectAttributes rattr,
						 @RequestHeader(value = "referer") String beforeURL)throws Exception {

		int result = askService.askDelete(ITEM_ASK_NUM);
		
		//삭제 처리 실패한 경우
		if(result == 0) {
			logger.info("문의 삭제 실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("message", "문의 삭제 실패");
			return "error/error";
		}
		logger.info("문의 삭제 성공");
		rattr.addFlashAttribute("result","deleteSuccess");
		
		return "redirect:" + beforeURL;
	}
	
	@GetMapping("/answer_view")
	public ModelAndView getreplyview(int ITEM_ID,
									ModelAndView mv
								   ) {
				
		int listcount = askService.getAnswerCount(ITEM_ID); //  ask 총 리스트 수	
		List<ItemAsk> asklist = askService.getAnswerList(ITEM_ID); // ask 리스트	
		List<Integer> answercheck = askService.answerCheck(ITEM_ID);  // 답변 유무
		List<ItemAnswer> answerlist = askService.answerlist(ITEM_ID);  // 답변 번호, 답변 내용
				
		logger.info(asklist.toString());
		logger.info(answercheck.toString());
		
		mv.addObject("listcount", listcount);
		mv.addObject("asklist", asklist);
		mv.addObject("answercheck", answercheck);
		mv.addObject("answerlist", answerlist);
		mv.setViewName("product/answer_view");
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value = "/add_answer")
	public int addAnswer( ItemAnswer answer ) {
		
		int result = askService.addAnswer(answer); 
		logger.info("result=" + result);

		return result;	
	}
	
	@GetMapping(value = "/update_answer")
	public String updateAnswer(
							 int ITEM_ANSWER_NUM,
							 String ITEM_ANSWER_CONTENT,
							 RedirectAttributes rattr,
							 @RequestHeader(value = "referer") String beforeURL)throws Exception {
		
		int result = askService.updateAnswer(ITEM_ANSWER_NUM, ITEM_ANSWER_CONTENT); 
		logger.info("result=" + result);
		
		if (result == 1) {
			rattr.addFlashAttribute("result", "updateSuccess");
		}		

		return "redirect:" + beforeURL;		
	}
}
	
	
