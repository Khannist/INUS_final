	package com.inus.bs.controller;


import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.inus.bs.vo.BoardVo;


@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "bs/test";
	}
	
	// 전체목록보기
	@RequestMapping("/boardList")
	public ModelAndView boardList(BoardVo bVo) {
		System.out.println(444);
		System.out.println(bVo);
		List<BoardVo> boardList = sqlSession.selectList("com.inus.board.getBoard");
		System.out.println("boardList = " + boardList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardList",boardList);
		mv.setViewName("bs/boardList");
		return mv;
	}
	
	// 로그인 화면
	@RequestMapping("/login")
	public String login() {
		return "bs/login";
	}
	
	//회원가입 화면
	@RequestMapping("/joinMembership")
	public String joinMembership() {
		return "bs/joinMembership";
	}
	
	// 게시글 상세보기
	@RequestMapping("/boardView")
	public String boardView(Model model ,
			@RequestParam("inus_boardNum") int inus_boardNum) {
			System.out.println(inus_boardNum);
			
			BoardVo bVo = new BoardVo();
			bVo.setInus_boardNum(inus_boardNum);
			System.out.println(bVo);
			System.out.println(inus_boardNum);
			List<BoardVo> boardView = sqlSession.selectList("com.inus.board.getView",bVo);
			System.out.println(boardView);
			
			model.addAttribute("boardView",boardView);
			System.out.println(boardView);
			
			sqlSession.update("com.inus.board.boardCount",bVo);
			return "bs/boardView";
	}
	// 게시글 상세보기
//		@RequestMapping("/boardView")
//		public String boardView(Model model , BoardVo bVo) {
//			
//			List<BoardVo> boardView = sqlSession.selectList("com.inus.board.getView",bVo);
//			model.addAttribute("boardView",boardView);
//			sqlSession.update("com.inus.board.boardCount",bVo);
//			return "bs/boardView";
//		}
	// 게시글 작성화면 보여주기
	@RequestMapping("/boardWrite")
	public ModelAndView boardWrite(Model model, BoardVo bVo) {
		
		model.addAttribute("inus_userName",bVo.getInus_userName());
		List<BoardVo> boardList = sqlSession.selectList("com.inus.board.getBoard");
		model.addAttribute("boardList", boardList);
		
		int intarray= (boardList.get(0).getInus_boardNum() + 1);
		System.out.println("boardList.size()" + boardList.size());
		System.out.println("boardList.get(boardList.size()).getInus_boardNum() + 1 = " + ((boardList.get(boardList.size()-1).getInus_boardNum())));
		System.out.println("boardList.get().getInus_boardNum() = " + boardList.get(0).getInus_boardNum());
		System.out.println("boardList.get(boardList.size()).getInus_boardNum() + 1 = " + ((boardList.get(boardList.size()-1).getInus_boardNum()) + 1));
		System.out.println("intarray = " + intarray);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("inus_boardNum", intarray);
		mv.setViewName("bs/boardWrite");
		
		
		return mv;
	}
	
	
	// 게시글 등록
		//나연수정
		@PostMapping("/boardInsert")
		public ModelAndView boardInsertImg(BoardVo bVo,
			    @RequestParam("boardimg") MultipartFile boardimg) throws IOException {
				if(boardimg.getBytes().length > 0) {
					bVo.setInsertboardImg(boardimg.getBytes());					
				}else {
					bVo.setInsertboardImg(fileWelcome());
				}
				sqlSession.insert("com.inus.board.boardInsert",bVo);
				ModelAndView mv = new ModelAndView();
				
				mv.addObject("inus_boardNum", bVo.getInus_boardNum());
				mv.setViewName("redirect:selet_postingImg");
				
				return mv;
		}
		
		//나연추가
		//게시판 사진 셀렉
		@RequestMapping("/selet_postingImg") 
		public void boardSelectImg(BoardVo bVo,
				HttpServletRequest request, ServletResponse res)  throws Exception{
			   System.out.println("4");
			   System.out.println(bVo);
			   //bVo.setInus_userName("skdus11");
			   List<BoardVo> bVo1 = sqlSession.selectList("com.inus.board.getView",bVo);
			   System.out.println("5");
			   
			   System.out.println("6");
			  

			   System.out.println(bVo1);
			   request.setAttribute("bVo", bVo1);
			   System.out.println("7");
			   request.getRequestDispatcher("/boardList").forward(request, res);
		}

	
	
	// 게시글 수정화면 보여주기
	@RequestMapping("/boardUpdate")
	public String boardUpdate(Model model, BoardVo bVo) {
		List<BoardVo> boardUpdate = sqlSession.selectList("com.inus.board.getView",bVo);
		model.addAttribute("boardUpdate",boardUpdate);
		return "bs/boardUpdate";
	}
	
	// 게시글 수정
	@RequestMapping("/updateBoard")
	public String updateBoard(Model model, BoardVo bVo) {
		List<BoardVo> updateBoard = sqlSession.selectList("com.inus.board.getView",bVo);
		sqlSession.update("com.inus.board.boardUpdate",bVo);
		model.addAttribute("updateBoard",updateBoard);
		return "forward:boardView";
	}
	
	// 게시글 삭제
	@RequestMapping("/boardDelete")
	public String boardDelete(BoardVo bVo) {
		sqlSession.delete("com.inus.board.boardDelete",bVo);
		return "bs/boardList";
	}
	
	public byte[] fileWelcome() {
		FileInputStream fis = null;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        String fileTime = "mainWelcome";

        String fileDir = "src\\main\\resources\\static\\NY\\img\\" + fileTime + ".jpg"; // 파일경로
        System.out.println(fileDir);

        try{
            fis = new FileInputStream(fileDir);
            System.out.println(fis);
        } catch(FileNotFoundException e){
            e.printStackTrace();
        }

        int readCount = 0;
        byte[] buffer = new byte[1024];
        byte[] fileArray = null;

        try{
            while((readCount = fis.read(buffer)) != -1){
                baos.write(buffer, 0, readCount);
            }
            fileArray = baos.toByteArray();
            fis.close();
            baos.close();
        } catch(IOException e){
            throw new RuntimeException("File Error");
        }
        return fileArray;
	}
}
