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
<link rel="stylesheet" href="<%=path%>/signUp/signUp.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
</head>
<body class="is-preload">

		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1>나눔 게시판</h1>
							
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
					<li><a href="board.nanum" onclick="goPopup()">Login</a></li>
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

<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">


	<table class="table table-hover click-table">
		<thead>
			<tr>
				<th style="width:10%;text-align:center">번호</th>
				<th>제목</th>
				<th style="width:10%;text-align:center">작성자</th>
				<th style="width:10%;text-align:center">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${requestScope.board_list }">
			<tr data-board-idx="${item.board_idx }">
				<td style="width:10%;text-align:center">${item.board_idx }</td>
				<td>${item.board_subject }[${item.reply_cnt }]</td>
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
<div class="col-sm-2"></div>
</div>

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