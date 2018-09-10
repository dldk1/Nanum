<%@page import="com.nanum.vo.FoodVO"%>
<%@page import="com.nanum.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<%
String path = request.getContextPath();
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");
%>
<head>
<title>::대한민국 1등 쉐어링 플랫폼, 나눔의 민족::</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="shortcut icon" href="<%=path %>/favicon1.ico">
<link rel="stylesheet" href="<%=path%>/signUp/signUp.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!----------------------- gps 정보 ------------------------------>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=XbIqz2MRd7GMcxbhPsgU"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function sendGps(lat, lng) { 
	var path = '/' + location.pathname.split('/')[1];
   	var postUrl = path + "/GpsToAddress";
//    	alert(postUrl);
    $.post(postUrl,
    	    { lat: lat,	lng: lng },
    	    function(data, status){
    	    	var loc = data.split(" ");
    	    	console.log("data" + loc);
    	    	$("#keyword").val(loc[1] + " " + loc[2]);
//     	    	alert(data);
    	    });
}
</script>
<!----------------------- gps 정보 ------------------------------>

<style type="text/css">
footer {
	position: relative;
	font-size: 12px;
	text-decoration: none;
	text-align: center;
	text-indent: 6px;
	color: gray;
}

#userId {
	font-size: 15px;
	padding-left: 50px;
	text-decoration: none;
}

.click-table>tbody>tr {
	/* 마우스 올렸을 때 손가락으로 표시*/
	cursor: pointer;
}
</style>
<script>				
function goPopup() {			
window.open('<%=path%>/login/loginForm.jsp','window','width=800,height=650,left=570,top=250');			
// window.open(URL,"팝업 구분값(팝업 1개일 경우 상관없음)","팝업 창 옵션")				
}				
</script>
<script>
$(function(){
	// tr태그를 클릭했을 때..
	$(".click-table > tbody > tr").click(function(){
		<c:choose>
		<c:when test="${not empty sessionScope.id }">
		<c:url var="path" value="/board_detail.nanum">
			<c:param name="info_idx" value="${param.info_idx}"/>
			<c:param name="page" value="${requestScope.now_page}"/>
		</c:url>
		// dataset에 셋팅되었는 값을 가지고 온다.
		var board_idx = $(this).data("board-idx");
		// 이동한다.
		location.href = "${path}&board_idx=" + board_idx;
		
		
		</c:when>
		<c:otherwise>
		alert("로그인 해주세요");
		
					
			window.open('login/loginForm.jsp','window','width=1000,height=750,left=570,top=200');		
			
			// window.open(URL,"팝업 	구분값(팝업 1개일 경우 상관없음)","팝업 창 옵션")	
			function getContextPath() {						
				var hostIndex = location.href.indexOf( location.host ) + location.host.length;					
				return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );					
			}						
			
			
			
			function closeLoginWindow(){		
			var path = getContextPath();						
			var theURL = path + "/board_list.nanum";						
			// 호출 한 부모 페이지에서 URL 호출						
			opener.window.location = theURL;						
			// 호출 한 뒤 현재 팝업 창 닫기 이벤트						
			close();						
			}
			
			function closeSignUpWindow(){	
				var path = getContextPath();						
				var theURL = path + "/signUp.nanum";						
				// 호출 한 부모 페이지에서 URL 호출						
				opener.window.location = theURL;						
				// 호출 한 뒤 현재 팝업 창 닫기 이벤트						
				close();						
				}
			
	
		</c:otherwise>
		</c:choose>
	});
});
</script>
<!-- WordPress KBoard plugin 5.3.9 - http://www.cosmosfarm.com/products/kboard -->
<link rel="alternate" href="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/rss.php" type="application/rss+xml" title="KBoard 데모 &raquo; KBoard 통합 피드">
<!-- WordPress KBoard plugin 5.3.9 - http://www.cosmosfarm.com/products/kboard -->

<link rel='dns-prefetch' href='//developers.kakao.com' />
<link rel='dns-prefetch' href='//s.w.org' />
<link rel="alternate" type="application/rss+xml" title="KBoard 데모 &raquo; 피드" href="https://www.cosmosfarm.com/demo/feed/" />
<link rel="alternate" type="application/rss+xml" title="KBoard 데모 &raquo; 댓글 피드" href="https://www.cosmosfarm.com/demo/comments/feed/" />
<link rel="pingback" href="https://www.cosmosfarm.com/demo/xmlrpc.php" />
		<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.4\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.4\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/www.cosmosfarm.com\/demo\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.9.7"}};
			!function(a,b,c){function d(a,b){var c=String.fromCharCode;l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,a),0,0);var d=k.toDataURL();l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,b),0,0);var e=k.toDataURL();return d===e}function e(a){var b;if(!l||!l.fillText)return!1;switch(l.textBaseline="top",l.font="600 32px Arial",a){case"flag":return!(b=d([55356,56826,55356,56819],[55356,56826,8203,55356,56819]))&&(b=d([55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447],[55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447]),!b);case"emoji":return b=d([55357,56692,8205,9792,65039],[55357,56692,8203,9792,65039]),!b}return!1}function f(a){var c=b.createElement("script");c.src=a,c.defer=c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var g,h,i,j,k=b.createElement("canvas"),l=k.getContext&&k.getContext("2d");for(j=Array("flag","emoji"),c.supports={everything:!0,everythingExceptFlag:!0},i=0;i<j.length;i++)c.supports[j[i]]=e(j[i]),c.supports.everything=c.supports.everything&&c.supports[j[i]],"flag"!==j[i]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[j[i]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(h=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",h,!1),a.addEventListener("load",h,!1)):(a.attachEvent("onload",h),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),g=c.source||{},g.concatemoji?f(g.concatemoji):g.wpemoji&&g.twemoji&&(f(g.twemoji),f(g.wpemoji)))}(window,document,window._wpemojiSettings);
		</script>
		<style type="text/css">
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<link rel='stylesheet' id='wp-members-css'  href='http://www.cosmosfarm.com/demo/wp-content/plugins/wp-members/css/generic-no-float.css?ver=3.2.0.1' type='text/css' media='all' />
<link rel='stylesheet' id='omega-style-css'  href='https://www.cosmosfarm.com/demo/wp-content/themes/omega-child/style.css?ver=4.9.7' type='text/css' media='all' />
<link rel='stylesheet' id='cosmosfarm-share-buttons-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/cosmosfarm-share-buttons/layout/default/style.css?ver=1.6' type='text/css' media='all' />
<link rel='stylesheet' id='enlighter-local-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/enlighter/resources/EnlighterJS.min.css?ver=3.7' type='text/css' media='all' />
<link rel='stylesheet' id='cosmosfarm-members-two-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/cosmosfarm-members/skin/two/style.css?ver=2.5' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-comments-skin-default-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard-comments/skin/default/style.css?ver=4.4.4' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-editor-media-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/template/css/editor_media.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-thumbnail-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/thumbnail/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-download-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/download/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-ocean-gallery-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-gallery/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-venus-webzine-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/venus-webzine/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-ocean-faq-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-faq/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-ocean-franchise-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-modern-gallery-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/modern-gallery/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-ocean-rating-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-rating/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-ocean-download-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-download/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-pic-gallery-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/pic-gallery/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-card-gallery-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/card-gallery/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-emotion-customer-service-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/emotion-customer-service/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-play-video-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/play-video/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-contact-form-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/contact-form/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-ask-one-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ask-one/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-forum-one-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/forum-one/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-pure-gallery-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/pure-gallery/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-cross-calendar-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/cross-calendar/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-cross-link-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/cross-link/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-inside-ask-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/inside-ask/style.css?ver=5.3.9' type='text/css' media='all' />
<link rel='stylesheet' id='kboard-skin-default-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/default/style.css?ver=5.3.9' type='text/css' media='all' />
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
<script type='text/javascript' src='https://developers.kakao.com/sdk/js/kakao.min.js?ver=1.6'></script>
<link rel='https://api.w.org/' href='https://www.cosmosfarm.com/demo/wp-json/' />
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://www.cosmosfarm.com/demo/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://www.cosmosfarm.com/demo/wp-includes/wlwmanifest.xml" /> 
<link rel="canonical" href="https://www.cosmosfarm.com/demo/kboard-ocean-franchise-skin/" />
<link rel='shortlink' href='https://www.cosmosfarm.com/demo/?p=359' />
<link rel="alternate" type="application/json+oembed" href="https://www.cosmosfarm.com/demo/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fwww.cosmosfarm.com%2Fdemo%2Fkboard-ocean-franchise-skin%2F" />
<link rel="alternate" type="text/xml+oembed" href="https://www.cosmosfarm.com/demo/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fwww.cosmosfarm.com%2Fdemo%2Fkboard-ocean-franchise-skin%2F&#038;format=xml" />
	<!--[if lt IE 9]>
	<script src="https://www.cosmosfarm.com/demo/wp-content/themes/omega/js/html5.js" type="text/javascript"></script>
	<![endif]-->

<style type="text/css" id="custom-css"></style>
		<style type="text/css">.recentcomments a{display:inline !important;padding:0 !important;margin:0 !important;}</style>
		<script>Kakao.init('f4f977cc33a5c358f2cd5e5fbe6540d3')</script>
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-includes/js/wp-embed.min.js?ver=4.9.7'></script>
</head>
<body class="is-preload">

	<div>
		<h1
			style="color: #B5B5B1; text-align: center; font-size: 2em; font-family: sans-serif; font-weight: 700; padding: 2em 0;  margin: 0 auto; ">
			------------------------ 나눔 게시판 -----------------------------</h1>
	</div>

	<div id="page-wrapper">

			<!-- Nav 시작 -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="<%=path %>/main.nanum">Home</a></li>
						<li><a href="<%=path %>/introduce/introduce10.jsp">소개</a>
						</li>
						<li><a href="<%=path%>/notice.nanum"">공지사항</a></li>
						<li><a href="#">배달나눔</a>
							<ul>
								<li><a href="<%=path %>/board_list.nanum">배달나눔 게시판</a></li>
								<li><a href="<%=path %>/rating_list.nanum">베스트 나눔인</a></li>
							</ul>
						</li>
						<li><a href="<%=path %>/main/FoodRecommendationPage2.jsp">메뉴 추천</a></li>
						<li><a href="<%=path%>/main/event.jsp">이벤트</a></li>
															
					<%if(id == null){ %>
						<li><a href="<%=path %>/index.jsp" onclick="goPopup()">Login</a></li>
					<%}else if(id.equals("admin")){ %>
						<li><a href="<%=path %>/admin.nanum">관리자페이지</a></li>
						<li><a href="logout.nanum">Logout</a></li>
						<b id = userId> <%out.print(name);%>님 안녕하세요!</b>
					<% } else { FoodVO fVO = UserDAO.randomFood(); %>	
						<li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
						<li><a href="logout.nanum">Logout</a></li>					
						<b id = userId> <a href="<%=path%>/myPage.nanum"><%out.print(name);%></a> 님! &nbsp 오늘은 <%=fVO.getStore() %>의 <%=fVO.getMenu()%> 어떠세요? </b>	
					<% } %>								
					</ul>
				</nav>
			<!--  Nav 끝	-->
				<br>
				<br>
				<br><div class="contentwrap">
				
				<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
				<div class="site-container">
				<div id="kboard-ocean-franchise-list">
	<div class="kboard-header">
		<div class="kboard-map-v2">
			<img src="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2.png">
			<div class="map-area" style="left:8%;top:13%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-incheon.png"><a href="<%=path%>/board_list_incheon.nanum">인천</a></div>
			<div class="map-area" style="left:20%;top:16%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-seoul.png"><a href="<%=path%>/board_list_seoul.nanum">서울</a></div>
			<div class="map-area" style="left:20%;top:23%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-gyeonggi.png"><a href="<%=path%>/board_list_gyeonggi.nanum">경기도</a></div>
			<div class="map-area" style="left:44%;top:14%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-gangwon.png"><a href="<%=path%>/board_list_gangwondo.nanum">강원도</a></div>
			<div class="map-area" style="left:32%;top:28%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-chungbuk.png"><a href="<%=path%>/board_list_chungbuk.nanum">충청북도</a></div>
			<div class="map-area" style="left:2%;top:35%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-chungnam.png"><a href="<%=path%>/board_list_chungnam.nanum">충청남도</a></div>
			<div class="map-area" style="left:22%;top:33%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-sejong.png"><a href="<%=path%>/board_list_sejong.nanum">세종</a></div>                                 
			<div class="map-area" style="left:22%;top:40%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-daejeon.png"><a href="<%=path%>/board_list_daejeon.nanum">대전</a></div>
			<div class="map-area" style="left:50%;top:40%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-gyeongbuk.png"><a href="<%=path%>/board_list_gyeongbuk.nanum">경상북도</a></div>
			<div class="map-area" style="left:16%;top:54%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-jeollabuk.png"><a href="<%=path%>/board_list_jyeonbuk.nanum">전라북도</a></div>
			<div class="map-area" style="left:48%;top:52%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-daegu.png"><a href="<%=path%>/board_list_daegu.nanum">대구</a></div>
			<div class="map-area" style="left:67%;top:57%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-ulsan.png"><a href="<%=path%>/board_list_ulsan.nanum">울산</a></div>
			<div class="map-area" style="left:41%;top:60%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-gyeongnam.png"><a href="<%=path%>/board_list_gyeongnam.nanum">경상남도</a></div>
			<div class="map-area" style="left:10%;top:73%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-jeollanam.png"><a href="<%=path%>/board_list_jeollanamdo.nanum">전라남도</a></div>
			<div class="map-area" style="left:16%;top:66%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-gwangju.png"><a href="<%=path%>/board_list_gwangju.nanum">광주</a></div>
			<div class="map-area" style="left:64%;top:64%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-busan.png"><a href="<%=path%>/board_list_busan.nanum">부산</a></div>
			<div class="map-area" style="left:10%;top:92%;" data-map="https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/images/map-v2-jeju.png"><a href="<%=path%>/board_list_jejuIsland.nanum">제주도</a></div></div>
		
		<form id="kboard-search-form" method="get" action="/demo/kboard-ocean-franchise-skin/?mod=list&pageid=1">
			<input type="hidden" name="mod" value="list"><input type="hidden" name="pageid" value="1">			
			<div class="kboard-search">
				<h3 class="kboard-header-title">주소 검색</h3>
				<input type="text" id="keyword" name="keyword" value=""><button type="submit" class="kboard-ocean-franchise-button-small">검색</button>
			</div>
			
			<div class="kboard-branch">
				<h3 class="kboard-header-title">시도별 게시판 안내</h3>
				<a class="kboard-branch-button" href="<%=path%>/board_list.nanum" title="전체">전체</a>				
				<a class="kboard-branch-button" href="<%=path%>/board_list_seoul.nanum" title="서울">서울</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_busan.nanum" title="부산">부산</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_daegu.nanum" title="대구">대구</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_incheon.nanum" title="인천">인천</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_gwangju.nanum" title="광주">광주</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_daejeon.nanum" title="대전">대전</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_ulsan.nanum" title="울산">울산</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_sejong.nanum" title="세종">세종</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_gyeonggi.nanum" title="경기도">경기도</a>
				<a class="kboard-branch-button active" href="<%=path%>/board_list_gyeongnam.nanum" title="경상남도">경상남도</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_gyeongbuk.nanum" title="경상북도">경상북도</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_jeollanamdo.nanum" title="전라남도">전라남도</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_jyeonbuk.nanum" title="전라북도">전라북도</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_chungnam.nanum" title="충청남도">충청남도</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_chungbuk.nanum" title="충청북도">충청북도</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_gangwondo.nanum" title="강원도">강원도</a>
				<a class="kboard-branch-button" href="<%=path%>/board_list_jejuIsland.nanum" title="제주도">제주도</a>
			</div>
		</form>
		
	</div>
	</div>
	</div>
	<!-- 검색폼 끝 -->
			<!-- Main -->
			<br>
	<table class="table table-hover click-table">
		<thead>
		<caption align="right">전체 게시판</caption>
			<tr>
				<th style="width:10%;text-align:center">번호</th>			
				<th>제목</th>
				<th style="width:10%;text-align:center">지역</th>
				<th style="width:10%;text-align:center">작성자</th>
				<th style="width:10%;text-align:center">조회수</th>				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${requestScope.board_list }">
			<tr data-board-idx="${item.board_idx }">			
				<td style="width:10%;text-align:center">${item.board_idx }</td>				
				<td>${item.board_subject }[${item.reply_cnt }]</td>
				<td style="width:10%;text-align:center">${item.board_area_code }</td>
				<td style="width:10%;text-align:center">${item.board_writer_name }</td>
				
				<%-- 3자리마다 쉼표가 찍여있는 문자열로 만든다. --%>
				<fmt:formatNumber var="str" value="${item.board_read_cnt }" type="number"/>
				<td style="width:10%;text-align:center">${str }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<br/>
	<br/>
		<div style="text-align: right;">
	<c:if test="${not empty sessionScope.id}">
	<c:url var="path" value="/board_write.nanum">		
	</c:url>
	<a href="${path }" class="btn btn-primary">
		글쓰기
	</a>
	</c:if>
	</div>
	<div style="text-align:center">
		<ul class="pagination">
			<c:url var="path" value="/board_list.nanum">
				
				<c:param name="page" value="1"/>
			</c:url>
			<li><a href="${path }">&lt;&lt;</a></li>
			
			<c:url var="path" value="/board_list.nanum">
				
				<c:param name="page" value="${requestScope.pre_max }"/>
			</c:url>
			<li><a href="${path }">&lt;</a></li>
			<c:forEach var="i" begin="${requestScope.min_page }" end="${requestScope.max_page }">
				<c:url var="path" value="/board_list.nanum">
				
					<c:param name="page" value="${i }"/>
				</c:url>
				
				<c:choose>
				<c:when test="${i == requestScope.now_page }">
				<li class="active">
				</c:when>
				<c:otherwise>
				<li>
				</c:otherwise>
				</c:choose>
				<a href="${path }">${i }</a></li>
			</c:forEach>	
			
			<c:url var="path" value="/board_list.nanum">
				
				<c:param name="page" value="${requestScope.next_min }"/>
			</c:url>
			<li><a href="${path }">&gt;</a></li>
			<c:url var="path" value="/board_list.nanum">
				
				<c:param name="page" value="${requestScope.page_cnt }"/>
			</c:url>
			<li><a href="${path }">&gt;&gt;</a></li>		
		</ul>
		
	</div>
		<h1>${requestScope.info_name }</h1>
	<br/>

</div>
<div class="col-sm-2">


</div>
</div>

</div>
<!--  GPS 정보       -->
		<div id="map" style="width: 1px; height: 1px; display: block;"></div>
<!--  GPS 정보       -->
<!-- Footer -->

<footer><br><br>
<p>(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com</p>
</footer>
</div>

<!--  GPS 정보       -->
 <script>
        var map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.5666805, 126.9784147),
            zoom: 5,
            mapTypeId: naver.maps.MapTypeId.NORMAL
        });

        var infowindow = new naver.maps.InfoWindow();

        function onSuccessGeolocation(position) {
            var location = new naver.maps.LatLng(position.coords.latitude,
                                                 position.coords.longitude);

            map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
            map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

            infowindow.setContent('<div style="padding:20px;">' +
                '위도: '+ location.lat() +'<br />' +
                '경도: '+ location.lng() +'</div>');
            sendGps(location.lat(), location.lng());
            infowindow.open(map, location);
        }

        function onErrorGeolocation() {
            var center = map.getCenter();

            infowindow.setContent('<div style="padding:20px;">' +
                '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "위도: "+ center.lat() +"<br />경도: "+ center.lng() +'</div>');

            infowindow.open(map, center);
        }

        $(document).ready(function(){
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
            } else {
                var center = map.getCenter();

                infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5>'+ ": "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
                infowindow.open(map, center);
            }
        });
        </script>
<!--  GPS 정보       -->

	</body>
	<!-- Scripts -->

	<script src="<%=path %>/assets/js/jquery.min.js"></script>
	<script src="<%=path %>/assets/js/jquery.dropotron.min.js"></script>
	<script src="<%=path %>/assets/js/jquery.scrolly.min.js"></script>
	<script src="<%=path %>/assets/js/browser.min.js"></script>
	<script src="<%=path %>/assets/js/breakpoints.min.js"></script>
	<script src="<%=path %>/assets/js/util.js"></script>
	<script src="<%=path %>/assets/js/main.js"></script>
	
	
	<link rel='stylesheet' id='font-awesome-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/assets/font-awesome/css/font-awesome.min.css?ver=5.3.9' type='text/css' media='all' />
<!--[if lte IE 7]>
<link rel='stylesheet' id='font-awesome-ie7-css'  href='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/assets/font-awesome/css/font-awesome-ie7.min.css?ver=5.3.9' type='text/css' media='all' />
<![endif]-->
<script type='text/javascript'>
/* <![CDATA[ */
var cosmosfarm_share_settings = {"version":"1.6","default_img_src":""};
/* ]]> */
</script>
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-content/plugins/cosmosfarm-share-buttons/js/cosmosfarm-share-buttons.js?ver=1.6'></script>
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-content/plugins/enlighter/resources/mootools-core-yc.js?ver=3.7'></script>
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-content/plugins/enlighter/resources/EnlighterJS.min.js?ver=3.7'></script>
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-content/plugins/cosmosfarm-members/assets/js/script.js?ver=2.5'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var cosmosfarm_members_settings = {"ajax_nonce":"820c43564d","home_url":"\/demo\/","site_url":"\/demo\/","post_url":"\/demo\/wp-admin\/admin-post.php","ajax_url":"\/demo\/wp-admin\/admin-ajax.php","locale":"ko_KR","postcode_service_disabled":"","use_postcode_service_iframe":"","use_strong_password":"","use_certification":"sms","certified_phone":"","certification_min_age":"","certification_name_field":"display_name","certification_gender_field":"","certification_birth_field":"","certification_carrier_field":"","certification_phone_field":"","iamport_id":"imp84178409"};
var cosmosfarm_members_localize_strings = {"please_enter_the_postcode":"\uc6b0\ud3b8\ubc88\ud638\ub97c \uc785\ub825\ud574\uc8fc\uc138\uc694.","please_wait":"\uae30\ub2e4\ub824\uc8fc\uc138\uc694.","yes":"\uc608","no":"\uc544\ub2c8\uc694","password_must_consist_of_8_digits":"\ube44\ubc00\ubc88\ud638\ub294 \uc601\ubb38,\uc22b\uc790,\ud2b9\uc218\ubb38\uc790\ub97c \ud3ec\ud568\ud558\uc5ec 8\uc790\ub9ac \uc774\uc0c1\uc73c\ub85c \uad6c\uc131\ud574\uc57c \ud569\ub2c8\ub2e4.","your_password_is_different":"\ube44\ubc00\ubc88\ud638\uac00 \uc11c\ub85c \ub2e4\ub985\ub2c8\ub2e4.","please_enter_your_password_without_spaces":"\ube44\ubc00\ubc88\ud638\ub294 \uacf5\ubc31 \uc5c6\uc774 \uc785\ub825\ud574\uc8fc\uc138\uc694.","it_is_a_safe_password":"\uc548\uc804\ud55c \ube44\ubc00\ubc88\ud638\uc785\ub2c8\ub2e4.","male":"\ub0a8\uc131","female":"\uc5ec\uc131","certificate_completed":"\ubcf8\uc778\uc778\uc99d \uc644\ub8cc","please_fill_out_this_field":"\ud544\ub4dc\uc5d0 \ub0b4\uc6a9\uc744 \uc785\ub825\ud574\uc8fc\uc138\uc694.","available":"\uc0ac\uc6a9 \uac00\ub2a5\ud569\ub2c8\ub2e4.","not_available":"\uc0ac\uc6a9\ud560 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4.","already_in_use":"\uc774\ubbf8 \uc0ac\uc6a9\uc911\uc785\ub2c8\ub2e4.","are_you_sure_you_want_to_delete":"\uc0ad\uc81c \ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?","no_notifications_found":"\uc54c\ub9bc\uc774 \uc5c6\uc2b5\ub2c8\ub2e4.","no_messages_found":"\ucabd\uc9c0\uac00 \uc5c6\uc2b5\ub2c8\ub2e4.","no_orders_found":"\uc8fc\ubb38\uc774 \uc5c6\uc2b5\ub2c8\ub2e4.","no_users_found":"\uc0ac\uc6a9\uc790\uac00 \uc5c6\uc2b5\ub2c8\ub2e4.","please_agree":"\ub3d9\uc758\ud574\uc8fc\uc138\uc694."};
/* ]]> */
</script>
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-content/plugins/cosmosfarm-members/skin/two/script.js?ver=2.5'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var kboard_settings = {"version":"5.3.9","home_url":"\/demo\/","site_url":"\/demo\/","post_url":"https:\/\/www.cosmosfarm.com\/demo\/wp-admin\/admin-post.php","ajax_url":"https:\/\/www.cosmosfarm.com\/demo\/wp-admin\/admin-ajax.php","alax_url":"https:\/\/www.cosmosfarm.com\/demo\/wp-admin\/admin-ajax.php","plugin_url":"https:\/\/www.cosmosfarm.com\/demo\/wp-content\/plugins\/kboard","add_media_url":"\/demo\/","media_group":"5b56aa325c33a","ajax_security":"995654b33f"};
var kboard_localize_strings = {"kboard_add_media":"KBoard \ubbf8\ub514\uc5b4 \ucd94\uac00","next":"\ub2e4\uc74c","prev":"\uc774\uc804","required":"%s\uc740(\ub294) \ud544\uc218\uc785\ub2c8\ub2e4.","please_enter_the_title":"\uc81c\ubaa9\uc744 \uc785\ub825\ud574\uc8fc\uc138\uc694.","please_enter_the_author":"\uc791\uc131\uc790\ub97c \uc785\ub825\ud574\uc8fc\uc138\uc694.","please_enter_the_password":"\ube44\ubc00\ubc88\ud638\ub97c \uc785\ub825\ud574\uc8fc\uc138\uc694.","please_enter_the_CAPTCHA":"\uc606\uc5d0 \ubcf4\uc774\ub294 \ubcf4\uc548\ucf54\ub4dc\ub97c \uc785\ub825\ud574\uc8fc\uc138\uc694.","please_enter_the_name":"\uc774\ub984\uc744 \uc785\ub825\ud574\uc8fc\uc138\uc694.","please_enter_the_email":"\uc774\uba54\uc77c\uc744 \uc785\ub825\ud574\uc8fc\uc138\uc694.","you_have_already_voted":"\uc774\ubbf8 \ud22c\ud45c\ud588\uc2b5\ub2c8\ub2e4.","please_wait":"\uae30\ub2e4\ub824\uc8fc\uc138\uc694.","newest":"\ucd5c\uc2e0\uc21c","best":"\ucd94\ucc9c\uc21c","updated":"\uc5c5\ub370\uc774\ud2b8\uc21c","viewed":"\uc870\ud68c\uc21c","yes":"\uc608","no":"\uc544\ub2c8\uc694","did_it_help":"\ub3c4\uc6c0\uc774 \ub418\uc5c8\ub098\uc694?","hashtag":"\ud574\uc2dc\ud0dc\uadf8","tag":"\ud0dc\uadf8","add_a_tag":"\ud0dc\uadf8 \ucd94\uac00","removing_tag":"\ud0dc\uadf8 \uc0ad\uc81c","changes_you_made_may_not_be_saved":"\ubcc0\uacbd\uc0ac\ud56d\uc774 \uc800\uc7a5\ub418\uc9c0 \uc54a\uc744 \uc218 \uc788\uc2b5\ub2c8\ub2e4.","email":"\uc774\uba54\uc77c","address":"\uc8fc\uc18c","postcode":"\uc6b0\ud3b8\ubc88\ud638","phone_number":"\ud734\ub300\ud3f0\ubc88\ud638","mobile_phone":"\ud734\ub300\ud3f0\ubc88\ud638","phone":"\ud734\ub300\ud3f0\ubc88\ud638","company_name":"\ud68c\uc0ac\uba85","vat_number":"\uc0ac\uc5c5\uc790\ub4f1\ub85d\ubc88\ud638","bank_account":"\uc740\ud589\uacc4\uc88c","name_of_deposit":"\uc785\uae08\uc790\uba85","find":"\ucc3e\uae30","rate":"\ub4f1\uae09","ratings":"\ub4f1\uae09","waiting":"\ub300\uae30","complete":"\uc644\ub8cc","question":"\uc9c8\ubb38","answer":"\ub2f5\ubcc0","notify_me_of_new_comments_via_email":"\uc774\uba54\uc77c\ub85c \uc0c8\ub85c\uc6b4 \ub313\uae00 \uc54c\ub9bc \ubc1b\uae30","ask_question":"\uc9c8\ubb38\ud558\uae30","categories":"\uce74\ud14c\uace0\ub9ac","pages":"\ud398\uc774\uc9c0","all_products":"\uc804\uccb4\uc0c1\ud488","your_orders":"\uc8fc\ubb38\uc870\ud68c","your_sales":"\ud310\ub9e4\uc870\ud68c","my_orders":"\uc8fc\ubb38\uc870\ud68c","my_sales":"\ud310\ub9e4\uc870\ud68c","new_product":"\uc0c1\ud488\ub4f1\ub85d","edit_product":"\uc0c1\ud488\uc218\uc815","delete_product":"\uc0c1\ud488\uc0ad\uc81c","seller":"\ud310\ub9e4\uc790","period":"\uae30\uac04","period_of_use":"\uc0ac\uc6a9\uae30\uac04","last_updated":"\uc5c5\ub370\uc774\ud2b8 \ub0a0\uc9dc","list_price":"\uc815\uc0c1\uac00\uaca9","price":"\ud310\ub9e4\uac00\uaca9","total_price":"\ucd1d \uac00\uaca9","amount":"\uacb0\uc81c\uae08\uc561","quantity":"\uc218\ub7c9","use_points":"\ud3ec\uc778\ud2b8 \uc0ac\uc6a9","my_points":"\ub0b4 \ud3ec\uc778\ud2b8","available_points":"\uc0ac\uc6a9 \uac00\ub2a5 \ud3ec\uc778\ud2b8","apply_points":"\uc801\uc6a9\ub41c \ud3ec\uc778\ud2b8","buy_it_now":"\uad6c\ub9e4\ud558\uae30","sold_out":"\ud488\uc808","for_free":"\ubb34\ub8cc","pay_s":"%s \uacb0\uc81c","payment_method":"\uacb0\uc81c\uc218\ub2e8","credit_card":"\uc2e0\uc6a9\uce74\ub4dc","make_a_deposit":"\ubb34\ud1b5\uc7a5\uc785\uae08","reward_point":"\uc801\ub9bd \ud3ec\uc778\ud2b8","download_expiry":"\ub2e4\uc6b4\ub85c\ub4dc \uae30\uac04","checkout":"\uc8fc\ubb38\uc815\ubcf4\ud655\uc778","buyer_information":"\uc8fc\ubb38\uc790","applying_cash_receipts":"\ud604\uae08\uc601\uc218\uc99d \uc2e0\uccad","privacy_policy":"\uac1c\uc778 \uc815\ubcf4 \uc815\ucc45","i_agree_to_the_privacy_policy":"\uac1c\uc778 \uc815\ubcf4 \uc815\ucc45\uc5d0 \ub3d9\uc758\ud569\ub2c8\ub2e4.","i_confirm_the_terms_of_the_transaction_and_agree_to_the_payment_process":"\uac70\ub798\uc870\uac74\uc744 \ud655\uc778\ud588\uc73c\uba70 \uacb0\uc81c\uc9c4\ud589\uc5d0 \ub3d9\uc758\ud569\ub2c8\ub2e4.","today":"\uc624\ub298","yesterday":"\uc5b4\uc81c","this_month":"\uc774\ubc88\ub2ec","last_month":"\uc9c0\ub09c\ub2ec","last_30_days":"\ucd5c\uadfc30\uc77c","agree":"\ucc2c\uc131","disagree":"\ubc18\ub300","opinion":"\uc758\uacac"};
var kboard_cross_link_localize_strings = {"missing_link_address":"\ub9c1\ud06c \uc8fc\uc18c\uac00 \uc5c6\uc2b5\ub2c8\ub2e4.","no_more_data":"\ub354 \uc774\uc0c1 \ud45c\uc2dc \ud560 \ub370\uc774\ud130\uac00 \uc5c6\uc2b5\ub2c8\ub2e4."};
var kboard_comments_localize_strings = {"reply":"\ub2f5\uae00","cancel":"\ucde8\uc18c","please_enter_the_author":"\uc791\uc131\uc790\uba85\uc744 \uc785\ub825\ud574\uc8fc\uc138\uc694.","please_enter_the_password":"\ube44\ubc00\ubc88\ud638\ub97c \uc785\ub825\ud574\uc8fc\uc138\uc694.","please_enter_the_CAPTCHA":"\ubcf4\uc548\ucf54\ub4dc\ub97c \uc785\ub825\ud574\uc8fc\uc138\uc694.","please_enter_the_content":"\ub0b4\uc6a9\uc744 \uc785\ub825\ud574\uc8fc\uc138\uc694.","are_you_sure_you_want_to_delete":"\uc0ad\uc81c \ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?","please_wait":"\uc7a0\uc2dc\ub9cc \uae30\ub2e4\ub824\uc8fc\uc138\uc694.","email":"\uc774\uba54\uc77c","address":"\uc8fc\uc18c","postcode":"\uc6b0\ud3b8\ubc88\ud638","phone_number":"\uc5f0\ub77d\ucc98","find":"\ucc3e\uae30","rate":"\ub4f1\uae09","ratings":"\ub4f1\uae09","waiting":"\ub300\uae30","complete":"\uc644\ub8cc","question":"\uc9c8\ubb38","answer":"\ub2f5\ubcc0","notify_me_of_new_comments_via_email":"\uc774\uba54\uc77c\ub85c \uc0c8\ub85c\uc6b4 \ub313\uae00 \uc54c\ub9bc \ubc1b\uae30"};
var kboard_current = {"board_id":"6","content_uid":"","use_tree_category":"","tree_category":""};
/* ]]> */
</script>
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/template/js/script.js?ver=5.3.9'></script>
<script type='text/javascript' src='https://www.cosmosfarm.com/demo/wp-content/plugins/kboard/skin/ocean-franchise/list.js?ver=5.3.9'></script>
<script type="text/javascript">/* <![CDATA[ */EnlighterJS_Config = {"selector":{"block":"pre.EnlighterJSRAW","inline":"code.EnlighterJSRAW"},"language":"generic","theme":"enlighter","indent":-1,"hover":"hoverEnabled","showLinenumbers":true,"rawButton":true,"infoButton":true,"windowButton":true,"rawcodeDoubleclick":false,"grouping":true,"cryptex":{"enabled":false,"email":"mail@example.tld"}};!function(){var a=function(a){var b="Enlighter Error: ";console.error?console.error(b+a):console.log&&console.log(b+a)};return window.addEvent?"undefined"==typeof EnlighterJS?void a("Javascript Resources not loaded yet!"):"undefined"==typeof EnlighterJS_Config?void a("Configuration not loaded yet!"):void window.addEvent("domready",function(){EnlighterJS.Util.Init(EnlighterJS_Config.selector.block,EnlighterJS_Config.selector.inline,EnlighterJS_Config)}):void a("MooTools Framework not loaded yet!")}();;/* ]]> */</script>
</html>