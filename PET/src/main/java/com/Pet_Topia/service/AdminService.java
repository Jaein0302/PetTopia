package com.Pet_Topia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Abn;
import com.Pet_Topia.domain.Member;

@Service
public interface AdminService {
	
	
public List<Member> getSearchList(int index, String search_word,
			  int page, int limit);

public int getSearchListCount(int index, String search_word);

public List<Member> listAll();


public int getAdminListCount();

public List<Abn> getAdminNoticeList(int page, int limit);



}
