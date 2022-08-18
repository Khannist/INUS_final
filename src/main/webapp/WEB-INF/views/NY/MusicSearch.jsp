<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="NY/css/MusicSearch.css" rel="stylesheet">
</head>
<body>

	<div class="SearchHeader">
		<div class="SearchInput">
			<input type="text" id="search_Input" placeholder="Search here...">
			<button type="submit" id="search_Button" onclick="Search()">Search</button>
	    </div>
	    <img class="ToIMG" id="ToMusic" src="NY/img/icon/ToMusicList.png" onclick="F_ToMusicRe()">
	</div>
	<div class="ScrollClass">
		<div class="iframe01_li">
		</div>
		<ul>

		<c:forTokens var="item" items="0,1,2,3,4,5,6,7,8,9" delims=",">
		    <li >
				<div class="ThAndTi" id="search${item}">
					<div class="searchIframe" id="search${item}_img"></div>
		            <div id="textPart">
		            	<div class="text01" id="search${item}_text01"></div>
		            	<div class="text02" id="search${item}_text02"></div>
		            	<div class="text03" id="search${item}_text03"></div>
		            </div>
				</div>
			</li>
		</c:forTokens>	
			
		</ul>
	</div>

<script type="text/javascript">

function Search(){

    var SearchBtn = document.getElementById('search_Input').value;

    $.ajax({
        method: "GET",
        url: "https://www.googleapis.com/youtube/v3/search",
        data: { part: "snippet", maxResults:"10", q:SearchBtn, key :"AIzaSyBLGX74Zs1Yx0xUG_miWKA5Pz0As9mkz0o"}
    })
    .done(function (msg) {
        console.log(msg);
        //alert("Data Saved: " + msg);
        for(var i = 0; i <= 9; i++) {
        	 $( "#search"+ i +"_img" ).empty().append( "<img src='"+msg.items[i].snippet.thumbnails.default.url+"'/>" );
             $( "#search"+ i +"_text01" ).empty().append( "<p>"+msg.items[i].snippet.title+"</p>" );
             $( "#search"+ i +"_text02" ).empty().append( "<p>"+msg.items[i].snippet.channelTitle+"</p>" );
             $( "#search"+ i +"_text03" ).empty().append( "<p>"+msg.items[i].snippet.description+"</p>" );
             //$( ".iframe01_li" ).empty().append( '<iframe id="search'+i+'_img" width="560" height="315" src="https://www.youtube.com/embed/'+msg.items[i].id.videoId+'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' );
             var src = "https://www.youtube.com/embed/"+msg.items[i].id.videoId+"";
             $("#search"+i+"_img").attr("onclick" , "videoIframe(\""+src+"\")")
             }; 
        })
	};


function videoIframe(src){
	console.log(src);
	//document.getElementById(res).style.display = "block";
	//$("#"+res).text("DOM이 완성되었습니다. 코드를 작성해주세요!"); 텍스트 들어감
	 $(".iframe01_li" ).attr("style","display:block");
	 $( ".iframe01_li" ).empty().append( '<iframe width="560" height="315" src="'+src+'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' );
	/*	$("#"+res).css({'display': 'block'});
 	for(var i = 0; i <= 9; i++) {
   	        
        $("#search"+ i +"_img").click(function(){
    		//$(".iframe01").hide();
    		//$("search"+ i +"_iframe").fadeIn( 2000 );
    		
        } );
   } */
};
	



































</script>
</body>
</html>