<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- <%@page import="java.io.PrintWriter"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%> --%>
<!DOCTYPE html>
<html>
<head>
<link href="js/music.js" rel="">
<meta charset="UTF-8">
<title>음악페이지</title>
<link href="NY/css/MusicRecommand.css" rel="stylesheet">
</head>
<body>
<div class="MusicPage">
	<img class="ToIMG" id="ToSearch" src="ny/img/icon/ToSearch.png" onclick="F_ToSearch()">
	<img class="ToIMG" id="ToSearch" src="NY/img/icon/ToSearch.png" onclick="F_ToSearch()">
	
	<jsp:include page="Musiciframe.jsp"></jsp:include>
	
	<div class="RecommandPlayList">
	
	
	
	<!-- [추천 재생목록] TOP100 -->
	
		<div class="top100List">
			<div id="top100List_Text">
				<p class="Command"  id="top100_Title">Top100</p>
			</div>
			<ul>
				<li>
					<img src="ny/img/PageImg/koreaTOP100.png" class="top100Img" id="top100Img_1" onclick="F_KoreaTop100Iframe()">
					<p>KoreaTop100</p>
					<input type="hidden" value="KoreaTop100" id="top100url_1">
					<input type="hidden" value="PLX_q1hyeET2TQLU4PzpVoSVYxsUnhzKaW" id="top100Img_1" >
				</li>
				<li >
					<img src="NY/img/PageImg/koreaMVTOP100.png" class="top100Img" id="top100Img_2" onclick="F_KoreaMVTop100Iframe()">
					<p>KoreaMVTop100</p>
					<input type="hidden" value="PLX_q1hyeET2Tbwcw6_aMvbCgv4HRtsaOh">
				</li>
				<li>
					<img src="NY/img/PageImg/globalTOP100.png" class="top100Img" id="top100Img_3" onclick="F_GlobalTop100Iframe()" >
					<p>GlobalTop100</p>
					<input type="hidden" value="PLX_q1hyeET2TyTOUo2FFLNG8H3xk5f5mP">
				</li>
				<li>
					<img src="NY/img/PageImg/globalMVTOP100.png" class="top100Img" id="top100Img_4" onclick="F_GlobalMVTop100Iframe()">
					<p>GlobalMVTop100</p>
					<input type="hidden" value="PLX_q1hyeET2Q1s--AgeUE0vSOxJBQn1L0">
				</li>
			</ul>
		</div>
						
						
	<!-- [추천 재생목록] Keyword -->
		<div class="keywordList">
		
			<div class="keyword_Text">
				<p class="Command" id="keyword_Title">Keyword PlayList</p>
				<input type="button" class="keyword" id="hiphop" value="힙합" onclick="F_hiphopList()">
				<input type="button" class="keyword" id="alonelove" value="짝사랑" onclick="F_aloneloveList()">
				<input type="button" class="keyword" id="PopArtist" value="팝송" onclick="F_PopArtistList()">
				<!--https://music.youtube.com/playlist?list=PLBII8lVtPFBpqddpNxV-5MuuRxPO5yPTK 킹갓곡 팝스테이지-->
				<input type="button" class="keyword" id="relax" value="편안한" onclick="F_Relax()"> 
				<input type="button" class="keyword" id="AniOST" value="애니OST" onclick="F_AniOST()">
				<input type="button" class="keyword" id="Exercise" value="운동" onclick="F_Exercise()">
				<input type="button" class="keyword" id="leavework" value="퇴근" onclick="F_Leavework()">
			</div>
				<div class="sideScroller">
					<div class="sideScroller_2">
						<ul class="hiphopList">
							<li>
								<img src="NY/img/recommandImg/hiphop/hiphopImg_1.jpg" class="KeyImg" id="hiphopList_1" onclick="F_hiphopList1_Iframe()">
								<p><span>잔잔한 국힙</span><br>흑수의 세상</p>
							<!-- https://music.youtube.com/playlist?list=PLgbg_mCwtmPIT_mK6JBvc1rgH9Xhw9Nbg -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/hiphop/hiphopImg_2.jpg" class="KeyImg" id="hiphopList_2" onclick="F_hiphopList2_Iframe()">
								<p><span>새엘범</span><br>관령 이</p>
							<!-- https://music.youtube.com/playlist?list=PLSKbod1H5pW_WBQccfH2rx5CtUTbCH7Wq -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/hiphop/hiphopImg_3.jpg" class="KeyImg" id="hiphopList_3" onclick="F_hiphopList3_Iframe()">
								<p><span>힙합</span><br>이영호</p>
							<!-- https://music.youtube.com/playlist?list=PLhU0JZza06SF0jhjGJlS-yDJNkHcF0K3R -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/hiphop/hiphopImg_4.PNG" class="KeyImg" id="hiphopList_4" onclick="F_hiphopList4_Iframe()">
								<p><span>그냥</span><br>히라</p>
							<!-- https://music.youtube.com/playlist?list=PL-vQeTIdSjsd6kzpAui6_84FynskONoh0 -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/hiphop/hiphopImg_5.PNG" class="KeyImg" id="hiphopList_5" onclick="F_hiphopList5_Iframe()">
								<p><span>잔잔한 그루브</span><br>류연호</p>
							<!-- https://music.youtube.com/playlist?list=PLo6MVj8CtU8XTt8Z8DSBn47v8QZE8zyi4 -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/hiphop/hiphopImg_6.jpg" class="KeyImg" id="hiphopList_6" onclick="F_hiphopList6_Iframe()">
								<p><span>랩재생</span><br>형준김</p>
							<!-- https://music.youtube.com/playlist?list=PLQZsEfgfgTtVqzWM0ttw7b-eqfUit4t8s -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/hiphop/hiphopImg_7.jpg" class="KeyImg" id="hiphopList_7" onclick="F_hiphopList7_Iframe()">
								<p><span>달달한 </span>온<br>국힙/국랩</p>
							<!-- https://music.youtube.com/playlist?list=PLbxSWLPqo2fOJffZKQk6l-O4y1ZtfjouZ -->
							</li>
						</ul>
						<ul class="aloneloveList" style="display: none;">
							<li>
								<img src="NY/img/recommandImg/alonelove/aloneloveImg_1.jpg" class="KeyImg" id="aloneloveList_1" onclick="F_aloneloveList1_Iframe()">
								<p><span>느낌있게</span><br>호랑</p>
							<!-- https://music.youtube.com/playlist?list=PLLmwQXGbsQma6YZfvPvlKXMvZF4_w9Z3A -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/alonelove/aloneloveImg_2.jpg" class="KeyImg" id="aloneloveList_2" onclick="F_aloneloveList2_Iframe()">
								<p><span>짝사랑</span><br>SIWON KIM</p>
							<!-- https://music.youtube.com/playlist?list=PLtTWdpTTFqZ2cj7-Suj0bAiH98NsCA-FM -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/alonelove/aloneloveImg_3.jpg" class="KeyImg" id="aloneloveList_3" onclick="F_aloneloveList3_Iframe()">
								<p><span>모던한 분위기</span><br>GONGS</p>
							<!-- https://music.youtube.com/playlist?list=PLTuUy-Y4gMbZ5bJqO9GNTabcltOJD6SHo -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/alonelove/aloneloveImg_4.jpg" class="KeyImg" id="aloneloveList_4" onclick="F_aloneloveList4_Iframe()">
								<p><span>그냥</span><br>히라</p>
							<!-- https://music.youtube.com/playlist?list=PL9StwatIujD4dXaMH8mHf-8GX3Lx16GX5 -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/alonelove/aloneloveImg_5.jpg" class="KeyImg" id="aloneloveList_5" onclick="F_aloneloveList5_Iframe()">
								<p><span>😬💗</span><br>SIWON KIM</p>
							<!-- https://music.youtube.com/playlist?list=PLtTWdpTTFqZ3c3XN9jwBdOa-njNXcV09f -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/alonelove/aloneloveImg_6.jpg" class="KeyImg" id="aloneloveList_6" onclick="F_aloneloveList6_Iframe()">
								<p><span>황미애</span><br>베리브라운</p>
							<!-- https://music.youtube.com/playlist?list=PLtpMMp6P5aNZOinVwNvz6hKgFUvn_75Pm -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/alonelove/aloneloveImg_7.jpg" class="KeyImg" id="aloneloveList_7" onclick="F_aloneloveList7_Iframe()">
								<p><span>절절</span><br>YeonSook Hyun</p>
							<!-- https://music.youtube.com/playlist?list=PLte-jRgLRogJfpAQA8z8-SSSUdhGsJJ0H -->
							</li>
						</ul>
						<ul class="PopArtistList" style="display: none;">
							<li>
								<img src="NY/img/recommandImg/popstar/PopArtistImg_1.jpg" class="KeyImg" id="PopArtistList_1" onclick="F_PopArtistList1_Iframe()">
								<p><span>Charlie Puth</span><br>컴맹개발자</p>
							<!-- https://music.youtube.com/playlist?list=PL254cLthc0Vzrj5-5HQzGj2v9n5HxUJ7C -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/popstar/PopArtistImg_2.jpg" class="KeyImg" id="PopArtistList_2" onclick="F_PopArtistList2_Iframe()">
								<p><span>Ed Sheeran</span><br>Happy Music</p>
							<!-- https://music.youtube.com/playlist?list=PLooeWILrVByLPyGewn2J1kBUzmdO1_eTZ -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/popstar/PopArtistImg_3.jpg" class="KeyImg" id="PopArtistList_3" onclick="F_PopArtistList3_Iframe()">
								<p><span>Ariana Grande</span><br>미 누미</p>
							<!-- https://music.youtube.com/playlist?list=PLWN8nA2sUL_PHDE1Pv1eyYAcKgwB7FjaG -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/popstar/PopArtistImg_4.jpg" class="KeyImg" id="PopArtistList_4" onclick="F_PopArtistList4_Iframe()">
								<p><span>AJR</span><br>YouTube Music</p>
							<!-- https://music.youtube.com/playlist?list=PLFTljmaaq3TJrktMrwZIouPbvJvpRdeHC -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/popstar/PopArtistImg_5.jpg" class="KeyImg" id="PopArtistList_5" onclick="F_PopArtistList5_Iframe()">
								<p><span>Dua Lipa</span><br>taiho yoo</p>
							<!-- https://music.youtube.com/playlist?list=PLu1-NsqAZi8HPsWBePGm6rXSzrywPApNw -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/popstar/PopArtistImg_6.jpg" class="KeyImg" id="PopArtistList_6" onclick="F_PopArtistList6_Iframe()">
								<p><span>Lauv</span><br>chanwoong4me</p>
							<!-- https://music.youtube.com/playlist?list=PLZ0PXHuZvKMxIguTmtrsfcz6SLSir40yX -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/popstar/PopArtistImg_7.jpg" class="KeyImg" id="PopArtistList_7" onclick="F_PopArtistList7_Iframe()">
								<p><span>Justin Bieber</span><br>밍쿠</p>
							<!-- https://music.youtube.com/playlist?list=PLSRJsTW0UbUxsRFbVMBRwFGjKIh1nURxo -->
							</li>
						</ul>
						<ul class="RelaxList" style="display: none;">
							<li>
								<img src="NY/img/recommandImg/Relax/RelaxImg_1.jpg" class="KeyImg" id="RelaxList_1" onclick="F_RelaxList1_Iframe()">
								<p><span>감성 온: </span><br>고예찬</p>
							<!-- https://music.youtube.com/playlist?list=PL-2aeEJY7wBe0hA3e93eqNRHi2LfJ511q -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Relax/RelaxImg_2.jpg" class="KeyImg" id="RelaxList_2" onclick="F_RelaxList2_Iframe()">
								<p><span>반지하노래방</span><br>강희승</p>
							<!-- https://music.youtube.com/playlist?list=PL1s6Ls1rihcq7OthK5mKOl11JSrX9LgPw-->
							</li> 
							<li>
							 	<img src="NY/img/recommandImg/Relax/RelaxImg_3.jpg" class="KeyImg" id="RelaxList_3" onclick="F_RelaxList3_Iframe()">
								<p><span>데이먼스 이어</span><br>YouTube Music</p>
							<!-- https://music.youtube.com/playlist?list=PLiB2ZlOTzp-BRf3SYu8w5wGlCvGoisuMi -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Relax/RelaxImg_4.jpg" class="KeyImg" id="RelaxList_4" onclick="F_RelaxList4_Iframe()">
								<p><span>포장마차</span><br>서진규</p>
							<!-- https://music.youtube.com/watch?v=9e-jcTNFZiw&list=PLCeBnfR2pp-94hr7qc0i4CNfFm_lp9vgt -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Relax/RelaxImg_5.jpg" class="KeyImg" id="RelaxList_5" onclick="F_RelaxList5_Iframe()">
								<p><span>일소라 차트</span><br>KYLE</p>
							<!-- https://music.youtube.com/playlist?list=PLM2r05RQ64_oSme66CRKm_qnxGQMrJNCZ -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Relax/RelaxImg_6.jpg" class="KeyImg" id="RelaxList_6" onclick="F_RelaxList6_Iframe()">
								<p><span>힘들때</span><br>무진</p>
							<!-- https://music.youtube.com/playlist?list=PLanSAF4vpi9IiX5GKjJ-lk8C2LGOdsG9C -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Relax/RelaxImg_7.jpg" class="KeyImg" id="RelaxList_7" onclick="F_RelaxList7_Iframe()">
								<p><span>힐링 가요</span><br>Junho Lee</p>
							<!-- https://music.youtube.com/playlist?list=PLiqSviI_3Qp86Ez9QnXl5mxwjtGM37LVX -->
							</li>
						</ul>
						<ul class="AniOSTList" style="display: none;">
							<li>
								<img src="NY/img/recommandImg/AniOST/AniOSTImg_1.jpg" class="KeyImg" id="AniOSTList_1" onclick="F_AniOSTList1_Iframe()">
								<p><span>스파이패밀리 </span><br>손예</p>
							<!-- https://music.youtube.com/playlist?list=PL1-UWLSdQLnECGy1W-F9mbJnMl-XlaDVi -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/AniOST/AniOSTImg_2.jpg" class="KeyImg" id="AniOSTList_2" onclick="F_AniOSTLis2_Iframe()">
								<p><span>날씨의 이름은</span><br>애니가좋아</p>
							<!-- https://music.youtube.com/playlist?list=PLmJbWimcTNe8gm3PW4mV6oN2eeXJxW5_Q -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/AniOST/AniOSTImg_3.jpg" class="KeyImg" id="AniOSTList_3" onclick="F_AniOSTLis3_Iframe()">
								<p><span>04년생의 애니</span><br>딤셺</p>
							<!-- https://music.youtube.com/watch?v=vh4IlhtwHeI&list=PLYpdtfYWZmDzQxAyb1fsj_sg0jDZjjQ6D -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/AniOST/AniOSTImg_4.jpg" class="KeyImg" id="AniOSTList_4" onclick="F_AniOSTList4_Iframe()">
								<p><span>귀멸의 칼날</span><br>이범수</p>
							<!-- https://music.youtube.com/watch?v=I_HU7gx6IHA&list=PLSwa-VwS0-mdbOREb-DsOP-vuzRhuTMXS -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/AniOST/AniOSTImg_5.jpg" class="KeyImg" id="AniOSTList_5" onclick="F_AniOSTList5_Iframe()">
								<p><span>디지니 한국어버전</span><br>말하는대로</p>
							<!-- https://music.youtube.com/watch?v=EzrfnlwWrI0&list=PLx95nomdvKRlvnd7-IGiuP4wOA33mbXkE -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/AniOST/AniOSTImg_6.jpg" class="KeyImg" id="AniOSTList_6" onclick="F_AniOSTList6_Iframe()">
								<p><span>디핵</span><br>류세형</p>
							<!-- https://music.youtube.com/playlist?list=PLce8o3AO5vjKddlCYrf3ttqcTdUBUmEvp -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/AniOST/AniOSTImg_6.jpg" class="KeyImg" id="AniOSTList_7" onclick="F_AniOSTList7_Iframe()">
								<p><span>사진 추가</span><br>YouTube Music</p>
							<!-- https://music.youtube.com/playlist?list=PLoNu5qsBDaYCQ2U6Hswqu-1TA6aXdmC73 -->
							</li>
						</ul>
						<ul class="ExerciseList" style="display: none;">
							<li>
								<img src="NY/img/recommandImg/Exercise/ExerciseImg_1.jpg" class="KeyImg" id="ExerciseList_1" onclick="F_ExerciseList1_Iframe()">
								<p><span>뼛속까지 단단하게</span><br>손예</p>
							<!-- https://music.youtube.com/watch?v=Ut6ZaXqnj1c&list=PLqvvUcaq_0OnDIjjL7QzuU-idiRqVx1M5 -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Exercise/ExerciseImg_2.jpg" class="KeyImg" id="ExerciseList_2" onclick="F_ExerciseList2_Iframe()">
								<p><span>운동1</span><br>이동현</p>
							<!-- https://music.youtube.com/playlist?list=PL4fQaQrmnpKD8IEhkVNU3L6t6-a5NaV01-->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Exercise/ExerciseImg_3.jpg" class="KeyImg" id="ExerciseList_3" onclick="F_ExerciseList3_Iframe()">
								<p><span>Exercising</span><br>괜사</p>
							<!-- https://music.youtube.com/playlist?list=PLghrVNacHnKnhZssAkorf5ryA0PtDoI-J -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Exercise/ExerciseImg_4.jpg" class="KeyImg" id="ExerciseList_4" onclick="F_ExerciseList4_Iframe()">
								<p><span>애플top100</span><br>junbe jo</p>
							<!-- https://music.youtube.com/playlist?list=PLw-dGKf44Qdzq6XxILhp0IsNczdYHgvHr-->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Exercise/ExerciseImg_5.jpg" class="KeyImg" id="ExerciseList_5" onclick="F_ExerciseList5_Iframe()">
								<p><span>사교댄스</span><br>이상교</p>
							<!-- https://music.youtube.com/playlist?list=PLoa_rpiVYJdySeb-TO6Rs_5mXzzeF1qGi -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Exercise/ExerciseImg_6.jpg" class="KeyImg" id="ExerciseList_6" onclick="F_ExerciseList6_Iframe()">
								<p><span>피트니스</span><br>황유빈</p>
							<!-- https://music.youtube.com/playlist?list=PL3cpvJ-_ArDZduNmX_5pkk33JJg6LlAzw -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/Exercise/ExerciseImg_7.jpg" class="KeyImg" id="ExerciseList_7" onclick="F_ExerciseList7_Iframe()">
								<p><span>ENFP 모이자.</span><br>엔프피세상</p>
							<!-- https://music.youtube.com/playlist?list=PLiwzbJb9V5yDy7k4vDG-cZBoy7slX-sNR -->
							</li>
						</ul>
						<ul class="leaveworkList" style="display: none;">
							<li>
								<img src="NY/img/recommandImg/leavework/leaveworkImg_1.jpg" class="KeyImg" id="leaveworkList_1" onclick="F_leaveworkList1_Iframe()">
								<p><span>산뜻한 초저녁</span><br>무</p>
							<!-- https://music.youtube.com/playlist?list=PLJ9y6MY8l9DirjA8ptVi2pwQkxrb0X2jD -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/leavework/leaveworkImg_2.jpg" class="KeyImg" id="leaveworkList_2" onclick="F_leaveworkList2_Iframe()">
								<p><span>뚝섬 11번출구</span><br>조성민</p>
							<!-- https://music.youtube.com/playlist?list=PLu1e8X5bKBImReD_-G1zQzvXMA7_7Z7Yb-->
							</li> 
							<li>
								<img src="NY/img/recommandImg/leavework/leaveworkImg_3.jpg" class="KeyImg" id="leaveworkList_3" onclick="F_leaveworkList3_Iframe()">
								<p><span>회사뿌셔</span><br>수연</p>
							<!-- https://music.youtube.com/watch?v=UznsP7hLWKc&list=PLdfZbgOpp0BcOMlmqIgUPvpc_RihX5JsD -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/leavework/leaveworkImg_4.jpg" class="KeyImg" id="leaveworkList_4" onclick="F_leaveworkList4_Iframe()">
								<p><span>BLACKPINK</span><br>MrMusicStart</p>
							<!-- https://music.youtube.com/playlist?list=PLA98OzH9gllk4vSheFsMYrZJ9-1hLOANn-->
							</li> 
							<li>
								<img src="NY/img/recommandImg/leavework/leaveworkImg_5.jpg" class="KeyImg" id="leaveworkList_5" onclick="F_leaveworkList5_Iframe()">
								<p><span>때잉뽀</span><br>연소록</p>
							<!-- https://music.youtube.com/watch?v=AAxre3pB4SQ&list=PLjftMfSk54_LrKxY47vzjkb03Ti2EttoP -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/leavework/leaveworkImg_6.jpg" class="KeyImg" id="leaveworkList_6" onclick="F_leaveworkList6_Iframe()">
								<p><span>백수여름</span><br>A songa</p>
							<!-- https://music.youtube.com/playlist?list=PLn7CZfgDjbV4tuXeTTsAqhvTiDBB8jfcQ -->
							</li> 
							<li>
								<img src="NY/img/recommandImg/leavework/leaveworkImg_7.jpg" class="KeyImg" id="leaveworkList_7" onclick="F_leaveworkList7_Iframe()">
								<p><span>불금전용</span><br>김민주</p>
							<!-- https://music.youtube.com/watch?v=t8ERhuId1h4&list=PLoZaF2VQLrUHlGZV9WvuAj1Sz5wXlfjzR -->
							</li>
						</ul>
					</div>
				</div>	
		</div>
	
	
	</div>

</div>
</body>
</html>