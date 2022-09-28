package com.Pet_Topia.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.MySaveFolder;
import com.Pet_Topia.domain.Product;
import com.Pet_Topia.service.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	private ProductService productService;
	private MySaveFolder mysavefolder;
	
	@Autowired
	public ProductController(ProductService productService,
							 MySaveFolder mysavefolder) {
		this.productService = productService;
		this.mysavefolder = mysavefolder;
	}
	
	@RequestMapping(value ="/product_list")
	public ModelAndView productlist(
			@RequestParam(value="item_category")String category,
			@RequestParam(value="search_field", defaultValue="-1", required = false) int index,
			@RequestParam(value="search_word",  defaultValue="",   required = false) String search_word,
			ModelAndView mv
			) {
		List<Product> list = productService.getSearchList(category, index, search_word);
		logger.info("item_category= " + category);
		logger.info("search_field= " + index);
		logger.info("search_word= " + search_word);

		mv.addObject("productlist", list);
		mv.setViewName("product/treat_list");
		return mv;
	}	
	
	@ResponseBody
	@RequestMapping(value ="/list_ajax")
	public Map<String, Object> productListAjax(
			@RequestParam(value="ITEM_SEX", defaultValue="", required = true) String sex,
			@RequestParam(value="ITEM_WEIGHT", defaultValue="", required = true) String weight,
			@RequestParam(value="ITEM_SPECIES", defaultValue="", required = true) String species
			) {
		
		logger.info("ITEM_SEX= " + sex);
		logger.info("ITEM_WEIGHT= " + weight);
		logger.info("ITEM_SPECIES= " + species);
		
		List<Product> list = productService.getListAjax(sex, weight, species);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productlist", list);

		return map;
	}	
	
	@GetMapping(value ="/detail")
	public ModelAndView productdetail(
					@RequestParam(value="ITEM_ID", required = true) int ITEM_ID,
					ModelAndView mv			
					) {
		Product product = productService.getDetail(ITEM_ID);
		
		if(product == null) {
			logger.info("상세페이지 보기 실패");
			mv.setViewName("error/error");
			mv.addObject("message", "상세보기 실패입니다.");
		} else {
			logger.info("상세페이지 보기 성공");
			mv.setViewName("product/product_detail");
			mv.addObject("productdata", product);
		}
		return mv;
		
	}
	
	@GetMapping(value ="/my_product") 
	public String my_product() {
		return "product/my_product";			
	}	
	
	@PostMapping(value ="/product_add") 
	public String add_product(Model mv, 
							  RedirectAttributes rattr, 
							  Product product, 
							  HttpServletRequest request) throws Exception {
		
		MultipartFile uploadfile = product.getUploadfile();

		if (!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
			product.setITEM_IMAGE_ORIGINAL(fileName); // 원래 파일명 저장
			String saveFolder = mysavefolder.getSavefolder();
			
			logger.info("fileName=" + fileName);
			logger.info("mysavefolder=" + mysavefolder);
			logger.info("saveFolder=" + saveFolder);
			/*
			  String saveFolder =
			  request.getSession().getServletContext().getRealPath("resources") +
			  "/upload";
			 */
			String fileDBName = fileDBName(fileName, saveFolder);
			logger.info("fileDBName = " + fileDBName);

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			logger.info("transferTo path = " + saveFolder + fileDBName);
			// 바뀐 파일명으로 저장
			product.setITEM_IMAGE_FILE(fileDBName);
		}
		
		logger.info(product.toString());// selectKey로 정의한 BAORD_NUM 값 확인해 봅니다.
		int result = productService.insertProduct(product); // 저장 메서드 호출
		
		if(result == 0) {
			logger.info("상품 등록실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("message", "게시판 삭제 실패");
			return "error/error";
		}
		
		logger.info("게시판 삭제 성공");		
		rattr.addFlashAttribute("result","addSuccess");
		
		return "redirect:my_product";
	}
	
	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
		int date = c.get(Calendar.DATE); // 오늘 일 구합니다.

		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir(); // 새로운 폴더를 생성
		}
		// 난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);

		/**** 확장자 구하기 시작 ****/
		int index = fileName.lastIndexOf(".");
		// 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
		// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
		// (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
		logger.info("index = " + index);

		String fileExtension = fileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		/*** 확장자 구하기 끝 ***/

		// 새로운 파일명
		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);

		// 오라클 디비에 저장될 파일 명
		// String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}


	@RequestMapping(value ="/wish")
	public String wish_list() {	
		return "product/wish_list";
	}	
	
	@RequestMapping(value ="/cart")
	public String cart_list() {	
		return "product/cart_list";
	}	
}
	
	