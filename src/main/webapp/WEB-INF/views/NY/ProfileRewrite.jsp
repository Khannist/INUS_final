<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/b448239927.js" crossorigin="anonymous"></script>
<link href="NY/css/Set.css" rel="stylesheet">
<link href="NY/css/profileReWrite.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="SetLbar">
			<div class="UlList">
				<div class="SetScrollBar">
						<div class="SetList" id="UserSet">
							<h4>사용자 설정</h4>
								<ul>
									<li><p onclick="F_AccountSet()">내 계정</p></li>
									<li><p onclick="F_ProfileSet()">프로필</p></li>
									<li><p onclick="F_SecuritySet()">개인정보 보호 및 보안</p></li>
									<li><p onclick="F_FreindSet()">친구관리</p></li>
								</ul>
						</div>
						<div class="SetList" id="AppSet">
						<h4>앱 설정</h4>
							<ul>
								<li><p onclick="F_DisplaySet()">디스플레이</p></li>
							</ul>
						</div>
						<div class="SetList" id="AddSet">
							<ul> 
								<li><p id="LogOutbtn" onclick="F_LogOutSet()" >로그아웃</p></li>
							</ul>
						</div>
						<div class="SetList" id="moreSet">
							<a href="https://instagram.com/disco_rd1111?igshid=YmMyMTA2M2Y="><i class="fa-brands fa-instagram" id="icon"></i></a>
							<a href="https://ko-kr.facebook.com/discord/"><i class="fa-brands fa-facebook-f" id="icon"></i></a>
							<a href="https://twitter.com/search?q=%23%EB%94%94%EC%BD%94"><i class="fa-brands fa-twitter" id="icon"></i></a>
							<p>MusicInus<br> from window10</p>
						</div>
				</div>
			</div>
		</div>
		<div class="SetMidbar">
			<a href="/boardList">
				<img src="NY/img/icon/SetToBack.png" id="Back">
			</a>
			<div class="MidSetList" id="AccountSet">
				<h3>내 계정</h3>
				
				<form action="">
					<h2>Prifile ReWrite</h2>
					<img src="">
					<ul>
						<li>
							<input type="file">
						</li>
						<li>
							<input type="text" placeholder="${list.id}" readonly="readonly">
						</li>
						<li>
							<input type="password" placeholder="${list.password}">
						</li>
						<li>
							<input type="text" placeholder="${list.nickname}">
						</li>
						<li>
							<input type="text" placeholder="${list.email}">
						</li>
						<li>
							<a href="#">
								<input type="submit" placeholder="INSERT">
							</a>
						</li>
					</ul>
				</form>
				
		
			</div>
		</div>
			<div class="MidSetList" id="ProfileSet">
				<h3>프로필</h3>
				<button id="ProfileSet_btn01" class="button" onclick="F_LeftPart()" >사용자 프로필</button>
				
				<div class="MOProfile" id="UserProfile">
					<div class="LeftPart">
						<div class="AbataDiv">
							<h3>아바타</h3>
							<button class="ProfileBtn" id="LeftBtn">아바타 변경하기</button>
							<button class="ProfileBtn" id="RightBtn">아바타 제거</button>
						</div>
						<div class="ColorDiv">
							<h3>프로필 색상</h3>
							<p><span>프로필 배너</span><br>
							이미지 해상도는 최소 600x240 크기여야해요. 10MB 미만인 PNG,JPG, 움직이는 GIF를 업로드할 수 있어요.
							</p>
							<button>Muinus로 해제</button>
						</div>
					</div>
					<div class="RightPart">
						
						<div class="smallProfile">
							<h3>미리 보기</h3>
							<div class="smallprofileBackG">
								<div class="smallprofileMID">
									<img alt="" src="https://source.unsplash.com/random">
									<p id="smallname">list.name</p>
									<p id="smallAly">내 프로필 꾸미기</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			
			<div class="MidSetList" id="SecuritySet">
				<div class="SecSetScroll">
					<div class="SecuritySet01">
						<h2>개인정보 보호 및 보안</h2>
						<p><span>개인 메시지 보안</span><br>
						다이렉트 메시지를 검사해 유해 미디어 콘텐츠를 포함한 메시지를 자동으로 삭제해요.
						</p>
						<ul>
							<li>
								<div id="radio01">
									<input type="radio" name="Sec">
									<p>나를 안전하게 보호하기<br><span>모든 사용자의 다이렉트 메시지를 스캔하기.</span></p>
								</div>
							</li>
							<li>
								<div id="radio02">
									<input type="radio" name="Sec">
									<p>착한 친구만 있어요<br><span>친구가 아닌 모든 사람의 다이렉트 메시지를 스캔하기.</span></p>
								</div>
							</li>
							<li>
								<div id="radio03">
									<input type="radio" name="Sec">
									<p>스캔하지 않기<br><span>다이렉트 메시지에서는 유해 콘텐츠를 스캔하지 않아요.</span></p>
								</div>
							</li>
						</ul>
						
						<div class="SecsubText">
							<p>서버 개인정보 보호 설정 기본값</p>
							<h3>서버 멤버가 보내는 다이렉트 메시지 허용하기</h3>
							<p id="Sec_seP">이 설정은 새로운 서버에 접속했을 때 적용돼요. 기존에 접속해 있던 서버에는 자동으로 적용되지 않아요.</p>
						</div>
					</div>
						<p id="datauser">데이터 사용처</p>
					<div class="SecuritySet02" id="SecSub01">	
						<h3>데이터를 사용해 Discord 향상하기</h3>
						<p>분석 목적으로 Discord 사용 정보를 사용해요. 예를 들어 새로운 기능 테스트에 포함될 수도 있어요. <a>여기에서 자세히 알아보세요</a></p>
					</div>
					<div class="SecuritySet02" id="SecSub02">	
						<h3>데이터를 사용해 내 Discord 사용 경험 바꾸기</h3>
						<p>Discord가 당신의 정보(이야기하는 사람, 플레이하는 게임 등)를 사용해 맞춤 서비스를 제공할 수 있어요.<a>자세히 알아보기</a></p>
					</div>
					<div class="SecuritySet02" id="SecSub03">	
						<h3>Discord가 스크린 리더 사용 기록을 추적하도록 허용</h3>
						<p>Discord를 사용할 때 스크린 리더 사용 기록을 추적할 수 있도록 허용하여, 접근성을 개선할 수 있도록 해요.  <a>자세한 내용은 여기에서 알아보세요</a></p>
					</div>
					<div class="CheckMyInfo">
						<p><a>이용약관</a>과 <a>개인정보</a>를 확인하세요.</p>
					</div>
				</div>
				
			</div>
			<div class="MidSetList" id="FreindSet">
			<h3>친구 요청</h3>
			<p id="FreindSet_p">친구요청을 보낼 수 있는 사람</p>
			<div class="friendRequire" id="Anyone">
				<label>누구나</label>
				<input type="radio" name="FreindWho" class="checkBoxCss" id="Anyonecheckbox">
			</div>
			<div class="friendRequire" id="FtoF">
				<label>친구의 친구</label>
				<input type="radio" name="FreindWho" class="checkBoxCss" id="FtoFcheckbox">
			</div>
			<div class="friendRequire" id="Server">
				<label>서버 멤버</label>
				<input type="radio"name="FreindWho"  class="checkBoxCss" id="Servercheckbox">
			</div>

		</div>
			
			
		<div class="MidSetList" id="DisplaySet">
			<h3>디스플레이</h3>
			<div class="theme">
				<p>테마</p>
				<div class="themeList" id="themeBlack">
					<input type="radio" name="theme">
					<label>어두운 테마</label>
				</div>
				<div class="themeList" id="themeWhite">
					<input type="radio" name="theme">
					<label>밝은 테마</label>
				</div>
			</div>
		</div>

		
		<div class="MidSetList" id="LogOutSet" onclick="LogOutFakeBtn()">
					<div id="Logoutdiv" >
						<h3>로그아웃</h3>
						<p>정말로 로그아웃 하시겠어요?</p>
						<div id="CheckLogout">
							<button class="logOutClass" id="LogOutFake" onclick="LogOutFakeBtn()">취소</button>
							<button class="logOutClass" id="LogOutReal">로그아웃</button>
						</div>
					</div>	
		</div>
		
		
		
		
</div>	
	</div>
	 <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
        crossorigin="anonymous"></script>
        
	<script type="text/javascript" src="NY/js/Set.js"></script>
</body>
</html>