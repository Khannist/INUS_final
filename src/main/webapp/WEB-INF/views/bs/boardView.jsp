<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="bs/css/inus.css">
<link type="text/css" rel="stylesheet" href="bs/css/comment.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/0535b153a9.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link  rel="stylesheet" type="text/css" href="ch/css/channel.css">
</head>
<header>
<a href="/boardList">
	<img src="bs/css/image/last_logo.jpg" id="logo" >
</a>
</header>
<body>
 <sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.userId" var="userid" />
   <sec:authentication property="principal.nickname" var="username" />
   <input type="hidden" id="userId" name="userId" value="${userid}">
   <input type="hidden" name="username" id="username" value="${username}">
</sec:authorize>
<section>
<div class="MainLbar">
   <article>
   <div class="ServerList">
         <div id="serverCount">   <!-- 필요없어보인다고 지우면 안됌 -->
            <jsp:include page="../ch/roomchannel/roomChannel.jsp"></jsp:include>
         </div>
   </div>
   <div class="ChatAndFriendList">
      <div class="chatAndFriendheader">
         <div class="ChatList">
            <div class="headerP" >
               <p id="ChatName">채팅방이름</p>
               <img class="ChatAndFriend_Icon" id="chatIcon" src="bs/css/image/ChatListIcon.png" onclick="F_openrReplace()">
               <img class="ChatAndFriend_Icon" id="chatIcon_2" style="display: none;" src="bs/css/image/ChatListIcon_2.png" onclick="F_closeReplace()">
            </div>
            <!-- 채팅방이름 7자 이내 -->
         </div>
         <div class="FriendReplace" style="display: none;">   <!-- 나연// 수정부분0813[1/2] -->
         <div>
            <p>친구추가</p><br><br>
                     <input type="text" id="friendAdd" placeholder="친구아이디">
         </div>
               <div id="inputNameSpace" style="display:none;"><!-- 확인 -->
                  
                  <input type="button" value="생성">
               </div>
         </div>
         <div>
         	<ul id="friend" class="friend"></ul>
         </div> 
       </div>
   </div>
   </article>
</div>

<script type="text/javascript">
//친구리스트 설정 페이지 나타남
function F_openFReReplace(){
    document.querySelector('.FriendReplace').style.display = "block";   //서버 수정 페이지 나타남
    document.querySelector('#chatIcon_2').style.display = "block";   //닫히는 아이콘 나타남
    document.querySelector('#chatIcon').style.display = "none";   //열리는 아이콘 없어짐

}
//친구리스트 설정 페이지 없어짐
function F_closeFReReplace(){
    document.querySelector('.FriendReplace').style.display = "none";   //서버 수정 페이지 없어짐
    document.querySelector('#chatIcon_2').style.display = "none";         //열리는 아이콘 나타남
    document.querySelector('#chatIcon').style.display = "block";      //닫히는 아이콘 없어짐  
}
//친구 삭제 나타남
function F_closeFReReplace(){
    document.querySelector('.FriendReplace').style.display = "none";   //서버 수정 페이지 없어짐
    document.querySelector('#chatIcon_2').style.display = "none";         //열리는 아이콘 나타남
    document.querySelector('#chatIcon').style.display = "block";      //닫히는 아이콘 없어짐  
}
</script>
<article>
<!-- feed -->
<div class="device">   
  <div class="instagram"> 
     <div class="search-box">
       <button class="btn-search"><i class="fas fa-search"></i></button>
       <input type="text" class="input-search" placeholder="Type to Search...">
  </div>
  <input type="hidden" id="inus_CmWriter" name="inus_CmWriter" value="${userid}">
   <div class="scroll">
            <main class="content" data-aos="flip-left"
     data-aos-duration="1000">
         <c:forEach items="${boardView}" var="boardView">
            <input type="hidden" id="inus_boardNum" name="${boardView.inus_boardNum}" value="${boardView.inus_boardNum}">
            <input type="hidden" id="inus_userName" name="${boardView.inus_userName}" value="${boardView.inus_userName}">
            <div class="postpade" >
                <div class="post">
                    <div class="post-header">
                        <img class="user-thumb" src="https://storage.googleapis.com/mkts/walter.jpg" alt="Walter">
                        <div class="user-details">
                            <strong class="name">${boardView.nickname}</strong>
                            <span class="location"><i class="fa-solid fa-eye"></i>17</span>
                        </div>
                        <div class="post-menu">
                            <span class="menu">&nbsp;</span>
                        </div>
                    </div> 
                    <img src="data:image/jpeg;base64,${boardView.boardImg}"  alt="post" class="post-photo">
                    <div class="post-footer">
 
                        <div class="likes">
                            <div class="comment-count"><i class="fa-solid fa-comment"></i> 댓글이<strong><span id="count">0</span></strong>개가 있습니다.                
	                        	<span class="update"><button type="button" onclick="location.href='boardUpdate?inus_boardNum=${boardView.inus_boardNum}'" style="border:none; background:#fff;"><i class="fa-solid fa-eraser"></i></button> </span>
	                        	<span class="delete"><button type="button" onclick="location.href='boardDelete?inus_boardNum=${boardView.inus_boardNum}'" style="border:none; background:#fff;"><i class="fa-solid fa-trash"></i></button> </span>
                        	</div>
                        </div>

                        <div class="comments">
                            <p>
                                <strong>${boardView.nickname}</strong>&nbsp;&nbsp;${boardView.inus_content}
                            </p>
                        </div>
                        <span class="time"><fmt:formatDate value="${boardView.inus_Date}" type="date" dateStyle="short"/></span>
                        
                        <%@ include file="comment.jsp"%>
                    </div>
                </div>
               </div>
           
         </c:forEach>
         
   </main>
</div>
         <!-- bottom navigation -->
         <div class="bottomNav">
            <nav class="menu">
            <input type="radio" name="menu" id="one" checked>
            <input type="radio" name="menu" id="two">
            <input type="radio" name="menu" id="three">
      <div class="list">
         <div class="link-wrap">
            <label for="one">
               <a href="/boardList" style="color:#7b9acc">
               <i class="fa-solid fa-house"></i>
               <span>Home</span>
               </a>
            </label>
            <label for="two">
               <a href="/boardWrite" style="color:#7b9acc">
               <i class="fa-solid fa-pen-to-square"></i>
               <span>Write</span>
               </a>
               
            </label>
            <p class="p-line"></p>
            <label for="three">
               <a href="#" style="color:#7b9acc">
               <i class="fa-brands fa-hotjar"></i>
               <span>Hot</span>
               </a>
            </label>
         </div>
      </div>
</nav>
         </div>
   </div>
<!-- right slide bar -->
        <aside class="profile2">
   <input type="checkbox" id="check">
    <div class="sidebar" >
      <center>
        <img src="https://source.unsplash.com/random" class="profile_image" alt="">
        <h4>Jessica</h4>
      </center>
      <div>
      <a href="#"><i class="fa-solid fa-address-card"></i><span>${userid}</span></a>
      <a href="#"><i class="fa-solid fa-envelope"></i><span>${useremail}</span></a>
      <a href="/SET"><i class="fas fa-sliders-h"></i><span>Settings</span></a>
      </div>
      <div class="snsBtn">
         <main>
          <!-- sns 아이콘 -->
          <!-- Media Button Element -->
          <section class="btn-section">
              <button class="btn-cp"><i class="fab fa-lg first-logo fa-codepen"></i><i class="fab fa-lg second-logo fa-codepen"></i></button>
              <button class="btn-tw"><i class="fab fa-lg first-logo fa-twitter"></i><i class="fab fa-lg second-logo fa-twitter"></i></button>
              <button class="btn-fb"><i class="fab fa-lg first-logo fa-facebook-f"></i><i class="fab fa-lg second-logo fa-facebook-f"></i></button>
              <button class="btn-ig"><i class="fab fa-lg first-logo fa-instagram"></i><i class="fab fa-lg second-logo fa-instagram"></i></button>
          </section>
          <!-- Media Button Element -->
          <!-- ==================== -->
      </main>
      </div>
    </div>
    <!--sidebar end-->
    </aside> 
</div>
   </article>
   
</section>


<script type="text/javascript">
  AOS.init();
</script>
<jsp:include page="../ch/roomchannel/addChannel.jsp"></jsp:include>
<script type="text/javascript" src="/ch/js/channel/mainchannel.js"></script>
<script type="text/javascript" src="/sh/js/flist.js"></script>
<script type="text/javascript" src="bs/js/reply.js"></script>
</body>
</html>