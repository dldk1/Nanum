<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<%
	String path = request.getContextPath();
%>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<%=path %>/signUp/signUp.css" />
		<link rel="stylesheet" href="<%=path %>/assets/css/main.css" />
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
footer{
position: relative;
font-size: 12px;
text-decoration: none;
  text-align: center;
  text-indent: 6px;  
color: gray;
}
</style>

<script type="text/javascript">

// 아이디 중복체크
$(document).ready(function(){ // document가 다 읽어졌을 때 이 스크립트로 들어와랏
    $('#id').keyup(function(){ // 눌렀다 뗐을 때 keyup 으로 들어와랏 (이벤트가 발생할 때마다 ajax 계속 발생)
           var a = $('#id').val();
           if(a.length > 0){
               $.post("/TeamProject/CheckId", {"id": a}, function(data){
                   if($.trim(data) == 0 && a.length > 3){
                       $('#idCheck').html('<font color="blue">사용 가능한 아이디입니다.</font>');    
                   }
                   else {
                       $('#idCheck').html('<font color="red">사용 불가능한 아이디입니다.</font>');    
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
	  var pw1 = f1.pw.value;
	  var pw2 = f1.pwCheck.value;
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
                       $('#emailCheck').html('<font color="blue">사용가능한 이메일입니다.</font>');    
                   }
                   else {
                       $('#emailCheck').html('<font color="red">중복된 이메일입니다.</font>');    
                   }
               }, "json");
           }
           else {
               $('#emailCheck').text('이메일 중복확인');
           }
}) // keyup
}); // ready 
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
		  
		  if(ObjUserId.value.length<4) {
			    alert("아이디는 4자 이상 입력해야 합니다.");
			    return false;
			  }
		 
		  if(ObjUserPassword.value.length<8 || ObjUserPassword.value.length>16) {
		    alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 8~16자까지, 영문은 대소문자를 구분합니다.");
		    return false;
		  }
		 
		  if(!ObjUserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
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
		 
		  for(var i=0; i < ObjUserPassword.value.length; i++) {
		    var chr_pass_0 = ObjUserPassword.value.charAt(i);
		    var chr_pass_1 = ObjUserPassword.value.charAt(i+1);
		    
		    //동일문자 카운트
		    if(chr_pass_0 == chr_pass_1) {
		      SamePass_0 = SamePass_0 + 1
		    }
		    
		    var chr_pass_2 = ObjUserPassword.value.charAt(i+2);

		    //연속성(+) 카운드
		    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
		      SamePass_1 = SamePass_1 + 1
		    }
		    
		    //연속성(-) 카운드
		    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
		      SamePass_2 = SamePass_2 + 1
		    }
		  }
		  if(SamePass_0 > 1) {
		    alert("비밀번호에 동일문자를 3번 이상 사용할 수 없습니다.");
		    return false;
		  }
		 
		  if(SamePass_1 > 1 || SamePass_2 > 1 ) {
		    alert("비밀번호에 연속된 문자열(123 또는 321, abc, cba 등)을\n3자 이상 사용 할 수 없습니다.");
		    return false;
		  }
		
		if (!document.signUp.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.signUp.pw.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.signUp.pw.value != document.signUp.pwCheck.value) {
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
		}
		else {
			return true;
		}

	}
</script>

	</head>
	<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1><a id="logo">회원가입</a></h1>
							
						</div>
					</div>
				</header>

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li>
							<a href="#">Dropdown</a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li>
									<a href="#">Phasellus consequat</a>
									<ul>
										<li><a href="#">Lorem ipsum dolor</a></li>
										<li><a href="#">Phasellus consequat</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
									</ul>
								</li>
								<li><a href="#">Veroeros feugiat</a></li>
							</ul>
						</li>
						<li class="current"><a href="left-sidebar.html">Left Sidebar</a></li>
						<li><a href="right-sidebar.html">Right Sidebar</a></li>
						<li><a href="no-sidebar.html">No Sidebar</a></li>
					</ul>
				</nav>

			<!-- Main -->
			<br>
<div class="contentwrap">
  <article class="container">
    <div class="page-header">
    </div>
    <form class="form-horizontal" action="<%=path %>/signUpProc.nanum" method="post" name = "signUp" id="signUp" onsubmit="return check()">
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">아이디</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" maxlength="12">
    아이디는 최소 4글자 이상 입력해야 합니다.
    <div id="idCheck"></div>
    </div>
    </div>
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
    </div>
    </div>
       <div class="form-group">
    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
    <div class="col-sm-6">
    <input type="password" class="form-control" id="pwCheck" name="pwCheck" placeholder="비밀번호 확인" onkeyup="checkPwd()">
      <div id="checkPwd">비밀번호를 한번 더 입력해주세요.</div>
    </div>
    </div>
     <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="name"  name="name" placeholder="이름">
    </div>
    </div>
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
    <div class="col-sm-6">
    <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
    <div id="emailCheck"></div>
    </div>
    </div>
    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대폰번호" maxlength="13" onfocus="callAutoHypen()">
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
      <div class="form-group">
    <label for="inputAgree" class="col-sm-2 control-label">약관 동의</label>
    <div class="col-sm-6 checkbox">  
     <input id="checkbox1" type="checkbox" name="checkbox" value="1"><label for="checkbox1"><span></span>
        이용약관에 동의합니다.</label>
    </div>
    <a href="agreement.jsp"> 이용약관 보기</a>
    </div>
    </form>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
      <button type="submit" class="btn btn-primary" form="signUp">회원가입</button>
    </div>
    </div>    
  </article>
</div>

<!-- Footer -->
<footer><br><br>
<p>(주) 나눔의 민족<br>
대구가톨릭대학교 공과대학 534호<br>
대표전화 : 010-1234-1234<br>
대표메일 : email@email.com</p>
</footer>
		</div>
	</body>
	<!-- Scripts -->

	<script src="<%=path %>/assets/js/jquery.min.js"></script>
	<script src="<%=path %>/assets/js/jquery.dropotron.min.js"></script>
	<script src="<%=path %>/assets/js/jquery.scrolly.min.js"></script>
	<script src="<%=path %>/assets/js/browser.min.js"></script>
	<script src="<%=path %>/assets/js/breakpoints.min.js"></script>
	<script src="<%=path %>/assets/js/util.js"></script>
	<script src="<%=path %>/assets/js/main.js"></script>
</html>