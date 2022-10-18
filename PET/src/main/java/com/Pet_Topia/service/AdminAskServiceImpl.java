package com.Pet_Topia.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Pet_Topia.domain.Aac;
import com.Pet_Topia.domain.Aam;
import com.Pet_Topia.mybatis.mapper.AdminMapper;

@Service
public class AdminAskServiceImpl implements AdminAskService {
   
    @Autowired
      private AdminMapper dao;
    
   
    
//      // 2.검색 리스트에 대하여 얼마나 검색되었는지 알려줌.
//      @Override
//      public int getSearchMemberListCount(int index, String search_word) {
//         Map<String, String> map = new HashMap<String, String>();
//         if (index != -1) {
//            String[] search_field = new String[] { "id", "name"};
//            map.put("search_field", search_field[index]);
//            map.put("search_word", "%" + search_word + "%");
//         }
//         return dao.getSearchMemberListCount(map);
//      }
//    
    
    
    
    ////   1.관리자는 컬럼 선택에 따라 1:1문의 사항을 다볼수있음.
   @Override
   public List<Aam> getAskColumnList(int search_field_one, int search_field_two, int page, int limit,String search_word) {
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
      map.put("CHECK", "DONE");
      return dao.getAskColumnList(map);
      }else if(search_field_one == -1){
         int startrow = (page - 1) * limit + 1;
         int endrow = startrow + limit - 1;
         map.put("start", startrow);
         map.put("end", endrow);
         return dao.getAskColumnListAll(map);
   }else if(search_field_one ==2) {
      return null;
   }else {
      return null;
   }
   }
   
   
   public int getAskColumnListCount(int search_field_one, int search_field_two,String search_word) {
      
      Map<String, Object> map = new HashMap<String, Object>();
      //http://localhost:8088/myhome4/member/list로 접속하는 경우
      //select를 선택하지 않아 index는 "-1"의 값을 갖습니다.
      //이 경우 아래의 문장을 수행하지 않기 때문에 "search_field" 키에 대한
      //map.get("search_field")의 값은 null이 됩니다.

      if (search_field_one == 0 ) {
         //0은 답변 대기이다. 
         
         String[] search_field = new String[] {"SUBJECT", "NAME"};
         //2가지 상황이 나눠지고 ...
         //답변대기일때 따로 답변완료일때 따로
      
         map.put("search_field", search_field[search_field_two]);
         
         map.put("search_word", "%" + search_word + "%");
      
          map.put("CHECK", "NOT");
      
      return dao.getAskColumnListCount(map);
      
      }else if(search_field_one ==1) {
         //1은 답변 완료를 부른다.
//0은 답변 대기이다. 
         
         String[] search_field = new String[] {"제목", "작성자"};
         //2가지 상황이 나눠지고 ...
         //답변대기일때 따로 답변완료일때 따로
      
         map.put("search_field", search_field[search_field_two]);
         map.put("search_word", "%" + search_word + "%");
      
      map.put("CHECK", "DONE");
      return dao.getAskColumnListCount(map);
      }else if(search_field_one == -1){
         
         return dao.getAskListAllCount();
         
   }else {
      return 1;
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
   
   
   public List<Aam> test_ask_member(int AAM_NUMBER){
      
      int AAM_NUMBER2 = 23;
      return dao.test_ask_member(AAM_NUMBER2);
   }


   public int getAskMemberListCount(String ask_member) {
      
      return dao.getAskMemberOwnListCount(ask_member);
   }
   
   public Aam getAskDetail(int num) {
      return dao.getAskDetail(num);
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


   
   

}
