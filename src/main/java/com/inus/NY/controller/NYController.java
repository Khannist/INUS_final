package com.inus.NY.controller;





import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class NYController {
	@Autowired
	SqlSession	sqlsession; 
	
	


	   @RequestMapping("/LOG_JOIN")
	   public String LOGINController() {
	      return "LoginLoinus";
	   }
	   @RequestMapping("/INUS")
	   public String INUSController() {	//이너스 소개페이지
	      return "INUS";
	   }

	   @RequestMapping("/SERVER")
	   public String RoomController() {
	      return "ServerPage";
	   }
	   @RequestMapping("/AddServer")
	   public String AddServerController() {
	      return "AddServerRoom";
	   }

	   @RequestMapping("/SET")
      public String SetController() {
         return "Set";
      }
	   
	   
	   
	   
}




