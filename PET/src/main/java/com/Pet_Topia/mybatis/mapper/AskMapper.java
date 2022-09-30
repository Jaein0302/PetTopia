package com.Pet_Topia.mybatis.mapper;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Pet_Topia.domain.ItemAsk;

@Mapper
public interface AskMapper {

	public int insertAsk(ItemAsk itemask);



}
