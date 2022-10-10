package com.Pet_Topia.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;
import com.Pet_Topia.service.AdminService;
import com.Pet_Topia.task.UserExcelExporter;
import com.Pet_Topia.task.UserPdfExporter;

@Controller
@RequestMapping(value = "/admin") 
public class AdminController {

	//멤버 리스트 부르기 위해서 필드값,생성자 생성
	//오토와이러를 안쓴다면?..
	
	private AdminService adminservice;
	

	public AdminController(AdminService adminservice) {
		this.adminservice=adminservice;
	}
	
	
	
	//메인페이지
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	public String main() {
		return "admin/admin_main";
	}
	
	//회원 명단을 불러오기
	@RequestMapping(value="/admin_list")
	public ModelAndView memberList(
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value ="limit", defaultValue = "3", required = false) int limit,
			ModelAndView mv,
			@RequestParam(value ="search_field", defaultValue = "1", required = false) int index,
			@RequestParam(value ="search_word", defaultValue = "", required = false) String search_word
			)
	{
		
		int listcount = adminservice.getSearchListCount(index, search_word);
		List<Member> list = adminservice.getSearchList(index, search_word, page, limit);
		
		
		int maxpage = (listcount + limit -1 ) / limit;
		
		int startpage = ((page-1)/10)*10 +1;
		
		int endpage = startpage+10 -1;
		
		if(endpage>maxpage)
			endpage=maxpage;
		
		
		mv.setViewName("admin/admin_list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount",listcount);
		mv.addObject("memberlist", list);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		return mv;
		
		
	}
	
	//공지사항 게시물 보여주기.
	@RequestMapping(value = "/admin_notice", method = RequestMethod.GET)
	public ModelAndView Admin_notice_board(
									@RequestParam(value = "page", defaultValue = "1", required = false) int page,
									ModelAndView mv) {
		int limit = 10; // 한 화면에 출력할 로우 갯수
		
		int listcount = adminservice.getAdminListCount(); // 총 리스트 수를 받아옴
		
		// 총 페이지 수
		int maxpage = (listcount + limit -1) / limit;
		
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		//int startpage = ((page - 1) / 10) * 10 +1;
		int startpage = 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10,20,30 등..)
		//int endpage = startpage + 10 -1;
		int endpage =10;
		if(endpage > maxpage)
			endpage = maxpage;
		
		List<Abn> admin_notice_boardlist = adminservice.getAdminNoticeList(page, limit); // 리스트를 받아옴
		
		System.out.println(admin_notice_boardlist);
		//현재 여기에서 rnum 등등의  컬럼 값이..? 오는건가?
		//1.sql에서 처음에 오는 값이 rnum과 admin_list의 값이 온다
		//2.Abn에서는
//		private String ADMIN_CONTENT;
//		private String ADMIN_SUBJECT;
//		private String ADMIN_MAIN_COLUMN;
//		private String ADMIN_WIRTER;
//		private MultipartFile uploadfile;
//		private String ADMIN_BOARD_ORIGINAL; //첨부될 파일 이름
//		private String ADMIN_BOARD_DATE;
//	    private String ADMIN_BOARD_FILE;
//      의 값이 있다.
//      먼저 rnum의 값은 받을수가 없는것 같다***
//      SQL의 이름과 도메인의 값은 어떻게 맞출까?
// 	    멤버와 비교하기(성공적으로 되고 있는)
		
// 		1.멤버
		
//		1)컨트롤러
//		List<Member> list = adminservice.
//		getSearchList(index, search_word, page, limit);

//		2)도메인
//      private String member_id		;
//		public String getMember_id() {
//			return member_id;
//		}	
//      <select id="getSearchList" parameterType="map" resultType="member">
//      select * 
//      from ( select rownum rnum, b.*
//          from  (select * 
//                 from member  
//                 where member_id != 'admin'
//                 <include refid="search_"/>
//                   order by member_id
//                  )b 
//           where rownum &lt;=  #{end}    
//        ) 
//      where rnum &gt;= #{start} and rnum  &lt;=  #{end} 
//</select>	
		
//		private String member_id		;
//		private String member_password  ;
//		private String member_name		;
//		private String member_post		;
//		private String member_address	;
//		private String member_email	    ;
//		private String member_tell      ;
//		private String member_btype     ;
//		private String member_regnum    ;
//		private String auth="ROLE_MEMBER";
		
// 여기서 num에 대한 이야기는 없음.
//List<Member> list = adminservice.
//		getSearchList(index, search_word, page, limit);

//	<select id="listAll" resultType="member">
//		select * from member
//		order by member_id
//	</select>	
		
// 생각해보니 여기서 num을 받지는 않음.


//그렇다면 해당 값을 sql로 실행은 했다고 콘솔창에서 나왔지만 해당 값은
//받지를 못한거임.
		
		
		
		
		mv.setViewName("admin/admin_notice");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("admin_notice_boardlist", admin_notice_boardlist);
		mv.addObject("limit", limit);
		
		
		
		return mv;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/export_excel")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		String headerKey = "Content-Disposition";
		
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:MM:ss");
		String currentDateTime = dateFormatter.format(new Date());
		String fileName = "petofia_member"+currentDateTime+".xlsx";
		String headerValue = "attachment; filename="+fileName;
		response.setHeader(headerKey, headerValue);
		List<Member> listMembers = adminservice.listAll();

		UserExcelExporter excelExporter = new UserExcelExporter(listMembers);
		
		excelExporter.export(response);
		
	}
	
	
	
	@GetMapping("/export_pdf")
	public void exportToPdf(HttpServletResponse response) throws IOException {
		  response.setContentType("application/pdf");
	        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
	        String currentDateTime = dateFormatter.format(new Date());
	         
	        String headerKey = "Content-Disposition";
	        String headerValue = "attachment; filename=users_" + currentDateTime + ".pdf";
	        response.setHeader(headerKey, headerValue);
		List<Member> listMembers = adminservice.listAll();

		UserPdfExporter exporter = new UserPdfExporter(listMembers);
		
		
		exporter.export_pdf(response);
		
	}
	
	
//	admin_ask_write
//	@RequestMapping(value = "/join_customer_step1", method = RequestMethod.GET)
//	public String join_customer_step1(@RequestParam(value="agree", required=false) String agree,Model m) {
//		m.addAttribute("agree",agree);
//		return "member/Join/join_customer_step1";
//	}
//	
//	
	
	
	//을 불러오기
		@RequestMapping(value="/admin_ask_list")
		public ModelAndView admin_ask_list(
				@RequestParam(value = "page", defaultValue = "1", required = false) int page,
				@RequestParam(value ="limit", defaultValue = "3", required = false) int limit,
				ModelAndView mv,
				@RequestParam(value ="search_field", defaultValue = "1", required = false) int index,
				@RequestParam(value ="search_word", defaultValue = "", required = false) String search_word
				)
		{
			
			int listcount = adminservice.getSearchListCount(index, search_word);
			List<Member> list = adminservice.getSearchList(index, search_word, page, limit);
			
			
			int maxpage = (listcount + limit -1 ) / limit;
			
			int startpage = ((page-1)/10)*10 +1;
			
			int endpage = startpage+10 -1;
			
			if(endpage>maxpage)
				endpage=maxpage;
			
			
			mv.setViewName("admin/admin_ask_list");
			mv.addObject("page", page);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount",listcount);
			mv.addObject("memberlist", list);
			mv.addObject("search_field", index);
			mv.addObject("search_word", search_word);
			mv.addObject("ask","ask확인값넘기기");
			return mv;
			
			
		}
		
		
		
		
		
		//이동하기(이벤트 페이지)
		@RequestMapping(value = "/admin_eventlist", method = RequestMethod.GET)
		public String admin_eventlist() {
			return "admin/admin_eventlist";
		}
	
	
	
	
	
	
	
	
	

		
	}
	
	
	
	

