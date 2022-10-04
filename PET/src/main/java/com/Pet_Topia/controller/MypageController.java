package com.Pet_Topia.controller;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
	
	//회원정보폼으로 이동
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
	
	//회원정보 변경 프로세스
	@RequestMapping(value="/updateProcess", method = RequestMethod.POST)
	public String BoardModifyAction(	Member member,
										HttpServletRequest request,
										RedirectAttributes rattr) throws Exception{
		
		int result = memberservice.update(member);
		
		if (result == 1) {
			rattr.addFlashAttribute("MU_message","success");
			return "redirect:/";
		} else {
			rattr.addFlashAttribute("MU_message","fail");
			return "error/error";
		}
	}
	
	//비밀번호 변경 폼
	@RequestMapping(value="/goto_changePW", method = RequestMethod.GET)
	public String changePW () {
		return "mypage/change_password_form";
	}
	
	//비밀번호 변경 프로세스
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
	
	//탈퇴 폼으로 이동
	@RequestMapping(value="/withdraw", method = RequestMethod.GET)
	public String orderList() {
		
		return "mypage/insert_pw_for_withdraw";
	}
	
	//탈퇴 프로세스
	@RequestMapping(value="/withdraw_process", method = RequestMethod.POST)
	public String withdraw_process ( Principal principal, @RequestParam("password") String password,
									RedirectAttributes rattr,
									HttpServletRequest request,
									HttpServletResponse response) {
		
		String id = (String) principal.getName();
		
		Member rmember = memberservice.getMemberdata(id);
		
		//로그아웃을 위해서 필요
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(rmember != null && passwordEncoder.matches(password, rmember.getMember_password())) {
			rattr.addFlashAttribute("withdraw_message","withdraw_success");
			memberservice.Delete_user(id);//아이디 삭제
			new SecurityContextLogoutHandler().logout(request, response, auth); //로그아웃
			return "redirect:../main/main";
		} else {
			rattr.addFlashAttribute("withdraw_message","withdraw_fail");
			return "redirect:../main/main";
		}
		
	}

}
