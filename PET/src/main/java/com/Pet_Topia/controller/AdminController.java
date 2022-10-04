package com.Pet_Topia.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	// import org.slf4j.Logger;
	// import org.slf4j.LoggerFactory;
	private static final Logger Logger = LoggerFactory.getLogger(AdminController.class);

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
		int startpage = ((page - 1) / 10) * 10 +1;
		
		// 현재 페이지에 보여줄 마지막 페이지 수(10,20,30 등..)
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage)
			endpage = maxpage;
		
		List<Abn> admin_notice_boardlist = adminservice.getAdminNoticeList(page, limit); // 리스트를 받아옴
		
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
	
	
	
	
	
}
