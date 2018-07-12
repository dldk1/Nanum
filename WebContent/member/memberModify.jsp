<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");	
%>
<head>
<title>Left Sidebar - TXT by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
<link rel="stylesheet" href="<%=path %>/signUp/signUp.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

// 아이디 중복체크
$(document).ready(function(){ // document가 다 읽어졌을 때 이 스크립트로 들어와랏
    $('#id').keyup(function(){ // 눌렀다 뗐을 때 keyup 으로 들어와랏 (이벤트가 발생할 때마다 ajax 계속 발생)
           var a = $('#id').val();
           if(a.length > 0){
               $.post("/TeamProject/CheckId", {"id": a}, function(data){
                   if($.trim(data) == 0 && a.length > 3){
                       $('#idCheck').html('<font color="blue">수정 가능한 아이디입니다.</font>');    
                   }
                   else {
                       $('#idCheck').html('<font color="red">수정 불가능한 아이디입니다.</font>');    
                   }
               }, "json");
           }
           else {
               $('#idCheck').text('');
           }
}) // keyup
}); // ready 

// 비밀번호 중복체크
function checkPwd(){
	  var f1 = document.forms[0];
	  var pw1 = f1.newPw.value;
	  var pw2 = f1.newPwCheck.value;
	  if(pw1!=pw2){
	   document.getElementById('checkPwd').style.color = "red";
	   document.getElementById('checkPwd').innerHTML = "동일한 비밀번호를 입력하세요."; 
	  }else{
	   document.getElementById('checkPwd').style.color = "blue";
	   document.getElementById('checkPwd').innerHTML = "비밀번호가 확인 되었습니다."; 
	   
	  }
	  
	 }	 

</script>
<script type="text/javascript">
$(document).ready(function(){ // document가 다 읽어졌을 때 이 스크립트로 들어와랏
    $('#email').keyup(function(){ // 눌렀다 뗐을 때 keyup 으로 들어와랏 (이벤트가 발생할 때마다 ajax 계속 발생)
           var a = $('#email').val();
           if(a.length > 0){
               $.post("/TeamProject/CheckEmail", {"email": a}, function(data){
                   if($.trim(data) == 0){
                       $('#emailCheck').html('<font color="blue">수정가능한 이메일입니다.</font>');    
                   }
                   else {
                       $('#emailCheck').html('<font color="red">수정불가한 이메일입니다.</font>');    
                   }
               }, "json");
           }
           else {
               $('#emailCheck').text('이메일 중복확인');
           }
}) // keyup
}); // ready 
</script>

<script type="text/javascript">

function getUserInfo(id) {	

	var path = getContextPath();
	console.log(path);
	$.ajax({

		type : 'POST',
		url : path + "/getUserInfo.nanum",

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
				$("#hiddenPw").val(test[2]); 			
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
function updateUserInfo() {	
	 if(!check()){
		 return;
	 }
	var id = $("#id").val();
	var newPw = $("#newPw").val();
	var name = $("#name").val();
	var email = $("#email").val();
	var phone = $("#phone").val();

	//if(u_idx==undefined)
	//alert(u_idx + " 번호를 수정해야함" );
	//return;
	var path = getContextPath();
	console.log(path);
	$.ajax({

		type : 'POST',
		url : path + "/updateInfo.nanum",

		data : {			
			"id" : id,
			"newPw" : newPw,
			"name" : name,
			"email" : email,
			"phone" : phone
		},

		success : function(data) {
			console.log(data);
			if ($.trim(data) == "OK") {
				console.log('수정 완료');
				alert("수정이 완료되었습니다.");
				location.reload();
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

<script>

//전화번호 하이픈
 function autoHypenPhone(str) {

		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;

		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;

		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}


function callAutoHypen() {
	var cellPhone = document.getElementById('phone');
	cellPhone.onkeyup = function(event) {
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val);
	} 
}
	
</script>
<script type="text/javascript">

	// null값 방지
	function check() {
		
		 

	var ObjUserId = document.signUp.id;
		var ObjUserPassword = document.signUp.pw;

		if (ObjUserId.value.length < 4) {
			alert("아이디는 4자 이상 입력해야 합니다.");
			return false;
		}
		var pw = $('#pw').val();
		var hiddenPw = $('#hiddenPw').val();
		
		if (pw.trim() != hiddenPw.trim()) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}

		if (ObjUserPassword.value.length<8 || ObjUserPassword.value.length>16) {
			alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 8~16자까지, 영문은 대소문자를 구분합니다.");
			return false;
		}

		if (!ObjUserPassword.value
				.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
			alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 8~16자까지, 영문은 대소문자를 구분합니다.");
			return false;
		}

		//if(ObjUserID.value.indexOf(ObjUserPassword) > -1) {
		//  alert("비밀번호에 아이디를 사용할 수 없습니다.");
		//  return false;
		//}

		var SamePass_0 = 0; //동일문자 카운트
		var SamePass_1 = 0; //연속성(+) 카운드
		var SamePass_2 = 0; //연속성(-) 카운드

		for (var i = 0; i < ObjUserPassword.value.length; i++) {
			var chr_pass_0 = ObjUserPassword.value.charAt(i);
			var chr_pass_1 = ObjUserPassword.value.charAt(i + 1);

			//동일문자 카운트
			if (chr_pass_0 == chr_pass_1) {
				SamePass_0 = SamePass_0 + 1
			}

			var chr_pass_2 = ObjUserPassword.value.charAt(i + 2);

			//연속성(+) 카운드
			if (chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1
					&& chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
				SamePass_1 = SamePass_1 + 1
			}

			//연속성(-) 카운드
			if (chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1
					&& chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
				SamePass_2 = SamePass_2 + 1
			}
		}
		if (SamePass_0 > 1) {
			alert("비밀번호에 동일문자를 3번 이상 사용할 수 없습니다.");
			return false;
		}

		if (SamePass_1 > 1 || SamePass_2 > 1) {
			alert("비밀번호에 연속된 문자열(123 또는 321, abc, cba 등)을\n3자 이상 사용 할 수 없습니다.");
			return false;
		}

		if (!document.signUp.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.signUp.newPw.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.signUp.newPw.value != document.signUp.newPwCheck.value) {
			alert("비밀번호가 서로 다릅니다.");
			return false;
		}
		if (!document.signUp.email.value) {
			alert("이메일을 입력하세요.");
			return false;
		}

		if (!document.signUp.name.value) {
			alert("이름을 입력하세요.");
			return false;

		}
		if (!document.signUp.phone.value) {
			alert("전화번호를 입력하세요.");
			return false;
		} else {
			return true;
		}

	}
</script>
</head>
<body class="is-preload" onload="getUserInfo('<%=id%>')">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
		<div class="logo container">
			<div>
				<h1 style="text-transform: none;">
					<a href="<%=path%>/myPage.nanum">My Page</a>
				</h1>

			</div>
		</div>
		</header>

		<!-- Nav -->
		<nav id="nav">
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="#">Dropdown</a>
				<ul>
					<li><a href="#">Lorem ipsum dolor</a></li>
					<li><a href="#">Magna phasellus</a></li>
					<li><a href="#">Phasellus consequat</a>
						<ul>
							<li><a href="#">Lorem ipsum dolor</a></li>
							<li><a href="#">Phasellus consequat</a></li>
							<li><a href="#">Magna phasellus</a></li>
							<li><a href="#">Etiam dolore nisl</a></li>
						</ul></li>
					<li><a href="#">Veroeros feugiat</a></li>
				</ul></li>
			<li class="current"><a href="left-sidebar.html">Left Sidebar</a></li>
			<li><a href="right-sidebar.html">Right Sidebar</a></li>
			<li><a href="no-sidebar.html">No Sidebar</a></li>
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
									<a href="#">내가 쓴 게시글</a>
								</h5>
								</br>
								<h5>
									<a href="#">과거 나눔 이력</a>
								</h5>
								</br>
								<h5>
									<a href="#">나의 별점</a>
								</h5>
								</br>
								<h5>
									<a href="#">회원탈퇴</a>
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
						<p>나눔의 민족 개인정보수정 페이지 입니다.</p>						
						</header> <section> <div class="contentwrap">
  <article class="container">
    <div class="page-header">
    </div>
    <form class="form-horizontal" method="post" name = "signUp" id="signUp" ">
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">아이디</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="id" name="id" maxlength="12">
    아이디는 최소 4글자 이상 입력해야 합니다.
    <div id="idCheck"></div>
    </div>
    </div>
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">현재 비밀번호</label>
    <input type="hidden" id="hiddenPw">
    <div class="col-sm-6">
    <input type="password" class="form-control" id="pw" name="pw">    
    </div>
    </div>
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">새 비밀번호</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="newPw" name="newPw">
    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
    </div>
    </div>
       <div class="form-group">
    <label for="inputPasswordCheck" class="col-sm-2 control-label">새 비밀번호 확인</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="newPwCheck" name="newPwCheck" placeholder="비밀번호 확인" onkeyup="checkPwd()">
      <div id="checkPwd">비밀번호를 한번 더 입력해주세요.</div>
    </div>
    </div>
     <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="name"  name="name" >
    </div>
    </div>
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
    <div class="col-sm-6">
    <input type="email" class="form-control" id="email" name="email" >
    <div id="emailCheck"></div>
    </div>
    </div>
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="phone" name="phone" maxlength="13"">
      <p class="help-block">- 없이 적어주세요.</p>
    </div>    
    </div>
     <div>
    <label for="inputGender" class="col-sm-2 control-label">성별</label>
    <div class="col-sm-4">
    	<div>
    	<input id="radio1" type="radio" name="radio"  value="남자" checked="checked"><label for="radio1"><span><span></span></span>남자</label>
    	<input id="radio2" type="radio" name="radio" value="여자"><label for="radio2"><span><span></span></span>여자</label>
    	</div>
    </div>    
    </div>
    </form>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
      <button type="submit" class="btn btn-primary" form="signUp" onclick="updateUserInfo()" >수정</button>
    </div>
    </div>    
  </article>
</div>
						</section>
					</div>
					<div class="col-12">

						<!-- Contact -->
						<section>
						<h2 class="major">
							<span>Get in touch</span>
						</h2>
						<ul class="contact">
							<li><a class="icon fa-facebook" href="#"><span
									class="label">Facebook</span></a></li>
							<li><a class="icon fa-twitter" href="#"><span
									class="label">Twitter</span></a></li>
							<li><a class="icon fa-instagram" href="#"><span
									class="label">Instagram</span></a></li>
							<li><a class="icon fa-dribbble" href="#"><span
									class="label">Dribbble</span></a></li>
							<li><a class="icon fa-linkedin" href="#"><span
									class="label">LinkedIn</span></a></li>
						</ul>
						</section>

					</div>
				</div>

				<!-- Copyright -->
				<div id="copyright">
					<ul class="menu">
						<li>&copy; Untitled. All rights reserved</li>
						<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>

			</div>
			</footer>

		</div>

		<!-- Scripts --> <script src="<%=path%>/assets/js/jquery.min.js"></script>
		<script src="<%=path%>/assets/js/jquery.dropotron.min.js"></script> <script
			src="<%=path%>/assets/js/jquery.scrolly.min.js"></script> <script
			src="<%=path%>/assets/js/browser.min.js"></script> <script
			src="<%=path%>/assets/js/breakpoints.min.js"></script> <script
			src="<%=path%>/assets/js/util.js"></script> <script
			src="<%=path%>/assets/js/main.js"></script>
</body>
</html>