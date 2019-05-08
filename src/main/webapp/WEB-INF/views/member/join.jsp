<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MS_Project</title>

<!-- Font Awesome Icons -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!-- Plugin CSS -->
<link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
<!-- Theme CSS - Includes Bootstrap -->
<link href="/resources/css/creative.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Plugin JavaScript -->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Custom scripts for this template -->
  <script src="/resources/js/creative.min.js" async></script>
</head>

<body id="page-top">
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/">MS</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto my-2 my-lg-0">
					<li class="nav-item">
						<a class="nav-link" href="/intro">소개</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/board/boardList">자유게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">test1</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">test2</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<header class="masthead">
		<div class="container h-100">
			<div class="row h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-10 align-self-end">
					<h1 class="text-uppercase text-white font-weight-bold">회원가입</h1>
					<hr class="divider my-4">
				</div>
				<div class="col-lg-8 align-self-baseline">
					<form method="post" action="/member/joinAction" name="frm" onsubmit="return false;">
						<table style="width:100%;">
						<tr>
							<td>
								<h5 class="text-white">아이디 </h5>
							</td>
							<td colspan="2">
								<input type="text" id="join_MemberID" class="form-control" placeholder="ID" name="memberID" required autofocus><br/>
							</td>
							<td style="padding-bottom: 25px;">
								<button type="button" class="btn btn-info" onclick="memberID_Check()">Check</button><br/>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">비밀번호 </h5>
							</td>
							<td colspan="3">
								<input type="password" id="join_MemberPassword" class="form-control" placeholder="Password" name="memberPassword" required><br/>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">비밀번호 확인</h5>
							</td>
							<td colspan="3">
								<input type="password" id="join_MemberPassword_Check" class="form-control" placeholder="Password Check" required><br/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3">
								<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
								<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">이름 </h5>
							</td>
							<td colspan="3">
								<input type="text" id="join_MemberName" class="form-control" placeholder="Name" name="memberName"required><br/>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">주소 </h5>
							</td>
							<td colspan="3">
								<input type="text" id="join_MemberAddr" class="form-control" placeholder="Address" name="memberAddr" required><br/>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">이메일 </h5>
							</td>
							<td colspan="3">
								<input type="email" id="join_MemberEmail" class="form-control" placeholder="Eamil" name="memberEmail" required><br/>
							</td>
						</tr>
						</table>
						<button type="button" class="btn btn-primary" onclick="join_Check()">회원가입</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger" onclick="join_Cancel()">취소</button>
					</form>
				</div>
			</div>
		</div>
	</header>

	<footer class="bg-light py-5">
		<div class="container">
			<div class="small text-center text-muted">
				Copyright &copy; 2019 - Start Bootstrap
			</div>
		</div>
	</footer>
</body>
<script>
	
	$(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("#join_MemberPassword_Check").keyup(function(){
			var pw = $("#join_MemberPassword").val();
			var pwck = $("#join_MemberPassword_Check").val();
			if(pw != "" || pwck != "") {
				if(pw == pwck) {
					$("#alert-success").show();
					$("#alert-danger").hide();
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
				}
			}
		});
	});
	
	function memberID_Check() {
		
		var memberid = $("#join_MemberID").val();
		
		if($("#join_MemberID").val() == "") {
			$("#join_MemberID").focus();
			alert("아이디를 입력하세요.");
			return false;
		} else {
			$.ajax({
				type : "POST",
				url : "/member/checkID",
				data : "memberID="+$("#join_MemberID").val(),
				dataType : "json",
				success : function(result) {
					if(result == 0) {
						$("#join_MemberID").attr("disabled", true);
						alert("사용가능합니다.");
					} else if(result == 1) {
						$("#join_MemberID").focus();
						alert("이미 존재하는 아이디입니다. \n다른 아이디를 사용해주세요.");
						return false;
					} else {
						alert("에러가 발생했습니다.");
					}
				},
				error : function(error) {
					alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
				}
			});
		}
	}
	
	function join_Check() {
		
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		
		if(!$("#join_MemberID").attr("disabled")) {
			$("#join_MemberID").focus();
			alert("아이디 중복확인을 하세요.");
			return false;
		}
		if($("#join_MemberPassword").val() == "") {
			$("#join_MemberPassword").focus();
			alert("비밀번호를 입력하세요");
			return false;
		}
		if($("#join_MemberPassword_Check").val() == "") {
			$("#join_MemberPassword_Check").focus();
			alert("비밀번호 확인을 입력하세요.")
			return false;
		}
		if($("#join_MemberPassword").val() != $("#join_MemberPassword_Check").val()) {
			$("#join_MemberPassword").focus();
			alert("비밀번호를 다시 확인해주세요.")
			return false;
		}
		if($("#join_MemberID").val() == $("#join_MemberPassword").val()) {
			$("#join_MemberPassword").focus();
			alert("아이디와 비밀번호를 다르게 입력해주세요.");
			return false;
		}
		if($("#join_MemberName").val() == "") {
			$("#join_MemberName").focus();
			alert("이름을 입력해주세요.");
			return false;
		}
		if($("#join_MemberAddr").val() == "") {
			$("#join_MemberAddr").focus();
			alert("주소을 입력해주세요.");
			return false;
		}
		if($("#join_MemberEmail").val() == "") {
			$("#join_MemberEmail").focus();
			alert("이메일을 입력해주세요.");
			return false;
		} else if(!getMail.test($("#join_MemberEmail").val())) {
			$("#join_MemberEmail").focus();
			alert("이메일 형식에 맞게 입력해주세요.");
			return false;
		}
		
		var join_Action = confirm("회원가입을 하시겠습니까?");
		if(join_Action == true) {
			$("#join_MemberID").attr("disabled", false);
			frm.submit();
		}
	}
	function join_Cancel() {
		var join_cancel = confirm("회원가입을 취소하시겠습니까?");
		if(join_cancel == true) {
			location.href = "/member/login_Page";
		}
	}
</script>
</html>