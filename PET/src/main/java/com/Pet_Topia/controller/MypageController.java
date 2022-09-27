package com.Pet_Topia.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.Member;
import com.Pet_Topia.service.MemberService;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	private MemberService memberservice;
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	public MypageController(MemberService memberservice, PasswordEncoder passwordEncoder) {
		this.memberservice = memberservice;
		this.passwordEncoder = passwordEncoder;
	}
	
	@RequestMapping(value ="/update", method= RequestMethod.GET)
	public ModelAndView member_updateform(Principal principal, ModelAndView mv) {
		
		String id = (String) principal.getName();
		

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
	
	@RequestMapping(value="/updateProcess", method = RequestMethod.POST)
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
	
	@RequestMapping(value="/goto_changePW", method = RequestMethod.GET)
	public String changePW () {
		return "mypage/change_password_form";
	}
	
	@RequestMapping(value="changePW_Proccess", method = RequestMethod.POST)
	public ModelAndView changePW_Process( @RequestParam("member_pass") String new_pass,
										Principal principal, ModelAndView mv) {
		String id = (String) principal.getName();
		//비밀번호 암호화
		String encPassword = passwordEncoder.encode(new_pass);
		
		
		int result = memberservice.update_pass(encPassword, id);
		
		if (result == 1) {
			mv.setViewName("mypage/success");
			return mv;
		} else {
			mv.setViewName("mypage/fail");
			return mv;
		}
	}

}
