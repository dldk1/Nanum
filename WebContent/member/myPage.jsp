<%@page import="com.nanum.dao.UserDAO"%>
<%@page import="com.nanum.vo.FoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
	String phone = (String) session.getAttribute("phone");
	String email = (String) session.getAttribute("email");
	FoodVO fVO = UserDAO.randomFood();
	String u_idx = (String) session.getAttribute("u_idx");
	if (u_idx == null) {
		u_idx = "132";
	}
%>
<head>
<title>::대한민국 1등 쉐어링 플랫폼, 나눔의 민족::</title>
<meta charset="utf-8" />
<meta name="viewport" 
content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="shortcut icon" href="<%=path %>/favicon1.ico">
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
<style type="text/css">
#userId {
	font-size: 15px;
	padding-left: 100px;	
	text-decoration: none;
}
footer{
margin:auto;
margin-top:-50px;
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
		url : path + "/getUserInfoForUser.nanum",

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
				$("#name").val(test[3]);
				$("#email").val(test[4]);
				$("#phone").val(test[5]);
				
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
<body class="is-preload" onload="getUserInfo('<%=id%>')">
	<div id="page-wrapper">

<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							
							<p><font color="dimgray">My Page</font></p>
						</div>
					</div>
				</header>
</div>
			<!-- Nav -->
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
					
									
															
					<%if(id == null){ %>
					<li><a href="<%=path %>/index.jsp" onclick="goPopup()">Login</a></li>
					<%}else if(id.equals("admin")){ %>
					<li><a href="<%=path %>/admin.nanum">관리자페이지</a></li>
					<li><a href="<%=path %>/logout.nanum">Logout</a></li>
					<b id = userId> <a href="#"><%out.print(name);%></a> 님 안녕하세요!</b>
					<%}else{ %>	
					<li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
					<li><a href="<%=path %>/logout.nanum">Logout</a></li>					
					<b id = userId> <a href="<%=path%>/myPage.nanum"><%out.print(name);%></a> 님! &nbsp 오늘은 <%=fVO.getStore() %>의 <%=fVO.getMenu()%> 어떠세요? </b>	
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
								<a href="board_mylist.nanum?u_idx=<%=u_idx%>">내가 쓴 게시글</a>
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
						
						 <section> <div class="contentwrap">
	<h4>내 정보</h4><br>				 
  <article class="container">
    <div class="page-header">
    </div>
    <form class="form-horizontal">
    <div class="form-group">
    <label for="inputId" class="col-sm-2 control-label" >아이디</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="id" name="id" maxlength="12" value="<%=id%>" readonly/> <br>
    </div>
    </div>
     <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="name"  name="name" value="<%=name%>" readonly/><br>
    </div>
    </div>
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
    <div class="col-sm-6">
    <input type="email" class="form-control" id="email" name="email" value="<%=email%>" readonly/><br>
    <div id="emailCheck"></div>
    </div>
    </div>
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">휴대폰 번호</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="phone" name="phone" value="<%=phone%>" readonly/>   <br>
    </div>    
    </div>
    </form>    
  </article>
</div>

</div>
</div></section>

						
						</section>
					</div>


		</div>
</section>
<footer>
(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com
</footer><br>
		<!-- Scripts --> <script src="<%=path%>/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/assets/js/jquery.dropotron.min.js"></script> <script
			src="<%=path%>/assets/js/jquery.scrolly.min.js"></script> <script
			src="<%=path%>/assets/js/browser.min.js"></script> <script
			src="<%=path%>/assets/js/breakpoints.min.js"></script> <script
			src="<%=path%>/assets/js/util.js"></script> <script
			src="<%=path%>/assets/js/main.js"></script>

</body>
</html>