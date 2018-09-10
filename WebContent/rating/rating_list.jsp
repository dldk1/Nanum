<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<%@page import="com.nanum.dao.UserDAO"%>
<%@page import="com.nanum.vo.FoodVO"%>
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
<link rel="stylesheet" href="<%=path %>/css/nanum.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.checked_star {
    color: orange;
}
</style>
<script>
$(function(){
	// tr태그를 클릭했을 때..
	$(".click-table > tbody > tr").click(function(){
		<c:url var="path" value="/rating_detail.nanum">
			<c:param name="page" value="${requestScope.now_page}"/>
		</c:url>
		// dataset에 셋팅되었는 값을 가지고 온다.
		var board_writer_idx = $(this).data("board_writer_idx");
		console.log("${path}&board_writer_idx=" + board_writer_idx);
		// 이동한다.
		location.href = "${path}&board_writer_idx=" + board_writer_idx;
	
	});
});
</script>
</head>
<body class="is-preload">

		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1>베스트 나눔인</h1>
							
						</div>
					</div>
				</header>
			<!-- Nav 시작 -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="<%=path %>/main.nanum">Home</a></li>
						<li><a href="<%=path %>/introduce/introduce10.jsp">소개</a>
						</li>
						<li><a href="<%=path%>/notice.nanum">공지사항</a></li>
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
			<!-- Main -->
			<br>
<div class="contentwrap">	

<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">

	<table class="table table-hover click-table">
		<thead>
			<tr>
				<th style="width:20%;text-align:center">별점</th>
				<th style="width:10%;text-align:center">나눔인</th>
				<th style="text-align:center">마지막 한줄평</th>
				<th style="width:10%;text-align:center">평가수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${requestScope.rating_list }">
			<tr data-board_writer_idx="${item.board_writer_idx }">
				<td style="width:20%;text-align:center">
				<c:forEach begin="1" end="${item.rating }" step="1">
					<span class="fa fa-star checked_star"></span>
				</c:forEach>
				</td>
				<td style="width:10%;text-align:center">${item.name }</td>	
				<td style="text-align:center">${item.content }</td>
				<td style="width:10%;text-align:center">${item.cnt }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
		<br/>
	<br/>
	<div style="text-align:center">
		<ul class="pagination">
			<c:url var="path" value="/rating_list.nanum">
				
				<c:param name="page" value="1"/>
			</c:url>
			<li><a href="${path }">&lt;&lt;</a></li>
			
			<c:url var="path" value="/rating_list.nanum">
				
				<c:param name="page" value="${requestScope.pre_max }"/>
			</c:url>
			<li><a href="${path }">&lt;</a></li>
			<c:forEach var="i" begin="${requestScope.min_page }" end="${requestScope.max_page }">
				<c:url var="path" value="/rating_list.nanum">
				
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
			
			<c:url var="path" value="/rating_list.nanum">
				
				<c:param name="page" value="${requestScope.next_min }"/>
			</c:url>
			<li><a href="${path }">&gt;</a></li>
			<c:url var="path" value="/rating_list.nanum">
				
				<c:param name="page" value="${requestScope.page_cnt }"/>
			</c:url>
			<li><a href="${path }">&gt;&gt;</a></li>		
		</ul>
		
	</div>
		<h1>${requestScope.info_name }</h1>
	<br/>

</div>

<div class="col-sm-2"></div>
</div>

</div>
<br><br><br><br><br><br><br><br><br><br>
<!-- footer  시작	 -->
<footer><br><br>
(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com
</footer><br><br><br>

		<!-- Scripts -->
			<script src="<%=path %>/assets/js/jquery.min.js"></script>
			<script src="<%=path %>/assets/js/jquery.dropotron.min.js"></script>
			<script src="<%=path %>/assets/js/jquery.scrolly.min.js"></script>
			<script src="<%=path %>/assets/js/browser.min.js"></script>
			<script src="<%=path %>/assets/js/breakpoints.min.js"></script>
			<script src="<%=path %>/assets/js/util.js"></script>
			<script src="<%=path %>/assets/js/main.js"></script>
<!-- footer  끝	 -->
</body>
</html>