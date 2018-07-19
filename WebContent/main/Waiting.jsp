<!--  대기하기 / 원활한 결제 페이지  부분 -->
<!--  페이지 완성하면 이 페이지는 필요없음 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>::대한민국 1등 쉐어링 플랫폼, 나눔의 민족::</title> 
<style>
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
  margin:0 auto;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
</head>
 <script language="javascript">
      function window_onload(){
         setTimeout('go_url()',3000)  // 3초후 go_url() 함수를 호출한다.
      }

      function go_url(){
         location.href="<%=path%>/main.nanum"  // 페이지 이동...
      }
  </script>

<body onload="javascript:window_onload()">
<div class="container" style="text-align: center">
<h2>서비스 준비중입니다.</h2>
<h2>불편을 드려 죄송합니다.</h2>
<h2>3초후 메인페이지로 이동합니다.</h2>
<div class="loader"></div>
</div>
</body>
</html>