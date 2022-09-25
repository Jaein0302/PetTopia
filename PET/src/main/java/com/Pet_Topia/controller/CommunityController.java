package com.Pet_Topia.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.service.CommunityService;

@Controller
@RequestMapping(value = "/community")
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	private CommunityService service;
	
	@Autowired
	public CommunityController(CommunityService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView baordList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {
		int limit = 8; // 한 화면에 출력할 로우 갯수
		int listcount = service.getListCount(); // 총 리스트 수를 받아옴
		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Community> boardlist = service.getBoardList(page, limit); // 리스트를 받아옴
		mv.setViewName("community/comm_list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("boardlist", boardlist);
		mv.addObject("limit", limit);
		return mv;
	}
	
	@GetMapping(value="/write")
	public String boardwrite() {
		return "community/comm_write";
	}
}
