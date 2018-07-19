<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/board_write.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function check_input(){
		// 입력한 내용을 가져온다.
		var subject = $("#subject").val();
		var content = $("#content").val();
		// 사용자가 첨부한 파일 객체를 가져온다.
		var file = $("#board_image")[0].files[0];
		// 게시판 인덱스 번호
		var info_idx = ${param.info_idx};
		
		if(subject.length == 0){
			alert("제목을 입력해주세요");
			$("#subject").focus();
			return false;
		}
		
		if(content.length == 0){
			alert("내용을 입력해주세요");
			$("#content").focus();
			return false;
		}
		
		// 서버로 보낼 데이터를 가지고 있는 객체
		var formData = new FormData();
		formData.append("board_image", file);
		formData.append("board_subject", subject);
		formData.append("board_content", content);
		formData.append("board_info_idx", info_idx);
		
		// 데이터를 저장하는 페이지
		<c:url var="path1" value="/board_write_pro.pj3"/>
		<c:url var="path2" value="/board_detail.pj3"/>
		
		$.ajax({
			// 접속할 페이지의 주소		
			url : "${path1}",
			processData : false,
			contentType : false,
			data : formData,
			type : "post",
			dataType : "json",
			success :  function(a){
				if(a.status.trim() == "OK"){
					alert("저장되었습니다");
					location.href = "${path2}?info_idx=${param.info_idx}&page=1&board_idx=" + a.board_idx;
				}
			}
		});
		
		
		return false;
	}
	
	function preview_image(){
		// input type="file"에서 사용자가 선택한
		// 파일 객체를 얻어온다.
		var file = $("#board_image")[0].files[0];
		// 파일에서 데이터를 읽어올 수 있는 객체를
		// 생성
		var reader = new FileReader();
		// 파일에서 데이터를 읽어오는 것이 완료되었을 때
		// 호출될 함수를 설정한다.
		reader.onloadend = function(){
			$("#preview").attr("src", reader.result);
		}
		// 파일에서 데이터를 읽어온다.
		reader.readAsDataURL(file);
	}
</script>
</head>
<body>
<%-- 상단 메뉴 --%>
<c:import url="/include/top_menu.jsp"/>

<div class="container" style="margin-top:100px">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
	<form class="form-horizontal" onsubmit="return check_input()" method="post">
		<div class="form-group">
			<label class="control-label col-sm-3" for="writer_name">
				작성자
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="writer_name" name="writer_name" value="${sessionScope.login_bean.user_name }" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="subject">
				제목
			</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="subject" name="subject"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="content">
				내용
			</label>
			<div class="col-sm-6">
				<textarea class="form-control" id="content" name="content" rows="10"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3" for="board_image">
				이미지 업로드
			</label>
			<div class="col-sm-6">
				<input type="file" class="form-control" name="board_image" id="board_image" accept="image/*" onchange="preview_image()"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<img id="preview" width="100%"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<button type="submit" class="btn btn-primary">
					저장하기
				</button>
				
				<c:url var="path" value="/board_list.pj3">
					<c:param name="info_idx" value="${param.info_idx }"/>
				</c:url>
				<a href="${path }" class="btn btn-primary">
					목록보기
				</a>
			</div>
		</div>
	</form>
</div>
<div class="col-sm-1"></div>
</div>
</div>
</body>
</html>





















