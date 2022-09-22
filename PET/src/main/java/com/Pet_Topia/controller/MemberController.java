package com.Pet_Topia.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.MailVO;
import com.Pet_Topia.domain.Member;
import com.Pet_Topia.service.MemberService;
import com.Pet_Topia.task.SendMail;

@Controller
@RequestMapping(value = "/main") 
public class MemberController {
	// import org.slf4j.Logger;
	// import org.slf4j.LoggerFactory;
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

	private MemberService memberservice;
	private PasswordEncoder passwordEncoder;
	private SendMail sendMail;
	
	@Autowired
	public MemberController(MemberService memberservice,
			PasswordEncoder passwordEncoder,SendMail sendMail) {
		this.memberservice = memberservice;
		this.passwordEncoder = passwordEncoder;
		this.sendMail = sendMail;
		
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "member/main";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login_form";
	}
	
	//회원가입 선택지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/join_member";
	}
	
	//개인 회원가입 폼
	@RequestMapping(value = "/customer_join", method = RequestMethod.GET)
	public String customer_join() {
		return "member/join_customer";
	}
	
	//기업 회원가입 폼
	@RequestMapping(value = "/business_join", method = RequestMethod.GET)
	public String business_join() {
		return "member/join_business";
	}
	
	//아이디 / 비밀번호 찾기 폼
	@RequestMapping(value = "/Find_user", method = RequestMethod.GET)
	public String Find_id_pass() {
			return "member/Find_id_pass";
	}


	//회원가입폼에서 아이디 검사
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public void idcheck(@RequestParam("member_id") String member_id, 
						HttpServletResponse response) throws Exception {
		int result = memberservice.isId(member_id);
		Logger.info("idcheck");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	//회원가입
	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
	public String joinProcess(Member m,
							RedirectAttributes rattr,
							Model model,
							HttpServletRequest request) {
		
		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(m.getMember_password());
		Logger.info(encPassword);
		m.setMember_password(encPassword);
		
		int result = memberservice.insert(m);
		
		//삽입이 된 경우
		if(result==1) {
			
			MailVO vo = new MailVO();
			vo.setTo(m.getMember_email());
			vo.setContent("<br><span>"+m.getMember_id() + "님 회원 가입을 축하드립니다.</span><br><a href='http://localhost:9600/pet_topia/'><b>홈페이지 바로가기</b></a>");
			sendMail.sendMail(vo);
			
			rattr.addFlashAttribute("message","JoinSuccess");
			return "redirect:main";
		}else {
			model.addAttribute("url",request.getRequestURL());
			model.addAttribute("message","회원 가입 실패");
			return "error/error";
		}
	}
	
	
	
	//회원 정보 수정폼
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public ModelAndView member_update(Principal principal,
									  ModelAndView mv) {
		
		String id = principal.getName();
		
		if(id==null) {
			mv.setViewName("redirect:login");
			Logger.info("id is null");
		}else {
			Member m = memberservice.member_info(id);
			mv.setViewName("member/member_updateForm");
			mv.addObject("memberinfo",m);
		}
		return mv;
	}
	
	@RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
	public String updateProcess(Member m,
							RedirectAttributes rattr,
							Model model,
							HttpServletRequest request) throws Exception {
		int result = memberservice.update(m);
		if(result==1) {
			rattr.addFlashAttribute("result","updateSuccess");
			return "redirect:/board/list";
		}else {
			model.addAttribute("url",request.getRequestURL());
			model.addAttribute("message","정보 수정 실패");
			return "error/error";
		}
	}
	
}
