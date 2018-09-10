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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/modify_board.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
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
	function preview_image(){
		// input type="file"에서 사용자가 선택한
		// 파일 객체를 얻어온다.
		var file = $("#board_image")[0].files[0];
		// 파일에서 데이터를 읽어올 수 있는 객체를
		// 생성
		var reader = new FileReader();
		// 파일에서 데이터를 읽어오는 것이 완료되었을 때
		// 호출될 함수를 설정한다.
		reader.onloadend = function(){
			$("#preview").attr("src", reader.result);
		}
		// 파일에서 데이터를 읽어온다.
		reader.readAsDataURL(file);
	}
	
	function check_input(){
		// 사용자가 입력한 데이터를 가져온다.
		var subject = $("#subject").val();
		var content = $("#content").val();
		var file = $("#board_image")[0].files[0];
		
		if(subject.length == 0){
			alert("제목을 입력해주세요");
			$("#subject").focus();
			return false;
		}
		
		if(content.length == 0){
			alert("내용을 입력해주세요");
			$("#content").focus();
			return false;
		}
		
		// 서버로 보낼 데이터를 가지고 있는 객체
		
		var formData = new FormData();
		formData.append("board_image", file);
		formData.append("board_subject", subject);
		formData.append("board_content", content);
		formData.append("board_idx", ${param.board_idx});
		// 통신한다.
		<c:url var="path1" value="/modify_board_pro.nanum"/>
		<c:url var="path2" value="/board_detail.nanum">
			<c:param name="info_idx" value="${param.info_idx}"/>
			<c:param name="page" value="${param.page}"/>
			<c:param name="board_idx" value="${param.board_idx}"/>
		</c:url>
		$.ajax({
			url : "${path1}",
			processData : false,
			contentType : false,
			data : formData,
			type : "post",
			dataType : "text",
			success :  function(a){
				if(a.trim() == "OK"){
					alert("저장되었습니다");
					location.href = "${path2}";
				}
			}
			
		});
		
		return false;
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
							<ul><li><a href="<%=path %>/introduce/introduce10.jsp"">개발진들</a></li></ul>
						</li>
						<li><a href="<%=path%>/notice.nanum">공지사항</a></li>
						<li><a href="#">배달나눔</a>
							<ul>
								<li><a href="<%=path %>/board_list.nanum">현재 인기있는 나눔 물품</a></li>
								<li><a href="<%=path %>/rating_list.nanum">베스트 나눔인</a></li>								
							</ul>
						</li>
						<li><a href="<%=path %>/main/FoodRecommendationPage2.jsp">메뉴 추천</a></li>
						<li><a href="<%=path%>/main/event.jsp">이벤트</a></li>	
															
					<%if(id == null){ %>
					<li><a href="index.jsp" onclick="goPopup()">Login</a></li>
					<%}else if(id.equals("admin")){ %>
					<li><a href="<%=path %>/admin.nanum">관리자페이지</a></li>
					<li><a href="logout.nanum">Logout</a></li>
					<b id = userId> <a href="#"><%out.print(name);%></a> 님 안녕하세요!</b>
					<%}else{ %>	
					<li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
					<li><a href="logout.nanum">Logout</a></li>
					<b id = userId> <a href="<%=path%>/myPage.nanum"><%out.print(name);%></a> 님! &nbsp 오늘은 <%=fVO.getStore() %>의 <%=fVO.getMenu()%> 어떠세요? </b>	
					<%} %>							
					</ul>					
				</nav>

<div class="container" style="margin-top:100px">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
	<form class="form-horizontal" onsubmit="return check_input()">
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
				<input type="text" class="form-control" id="subject" name="subject" value="${requestScope.board_bean.board_subject }"/>
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
				<textarea class="form-control" id="content" name="content" rows="10">${requestScope.board_bean.board_content }</textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="board_image">
				이미지 업로드
			</label>
			<div class="col-sm-6">
				<input type="file" class="form-control" name="board_image" id="board_image" accept="image/*" onchange="preview_image()"/>
			</div>
		</div>
		
		

		<div class="form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<c:choose>
				<c:when test="${not empty requestScope.board_bean.board_image }"><%-- 이미지 있을 때 --%>
				<c:url var="path" value="/upload"/>
				<img id="preview" src="${path }/${requestScope.board_bean.board_image}" style="width:100%"/>				
				</c:when>
				<c:otherwise><%-- 이미지 없을때 --%>
				<img id="preview" style="width:100%"/>
				</c:otherwise>
				</c:choose>	
			</div>
		</div>
		
		
		<div class="form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<button type="submit" class="btn btn-primary">
					저장하기
				</button>
				<button type="reset" class="btn btn-info">
					초기화
				</button>
				
				<c:url var="path" value="board_detail.nanum">
					<c:param name="info_idx" value="${param.info_idx}"/>
					<c:param name="page" value="${param.page }"/>
					<c:param name="board_idx" value="${param.board_idx }"/>
				</c:url>
				<a href="${path }" class="btn btn-danger">
					취소
				</a>
			</div>
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





















