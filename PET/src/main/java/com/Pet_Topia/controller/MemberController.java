package com.Pet_Topia.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	//메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "member/main";
	}
	
	//로그인에러시
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
	
	//회원가입폼에서 아이디 검사
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public void idcheck(@RequestParam("id") String member_id, 
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
	
	//아이디 / 비밀번호 찾기 폼
	@RequestMapping(value = "/Find_user", method = RequestMethod.GET)
	public String Find_id_pass() {
				return "member/Find_id_pass";
		}
		
	//아이디 찾기
	@PostMapping(value="/Find_id")
	public ModelAndView Find_id(String member_name,String member_email, HttpServletRequest request,
			ModelAndView mv) {
			String id = memberservice.find_id(member_name, member_email);
			if(id!=null) {
				mv.setViewName("member/Find_id_success");
				mv.addObject("member_id",id);
			}else {
				mv.addObject("message","fail");
				mv.setViewName("member/Find_id_pass");
			}
		return mv;
	}
	
	//비밀번호 찾기
	@PostMapping(value="/Find_pass")
	public ModelAndView Find_pass(String member_id,String member_name,String member_email, 
			ModelAndView mv,
			HttpServletRequest request) {
		
		Member m = new Member();
		int result = memberservice.find_pass(member_id, member_name, member_email);
		
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        String str = "";
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
		
				if(result==1) {
					MailVO vo = new MailVO();
					vo.setTo(member_email);
					vo.setSubject("<펫토피아> 임시 비밀번호 발송 메일");
					vo.setContent("<br><span>"+member_id + "님의 임시비밀번호는 <b>"+str+"</b> 입니다.</span><br><a href='http://localhost:9600/pet_topia/'><b>홈페이지 바로가기</b></a>");
					sendMail.sendMail(vo);
					//임시비밀번호로 업데이트
					String Password = passwordEncoder.encode(str);
					memberservice.update_pass(Password, member_id);
					mv.setViewName("member/Find_pass_success");
					mv.addObject("member_email",member_email);
				}else {
					mv.addObject("message","fail");
					mv.setViewName("member/Find_id_pass");
				}
				
				return mv;
	}
	


	//통합검색
	@PostMapping(value = "/search_item")
	public String searchitem(@RequestParam("item") String item,Model m) {
		m.addAttribute("item",item);
		return "member/Search_item";
	}
	
	
}
