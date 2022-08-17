package com.inus.sh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.inus.sh.Dto.SignupDto;
import com.inus.sh.config.auth.CustomUserDetails;
import com.inus.sh.service.UserService;
import com.inus.sh.utils.Script;

@RestController
public class AuthController {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	UserService userService;
	
	
	@GetMapping("/login")
	public ModelAndView signin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/bs/login");
		return mv;
	}
	
	
	@GetMapping("/joinMembership")
	public ModelAndView signup(SignupDto signupDto) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/bs/joinMembership");
		return mv;
	}
	
	//로그인 실패시 failed로 이동
	@GetMapping("/failed")
	public ModelAndView failedSignin(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/bs/login");
		return mv;
	}
	
	//Errors는 반드시 Request객체 바로뒤에 위치해야함
	@PostMapping("/joinMembership")
	public ModelAndView signup(@Valid SignupDto signupDto, Errors errors, Model model) {
		ModelAndView mv = new ModelAndView();
		//유효성 검사 실패
		if(errors.hasErrors()) {
			//사용자로부터 입력받은 데이터를 유지하기 위함
			model.addAttribute("signupDto", signupDto);
			
			//유효성검사에 실패한 필드와 메시지를 저장
			Map<String, String> validResult = validHandling(errors);
			
			//필드를 key값으로 에러메시지 저장
			for(String key : validResult.keySet()) {
				System.out.println(key + validResult.get(key));
				model.addAttribute(key, validResult.get(key));
			}
			
			// 사용자로부터 입력받은 데이터와 에러메시지를 가지고 회원가입 페이지로 다시이동
			mv.setViewName("/bs/joinMembership");
			return mv;
		}
		
		//username이 이미 존재할시 키값에 오류메시지 저장
		if(usernameChk(signupDto.getUserId()) != 0) {
			mv.addObject("valid_userId" ,"이미 등록된 아이디입니다.");
			mv.setViewName("/bs/joinMembership");
			return mv;
		}
		
		//유효성 검사 성공시 회원가입 서비스 로직 실행
		signup(signupDto);
		
		// 회원가입이 성공하면 로그인 페이지 이동
		String encPassword = bCryptPasswordEncoder.encode(signupDto.getPassword());
		signupDto.setPassword(encPassword);
		sqlSession.insert("AuthMapper.signup", signupDto);
		
		mv.setViewName("/bs/login");
		return mv;
		
	}
	
	// 유효성 검사를 위한 메서드
	public Map<String, String> validHandling(Errors errors){
		Map<String, String> validResult = new HashMap<>();
		for(FieldError error : errors.getFieldErrors()) {
			validResult.put("valid_"+error.getField(), error.getDefaultMessage());
		}
		return validResult;
	}
	
	// 아이디 중복체크를 위한 메서드
	public int usernameChk(String userId) { 
	    int result = sqlSession.selectOne("AuthMapper.usernameChk", userId);
	    return result; 
	}
	
	 //회원정보 수정 처리
	 
		/*
		 * @PostMapping("/myInfo") public String myInfo (
		 * 
		 * @RequestParam("password") String passwordout,
		 * 
		 * @RequestParam("nickname") String nickname,
		 * 
		 * @RequestParam("email") String email, Model model) throws Exception {
		 * 
		 * String password = bCryptPasswordEncoder.encode(passwordout);
		 * 
		 * CustomUserDetails customUserDetails = new CustomUserDetails();
		 * 
		 * customUserDetails.setPassword(password);
		 * customUserDetails.setNickname(nickname); customUserDetails.setEmail(email);
		 * 
		 * userService.modifyInfo(customUserDetails);
		 * 
		 * model.addAttribute("myInfo","info"); model.addAttribute("customUserDetails",
		 * customUserDetails);
		 * 
		 * 
		 * return "sh/jsp/myInfo";
		 * 
		 * }
		 */
	 
}
