<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>

</head>
<body>
	<input type="hidden" id="userId" name="userId" value="${userid}">
   <div class="comment_Box" style="border:1px;"> <!-- 댓글이 들어갈 박스 -->
      <p>아직 작성된 글이 없습니다.</p>   
     </div>

   <div class="comment-box">                        
                          <!-- <span class="c-icon"><i class="fa-solid fa-user"></i>  -->
                          <div class="comment-name">
                           <span style='display:none;' class="anonym">작성자 : 
                              <input type="text" class="form-control" id="inus_CmWriter" placeholder="이름" name ="inus_CmWriter" value='${userid}' readonly  style="width: 100px; border:none; ">
                           </span>
                         </div> 
                       
                       <form>
                          <div class="comment-sbox">
                          <input type="text" class="comment-input" id="inus_CmContent" style="border: none;" placeholder="   댓글달기...">
                           <input type="button" class="regBtn" id="Comment_regist"  value="게시" >
                          </div>
                       </form>
    </div>

</body>
</html>