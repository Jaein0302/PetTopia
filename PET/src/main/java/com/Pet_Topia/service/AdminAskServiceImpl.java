package com.Pet_Topia.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.Pet_Topia.domain.Aac;
import com.Pet_Topia.domain.Aam;
import com.Pet_Topia.mybatis.mapper.AdminMapper;
import org.slf4j.Logger;


@Service
public class AdminAskServiceImpl implements AdminAskService {
   
    @Autowired
      private AdminMapper dao;
    
   
    private static final Logger logger = LoggerFactory.getLogger(AdminAskServiceImpl.class);
    
   @Override
   public List<Aam> getAskColumnList(int page, int limit, int search_field_one, int search_field_two,String search_word) {
      Map<String, Object> map = new HashMap<String, Object>();
      if (search_field_one == 0 ) {
         String[] search_field = new String[] {"SUBJECT", "NAME"};
         map.put("search_field", search_field[search_field_two]);
         map.put("search_word", "%" + search_word + "%");
      int startrow = (page - 1) * limit + 1;
      int endrow = startrow + limit - 1;
      map.put("start", startrow);
      map.put("end", endrow);
      map.put("CHECK", null);
      return dao.getAskColumnList(map);
      }else if(search_field_one ==1) {
         String[] search_field = new String[] {"SUBJECT", "NAME"};
         map.put("search_field", search_field[search_field_two]);
         map.put("search_word", "%" + search_word + "%");
      int startrow = (page - 1) * limit + 1;
      int endrow = startrow + limit - 1;
      map.put("start", startrow);
      map.put("end", endrow);
      map.put("CHECK", "NOT");
      return dao.getAskColumnList(map);
      }else {
      
    	  String[] search_field = new String[] {"SUBJECT", "NAME"};
          map.put("search_field", search_field[search_field_two]);
          map.put("search_word", "%" + search_word + "%");
         int startrow = (page - 1) * limit + 1;
         int endrow = startrow + limit - 1;
         map.put("start", startrow);
         map.put("end", endrow);
         map.put("CHECK", "DONE");
         return dao.getAskColumnList(map);
   }
   }
   
   public int getAskColumnListCount(int search_field_one, int search_field_two,String search_word) {
      
      Map<String, Object> map = new HashMap<String, Object>();

      if (search_field_one == 0 ) {
          String[] search_field = new String[] {"SUBJECT", "NAME"};
          map.put("search_field", search_field[search_field_two]);
          map.put("search_word", "%" + search_word + "%");
          map.put("CHECK", null);
      
      return dao.getAskColumnListCount(map);
      
      }else if(search_field_one ==1) {
    	  String[] search_field = new String[] {"SUBJECT", "NAME"};
          map.put("search_field", search_field[search_field_two]);
          map.put("search_word", "%" + search_word + "%");
          map.put("CHECK", "NOT");
      return dao.getAskColumnListCount(map);
      }else{
    	  String[] search_field = new String[] {"SUBJECT", "NAME"};
          map.put("search_field", search_field[search_field_two]);
          map.put("search_word", "%" + search_word + "%");
          map.put("CHECK", "DONE");
      return dao.getAskColumnListCount(map);
   }
   }
   
   public List<Aam> getAskMemberOwnList(int page,int limit,String login_id){
      
      Map<String, Object> map = new HashMap<String, Object>();
      int startrow = (page - 1) * limit + 1;
      int endrow = startrow + limit - 1;
      map.put("start", startrow);
      map.put("end", endrow);
      map.put("login_id", login_id);
      
      return dao.getAskMemberOwnList(map);
      
   }
   
   @Override
   public int getAskMemberOwnListCount(String login_id) {
      return dao.getAskMemberOwnListCount(login_id);
   }
 
   public int getAskMemberListCount(String ask_member) {
      return dao.getAskMemberOwnListCount(ask_member);
   }
   
   public Aac getComent(int num) {
      return dao.getComent(num);
   }
   
   public int AnswerUpdate(int num) {
      return dao.AnswerUpdate(num);
   }
   
   public int write_to_admin_form(Aam aam) {
      return dao.write_to_admin_form(aam);
   }

   public Aam ask_to_admin_view(int num) {
	   return dao.ask_to_admin_view(num);
   }


}
