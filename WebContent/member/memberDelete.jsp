<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");	
%>
<head>
<title>Left Sidebar - TXT by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
<link rel="stylesheet" href="<%=path %>/signUp/signUp.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">

function deleteUserInfo() {
	var pw = $('#pw').val();
	var id = $('#id').val();
	
	console.log(id);	
	console.log(pw);
	
	alert("정말로 회원탈퇴를 하시겠습니까?");
	var path = getContextPath();
	console.log(path);
	// 전달 매개변수는 idx(사용자 번호)
	// url 접속 정보(서블릿으로 보내는) 

	$.ajax({
		type : 'POST',
		url : path + "/delInfo.nanum",
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
				alert(path+ "/logout.nanum");
				//location.href = path+ "/logout.nanum";
				//location.reload();
				//var url = "path+ "/logout.nanum"; 
				alert(data);			
				//$(location).attr('href',url);				
			    
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
		console.log($('#hiddenPw').val());
		console.log($('#pw').val());
		
		var aa = true;
		
 		if (pw=="") {	 		
			alert("비밀번호를 입력하세요.");
			aa=false;
		}
		
 		else if (pw.trim() != hiddenPw.trim()) {
			alert("비밀번호가 일치하지 않습니다.");
			aa= false;
		}		
 		
		return aa;
		
	}
</script>
</head>
<body class="is-preload">
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
			<li class="current"><a href="left-sidebar.html">Left Sidebar</a></li>
			<li><a href="right-sidebar.html">Right Sidebar</a></li>
			<li><a href="no-sidebar.html">No Sidebar</a></li>
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
						<p>나눔의 민족 개인정보수정 페이지 입니다.</p>						
						</header> <section> <div class="contentwrap">
  <article class="container">
    <div class="page-header">
    </div>
    <form class="form-horizontal" method="post" name = "signUp" id="signUp">
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
    <div class="col-sm-6"></br>
      <button type="submit" class="btn btn-primary" form="signUp" onclick="deleteUserInfo()" >회원탈퇴</button>
    </div>
    </div>    
  </article>
</div>
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

		<!-- Scripts --> <script src="<%=path%>/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/assets/js/jquery.dropotron.min.js"></script> <script
			src="<%=path%>/assets/js/jquery.scrolly.min.js"></script> <script
			src="<%=path%>/assets/js/browser.min.js"></script> <script
			src="<%=path%>/assets/js/breakpoints.min.js"></script> <script
			src="<%=path%>/assets/js/util.js"></script> <script
			src="<%=path%>/assets/js/main.js"></script>
</body>
</html>