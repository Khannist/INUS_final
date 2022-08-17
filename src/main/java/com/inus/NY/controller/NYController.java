package com.inus.NY.controller;





import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.inus.NY.profile.vo.ServerImgvo;


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
	   
	   @RequestMapping("/userReWrite")
      public String userReWriteController() {
         return "NY/ProfileRewrite";
      }
	   
	   @PostMapping("/Insert_serverimg") //채널이미지 삽입
	    public ModelAndView Insert_serverimgCont(
	    	@RequestParam("channelCode") String channelCode,
	    	@RequestParam("channelImg") MultipartFile channelImg) throws IOException {
		    ServerImgvo sVo = new ServerImgvo();
		    System.out.println("1");
		    
		    sVo.setChannelCode(channelCode);
		    sVo.setInsertchannelImg(channelImg.getBytes());
		    
		    System.out.println("2");
		    ModelAndView mv = new ModelAndView();
			sqlsession.insert("com.inus.NY.profile.vo.ServerImgvo.insert_serverImg", sVo);
			System.out.println(sVo);
			mv.addObject("sVo", sVo);
			mv.setViewName("redirect:selet_postingImg");
			
			System.out.println("3");
			return mv;
	   }

	   @RequestMapping("/Selet_serverImg") //채널 이미지 출력
		public void Selet_serverImgCont(ServerImgvo sVo) throws UnsupportedEncodingException {
		    System.out.println("4");
		    System.out.println(sVo);
			ServerImgvo sVo1 = sqlsession.selectOne("com.inus.NY.profile.vo.ServerImgvo.Selet_serverImg", sVo);
			System.out.println("5");
			System.out.println(sVo1);
			ModelAndView mv = new ModelAndView();
			System.out.println("6");
		    mv.addObject("sVo", sVo1);
		    //mv.setViewName("redirect:boardList");
		}
}




