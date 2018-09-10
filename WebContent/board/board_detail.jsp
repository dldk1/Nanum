<%@page import="com.nanum.dao.UserDAO"%>
<%@page import="com.nanum.vo.FoodVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
%>
<%-- 삭제 여부 처리 --%>
<c:choose>
<c:when test="${requestScope.board_bean.board_status == 2 }">
<script>
	alert('삭제된 글입니다');
	<c:url var="path" value="/board_list.nanum">
		<c:param name="info_idx" value="${param.info_idx}"/>
		<c:param name="page" value="${param.page}"/>
	</c:url>
	location.href = "${path}";
</script>
</c:when>
<c:otherwise>

<!DOCTYPE html>
<html>
<head>
<title>::대한민국 1등 쉐어링 플랫폼, 나눔의 민족::</title> 		
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="shortcut icon" href="<%=path %>/favicon1.ico">
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
<link rel="stylesheet" href="<%=path %>/css/nanum.css" />
<link rel="stylesheet" href="<%=path %>/css/rating.css" />
<style>
div .stars {
  background: url("<%=path%>/images/stars.png") repeat-x 0 0;
  width: 150px;
  margin: 0 auto;
}

div .stars span {
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

footer{
position: relative;
font-size: 12px;
text-decoration: none;
  text-align: center;
  text-indent: 6px;  
color: gray;
}

#map {
    position:absolute;
    top:0;
    bottom:0;
    width:450px; /* Assign a value */
    height:250px; /* Assign a value */
    margin:auto;
}

</style>
<script>
	function add_reply(){
		// 사용자가 입력한 댓글 내용
		var reply_content = $("#reply_content").val();

		if(reply_content.length == 0){
			alert("댓글 내용을 입력해주세요");
			$("#reply_content").focus();
			return false;
		}
		// 서버로 전달할 파라미터 데이터
		var param = {
			reply_board_idx : ${param.board_idx},
			reply_content : reply_content
		};
		// 접속할 주소
		<c:url var="path1" value="/add_reply.nanum"/>
		<c:url var="path2" value="/board_detail.nanum">
			<c:param name="page" value="${param.page}"/>
			<c:param name="board_idx" value="${param.board_idx}"/>
		</c:url>
		
		$.ajax({
			url : "${path1}",
			type : "post",
			dataType : "text",
			data : param,
			success : function(a){
				if(a.trim() == "OK"){
					alert("저장되었습니다");
					location.href = "${path2}";
				}
			}
		});
		
		
		return false;
	}
	
	function remove_reply(reply_idx){
		// 파라미터
		var param = {
			reply_idx : reply_idx
		};
		// 요청할 주소
		<c:url var="path1" value="/remove_reply.nanum"/>
		<c:url var="path2" value="/board_detail.nanum">
			<c:param name="page" value="${param.page}"/>
			<c:param name="board_idx" value="${param.board_idx}"/>
		</c:url>
		
		$.ajax({
			url : "${path1}",
			type : "post",
			dataType : "text",
			data : param,
			success : function(a){
				if(a.trim() == "OK"){
					alert("삭제되었습니다");
					location.href = "${path2}";
				}
			}
		});
		
	}
		function add_rating(board_writer_idx){
			var content = $("#evaluate").val();
			var rating = $('input[name=star]:checked').val();
			if (rating == undefined) {
				alert("별점을 클릭 해주세요.\n좋은평 부탁 드립니다.");
				return false;
//	 			rating = 0;
			}
			console.log(content);
			console.log(rating);
			console.log(board_writer_idx);
			
			// 파라미터
			var param = {
				rating : rating,
				content : content,
				board_writer_idx : board_writer_idx
			};
			// 요청할 주소
			<c:url var="path1" value="/add_rating.nanum"/>
			<c:url var="path2" value="/board_detail.nanum">
				<c:param name="page" value="${param.page}"/>
				<c:param name="board_idx" value="${param.board_idx}"/>
			</c:url>
			
			$.ajax({
				url : "${path1}",
				type : "post",
				dataType : "text",
				data : param,
				success : function(a){
					if(a.trim() == "OK"){
						alert("평가가 완료되었습니다.\n좋은 하루 되세요~");
						location.href = "${path2}";
					}
				}
			});
			
		}
</script>
<!----------------------- gps 정보 ------------------------------>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=XbIqz2MRd7GMcxbhPsgU"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function sendGps(lat, lng) { 
	var path = '/' + location.pathname.split('/')[1];
   	var postUrl = path + "/GpsToAddress";
//    	alert(postUrl);
    $.post(postUrl,
    	    { lat: lat,	lng: lng },
    	    function(data, status){
       	    	var loc = data.split(" ");
    	    	console.log("data" + loc);
    	    	$("#board_loc").val(loc[2] + " " + loc[3]);
//     	    	alert(data);
    	    });
}
</script>
<!----------------------- gps 정보 ------------------------------>
</head>
<body>
	<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							
							<p>나눔의 민족! 여기와서 나누자!!</p>
						</div>
					</div>
				</header>

			<!-- Nav 시작 -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="<%=path %>/main.nanum">Home</a></li>
						<li><a href="#">소개</a>
							<ul><li><a href="<%=path %>/introduce/introduce10.jsp"">개발진들</a></li></ul>
						</li>
						<li><a href="<%=path%>/notice.nanum"">공지사항</a></li>
						<li><a href="#">배달나눔</a>
							<ul>
								<li><a href="<%=path %>/board_list.nanum">현재 인기있는 나눔 물품</a></li>
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
						<b id = userId> <%out.print(name);%>님 안녕하세요!</b>
					<% } else { FoodVO fVO = UserDAO.randomFood(); %>	
						<li><a href="<%=path%>/myPage.nanum">마이페이지</a></li>
						<li><a href="logout.nanum">Logout</a></li>					
						<b id = userId> <a href="<%=path%>/myPage.nanum"><%out.print(name);%></a> 님! &nbsp 오늘은 <%=fVO.getStore() %>의 <%=fVO.getMenu()%> 어떠세요? </b>	
					<% } %>								
					</ul>
				</nav>
			<!--  Nav 끝	-->

<div class="container" style="margin-top:100px">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">

	<form class="form-horizontal">
		<div class="form-group">
			<label class="control-label col-sm-3" for="writer_name">
				작성자
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="writer_name" name="writer_name" value="${requestScope.board_bean.board_writer_name }" readonly="readonly"/>
			</div>
		</div>
			<div class="form-group">
			<label class="control-label col-sm-3" for="area_code">
				지역
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="area_code" name="area_code" value="${requestScope.board_bean.board_area_code }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="subject">
				제목
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="subject" name="subject" value="${requestScope.board_bean.board_subject }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label  class="control-label col-sm-3" for="board_date">
				작성날짜
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="board_date" value="${requestScope.board_bean.board_date }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="board_ip">
				작성자 IP
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="board_ip" value="${requestScope.board_bean.board_ip }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="content">
				내용
			</label>
			<div class="col-sm-6">
				<textarea class="form-control" id="content" name="content" readonly="readonly" rows="10">${requestScope.board_bean.board_content }</textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="board_loc">
				작성자 위치
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="board_loc"  readonly="readonly"/>
			</div>
		</div>
		
		<c:if test="${not empty requestScope.board_bean.board_image }">
		<div class="form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<c:url var="path" value="/upload"/>
				<img src="${path }/${requestScope.board_bean.board_image}" style="width:100%"/>
			</div>
		</div>
		</c:if>
		
		<div class="form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<c:if test="${requestScope.board_bean.board_writer_idx == sessionScope.login_bean.u_idx }">
				
				<c:url var="path" value="/modify_board.nanum">
					<c:param name="page" value="${param.page }"/>
					<c:param name="board_idx" value="${param.board_idx }"/>
				</c:url>				
				<a href="${path }" class="btn btn-success">
					수정하기
				</a>
				
				<c:url var="path" value="/delete_board.nanum">
				
					<c:param name="page" value="${param.page }"/>
					<c:param name="board_idx" value="${param.board_idx }"/>
				</c:url>
				<a href="${path }" class="btn btn-danger">
					삭제하기
				</a>
				</c:if>
				
				<c:url var="path" value="/board_list.nanum">
					
					<c:param name="page" value="${param.page }"/>
					
				</c:url>
				<a href="${path }" class="btn btn-primary">목록보기</a>
				<button type="button" class="btn btn-danger"  data-toggle="modal" data-target="#myModal">평가하기</button>
			</div>
		</div>
	</form>
	<br><br>
		<!--  GPS 정보       -->
		<div id="map"></div>
		<br><br><br>
	<!--  GPS 정보       -->
	<form class="form-horizontal" onsubmit="return add_reply()">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="form-group">
				<textarea class="form-control" id="reply_content" rows="5" style="resize:none;"></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">
					댓글 저장
				</button>
			</div>
			
			<c:forEach var="item" items="${requestScope.reply_list }">
			
			<div class="form-group">
				<div class="alert alert-success">
  					<strong>${item.reply_writer_name }</strong> ${item.reply_content }
  					
				</div>
				
				<c:if test="${sessionScope.login_bean.u_idx == item.reply_writer_idx }">
				<div>
					<button type="button" class="btn btn-danger" onclick="remove_reply(${item.reply_idx})">
						<span class="glyphicon glyphicon-arrow-up"></span> 댓글 삭제
					</button>
				</div>
				</c:if>
			</div>
			
			</c:forEach>
			
		</div>
	</form>
</div>
<div class="col-sm-1"></div>
</div>

 <!-- Modal 시작 -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <img src="<%=path %>/images/thankyou.jpg" class="img-rounded" style="width:100%">
          <h2 class="modal-title font-weight-bold">주문 평가하기</h2>
          <p>평가는 안전하고, 믿을 수 있으며, 즐거운 서비스를 만드는 데 도움이 됩니다.</p>
        </div>
        <div class="modal-body">
           <div class="form-group">
			<div class="stars">
				<input type="radio" name="star" class="star-1" id="star-1" value=1>
				<label class="star-1" for="star-1">1</label> 
				<input type="radio"	name="star" class="star-2" id="star-2" value=2> 
				<label class="star-2" for="star-2">2</label> 
				<input type="radio" name="star" class="star-3" id="star-3" value=3> 
				<label class="star-3" for="star-3">3</label> 
				<input type="radio" name="star" class="star-4" id="star-4" value=4> 
				<label class="star-4" for="star-4">4</label> 
				<input type="radio" name="star" class="star-5" id="star-5" value=5> 
				<label class="star-5" for="star-5">5</label> 
				<span></span>
			</div>
		  </div>
		  	<div class="form-group">
				<label for="inputlg">한줄 평을 남겨 주세요</label> 
				<input class="form-control input-lg" id="evaluate" type="text">
			</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" onclick="add_rating(${requestScope.board_bean.board_writer_idx})" data-dismiss="modal">저장</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
<!--   모달 끝 -->  
</div>

<!--  GPS 정보       -->
 <script>
        var map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.5666805, 126.9784147),
            zoom: 5,
            mapTypeId: naver.maps.MapTypeId.NORMAL
        });

        var infowindow = new naver.maps.InfoWindow();

        function onSuccessGeolocation(position) {
            var location = new naver.maps.LatLng(position.coords.latitude,
                                                 position.coords.longitude);

            map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
            map.setZoom(10); // 지도의 줌 레벨을 변경합니다.


//         	var marker = new naver.maps.Marker({
//         	    position: new naver.maps.LatLng(location.lat(), location.lng()),
//         	    map: map
//         	});
//             infowindow.setContent('<div style="padding:20px;">' +
//                 '위도: '+ location.lat() +'<br />' +
//                 '경도: '+ location.lng() +'</div>');
            sendGps(location.lat(), location.lng());
//             infowindow.open(map, location);
        }
        



        function onErrorGeolocation() {
            var center = map.getCenter();

            infowindow.setContent('<div style="padding:20px;">' +
                '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "위도: "+ center.lat() +"<br />경도: "+ center.lng() +'</div>');

            infowindow.open(map, center);
        }

        $(document).ready(function(){
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
            } else {
                var center = map.getCenter();

                infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5>'+ ": "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
                infowindow.open(map, center);
            }
        });
        </script>
<!--  GPS 정보       -->
</body>
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
</html>
</c:otherwise>
</c:choose>




















