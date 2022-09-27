package com.Pet_Topia.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Pet_Topia.domain.Community;
import com.Pet_Topia.domain.MySaveFolder;
import com.Pet_Topia.service.CommunityService;

@Controller
@RequestMapping(value = "/community")
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	private CommunityService service;
	private MySaveFolder mysavefolder;
	
	@Autowired
	public CommunityController(CommunityService service,MySaveFolder mysavefolder) {
		this.service = service;
		this.mysavefolder=mysavefolder;
	}
	
	// 게시판 리스트
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
	
	// 글쓰기 폼 이동
	@GetMapping(value="/write")
	public String boardwrite() {
		return "community/comm_write";
	}
	
	// 글쓰기
		@PostMapping("/add")
		public String add(Community comm, HttpServletRequest request) throws Exception {

			MultipartFile uploadfile = comm.getUploadfile();

			if (!uploadfile.isEmpty()) {
				String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
				comm.setCommu_original(fileName); // 원래 파일명 저장
				String saveFolder = mysavefolder.getSavefolder();

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
				comm.setCommu_file(fileDBName);
			}

			service.insert(comm); // 저장 메서드 호출
			logger.info(comm.toString());// selectKey로 정의한 BAORD_NUM 값 확인해 봅니다.
			return "redirect:list";

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
		
		@GetMapping(value = "/detail")
		public ModelAndView detail(int num, ModelAndView mv, HttpServletRequest request,
				@RequestHeader(value = "referer") String beforeURL)
		{
			logger.info("referer:" + beforeURL);
			if (beforeURL.endsWith("list")) {
				service.setReadCountUpdate(num);
			}

			Community community = service.getDetail(num);
			// board=null; //error 페이지 이동 확인하고자 임의로 지정합니다.
			if (community == null) {
				logger.info("상세보기 실패");
				mv.setViewName("error/error");
				mv.addObject("url", request.getRequestURL());
				mv.addObject("message", "상세보기 실패입니다.");
			} else {
				logger.info("상세보기 성공");
				//int count = service.getListCount(num);
				mv.setViewName("community/comm_detail");
				//mv.addObject("count", count);
				mv.addObject("c", community);
			}
			return mv;
		}
		
		@GetMapping(value = "/modifyView") 
		public ModelAndView modifyView(int num, 
				ModelAndView mv,
				HttpServletRequest request) {
			Community boarddata = service.getDetail(num);
			
			//글 내용 불러오기 실패한 경우 입니다.
			if(boarddata == null) {
				logger.info("수정보기 실패");
				mv.setViewName("error/error");
				mv.addObject("url",request.getRequestURL());
				mv.addObject("message","수정보기 실패입니다.");
				return mv;
			}
			logger.info("(수정)상세보기 성공");
			mv.setViewName("community/comm_modify");
			mv.addObject("c", boarddata);
			return mv;
		}
		
		@GetMapping("/delete")
		public String delete(int num,
							 Model mv, HttpServletRequest request,
							 RedirectAttributes rattr) {

			int result = service.delete(num);
			
			//삭제 처리 실패한 경우
			if(result == 0) {
				logger.info("게시판 삭제 실패");
				mv.addAttribute("url",request.getRequestURL());
				mv.addAttribute("message", "게시판 삭제 실패");
				return "error/error";
			}
			//삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분입니다.
			logger.info("게시판 삭제 성공");
			rattr.addFlashAttribute("result","deleteSuccess");
			return "redirect:list";
		}
		
		
		
		
}
