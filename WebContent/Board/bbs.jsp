<%@page import="com.nanum.dao.BbsDAO"%>
<%@page import="com.nanum.vo.BbsVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import = "java.io.PrintWriter"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<%
String path = request.getContextPath();
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");


		if (session.getAttribute("id") != null) {
			id = (String)session.getAttribute("id");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<head>
		<title>::대한민국 1등 쉐어링 플랫폼, 나눔의 민족::</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=path %>/signUp/signUp.css" />
		<link rel="stylesheet" href="<%=path %>/assets/css/main.css" />
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
footer{
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
</style>
<script>				
function goPopup() {			
window.open('<%=path%>/login/loginForm.jsp','window','width=800,height=650,left=570,top=250');			
// window.open(URL,"팝업 구분값(팝업 1개일 경우 상관없음)","팝업 창 옵션")				
}				
</script>
	</head>
	<body class="is-preload">

		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1><a id="logo">나눔 게시판</a></h1>
							
						</div>
					</div>
				</header>

			<nav id="nav">
					<ul>
						<li class="current"><a href="<%=path %>/main.nanum">Home</a></li>
						
						<li><a href="#">소개</a>
						<ul>
						<li><a href="introduce.html">개발진들</a></li>
						</ul>
						</li>
						
						<li><a href="#">공지사항</a>
						<ul>
						<li><a href="#">개인정보 주의</a></li>
						</ul>
						</li>
						
						<li>
							<a href="#">배달나눔</a>
							<ul>
								<li><a href="#">현재 인기있는 나눔 물품</a></li>
								<li><a href="#"> 나눔 예정인 물품</a></li>
								<li>
									<a href="#">나와 가까운 곳에서 진행중인 나눔 물품</a>
									
								</li>
								
							</ul>
						</li>
						<li>
							<a href="#">이벤트</a>
							<ul>
								<li><a href="#">협력업체 이벤트</a></li>
								<li><a href="#">시간할인 이벤트</a></li>
								<li>
									<a href="#">별점할인 이벤트</a>
									
								</li>
					</ul>
					
						<li>
						<a href="#">고객센터</a>
						</li>			
															
					<%if(id == null){ %>
					<li><a href="<%=path %>/Board/bbs.jsp" onclick="goPopup()">Login</a></li>
					<%}else if(id.equals("admin")){ %>
					<li><a href="<%=path %>/admin.nanum">관리자페이지</a></li>
					<li><a href="logout.nanum">Logout</a></li>
					<b id = userId> <a href="#"><%out.print(name);%></a> 님 안녕하세요!</b>
					<%}else{ %>	
					<li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
					<li><a href="logout.nanum">Logout</a></li>
					<b id = userId> <a href="<%=path%>/myPage.nanum"><%out.print(name);%></a> 님 안녕하세요!</b>	
					<%} %>							
					</ul>					
				</nav>

			<!-- Main -->
			<br>
<div class="contentwrap">	

</div>

<!-- Footer -->
<footer><br><br>
<p>(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com</p>
</footer>
		</div>
	</body>
	<!-- Scripts -->

	<script src="<%=path %>/assets/js/jquery.min.js"></script>
	<script src="<%=path %>/assets/js/jquery.dropotron.min.js"></script>
	<script src="<%=path %>/assets/js/jquery.scrolly.min.js"></script>
	<script src="<%=path %>/assets/js/browser.min.js"></script>
	<script src="<%=path %>/assets/js/breakpoints.min.js"></script>
	<script src="<%=path %>/assets/js/util.js"></script>
	<script src="<%=path %>/assets/js/main.js"></script>
</html>