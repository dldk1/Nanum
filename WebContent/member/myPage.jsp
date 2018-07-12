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
				$("#id").val(test[2]); //모달에서 id 값이 name인 곳에 값 설정 u_idx + name + pw + email + phone
				$("#pw").val(test[3]);
				$("#name").val(test[4]);
				$("#email").val(test[5]);
				$("#phone").val(test[6]);
				
				//alert("정보 불러오기 성공");
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
									<a href="#">회원탈퇴</a>
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
						<p>나눔의 민족 마이페이지 입니다.</p>
						<ul class="meta">
							<li class="icon fa-clock-o">5 days ago</li>
							<li class="icon fa-comments"><a href="#">1,024</a></li>
						</ul>
						</header> <section> <span class="image featured"><img
							src="<%=path%>/images/pic05.jpg" alt="" /></span>
						<p>Phasellus quam turpis, feugiat sit amet ornare in,
							hendrerit in lectus. Praesent semper mod quis eget mi. Etiam eu
							ante risus. Aliquam erat volutpat. Aliquam luctus et mattis
							lectus sit amet pulvinar. Nam turpis nisi consequat etiam lorem
							ipsum dolor sit amet nullam.</p>
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