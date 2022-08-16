package com.inus.sh.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inus.sh.vo.MemberListVO;

@Controller
public class FriendsController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/boardList")
	public String memberList(Model model, MemberListVO mlVo) {
		List<MemberListVO> memberList = sqlSession.selectList("AuthMapper.getMember");
		model.addAttribute("memberList", memberList);
		return "bs/boardList";
	}
}
