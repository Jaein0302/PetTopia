package com.Pet_Topia.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Pet_Topia.domain.Review;
import com.Pet_Topia.service.OrderService;
import com.Pet_Topia.service.ReviewService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value = "/order") 
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	private OrderService oservice;
	private ReviewService rservice;
	
	@Autowired
	public OrderController(OrderService oservice,ReviewService rservice) {
		this.oservice = oservice;
		this.rservice = rservice;
		
	}
	
	// 예약내역
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv) {
		mv.setViewName("order/list");
		return mv;
	}
	
	// 내가 남긴 후기
	@RequestMapping(value = "/myreview", method = RequestMethod.GET)
	public ModelAndView baordList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value="search_word",defaultValue="",required=false)String search_word,
			@RequestParam(value="search_field",defaultValue="-1",required=false)int index,
			ModelAndView mv) {
		int limit = 10; // 한 화면에 출력할 로우 갯수
		int listcount = rservice.getListCount(index, search_word); // 총 리스트 수를 받아옴
		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int startpage = ((page - 1) / 10) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Review> boardlist = rservice.getBoardList(index, search_word, page, limit); // 리스트를 받아옴
		mv.setViewName("order/review_mylist");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("boardlist", boardlist);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		mv.addObject("limit", limit);
		return mv;
	}
	
	// 후기 작성 폼
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public ModelAndView review(ModelAndView mv) {
		mv.setViewName("order/review_write");
		return mv;
	}
	
	// 썸머노트 이미지 업로드
		@PostMapping(value = "/uploadSummernoteImageFile", produces = "application/json")
		@ResponseBody
		public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

			JsonObject jsonObject = new JsonObject();

			String fileRoot = "C:\\image\\"; // 저장될 외부 파일 경로
			String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
			System.out.println(originalFileName);
			String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

			File targetFile = new File(fileRoot + savedFileName);

			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
				jsonObject.addProperty("url", "/pet_topia/summernoteImage/" + savedFileName);
				jsonObject.addProperty("responseCode", "success");
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			System.out.println(jsonObject);

			return jsonObject;
		}
		
		// 글쓰기
		@PostMapping("/add")
		public String add(Review review, HttpServletRequest request) throws Exception {
			
			// 이미지 태그를 추출하기 위한 정규식.
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>");
			// 추출할 내용.
			String content = review.getReview_content();
			// 내용 중에서 이미지 태그를 찾아라!
			Matcher match = pattern.matcher(content);
			String imgTag = null;
			if(match.find()){ // 이미지 태그를 찾았다면,,
			    imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
			}
			// 결과값은 name1.jpg
			System.out.println("imgTag : " + imgTag);
			review.setReview_image(imgTag);
			
			rservice.insert(review); // 저장 메서드 호출
			return "redirect:list";
		}
		
	
}
