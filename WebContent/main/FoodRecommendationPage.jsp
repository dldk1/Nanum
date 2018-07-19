<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String path = request.getContextPath(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

.btn {
  display: inline-block;
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  margin: 10px;
}


/* Green */
.success {
  border-color: #4CAF50;
  color: green;
}

.success:hover {
  background-color: #4CAF50;
  color: white;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="text-align:center">
		<div class="row my-4">
			<div class="col-lg-4">
				<h4>오늘 뭐 먹지?</h4>
				<h2>메뉴추천받기</h2>
				<br>
				<img src="<%=path %>/images/emoji.png" style="width: 15%;"><br><br><br>
				<a href='FoodRecommendationPage2.jsp' class="btn success">시작</a>
			</div>
		</div>
	</div>
</body>
</html>