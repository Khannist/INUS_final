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
<a href="/boardList">
	<img src="bs/css/image/last_logo.jpg" id="logo" >
</a>
</header>
<body>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userId" var="userid" />
	<sec:authentication property="principal.nickname" var="username" />
	<sec:authentication property="principal.email" var="useremail" />
	<input type="hidden" id="userId" name="userId" value="${userid}">
	<input type="hidden" name="username" id="username" value="${username}">
	<c:if test="${empty userid}">
		<a href="/login"></a>
		<script type="text/javascript">
			a.click();
		</script>
	</c:if>
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
               <p id="ChatName">Recommand Friend</p>
               <img class="ChatAndFriend_Icon" id="chatIcon" src="bs/css/image/ChatListIcon.png" onclick="F_openFReReplace()">
               <img class="ChatAndFriend_Icon" id="chatIcon_2" style="display: none;" src="bs/image/ChatListIcon_2.png" onclick="F_closeFReReplace()">
            </div>
            <!-- 채팅방이름 7자 이내 -->
            <div>
                <ul id="friend" class="friend">
	                
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
<article>
<!-- feed -->
<div class="device">   
  <div class="instagram"> 
     <div class="search-box">
       <button class="btn-search"><i class="fas fa-search"></i></button>
       <input type="text" class="input-search" placeholder="Type to Search...">
  </div>
   <div class="scroll">
            <main class="content" data-aos="fade-up" data-aos-duration="3000">
         <c:forEach items="${boardList}" var="bVo">
            <div class="postpade" >
                <div class="post">
                    <div class="post-header">
                        <img class="user-thumb" src="https://storage.googleapis.com/mkts/walter.jpg" alt="Walter">
                        <div class="user-details">
                            <strong class="name">${bVo.nickname}</strong>
                        </div>
                        <div class="post-menu">
                            <span class="menu">&nbsp;</span>
                        </div>
                    </div>
                    <a onclick="location.href='boardView?inus_boardNum=${bVo.inus_boardNum}'">
		            <img src="data:image/jpeg;base64,${bVo.boardImg}" alt="post" class="post-photo">                 	
                    </a>
                    <div class="post-footer">
               
                        <div class="buttons">
                            <div class="post-btn"><span class="like">&nbsp;</span></div>
                            <div class="post-btn"><span class="comn">&nbsp;</span></div>
                            <div class="spacer">&nbsp;</div>
                            <div class="post-btn"><span class="save">&nbsp;</span></div>
                        </div>
                        <div class="likes">
                            <img src="NY/img/icon/profileIcon.png"  onerror="this.src='NY/img/icon/profileIcon.png'" alt="user" class="user-like">
                            <i class="fa-solid fa-eye"></i><strong> ${bVo.boardCount}</strong>명이 조회했습니다.
                        </div>

                        <div class="comments">
                            <p>
                                <strong>${bVo.nickname}</strong>&nbsp;&nbsp;${bVo.inus_content}
                            </p>
                        </div>
                        <span class="time"><fmt:formatDate value="${bVo.inus_Date}" type="date" dateStyle="short"/></span>
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
        <img src="NY/img/icon/profileIcon.png" class="profile_image" alt="">
        <h4>${username}</h4>
      </center>
      <div data-aos="flip-left"
     data-aos-duration="3000">
      <a href="#"><i class="fa-solid fa-address-card"></i><span>${userid}</span></a>
      <a href="#"><i class="fa-solid fa-envelope"></i><span>${useremail}</span></a>
      <a href="/SET"><i class="fas fa-sliders-h"></i><span>Settings</span></a>
      </div>
      <div class="snsBtn" data-aos="fade-down"
     data-aos-duration="3000">
         <main>
          <!-- sns 아이콘 -->
          <!-- Media Button Element -->
          <section class="btn-section">
              <a href="https://twitter.com/discord">
              	<button class="btn-tw"><i class="fab fa-lg first-logo fa-twitter"></i><i class="fab fa-lg second-logo fa-twitter"></i></button>
              </a>
              <a href="https://www.facebook.com/discord/">
              	<button class="btn-fb"><i class="fab fa-lg first-logo fa-facebook-f"></i><i class="fab fa-lg second-logo fa-facebook-f"></i></button>
              </a>
              <a href="https://www.instagram.com/discord/">
              	<button class="btn-ig"><i class="fab fa-lg first-logo fa-instagram"></i><i class="fab fa-lg second-logo fa-instagram"></i></button>
              </a>
              
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
<script type="text/javascript" src="/sh/js/flist.js"></script>
<script type="text/javascript" src="/NY/js/boardList.js"></script>
<script type="text/javascript">
  AOS.init();
</script>
</body>
</html>