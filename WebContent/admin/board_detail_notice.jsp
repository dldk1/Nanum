<%@page import="com.nanum.dao.UserDAO"%>
<%@page import="com.nanum.vo.FoodVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
	
	FoodVO fVO = UserDAO.randomFood();
%>
<%-- 삭제 여부 처리 --%>
<c:choose>
<c:when test="${requestScope.board_bean.board_status == 2 }">
<script>
	alert('삭제된 글입니다');
	<c:url var="path" value="/board_list_notice.nanum">
	<c:param name="info_idx" value="${param.info_idx}"/>
		<c:param name="page" value="${param.page}"/>
	</c:url>
	location.href = "${path}";
</script>
</c:when>
<c:otherwise>

<!DOCTYPE html>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
footer{
position: relative;
font-size: 12px;
text-decoration: none;
  text-align: center;
  text-indent: 6px;  
color: gray;
}
</style>
<script>
	function add_reply(){
		// 사용자가 입력한 댓글 내용
		var reply_content = $("#reply_content").val();

		if(reply_content.length == 0){
			alert("댓글 내용을 입력해주세요");
			$("#reply_content").focus();
			return false;
		}
		// 서버로 전달할 파라미터 데이터
		var param = {
			reply_board_idx : ${param.board_idx},
			reply_content : reply_content
		};
		// 접속할 주소
		<c:url var="path1" value="/add_reply_notice.nanum"/>
		<c:url var="path2" value="/board_detail_notice.nanum">
			<c:param name="page" value="${param.page}"/>
			<c:param name="board_idx" value="${param.board_idx}"/>
		</c:url>
		
		$.ajax({
			url : "${path1}",
			type : "post",
			dataType : "text",
			data : param,
			success : function(a){
				if(a.trim() == "OK"){
					alert("저장되었습니다");
					location.href = "${path2}";
				}
			}
		});
		
		
		return false;
	}
	
	function remove_reply(reply_idx){
		// 파라미터
		var param = {
			reply_idx : reply_idx
		};
		// 요청할 주소
		<c:url var="path1" value="/remove_reply_notice.nanum"/>
		<c:url var="path2" value="/board_detail_notice.nanum">
			<c:param name="page" value="${param.page}"/>
			<c:param name="board_idx" value="${param.board_idx}"/>
		</c:url>
		
		$.ajax({
			url : "${path1}",
			type : "post",
			dataType : "text",
			data : param,
			success : function(a){
				if(a.trim() == "OK"){
					alert("삭제되었습니다");
					location.href = "${path2}";
				}
			}
		});
		
	}
	
</script>
</head>
<body>
	<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							
							<p>나눔의 민족! 여기와서 나누자!!</p>
						</div>
					</div>
				</header>

		<!-- Nav -->
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
								<li><a href="<%=path %>/board_list.nanum">현재 인기있는 나눔 물품</a></li>
								<li><a href="#"> 나눔 예정인 물품</a></li>
								<li>
									<a href="#">나와 가까운 곳에서 진행중인 나눔 물품</a>
									
								</li>
								
							</ul>
						</li>
						<li>
						<a href="<%=path %>/main/FoodRecommendationPage2.jsp">메뉴 추천</a>
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
					
									
															
					<%if(id == null){ %>
						<li><a href="<%=path %>/index.jsp" onclick="goPopup()">Login</a></li>
					<%}else if(id.equals("admin")){ %>
						<li><a href="<%=path %>/admin.nanum">관리자페이지</a></li>
						<li><a href="<%=path %>/logout.nanum">Logout</a></li>
						<b id = userId> <%out.print(name);%>님 안녕하세요!</b>
					<% } else { fVO = UserDAO.randomFood(); %>	
						<li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
						<li><a href="<%=path %>/logout.nanum">Logout</a></li>					
						<b id = userId> <a href="<%=path%>/myPage.nanum"><%out.print(name);%></a> 님! &nbsp 오늘은 <%=fVO.getStore() %>의 <%=fVO.getMenu()%> 어떠세요? </b>	
					<% } %>								
					</ul>
									
				</nav>

<div class="container" style="margin-top:100px">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
	
	<form class="form-horizontal">
		<div class="form-group">
			<label class="control-label col-sm-3" for="writer_name">
				작성자
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="writer_name" name="writer_name" value="${requestScope.board_bean.board_writer_name }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="subject">
				제목
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="subject" name="subject" value="${requestScope.board_bean.board_subject }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label  class="control-label col-sm-3" for="board_date">
				작성날짜
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="board_date" value="${requestScope.board_bean.board_date }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="board_ip">
				작성자 IP
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="board_ip" value="${requestScope.board_bean.board_ip }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="content">
				내용
			</label>
			<div class="col-sm-6">
				<textarea class="form-control" id="content" name="content" readonly="readonly" rows="10">${requestScope.board_bean.board_content }</textarea>
			</div>
		</div>
		
		<c:if test="${not empty requestScope.board_bean.board_image }">
		<div class="form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<c:url var="path" value="/upload"/>
				<img src="${path }/${requestScope.board_bean.board_image}" style="width:100%"/>
			</div>
		</div>
		</c:if>
		
		<div class="form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<c:if test="${requestScope.board_bean.board_writer_idx == sessionScope.login_bean.u_idx }">
				
				<c:url var="path" value="/modify_board_notice.nanum">
					<c:param name="page" value="${param.page }"/>
					<c:param name="board_idx" value="${param.board_idx }"/>
				</c:url>				
				<a href="${path }" class="btn btn-success">
					수정하기
				</a>
				
				<c:url var="path" value="/delete_board_notice.nanum">
				
					<c:param name="page" value="${param.page }"/>
					<c:param name="board_idx" value="${param.board_idx }"/>
				</c:url>
				<a href="${path }" class="btn btn-danger">
					삭제하기
				</a>
				</c:if>
				
				<c:url var="path" value="/board_list_notice.nanum">
					
					<c:param name="page" value="${param.page }"/>
					
				</c:url>
				<a href="${path }" class="btn btn-primary">
					목록보기
				</a>
			</div>
		</div>
	</form>
	
	<form class="form-horizontal" onsubmit="return add_reply()">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="form-group">
				<textarea class="form-control" id="reply_content" rows="5" style="resize:none;"></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">
					댓글 저장
				</button>
			</div>
			
			<c:forEach var="item" items="${requestScope.reply_list }">
			
			<div class="form-group">
				<div class="alert alert-success">
  					<strong>${item.reply_writer_name }</strong> ${item.reply_content }
  					
				</div>
				
				<c:if test="${sessionScope.login_bean.u_idx == item.reply_writer_idx }">
				<div>
					<button type="button" class="btn btn-danger" onclick="remove_reply(${item.reply_idx})">
						<span class="glyphicon glyphicon-arrow-up"></span> 댓글 삭제
					</button>
				</div>
				</c:if>
			</div>
			
			</c:forEach>
			
		</div>
	</form>
</div>
<div class="col-sm-1"></div>
</div>
</div>
</body>
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
</html>
</c:otherwise>
</c:choose>




















