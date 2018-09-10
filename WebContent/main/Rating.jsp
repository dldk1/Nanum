<%@page import="com.nanum.dao.UserDAO"%>
<%@page import="com.nanum.vo.FoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
	
	FoodVO fVO = UserDAO.randomFood();
	
%>

<html>
<head>
<title>::대한민국 1등 쉐어링 플랫폼, 나눔의 민족::</title> 		
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="shortcut icon" href="<%=path %>/favicon1.ico">
<link rel="stylesheet" href="<%=path %>/signUp/signUp.css" />
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

<style type="text/css">

#userId {
	font-size: 12px;
	padding-left: 30px;	
	text-decoration: none;
	margin-right: -100px;
}
footer{
position: relative;
font-size: 12px;
text-decoration: none;
  text-align: center;
  text-indent: 6px;  
color: gray;
}
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: green;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}

body {
  padding: 50px;
}
form .stars {
  background: url("<%=path%>/images/stars.png") repeat-x 0 0;
  width: 150px;
  margin: 0 auto;
}

form .stars input[type="radio"] {
  position: absolute;
  opacity: 0;
  filter: alpha(opacity=0);
}
form .stars input[type="radio"].star-5:checked ~ span {
  width: 100%;
}
form .stars input[type="radio"].star-4:checked ~ span {
  width: 80%;
}
form .stars input[type="radio"].star-3:checked ~ span {
  width: 60%;
}
form .stars input[type="radio"].star-2:checked ~ span {
  width: 40%;
}
form .stars input[type="radio"].star-1:checked ~ span {
  width: 20%;
}
form .stars label {
  display: block;
  width: 30px;
  height: 30px;
  margin: 0!important;
  padding: 0!important;
  text-indent: -999em;
  float: left;
  position: relative;
  z-index: 10;
  background: transparent!important;
  cursor: pointer;
}
form .stars label:hover ~ span {
  background-position: 0 -30px;
}
form .stars label.star-5:hover ~ span {
  width: 100% !important;
}
form .stars label.star-4:hover ~ span {
  width: 80% !important;
}
form .stars label.star-3:hover ~ span {
  width: 60% !important;
}
form .stars label.star-2:hover ~ span {
  width: 40% !important;
}
form .stars label.star-1:hover ~ span {
  width: 20% !important;
}
form .stars span {
  display: block;
  width: 0;
  position: relative;
  top: 0;
  left: 0;
  height: 30px;
  background: url("<%=path%>/images/stars.png") repeat-x 0 -60px;
  -webkit-transition: -webkit-width 0.5s;
  -moz-transition: -moz-width 0.5s;
  -ms-transition: -ms-width 0.5s;
  -o-transition: -o-width 0.5s;
  transition: width 0.5s;
}
</style>
<script>

function ratingSuccess() {
	alert("평가가 완료되었습니다. 감사합니다.");
}

</script>
</head>
<title>Insert title here</title>
</head>
<body>
<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<p><font color="dimgray">나눔의 민족</font></p>
						</div>
					</div>
				</header>

			<!-- Nav -->
	<nav id="nav">
					<ul>
						<li class="current"><a href="<%=path %>/main.nanum">Home</a></li>
						<li><a href="<%=path %>/introduce/introduce10.jsp">소개</a>
						</li>
						<li><a href="<%=path%>/notice.nanum">공지사항</a></li>
						<li><a href="#">배달나눔</a>
							<ul>
								<li><a href="<%=path %>/board_list.nanum">배달나눔 게시판</a></li>
								<li><a href="<%=path %>/rating_list.nanum">베스트 나눔인</a></li>
							</ul>
						</li>
						<li><a href="<%=path %>/main/FoodRecommendationPage2.jsp">메뉴 추천</a></li>
						<li><a href="<%=path%>/main/event.jsp">이벤트</a></li>
															
					<%if(id == null){ %>
					<li><a href="<%=path %>/index.jsp" onclick="goPopup()">Login</a></li>
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
						
	<section id="main">			
	<div class="container" style="text-align: center">
	<img src="<%=path %>/images/thankyou.jpg" width="800">
		<div>
			<h2>주문 평가하기</h2>
			<p>평가는 안전하고, 믿을 수 있으며, 즐거운 서비스를 만드는 데 도움이 됩니다.</p>
		</div>
		<br> <br> <br>
		<form id="ratingsForm">
			<div class="stars">
				<input type="radio" name="star" class="star-1" id="star-1">
				<label class="star-1" for="star-1">1</label> <input type="radio"
					name="star" class="star-2" id="star-2"> <label
					class="star-2" for="star-2">2</label> <input type="radio"
					name="star" class="star-3" id="star-3"> <label
					class="star-3" for="star-3">3</label> <input type="radio"
					name="star" class="star-4" id="star-4"> <label
					class="star-4" for="star-4">4</label> <input type="radio"
					name="star" class="star-5" id="star-5"> <label
					class="star-5" for="star-5">5</label> <span></span>
			</div>
		</form> <!--  form 데이터 넘기기 1 -->
		<br><br>
		<form>
		<br><br>
			<div>
				<p>서비스에 만족하시나요?</p>				
				<input id="radio1" type="radio" name="radio"  value="만족" checked="checked"><label for="radio1"><span><span></span></span>만족</label>
				<input id="radio2" type="radio" name="radio" value="보통"><label for="radio2"><span><span></span></span>보통</label>
				<input id="radio3" type="radio" name="radio"  value="불만족"><label for="radio3"><span><span></span></span>불만족</label>
			</div><br>
			</form> <!--  form 데이터 넘기기 2 -->
			<form>
			<div>
				<br> <br>
				<p>또 이용할 의향이 있으신가요?</p>
				<input id="radio4" type="radio" name="radio"  value="예" checked="checked"><label for="radio4"><span><span></span></span>예</label>
				<input id="radio5" type="radio" name="radio" value="아니요"><label for="radio5"><span><span></span></span>아니요</label>
				
			</div>
			</form> <!--  form 데이터 넘기기 3 -->
			<br> <br>
			<form action="<%=path %>/rating.nanum" method="post">
			<div class="form-group">
				<label for="inputlg">다른 의견이 있다면 적어주세요.</label> <input
					class="form-control input-lg" id="inputlg" type="text">
			</div>
			<br>
			<button type="submit" class="btn btn-default" onclick="ratingSuccess()">평가하기</button>
		</form> <!--  form 데이터 넘기기 4 -->
		
		</div>
		
	</div>
	
	</section>
<footer><br>
(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com
</footer><br>

		

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