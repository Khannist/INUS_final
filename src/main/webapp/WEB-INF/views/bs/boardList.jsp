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
<link type="text/css" rel="stylesheet" href="bs/css/inus.css">
<link  rel="stylesheet" type="text/css" href="ch/css/channel.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/0535b153a9.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<header>
<img src="bs/css/image/last_logo.jpg" id="logo">
</header>
<body>

 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userId" var="userid" />
	<sec:authentication property="principal.nickname" var="username" />
	<sec:authentication property="principal.email" var="useremail" />
	<input type="hidden" id="userId" name="userId" value="${userid}">
	<input type="hidden" name="username" id="username" value="${username}">
</sec:authorize>
<section>
<div class="MainLbar">
   <article>
   <div class="ServerList" data-aos="fade-right"
     data-aos-duration="3000">
         <div id="serverCount">	<!-- 필요없어보인다고 지우면 안됌 -->
		<jsp:include page="../ch/roomchannel/roomChannel.jsp"></jsp:include>
	</div>
   </div>
   <div class="ChatAndFriendList" data-aos="fade-right"
     data-aos-duration="3000">
      <div class="chatAndFriendheader">
         <div class="ChatList">
            <div class="headerP" >
               <p id="ChatName">친구리스트</p>
               <img class="ChatAndFriend_Icon" id="chatIcon" src="bs/css/image/ChatListIcon.png" onclick="F_openFReReplace()">
               <img class="ChatAndFriend_Icon" id="chatIcon_2" style="display: none;" src="bs/image/ChatListIcon_2.png" onclick="F_closeFReReplace()">
            </div>
            <!-- 채팅방이름 7자 이내 -->
            <div>
                <ul>
                <c:forEach items="${memberlist}" var="mVo">
                    <li>
                        <p>${}</p>
                    </li>
                </c:forEach>
                </ul>
            </div>
            
         </div>
        <div class="FriendReplace" style="display: none;">	<!-- 나연// 수정부분0813[1/2] -->
			<div>
				<p>친구추가</p><br><br>
               		<input type="text" id="friendAdd" placeholder="친구아이디">
			</div>
               <div id="inputNameSpace" style="display:none;"><!-- 확인 -->
                  
                  <input type="button" value="생성">
               </div>
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
   <div class="scroll">
            <main class="content" data-aos="fade-up"
     data-aos-duration="3000">
         <c:forEach items="${boardList}" var="boardList">
            <div class="postpade" >
                <div class="post">
                    <div class="post-header">
                        <img class="user-thumb" src="https://storage.googleapis.com/mkts/walter.jpg" alt="Walter">
                        <div class="user-details">
                            <strong class="name">${boardList.inus_userName}</strong>
                            <span class="location">수원시, 팔달구</span>
                        </div>
                        <div class="post-menu">
                            <span class="menu">&nbsp;</span>
                        </div>
                    </div>
                    <a onclick="location.href='boardView?inus_boardNum=${boardList.inus_boardNum}'">
                    <img src="https://image.freepik.com/psd-gratuitas/instagram-post-mockup_15879-4.jpg" alt="post" class="post-photo">
                    </a>
                    <div class="post-footer">
               
                        <div class="buttons">
                            <div class="post-btn"><span class="like">&nbsp;</span></div>
                            <div class="post-btn"><span class="comn">&nbsp;</span></div>
                            <div class="spacer">&nbsp;</div>
                            <div class="post-btn"><span class="save">&nbsp;</span></div>
                        </div>
                        <div class="likes">
                            <img src="https://storage.googleapis.com/mkts/walter.jpg" alt="user" class="user-like">
                            <strong>${boardList.inus_userName}</strong>의 글을<strong>8</strong>명이 좋아요을 눌렀습니다.
                        </div>

                        <div class="comments">
                            <p>
                                <strong>${boardList.inus_userName}</strong>&nbsp;&nbsp;${boardList.inus_content}
                            </p>
                        </div>
                        <span class="time"><fmt:formatDate value="${boardList.inus_Date}" type="date" dateStyle="short"/></span>
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
    <div class="sidebar" data-aos="fade-left"
     data-aos-duration="3000">
      <center>
        <img src="https://source.unsplash.com/random" class="profile_image" alt="">
        <h4>${username}</h4>
      </center>
      <div data-aos="flip-left"
     data-aos-duration="3000">
      <a href="#"><i class="fas fa-desktop"></i><span>${userid}</span></a>
      <a href="#"><i class="fas fa-cogs"></i><span>${useremail}</span></a>
      <a href="#"><i class="fas fa-table"></i><span>이</span></a>
      <a href="#"><i class="fas fa-th"></i><span>거</span></a>
      <a href="#"><i class="fas fa-info-circle"></i><span>지워주세유</span></a>
      <a href="/SET"><i class="fas fa-sliders-h"></i><span>Settings</span></a>
      </div>
      <div class="snsBtn" data-aos="fade-down"
     data-aos-duration="3000">
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

<jsp:include page="../ch/roomchannel/addChannel.jsp"></jsp:include>
<script type="text/javascript" src="/ch/js/channel/mainchannel.js"></script>
<script type="text/javascript">
  AOS.init();
</script>
</body>
</html>