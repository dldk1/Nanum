<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nanum.dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nanum.vo.FoodVO"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");	
	FoodVO fVO = UserDAO.randomFood();
%>

<html>
<head>
<title>::대한민국 1등 쉐어링 플랫폼, 나눔의 민족::</title> 		
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="shortcut icon" href="<%=path %>/favicon1.ico">
<link rel="stylesheet" href="<%=path %>/assets/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> 
<script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> 

<style>

#userId {
	font-size: 12px;
	padding-left: 30px;	
	text-decoration: none;
	margin-right: -100px;
}
footer{
position: relative;
margin-top:-70px;
font-size: 12px;
text-decoration: none;
  text-align: center;
  text-indent: 6px;  
color: gray;
}
.btn {
	display: inline-block;
	border: 2px solid black;
	background-color: white;
	color: black;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
	margin: 50px;
}

/* Green */
.success {
	border-color: #4CAF50;
	color: green;
}

.success:hover {
	background-color: #4CAF50;
	color: white;
}


</style>
<title>Insert title here</title>
</head>
<body>
<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<p><font color="dimgray">메뉴추천</font></p>
						</div>
					</div>
				</header>

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
					<li><a href="<%=path%>/logout.nanum">Logout</a></li>
					<b id = userId> <a href="#"><%out.print(name);%></a> 님 안녕하세요!</b>
					<%}else{ %>	
					<li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
					<li><a href="<%=path%>/logout.nanum">Logout</a></li>					
					<b id = userId> <a href="<%=path%>/myPage.nanum"><%out.print(name);%></a> 님! &nbsp 오늘은 <%=fVO.getStore() %>의 <%=fVO.getMenu()%> 어떠세요? </b>	
					<%} %>								
					</ul>
									
				</nav>						
<section id="main">	
	<div style="text-align: center">
		
			<div class="col-lg-4">
				
				
			</div>
		
		<div>

		</div>
	<div><br>
	<h1 style="margin-bottom: 20px;">오늘은
	<%
		ArrayList<String> list = new ArrayList<String>();	
		list.add("갈비찜");
		list.add("김밥");
		list.add("냉면");
		list.add("닭강정");
		list.add("돈가스");
		list.add("떡볶이");
		list.add("보쌈");
		list.add("보쌈2");
		list.add("부대찌개");
		list.add("비빔밥");
		list.add("빙수");
		list.add("삼겹살도시락");
		list.add("삼계탕");
		list.add("연어회");
		list.add("육회비빔밥");
		list.add("일식");
		list.add("잡채");
		list.add("짜장면");
		list.add("짬뽕");
		list.add("찌개");
		list.add("찜닭");
		list.add("치킨");
		list.add("치킨2");
		list.add("캘리포니아롤");
		list.add("탕수육");
		list.add("파스타");
		list.add("파스타2");
		list.add("피자");
		list.add("피자2");
		list.add("함박스테이크");
		list.add("해산물");		
		list.add("회");		

		Collections.shuffle(list); // num 값들 랜덤으로 순서 재배치
		String rName = list.get(1);
		String imgName = path+"/images/" + rName + ".jpg";
	%>
	<a style="color: #F07878">
	<%
	out.print(rName);
	%> </a>어떠신가요?
	</h1>
	<img src="<%=imgName %>" style="border:1px solid black; width: 600px; height: 400px;">
	</div>
		<div>			
			<a href="javascript:location.reload()" class="btn success" style="margin-bottom: 0px;">다른메뉴 추천</a>
			<a href='<%=path %>/board_list.nanum' class="btn success">주문하러 가기</a><br>
			</div>
	
	</div>
	</section>
<footer>
(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com
</footer><br>

		

		<!-- Scripts -->
			<script src="<%=path %>/assets/js/jquery.min.js"></script>
			<script src="<%=path %>/assets/js/jquery.dropotron.min.js"></script>
			<script src="<%=path %>/assets/js/jquery.scrolly.min.js"></script>
			<script src="<%=path %>/assets/js/browser.min.js"></script>
			<script src="<%=path %>/assets/js/breakpoints.min.js"></script>
			<script src="<%=path %>/assets/js/util.js"></script>
			<script src="<%=path %>/assets/js/main.js"></script>

	</body>
</html>