<%@page import="com.nanum.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<%
String path = request.getContextPath();
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");
// UserVO login_bean = (UserVO)session.getAttribute("login_bean");
// System.out.println(login_bean);
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

}
</style>
<script>
	function check_input(){
		// 입력한 내용을 가져온다.
		var subject = $("#subject").val();
		var content = $("#content").val();
		// 사용자가 첨부한 파일 객체를 가져온다.
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
// 		formData.append("board_info_idx", info_idx);
// 		alert("sadfsaf");
		// 데이터를 저장하는 페이지
		<c:url var="path1" value="/board_write_pro_notice.nanum"/>
		<c:url var="path2" value="/board_detail_notice.nanum"/>

		$.ajax({
			// 접속할 페이지의 주소	
			
			url : "${path1}",
			processData : false,
			contentType : false,
			data : formData,
// 			data : {
// 				board_image: file,
// 				board_subject: subject,
// 				board_content: content
// 			},
			type : "post",
			dataType : "json",
			success :  function(a){
				console.log(a);
				if(a.status.trim() == "OK"){
					alert("저장되었습니다");
					location.href = "${path2}?&board_idx=" + a.board_idx;
				}
			}
		});
		
		
		return false;
	}
	
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
</script>
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
					</ul>
					
						<li>
						<a href="#">고객센터</a>
						</li>			
															
					<%if(id == null){ %>
					<li><a href="<%=path%>/board.nanum" onclick="goPopup()">Login</a></li>
					<%}else if(id.equals("admin")){ %>
					<li><a href="<%=path %>/admin.nanum">관리자페이지</a></li>
					<li><a href="<%=path%>/logout.nanum">Logout</a></li>
					<b id = userId> <a href="#"><%out.print(name);%></a> 님 안녕하세요!</b>
					<%}else{ %>	
					<li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
					<li><a href="<%=path%>/logout.nanum">Logout</a></li>
					<b id = userId> <a href="<%=path%>/myPage.nanum"><%out.print(name);%></a> 님 안녕하세요!</b>	
					<%} %>							
					</ul>					
				</nav>

			<!-- Main -->
			<br>
<div class="contentwrap">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
	<form class="form-horizontal" onsubmit="return check_input()" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="control-label col-sm-3" for="writer_name">
				작성자
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="writer_name" name="writer_name" value="<%out.print(name); %>" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="subject">
				제목
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="subject" name="subject"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="content">
				내용
			</label>
			<div class="col-sm-6">
				<textarea class="form-control" id="content" name="content" rows="10"></textarea>
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
				<img id="preview" width="100%"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<button type="submit" class="btn btn-primary">
					저장하기
				</button>
				
				<c:url var="path" value="/board_list_notice.nanum">					
				</c:url>
				<a href="${path }" class="btn btn-primary">
					목록보기
				</a>
			</div>
		</div>
	</form>
</div>
<div class="col-sm-1"></div>
</div>
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