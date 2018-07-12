<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
	
%>
<html>
<head>
<title>TXT by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
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

<!--  이미지 자동 변경 -->
<script> 
$(document).ready(function(){ 
    var main = $('.bxslider').bxSlider({ 
    mode: 'fade', 
    auto: true, //자동으로 슬라이드 
    controls : true,    //좌우 화살표    
    autoControls: true, //stop,play 
    pager:true, //페이징 
    pause: 3000, 
    autoDelay: 0,   
    slideWidth: 800, 
    speed: 500, 
    stopAutoOnclick:true
}); 
    
$(".bx-stop").click(function(){ // 중지버튼 눌렀을때 
    main.stopAuto(); 
    $(".bx-stop").hide(); 
    $(".bx-start").show(); 
    return false; 
}); 
 
$(".bx-start").click(function(){    //시작버튼 눌렀을때 
    main.startAuto(); 
    $(".bx-start").hide(); 
    $(".bx-stop").show(); 
    return false; 
}); 
 
  $(".bx-start").hide();    //onload시 시작버튼 숨김. 
}); 
</script> 

<style type="text/css">
#userId {
	font-size: 15px;
	padding-left: 200px;	
	text-decoration: none;
}

#menuBar {
	padding-left: 400px;
}
</style>
<script>				
function goPopup() {			
window.open('login/loginForm.jsp','window','width=800,height=650,left=570,top=250');			
// window.open(URL,"팝업 구분값(팝업 1개일 경우 상관없음)","팝업 창 옵션")				
}				
</script>
</head>
<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1><a href="index.html" id="logo">TXT</a></h1>
							<p>A responsive site template by HTML5 UP</p>
						</div>
					</div>
				</header>

			<!-- Nav -->
				<nav id="nav">
					<ul id = menuBar>
						<li class="current"><a href="index.html">Home</a></li>
						<li>
							<a href="#">Dropdown</a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li>
									<a href="#">Phasellus consequat</a>
									<ul>
										<li><a href="#">Lorem ipsum dolor</a></li>
										<li><a href="#">Phasellus consequat</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
									</ul>
								</li>
								<li><a href="#">Veroeros feugiat</a></li>
							</ul>
						</li>
						<li><a href="left-sidebar.html">Left Sidebar</a></li>
						
						<li><a href="">123123</a></li>																
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
				
<div class="container">
		<h1><p class="text-center"><b>나눔의 민족</b></p></h1>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="<%=path %>/images/05.jpg" style="width: 100%;">
				</div>

				<div class="item">
					<img src="<%=path %>/images/06.jpg" style="width: 100%;">
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
				

			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- Highlight -->
									<section class="box highlight">
										<ul class="special">
											<li><a href="#" class="icon fa-search"><span class="label">Magnifier</span></a></li>
											<li><a href="#" class="icon fa-tablet"><span class="label">Tablet</span></a></li>
											<li><a href="#" class="icon fa-flask"><span class="label">Flask</span></a></li>
											<li><a href="#" class="icon fa-cog"><span class="label">Cog?</span></a></li>
										</ul>
										<header>
											<h2>A random assortment of icons in circles</h2>
											<p>And some text that attempts to explain their significance</p>
										</header>
										<p>
											Phasellus quam turpis, feugiat sit amet ornare in, hendrerit in lectus. Praesent semper mod quis eget mi. Etiam eu<br />
											ante risus. Aliquam erat volutpat. Aliquam luctus et mattis lectus amet pulvinar. Nam nec turpis consequat.
										</p>
									</section>

							</div>
							<div class="col-12">

								<!-- Features -->
									<section class="box features">
									
									
										<h2 class="major"><span>A Major Heading</span></h2>
										<div>
											<div class="row">
												<div class="col-3 col-6-medium col-12-small">

													<!-- Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="<%=path %>/images/pic01.jpg" alt="" /></a>
															<h3><a href="#">A Subheading</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="<%=path %>/images/pic02.jpg" alt="" /></a>
															<h3><a href="#">Another Subheading</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="<%=path %>/images/pic03.jpg" alt="" /></a>
															<h3><a href="#">And Another</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="<%=path %>/images/pic04.jpg" alt="" /></a>
															<h3><a href="#">And One More</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-12">
													<ul class="actions">
														<li><a href="#" class="button large">Do Something</a></li>
														<li><a href="#" class="button alt large">Think About It</a></li>
													</ul>
												</div>
											</div>
										</div>
									</section>

							</div>
							<div class="col-12">

								<!-- Blog -->
									<section class="box blog">
										<h2 class="major"><span>Another Major Heading</span></h2>
										<div>
											<div class="row">
												<div class="col-9 col-12-medium">
													<div class="content">

														<!-- Featured Post -->
															<article class="box post">
																<header>
																	<h3><a href="#">Here's a really big heading</a></h3>
																	<p>With a smaller subtitle that attempts to elaborate</p>
																	<ul class="meta">
																		<li class="icon fa-clock-o">15 minutes ago</li>
																		<li class="icon fa-comments"><a href="#">8</a></li>
																	</ul>
																</header>
																<a href="#" class="image featured"><img src="<%=path %>/images/pic05.jpg" alt="" /></a>
																<p>
																	Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in lectus. Praesent
																	semper mod quis eget mi. Etiam sed ante risus aliquam erat et volutpat. Praesent a
																	dapibus velit. Curabitur sed nisi nunc, accumsan vestibulum lectus. Lorem ipsum
																	dolor sit non aliquet sed, tempor et dolor.  Praesent a dapibus velit. Curabitur
																	accumsan.
																</p>
																<a href="#" class="button">Continue Reading</a>
															</article>

													</div>
												</div>
												<div class="col-3 col-12-medium">
													<div class="sidebar">

														<!-- Archives -->
															<ul class="divided">
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">A Subheading</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock-o">6 hours ago</li>
																			<li class="icon fa-comments"><a href="#">34</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Another Subheading</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock-o">9 hours ago</li>
																			<li class="icon fa-comments"><a href="#">27</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">And Another</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock-o">Yesterday</li>
																			<li class="icon fa-comments"><a href="#">184</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">And Another</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock-o">2 days ago</li>
																			<li class="icon fa-comments"><a href="#">286</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">And One More</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock-o">3 days ago</li>
																			<li class="icon fa-comments"><a href="#">8,086</a></li>
																		</ul>
																	</article>
																</li>
															</ul>
															<a href="#" class="button alt">Archives</a>

													</div>
												</div>
											</div>
										</div>
									</section>

							</div>
						</div>
					</div>
				</section>

			<!-- Footer -->
				<footer id="footer">
					
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span>What's this about?</span></h2>
										<p>
											This is <strong>TXT</strong>, yet another free responsive site template designed by
											<a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net">HTML5 UP</a>. It's released under the
											<a href="http://html5up.net/license/">Creative Commons Attribution</a> license so feel free to use it for
											whatever you're working on (personal or commercial), just be sure to give us credit for the design.
											That's basically it :)
										</p>
									</section>

							</div>
							<div class="col-12">

								<!-- Contact -->
									<section>
										<h2 class="major"><span>Get in touch</span></h2>
										<ul class="contact">
											<li><a class="icon fa-facebook" href="#"><span class="label">Facebook</span></a></li>
											<li><a class="icon fa-twitter" href="#"><span class="label">Twitter</span></a></li>
											<li><a class="icon fa-instagram" href="#"><span class="label">Instagram</span></a></li>
											<li><a class="icon fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
											<li><a class="icon fa-linkedin" href="#"><span class="label">LinkedIn</span></a></li>
										</ul>
									</section>

							</div>
						</div>

						<!-- Copyright -->
							<div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
								</ul>
							</div>

					</div>
				</footer>

		</div>

		<!-- Scripts -->
			<script src="<%=path %>/assets/js/jquery.min.js"></script>
			<script src="<%=path %>/assets/js/jquery.dropotron.min.js"></script>
			<script src="<%=path %>/assets/js/jquery.scrolly.min.js"></script>
			<script src="<%=path %>/assets/js/browser.min.js"></script>
			<script src="<%=path %>/assets/js/breakpoints.min.js"></script>
			<script src="<%=path %>/assets/js/util.js"></script>
			<script src="<%=path %>/assets/js/main.js"></script>

	</body>
</html>