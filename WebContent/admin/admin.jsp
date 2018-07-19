<%@page import="com.nanum.vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

String path = request.getContextPath();
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");
ArrayList<UserVO> getUserList = (ArrayList<UserVO>) request.getAttribute("userList");
	
%>
<head>
<title>::대한민국 1등 쉐어링 플랫폼, 나눔의 민족::</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

	<link rel="stylesheet" href="<%=path%>/signUp/signUp.css"/>
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
#userId {
	font-size: 15px;
	padding-left: 100px;	
	text-decoration: none;
}
footer{
position: relative;
font-size: 12px;
text-decoration: none;
  text-align: center;
  text-indent: 6px;  
color: gray;
}
</style>

<script type="text/javascript">

function getUserInfo() {
	var u_idx = $('input[name = optradio]:checked').val();

	var path = getContextPath();
	console.log(path);
	$.ajax({

		type : 'POST',
		url : path + "/getUserInfoForAdmin.nanum",

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
		url : path + "/delInfoForAdmin.nanum",
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
<script>
//전화번호 하이픈

 function autoHypenPhone(str) {

		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;

		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;

		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}


function callAutoHypen() {
	var cellPhone = document.getElementById('phone');
	cellPhone.onkeyup = function(event) {
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val);
	} 
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
								<li><a href="<%=path %>/board.nanum">현재 인기있는 나눔 물품</a></li>
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
					<li><a href="logout.nanum">Logout</a></li>
					<b id = userId> <a href="#"><%out.print(name);%></a> 님 안녕하세요!</b>
					<%}else{ %>	
					<li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
					<li><a href="logout.nanum">Logout</a></li>					
					<b id = userId><%out.print(name);%></a> 님 안녕하세요! </b>	
					<%} %>								
					</ul>
									
				</nav>		
<!--수정 부분-->
<section id="main">
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
									class="form-control" id="phone" onfocus="callAutoHypen()" maxlength="12">
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
</section>	
		<!-- Footer -->
		<footer><br><br>
(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com
</footer><br><br><br>

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