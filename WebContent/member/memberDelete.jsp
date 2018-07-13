<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
	
%>


</style>
<head>
<title>Left Sidebar - TXT by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
<link rel="stylesheet" href="<%=path %>/signUp/signUp.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
#userId {
	font-size: 15px;
	padding-left: 100px;	
	text-decoration: none;
}
footer{
margin:auto;
position: relative;
font-size: 12px;
text-decoration: none;
  text-align: center;
  text-indent: 6px;  
color: gray;

}
</style>
<script type="text/javascript">

function getUserInfo(id) {	

	var path = getContextPath();
	console.log(path);
	$.ajax({

		type : 'POST',
		url : path + "/getUserInfo.nanum",

		data : {
			"id" : id
		},

		success : function(data) {
			console.log(data);
			var test = data.split('/');
			if ($.trim(test[0]) == "OK") {
				console.log('정보 불러오기 성공');
				console.log(test);
				$("#id").val(test[1]); //모달에서 id 값이 name인 곳에 값 설정 u_idx + name + pw + email + phone				
				$("#hiddenPw").val(test[2]); 						
				//alert("정보 불러오기 성공");
			} else {
				console.log('서버 에러');
			}
		},
	}); // end ajax
}

function deleteUserInfo() {
	
	 if(!check()){
		 return;
	 }	
	var pw = $('#pw').val();
	var id = $('#id').val();
	
	console.log(id);	
	console.log(pw);
	
	var path = getContextPath();
	console.log(path);
	

	$.ajax({
		type : 'POST',
		url : path + "/delInfoForUser.nanum",
		data : {
			"id" : id,
			"pw" : pw
		},
		success : function(data) {
			console.log(data);
			if ($.trim(data) == "OK") {
				console.log('수정이나 삭제 완료');
				alert("회원탈퇴가 완료 되었습니다.");
				var path = '/' + location.pathname.split('/')[1];				
				location.href = path+ "/logout.nanum";			    
			} else {
				console.log('서버 에러');
				alert("패스워드가 다릅니다.");
			}
		},
		//async:false
	}); // end ajax
}

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host)
			+ location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/',
			hostIndex + 1));
}
</script>

<script type="text/javascript">
	// null값 방지
	function check() {	
		var pw = $('#pw').val();
		var hiddenPw = $('#hiddenPw').val();
		
 		if (pw=="") {	 		
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
 		else if (pw.trim() != hiddenPw.trim()) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}		
 		
		return true;
		
	}
</script>
</head>
<body class="is-preload" onload="getUserInfo('<%=id%>')">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
		<div class="logo container">
			<div>
				<h1 style="text-transform: none;">
					<a href="<%=path%>/myPage.nanum">My Page</a>
				</h1>

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
					<li><a href="index.jsp" onclick="goPopup()">Login</a></li>
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
		<section id="main">
		<div class="container">
			<div class="row">
				<div class="col-3 col-12-medium">
					<div class="sidebar">

						<!-- Sidebar -->

						<!-- Recent Posts -->
						<section>
						<h2 class="major">
							<span>마이페이지</span>
						</h2>
						</br>
						<ul class="divided">
							<li><article class="box post-summary">
								<h5>
									<a href="memberModify.nanum">개인정보변경</a>
								</h5>
								</br>
								<h5>
									<a href="#">내가 쓴 게시글</a>
								</h5>
								</br>
								<h5>
									<a href="#">과거 나눔 이력</a>
								</h5>
								</br>
								<h5>
									<a href="#">나의 별점</a>
								</h5>
								</br>
								<h5>
									<a href="memberDelete.nanum">회원탈퇴</a>
								</h5>
								</br>
								</article>
						</section>

					</div>
				</div>
				<div class="col-9 col-12-medium imp-medium">
					<div class="content">

						<!-- Content -->

						<article class="box page-content"> <header>
						<h3>
							<%
								out.print(name);
							%> 님 안녕하세요!
						</h3></br>
						<p>나눔의 민족 회원탈퇴 페이지 입니다.</p>						
						</header> <section> <div class="contentwrap">
  <article class="container">
    <div class="page-header">
    </div>
    <form class="form-horizontal" method="post">
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">아이디</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="id" name="id" maxlength="12" value="<%=id%>" readonly/>   
    <div id="idCheck"></div><br>
    </div>
    </div>
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">현재 비밀번호</label>
    <input type="hidden" id="hiddenPw">
    <div class="col-sm-6">
    <input type="password" class="form-control" id="pw" name="pw">    
    </div>
    </div>    
    </form>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6" style="margin: auto; width: 20%;"><br><br>
      <button type="submit" class="btn btn-primary" onclick="deleteUserInfo()" style="margin: auto;">회원탈퇴</button>
    </div>
    </div>    
  </article>
</div>
						</section>
					</div>				
				</div>

				<!-- Copyright -->

<footer><br><br>
(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com
</footer><br><br><br>

		</div>

		<!-- Scripts --> <script src="<%=path%>/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/assets/js/jquery.dropotron.min.js"></script> <script
			src="<%=path%>/assets/js/jquery.scrolly.min.js"></script> <script
			src="<%=path%>/assets/js/browser.min.js"></script> <script
			src="<%=path%>/assets/js/breakpoints.min.js"></script> <script
			src="<%=path%>/assets/js/util.js"></script> <script
			src="<%=path%>/assets/js/main.js"></script>
</body>
</html>