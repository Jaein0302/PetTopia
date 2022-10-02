package com.Pet_Topia.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Pet_Topia.domain.Community_comm;
import com.Pet_Topia.service.Community_comm_Service;

@RestController //@Controller + @ResponseBody
@RequestMapping(value = "/comment")
public class Community_comm_Controller {
	
private static final Logger logger = LoggerFactory.getLogger(Community_comm_Controller.class);

	
	private Community_comm_Service commentService;

	@Autowired
	public Community_comm_Controller(Community_comm_Service commentService) {
		this.commentService = commentService;
	}
	
	@PostMapping(value = "/list")
	public Map<String,Object> CommentList(int comment_commu_num,int page){
		List<Community_comm> list = commentService.getCommentList(comment_commu_num,page);
		int listcount = commentService.getListCount(comment_commu_num);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("listcount", listcount);
		return map;
	}
	
	@PostMapping(value="/add")
	public int CommentAdd(Community_comm co) {
		return commentService.commentsInsert(co);
	}
	
	@PostMapping(value="/update")
	public int CommentUpdate(Community_comm co) {
		return commentService.commentsUpdate(co);
	}
	
	@PostMapping(value="/delete")
	public int CommentDelete(int comment_num) {
		return commentService.commentsDelete(comment_num);
	}
}


