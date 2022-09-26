package com.Pet_Topia.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.Member;
import com.Pet_Topia.service.MemberService;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private MemberService memberservice;
	
	@Autowired
	public MypageController(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	
	@RequestMapping(value ="/update", method= RequestMethod.GET)
	public ModelAndView member_updateform(Principal principal, ModelAndView mv) {
		
		String id = (String) principal.getName();
		
		//int i = 5/0; //오류테스트

		if (id == null) {
			mv.setViewName("redirect:login");
			logger.info("id is null");
		} else {
			Member m = memberservice.member_info(id);
			mv.setViewName("mypage/member_updateForm");
			mv.addObject("memberinfo", m);
		}
		
		return mv;
	}
	
	@RequestMapping(value="updateProcess", method = RequestMethod.POST)
	public String BoardModifyAction(	Member member,
										Model model,
										HttpServletRequest request,
										RedirectAttributes rattr) throws Exception{
		
		int result = memberservice.update(member);
		
		if (result == 1) {
			return "redirect:/";
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message","정보 수정 실패");
			return "error/error";
		}
	}

}
