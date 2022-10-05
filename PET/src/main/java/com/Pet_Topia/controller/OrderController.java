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
import org.springframework.web.bind.annotation.GetMapping;
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
	
	// 리뷰 작성 폼
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public ModelAndView review(ModelAndView mv) {
		mv.setViewName("order/review_write");
		return mv;
	}
	
	// 리뷰 쓰기
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
		
		// 텍스트만 추출
		String textTag = content.replaceAll("<[^>]*>", "");
		System.out.println("textTag : " + textTag);
		review.setReview_text(textTag);
		
		rservice.insert(review); // 저장 메서드 호출
		
		int review_item_id = review.getReview_item_id();
		
		//별점 구하기
		Double star_avg = rservice.starAVG(review_item_id);
		logger.info("평균 별점 : "+star_avg);
		
		//별점 Update
		rservice.starUpdate(review_item_id);
		
		return "redirect:list";
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
		
		// 나의 리뷰 게시판
		@RequestMapping(value = "/myreview", method = RequestMethod.GET)
		public ModelAndView myreview(
				@RequestParam(value = "member_id") String member_id,
				@RequestParam(value = "page", defaultValue = "1", required = false) int page,
				ModelAndView mv) {
		
			int limit = 10; // 한 화면에 출력할 로우 갯수
			int listcount = rservice.mygetListCount(member_id); // 총 리스트 수를 받아옴
			int maxpage = (listcount + limit - 1) / limit;
			int startpage = ((page - 1) / 10) * 10 + 1;
			int endpage = startpage + 10 - 1;
			if (endpage > maxpage) endpage = maxpage;

			List<Review> boardlist = rservice.mygetBoardList(member_id, page, limit); // 리스트를 받아옴
			mv.setViewName("order/review_mylist");
			mv.addObject("page", page);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("boardlist", boardlist);
			mv.addObject("limit", limit);
			return mv;
		}
		
}
