package com.Pet_Topia.domain;

//1:1 문의시 어드민이 답변해줌.

public class Aac {
   
   private int num;
   private String content;
   private String reg_date;
   private String ask_output;
   private int ask_list_num; //문의글 번호를 레퍼런스. AAM_NUMBER
   
   
   
   public int getNum() {
      return num;
   }
   public void setNum(int num) {
      this.num = num;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getReg_date() {
      return reg_date;
   }
   public void setReg_date(String reg_date) {
      this.reg_date = reg_date;
   }
   public String getAsk_output() {
      return ask_output;
   }
   public void setAsk_output(String ask_output) {
      this.ask_output = ask_output;
   }
   public int getAsk_list_num() {
      return ask_list_num;
   }
   public void setAsk_list_num(int ask_list_num) {
      this.ask_list_num = ask_list_num;
   }
   
   
   
     
     
     

}