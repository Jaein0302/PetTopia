package com.Pet_Topia.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView member_update(Principal principal, ModelAndView mv) {
		
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

}
