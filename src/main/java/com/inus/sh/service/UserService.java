package com.inus.sh.service;
 
 import org.apache.ibatis.session.SqlSession; import
 org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import
 org.springframework.transaction.annotation.Transactional;
 
 import com.inus.sh.config.auth.CustomUserDetails;
 
 @Service
 public class UserService {
 
 @Autowired 
 private SqlSession sqlSession; //회원정보 수정
 
 @Transactional 
 public void modifyInfo(CustomUserDetails customUserDetails) throws Exception { 
	 sqlSession.update("UserMapper.modifyInfo",customUserDetails);
 } 
 
 }
