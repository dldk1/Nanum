<%@page import="com.nanum.dao.UserDAO"%>
<%@page import="com.nanum.vo.FoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
   String path = request.getContextPath();
   String name = (String) session.getAttribute("name");
   String id = (String) session.getAttribute("id");   
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=path %>/assets/css/main.css" />
<link rel="shortcut icon" href="<%=path %>/favicon1.ico">
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>| Nanum | Event Page</title>
<style>
<!--  마우스 스크롤 시 페이지 맨 위로 올리는 효과 -->

#userId {
   font-size: 12px;
   padding-left: 30px;   
   text-decoration: none;
   margin-right: -100px;
}



body {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 15px;
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

body, html {
    height: 100%;
    margin: 0;
}

</style>
</head>
<body>
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
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
              <p><font color="dimgray">이벤트</font></p>
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

<div class="container">
  
  <h2 style="margin-left: 50px">현재 진행중인 이벤트 | 프랜차이즈</h2><br>
  <p style="margin-left: 50px">이미지를 누르면 해당 사이트로 이동합니다.</p><br><br>
  
  <div class="row">
    <div class="col-sm-6" align="center">
   <a href="https://web.dominos.co.kr/hotdeal/specialSet">
   <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/img_gate_20180721.jpg" width="400px"></a><br><br>
   <p>도미노 피자</p>
   </div>
    <div class="col-sm-6" align="center">
   <a href="http://www.kyochon.com/event/ing_view.asp?event_seq=213">
   <img src="http://www.kyochon.com/uploadFiles/TB_EVENT/list_%EC%9D%B4%EC%97%B4%EC%B9%98%EB%A7%A52.jpg" width="400px"></a><br><br>
   <p>교촌치킨</p>
    </div>
  </div>
  <hr align="center" style="border: solid 2px LightGray; width: 100%;">
  
  <br>
  <div class="row">
    <div class="col-sm-6" align="center">
   <a href="http://www.lotteria.com/Event/Event_View.asp?Idx=925&Mode=VIEWHEADOFFICE">
   <img src="http://www.lotteria.com/Data/event/925/ListImage.jpg" width="400px"></a><br><br>
   <p>롯데리아</p>
    </div>
    <div class="col-sm-6" align="center">
   <a href="http://www.kfckorea.com/promotion/promotionView/A801?event_index=69">
   <img src="http://www.kfckorea.com/nas/event/2018/07/23/X6iTKS7gUjyu.jpg" width="400px"></a><br><br>
   <p>KFC</p>
    </div>
  </div>
  <hr align="center" style="border: solid 2px LightGray; width: 100%;">
  
  <br>
    <div class="row">
    <div class="col-sm-6" align="center">
   <a href="http://www.burgerking.co.kr/#">
   <img src="http://www.burgerking.co.kr/Content/Event/531/529x165_1.png" width="400px"></a><br><br>
   <p>버거킹</p>
   </div>
    <div class="col-sm-6" align="center">
   <a href="http://www.mcdonalds.co.kr/www/kor/event/event_view.do?event_seq=184&utm_medium=Corp_Site&utm_source=Mainbanner_Button01&utm_campaign=30thSDX_180709&utm_content=Corp_Contents">
   <img src="http://www.mcdonalds.co.kr/uploadFolder/banner/banner_thum_k201807230949463030.png" width="400px"></a><br><br>
   <p>맥도날드</p>
    </div>
  </div>
  <hr align="center" style="border: solid 2px LightGray; width: 100%;"><br><br>
  
  <br>
  <div class="row">
    <div class="col-sm-6" align="center">
   <a href="http://www.popeyes.co.kr/event/">
   <img src="http://www.popeyes.co.kr/images/banner/promo180716_1.png" width="400px"></a><br><br>
   <p>파파이스</p>
   </div>
    <div class="col-sm-6" align="center">
   <a href="http://subway.co.kr/eventView?eventIdx=142">
   <img src="http://subway.co.kr/upload/event/%EC%9D%B4%EB%B2%A4%ED%8A%B8%EB%B0%B0%EB%84%88_01_%EC%95%84%EB%B3%B4%EC%B9%B4%EB%8F%84_770x400_20180504031751809.jpg" width="400px"></a><br><br>
   <p>써브웨이</p>
    </div>
  </div>
  <hr align="center" style="border: solid 2px LightGray; width: 100%;"><br><br><br>
  
  <h2 style="margin-left: 50px">현재 진행중인 이벤트 | 결제 서비스</h2><br>
  <p style="margin-left: 50px">이미지를 누르면 해당 사이트로 이동합니다.</p><br><br>
  <div class="row">
  <div class="col-sm-6" align="center">
  <a href="http://event2.pay.naver.com/event/benefit/list">
  <img src="https://phinf.pstatic.net/checkout/20161111_121/KR17927_1478849445329R0i0U_JPEG/840x242.jpg" width="400px"></a><br><br>
  <p>네이버페이</p>
  </div>
  <div class="col-sm-6" align="center">
  <a href="http://event.payco.com/event/payco/point/1807.nhn">
  <img src="https://image.toast.com/aaaaej/paycoNoti/1807_ss_pc_770_320.jpg" width="400px"></a><br><br>
  <p>페이코</p>
  </div>
  </div>
  <hr align="center" style="border: solid 2px LightGray; width: 100%;"><br><br>
  
  <br>
  <div class="row">
  <div class="col-sm-6" align="center">
  <a href="https://www.yogiyo.co.kr/mobile/#/event/1/">
  <img src="https://d1iauiklx4z2w4.cloudfront.net/wp-content/uploads/2018/06/YGY_SRW07_01.gif" width="400px"></a><br><br>
  <p>요기요</p>
  </div>
  <div class="col-sm-6" align="center">
  <a href="">
  <img src="" width="400px"></a>
  </div>
  </div>
    <hr align="center" style="border: solid 2px LightGray; width: 100%;"><br><br>
  
</div>
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