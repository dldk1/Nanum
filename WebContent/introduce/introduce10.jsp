<%@page import="com.nanum.dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.nanum.vo.FoodVO"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
   String path = request.getContextPath();
   String name = (String) session.getAttribute("name");
   String id = (String) session.getAttribute("id");   
%>

<head>
  <meta charset="utf-8">
  <title>악의 무리 3조</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <meta content="" name="keywords">
  <meta content="" name="description">
<link rel="stylesheet" href="<%=path %>/assets/css/main.css" />
<link rel="shortcut icon" href="<%=path %>/favicon1.ico">
  <!-- Place your favicon.ico and apple-touch-icon.png in the template root directory -->
  <link href="favicon.ico" rel="shortcut icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate-css/animate.min.css" rel="stylesheet">



  <!-- =======================================================
    Theme Name: Imperial
    Theme URL: https://bootstrapmade.com/imperial-free-onepage-bootstrap-theme/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
  <style>
  
 #myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 15px;
  border: solid 2px grey;
  outline: none;
  color: black;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
  background-color: white;
}

#myBtn:hover {
  background-color: #555;
  color: white;
} 
  
  
  #testimonials {
  background: #f6f6f6;
  padding: 80px 0;
}

#testimonials .profile {
  text-align: center;
}

#testimonials .profile .pic {
  border-radius: 50%;
  border: 6px solid #fff;
  margin-bottom: 15px;
  overflow: hidden;
  height: 260px;
  width: 260px;
}

#testimonials .profile .pic img {
  max-width: 100%;
}

#testimonials .profile h4 {
  font-weight: 700;
  color: #03C4EB;
  margin-bottom: 5px;
}

#testimonials .profile span {
  color: #333333;
}

#testimonials .quote {
  position: relative;
  background: #fff;
  padding: 60px;
  margin-top: 40px;
  font-size: 16px;
  font-style: italic;
  border-radius: 5px;
}

#testimonials .quote b {
  display: inline-block;
  font-size: 22px;
  left: -9px;
  position: relative;
  top: -8px;
}

#testimonials .quote small {
  display: inline-block;
  right: -9px;
  position: relative;
  top: 4px;
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
</head>

<body>
  <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
 <script>
 window.onscroll = function() {scrollFunction()};
 
 function scrollFunction() {
       if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
           document.getElementById("myBtn").style.display = "block";
       } else {
           document.getElementById("myBtn").style.display = "none";
       }
   }
 
  function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}
  </script> 
      <div id="page-wrapper">

         <!-- Header -->
      <header id="header">
               <div class="logo container">
                  <div>
                     <p><font color="dimgray">개발진 소개</font></p>
                  </div>
               </div>
            </header>

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
                  <b id = userId> <%out.print(name);%>님 안녕하세요!</b>
               <% } else { FoodVO fVO = UserDAO.randomFood(); %>   
                  <li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
                  <li><a href="<%=path %>/logout.nanum">Logout</a></li>               
                  <b id = userId> <a href="<%=path%>/myPage.nanum"><%out.print(name);%></a> 님! &nbsp 오늘은 <%=fVO.getStore() %>의 <%=fVO.getMenu()%> 어떠세요? </b>   
               <% } %>                        
               </ul>
                           
            </nav>      
      

 

     

  

  <!--==========================
  Services Section
  ============================-->
  

  

 

  <!--==========================
  Testimonials Section
  ============================-->
  <section id="testimonials">
    <div class="container wow fadeInUp">
      <div class="row">
        <div class="col-md-12">
          <h3 class="section-title">개발진들</h3>
          <div class="section-title-divider"></div>
          <p class="section-description">다들 상당히 악하다.</p>
        </div>
      </div>

      <div class="row">
        <div class="col-md-3">
          <div class="profile">
            <div class="pic"><img src="img/client-1.jpg" alt=""></div>
            <h4>김민재</h4>
            <span>악의 리더</span><br>
            <span>(마케팅 전문)</span>
          </div>
        </div>
        <div class="col-md-9">
          <div class="quote">
            <b><img src="img/quote_sign_left.png" alt=""></b> 악의 중심! 악의 리더! 악마 자체<small><img src="img/quote_sign_right.png" alt=""></small>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-9">
          <div class="quote">
            <b><img src="img/quote_sign_left.png" alt=""></b> 누구든 날 건들면 기선이 핵 주먹 맛을 볼 줄 알아라. 띠드버거 사주면 봐줌. <small><img src="img/quote_sign_right.png" alt=""></small>
          </div>
        </div>
        <div class="col-md-3">
          <div class="profile">
            <div class="pic"><img src="img/client-2.jpg" alt=""></div>
            <h4>권기선</h4>
            <span>키보드워리어</span><br>
            <span>(보조 프로그래머)</span>
          </div>
        </div>
      </div>
      
       <div class="row">
        <div class="col-md-3">
          <div class="profile">
            <div class="pic"><img src="img/team-1.jpg" alt=""></div>
            <h4>손보경</h4>
            <span>카트의 악마</span><br>
            <span>(메인 프로그래머)</span>
          </div>
        </div>
        <div class="col-md-9">
          <div class="quote">
            <b><img src="img/quote_sign_left.png" alt=""></b> 카트할땐 민재 그 이상의 사악함! <small><img src="img/quote_sign_right.png" alt=""></small>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-md-9">
          <div class="quote">
            <b><img src="img/quote_sign_left.png" alt=""></b> 누구든 날 건들면 계단에서 밀어주마! <small><img src="img/quote_sign_right.png" alt=""></small>
          </div>
        </div>
        <div class="col-md-3">
          <div class="profile">
            <div class="pic"><img src="img/team-2.jpg" alt=""></div>
            <h4>김경인</h4>
            <span>기이↓서언↑씨!</span><br>
            <span>(수석 디자이너)</span>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-md-3">
          <div class="profile">
            <div class="pic"><img src="img/team-3.jpg" alt=""></div>
            <h4>박찬호</h4>
            <span>순수함의 결정체</span><br>
              <span>(차석 디자이너)</span>
          </div>
        </div>
        <div class="col-md-9">
          <div class="quote">
            <b><img src="img/quote_sign_left.png" alt=""></b> 악의 무리들 사이에 고생하고 있다.<small><img src="img/quote_sign_right.png" alt=""></small>
          </div>
        </div>
      </div>
      
      

    </div>
  </section>



 

  

  <!-- Required JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="lib/superfish/hoverIntent.js"></script>
  <script src="lib/superfish/superfish.min.js"></script>
  <script src="lib/morphext/morphext.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/stickyjs/sticky.js"></script>
  <script src="lib/easing/easing.js"></script>

  <!-- Template Specisifc Custom Javascript File -->
  <script src="js/custom.js"></script>

  <script src="contactform/contactform.js"></script>
<footer><br><br>
(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com
</footer><br><br><br>

      

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