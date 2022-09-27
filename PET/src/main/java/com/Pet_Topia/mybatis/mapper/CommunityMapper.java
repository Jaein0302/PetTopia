package com.Pet_Topia.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.Community;

@Mapper
public interface CommunityMapper {

		// 글의 갯수 구하기
		public int getListCount();

		// 글 목록 보기
		public List<Community> getBoardList(HashMap<String, Integer> map);
		
		//	글 삽입
		public void insert(Community comm);

		public int setReadCountUpdate(int num);

		public Community getDetail(int num);

		public int delete(int num);

	
}
