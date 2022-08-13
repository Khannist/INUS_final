package com.inus.NY.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
@RequestMapping("/video")
public class MusicController {

	
	// 비디오 출력
	@RequestMapping("/videoIframeOut")
	public @ResponseBody void CommentList(HttpServletResponse res,  vo) throws Exception {
		System.out.println("1 = " + vo.getInus_CmContent());
		System.out.println("2 = " + vo.getInus_boardNum());
		System.out.println("3 = " + vo.getInus_CmWriter());
		Gson gson = new Gson();
		Map<String, Object> data = new HashMap<String, Object>();
		List<CommentVo> list = sqlSession.selectList("com.inus.board.CommentMapper.getList", vo);
		if(list.size() > 0) {
			data.put("list", list);
		}
		
		System.out.println("data = " + data);
		res.setCharacterEncoding("UTF-8");
		res.getWriter().print(gson.toJson(data));
		}
}
