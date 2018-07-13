<%@page import="javax.swing.BorderFactory"%>
<%@page import="javax.swing.JPanel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<!--  이미지 자동 변경 -->
<!-- <script> 
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
</script>  -->

</head>

<body>
	<!-- <div class="home__slider"> 
    <div class="bxslider"> 
        <div><img src="Test/images/01.jpg" alt="그림1"></div>
        <div><img src="Test/images/02.jpg" alt="그림2"></div> 
        <div><img src="Test/images/03.jpg" alt="그림3"></div> 
        <div><img src="Test/images/04.jpg" alt="그림4"></div> 
    </div> 
</div><br><br> -->



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
					<img src="Test/images/05.jpg" style="width: 100%;">
				</div>

				<div class="item">
					<img src="Test/images/06.jpg" style="width: 100%;">
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
	<br>
	<br>


	<!--  구글지도  -->
	<iframe
		src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7792.376720191432!2d128.805493756368!3d35.9128068876473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3566726281568c53%3A0x73386aadf1c5fa44!2z64yA6rWs6rCA7Yao66at64yA7ZWZ6rWQ!5e1!3m2!1sko!2skr!4v1530689750167"
		width="400" height="300" frameborder="0" style="border: 0"
		allowfullscreen></iframe>
	<br>
	<br>
	<br>
	<br>


	<!-- <div class="container-fluid">
  <h1>이용안내</h1>
  <div class="row">
    <div class="col-xs-6 col-sm-3" style="background-color:lavender;">
      <b>음식점 검색</b><br>
      현재 주문하고자 하는 음식점을 검색합니다. <br><br>
      <a href="">나와 가까운 음식점</a><br>
      <a href="">메뉴 추천받기</a>
    </div>
      <div class="col-xs-6 col-sm-3" style="background-color:lavender;">
      <b>진행중인 게시판</b><br>
      현재 최소주문금액을 맞추기 위해 진행중인 게시판을 검색합니다<br><br>
      <a href="">게시판 바로가기</a><br>
    </div>
     <div class="col-xs-6 col-sm-3" style="background-color:lavender;">
      <b>원활한 결제</b><br>
      결제결제<br><br>
      <a href="">결제하기</a><br>
    </div>
     
  </div>
</div><br><br><br> -->



	<!--  테스트 -->
	<!-- Page Content -->
	<!-- Page Content -->
	<div class="container">

		<div class="row my-4">
			<div class="col-lg-4">
				<h4>개요</h4>
				<h2>나눔의 민족 이용방법</h2>
			</div>
		</div>

		<br> <br>

		<!-- /.col-md-4 -->
		<div class="row">
			<div class="col-md-3 mb-3">
				<div class="card h-100">
					<div class="card-body">
						<h3 class="card-title">검색</h3><br>
						<p class="card-text">검색하고자 하는 음식과 음식점의 위치를 파악하고 게시판을 검색 후
							입력합니다.</p>
						<br>
						<p class="card-text">
						<p class="text-danger">
							<b>주의사항</b>
						</p>
						음식과 음식금액을 정확히 입력해주세요.
						<br>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-3 col-md-offset-1">
				<div class="card h-100">
					<div class="card-body">
						<h3 class="card-title">주문</h3><br>
						<p class="card-text">최소주문금액이 맞춰지면 게시판 작성자가 주문을 합니다.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-3 col-md-offset-1">
				<div class="card h-100">
					<div class="card-body">
						<h3 class="card-title">대기</h3><br>
						<p class="card-text">배달출발 시 배달원이 전송한 문자를 확인 후 도착예정시간에 맞춰
							대기합니다.</p>
						<br>
						<p class="card-text">
						<p class="text-danger">
							<b>주의사항</b>
						</p>
						배달원이 도착하기 전에 대기해주세요.
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>



	<!-- Heading Row -->
	<div class="container">
		<div class="row my-4">
			<div class="col-lg-4">
				<h4>더 보기</h4>
				<h2>주문 서비스 상세 요청</h2>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->

		<br> <br>

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-3 mb-3">
				<div class="card h-100">
					<div class="card-body">
						<h3 class="card-title">음식점 검색</h3><br>
						<p class="card-text">현재 주문하고자 하는 음식점을 검색합니다.</p>
						<br>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-default">나와 가까운 음식점</a><br> <br>
						<a href="#" class="btn btn-default">메뉴 추천받기</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-3 mb-3 col-md-offset-1">
				<div class="card h-100">
					<div class="card-body">
						<h3 class="card-title">진행중인 게시판</h3><br>
						<p class="card-text">현재 최소주문금액을 맞추기 위해 진행중인 게시판을 검색합니다.</p>
						<br>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-default">게시판 바로가기</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-3 mb-3 col-md-offset-1">
				<div class="card h-100">
					<div class="card-body">
						<h3 class="card-title">원활한 결제</h3><br>
						<p class="card-text">결제결제</p>
						<br>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-default">결제하기</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->

		</div>
		<br> <br> <br> <br>

		<div class="row">
			<div class="col-md-3 mb-3">
				<div class="card h-100">
					<div class="card-body">
						<h3 class="card-title">대기하기</h3><br>
						<p class="card-text">배달원의 도착예정시간에 맞춰 대기합니다.</p>
						<br>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-default">도착시간 확인하기</a><br> <br>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-3 col-md-offset-1">
				<div class="card h-100">
					<div class="card-body">
						<h3 class="card-title">주문 평가하기</h3><br>
						<p class="card-text">평가는 안전하고, 믿을 수 있으며, 즐거운 서비스를 만드는 데 도움이
							됩니다.</p>
						<br>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-default">평가하기</a><br> <br>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- /.container -->

	<footer class="container-fluid text-center">
		<p>나눔의 민족</p>
	</footer>

</body>
</html>