<%@page import="com.nanum.vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();

	ArrayList<UserVO> getUserList = (ArrayList<UserVO>) request.getAttribute("userList");
	
%>
<head>
<title>회원정보수정</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

	<link rel="stylesheet" href="<%=path%>/signUp/signUp.css"/>
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script type="text/javascript">

function getUserInfo() {
	var u_idx = $('input[name = optradio]:checked').val();

	var path = getContextPath();
	console.log(path);
	$.ajax({

		type : 'POST',
		url : path + "/getUserInfo.nanum",

		data : {
			"u_idx" : u_idx
		},

		success : function(data) {
			console.log(data);
			var test = data.split('/');
			if ($.trim(test[0]) == "OK") {
				console.log('정보 불러오기 성공');
				console.log(test);
				$("#id").val(test[2]); //모달에서 id 값이 name인 곳에 값 설정 u_idx + name + pw + email + phone
				$("#pw").val(test[3]);
				$("#name").val(test[4]);
				$("#email").val(test[5]);
				$("#phone").val(test[6]);
				 $('#myModal').modal({show: true});
				//alert("정보 불러오기 성공");
			} else {
				console.log('서버 에러');
			}
		},
	}); // end ajax
}
function updateUserInfo() {
	var u_idx = $('input[name = optradio]:checked').val();
	var id = $("#id").val();
	var pw = $("#pw").val();
	var name = $("#name").val();
	var email = $("#email").val();
	var phone = $("#phone").val();

	//if(u_idx==undefined)
	//alert(u_idx + " 번호를 수정해야함" );
	//return;
	var path = getContextPath();
	console.log(path);
	$.ajax({

		type : 'POST',
		url : path + "/updateInfo.nanum",

		data : {
			"u_idx" : u_idx,
			"id" : id,
			"pw" : pw,
			"name" : name,
			"email" : email,
			"phone" : phone
		},

		success : function(data) {
			console.log(data);
			if ($.trim(data) == "OK") {
				console.log('수정 완료');
				alert("수정이 완료되었습니다.");
				location.reload();
			} else {
				console.log('서버 에러');
			}
		},
	}); // end ajax
}

function deleteUserInfo() {
	var u_idx = $('input[name = optradio]:checked').val();
	alert(u_idx + " 정보를 삭제 하시겠습니까?");
	var path = getContextPath();
	console.log(path);
	// 전달 매개변수는 idx(사용자 번호)
	// url 접속 정보(서블릿으로 보내는) 

	$.ajax({
		type : 'POST',
		url : path + "/delinfo.nanum",
		data : {
			"u_idx" : u_idx
		},
		success : function(data) {
			console.log(data);
			if ($.trim(data) == "OK") {
				console.log('수정이나 삭제 완료');
				alert("삭제되었습니다.");
				location.reload();
			} else {
				console.log('서버 에러');
			}
		},
	}); // end ajax
}

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host)
			+ location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/',
			hostIndex + 1));
}
</script>

</head>
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
		<div class="logo container">
			<div>
				<h1>관리자 페이지</h1>
			</div>
		</div>
		</header>

		<!-- Nav -->
		<nav id="nav">
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="#">Dropdown</a>
				<ul>
					<li><a href="#">Lorem ipsum dolor</a></li>
					<li><a href="#">Magna phasellus</a></li>
					<li><a href="#">Phasellus consequat</a>
						<ul>
							<li><a href="#">Lorem ipsum dolor</a></li>
							<li><a href="#">Phasellus consequat</a></li>
							<li><a href="#">Magna phasellus</a></li>
							<li><a href="#">Etiam dolore nisl</a></li>
						</ul></li>
					<li><a href="#">Veroeros feugiat</a></li>
				</ul></li>
			<li><a href="left-sidebar.html">Left Sidebar</a></li>
			<li><a href="right-sidebar.html">Right Sidebar</a></li>
			<li class="current"><a href="no-sidebar.html">No Sidebar</a></li>
		</ul>
		</nav>
<!--수정 부분-->
	<div class="container">		
		<h2>회원정보</h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>선택</th>
					<th>U_IDX</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>Email</th>
					<th>전화번호</th>
					<th>탈퇴여부?</th>
				</tr>
			</thead>
			<tbody>
				<%
				int count=0;
					for (UserVO vo : getUserList) {
						count++;
				%>
				<tr>
					<td><input type="radio" id= "radio<%=count %>" name="optradio" value="<%=vo.getU_idx()%>"><label for="radio<%=count%>"><span><span></span></span></label></td>
					<td><%=vo.getU_idx()%></td>
					<td><%=vo.getId()%></td>
					<td><%=vo.getPw()%></td>
					<td><%=vo.getName()%></td>
					<td><%=vo.getEmail()%></td>
					<td><%=vo.getPhone()%></td>
					<td><%=vo.getState()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

								<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원 정보 변경</h4>
					</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="id">아이디</label> <input type="text"
									class="form-control" id="id">
							</div>

							<div class="form-group">
								<label for="pwd">패스워드</label> <input type="password"
									class="form-control" id="pw">
							</div>
							<div class="form-group">
								<label for="name">이름</label> <input type="text"
									class="form-control" id="name">
							</div>

							<div class="form-group">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email">
							</div>

							<div class="form-group">
								<label for="phone">전화번호</label> <input type="text"
									class="form-control" id="phone">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								onclick="updateUserInfo()" data-dismiss="modal">저장</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>

			</div>
		</div>
		<!-- Modal 끝 -->
		<button type="button" class="btn btn-default" onclick="getUserInfo()">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteUserInfo()">삭제</button>
	</div>
		<!-- Footer -->
		<footer id="footer">
		<div class="container">
			<div class="row gtr-200">
				<div class="col-12">

					<!-- About -->
					<section>
					<h2 class="major">
						<span>What's this about?</span>
					</h2>
					<p>
						This is <strong> </strong>, yet another free responsive site
						template designed by <a href="http://twitter.com/ajlkn">AJ</a> for
						<a href="http://html5up.net">HTML5 UP</a>. It's released under the
						<a href="http://html5up.net/license/">Creative Commons
							Attribution</a> license so feel free to use it for whatever you're
						working on (personal or commercial), just be sure to give us
						credit for the design. That's basically it :)
					</p>
					</section>

				</div>
				<div class="col-12">

					<!-- Contact -->
					<section>
					<h2 class="major">
						<span>Get in touch</span>
					</h2>
					<ul class="contact">
						<li><a class="icon fa-facebook" href="#"><span
								class="label">Facebook</span></a></li>
						<li><a class="icon fa-twitter" href="#"><span
								class="label">Twitter</span></a></li>
						<li><a class="icon fa-instagram" href="#"><span
								class="label">Instagram</span></a></li>
						<li><a class="icon fa-dribbble" href="#"><span
								class="label">Dribbble</span></a></li>
						<li><a class="icon fa-linkedin" href="#"><span
								class="label">LinkedIn</span></a></li>
					</ul>
					</section>

				</div>
			</div>

			<!-- Copyright -->
			<div id="copyright">
				<ul class="menu">
					<li>&copy; Untitled. All rights reserved</li>
					<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>

		</div>
		</footer>

	</div>

	<!-- Scripts -->

	<script src="<%=path%>/assets/js/jquery.dropotron.min.js"></script>
	<script src="<%=path%>/assets/js/jquery.scrolly.min.js"></script>
	<script src="<%=path%>/assets/js/browser.min.js"></script>
	<script src="<%=path%>/assets/js/breakpoints.min.js"></script>
	<script src="<%=path%>/assets/js/util.js"></script>
	<script src="<%=path%>/assets/js/main.js"></script>

</body>
</html>