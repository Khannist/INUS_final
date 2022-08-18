package com.inus.sh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.inus.bs.vo.BoardVo;
import com.inus.sh.vo.MemberListVO;

@Controller
public class FListCotroller {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/flist")
	public @ResponseBody void flist(HttpServletResponse res,MemberListVO mVo) throws Exception{
		Gson gson = new Gson();
		System.out.println("mVo");
		System.out.println("mVo");
		System.out.println("mVo");
		System.out.println(mVo);
		Map<String, Object> data = new HashMap<String, Object>();
		List<BoardVo> memView = sqlSession.selectList("AuthMapper.getMember",mVo);
		System.out.println(memView);
		data.put("list", memView);
		res.getWriter().print(gson.toJson(data));
	}
}
