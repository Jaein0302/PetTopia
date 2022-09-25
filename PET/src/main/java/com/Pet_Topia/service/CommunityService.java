package com.Pet_Topia.service;

import java.util.List;

import com.Pet_Topia.domain.Community;

public interface CommunityService {

	int getListCount();

	List<Community> getBoardList(int page, int limit);

}
