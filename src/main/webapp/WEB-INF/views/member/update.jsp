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
					<h1 class="text-uppercase text-white font-weight-bold">회원정보 수정</h1>
					<hr class="divider my-4">
				</div>
				<div class="col-lg-8 align-self-baseline">
					<form method="post" action="/member/updateAction" name="frm" onsubmit="return false;">
						<table style="width:100%;">
						<tr>
							<td>
								<h5 class="text-white">아이디 </h5>
							</td>
							<td colspan="2">
								<input type="hidden" name="memberIDX" value="${ memberDTO.memberIDX }">
								<input type="hidden" name="memberID" id="update_MemberID" value="${ memberDTO.memberID }">
								<h5 class="text-white font-weight-bold">${ memberDTO.memberID }</h5><br/>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">비밀번호 </h5>
							</td>
							<td colspan="2">
								<input type="password" id="update_MemberPassword" class="form-control" placeholder="비밀번호" name="memberPassword" value="${ memberDTO.memberPassword }" required><br/>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">비밀번호 확인 </h5>
							</td>
							<td colspan="2">
								<input type="password" id="update_MemberPassword_Check" class="form-control" placeholder="비밀번호 확인" value="${ memberDTO.memberPassword }" required><br/>
							</td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td colspan="2">
								<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
								<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">이름 </h5>
							</td>
							<td colspan="2">
								<input type="text" id="update_MemberName" class="form-control" placeholder="사용자 이름" name="memberName" value="${ memberDTO.memberName }"required><br/>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">주소 </h5>
							</td>
							<td colspan="2">
								<input type="text" id="update_MemberAddr" class="form-control" placeholder="주소" name="memberAddr" value="${ memberDTO.memberAddr }" required><br/>
							</td>
						</tr>
						<tr>
							<td>
								<h5 class="text-white">이메일 </h5>
							</td>
							<td colspan="2">
								<input type="email" id="update_MemberEmail" class="form-control" placeholder="이메일" name="memberEmail" value="${ memberDTO.memberEmail }" required><br/>
							</td>
						</tr>
						</table>
						<button type="button" class="btn btn-primary" onclick="update_Check()">회원정보 수정</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger" onclick="update_Cancel()">취소</button>
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
		$("#update_MemberPassword_Check").keyup(function(){
			var pw = $("#update_MemberPassword").val();
			var pwck = $("#update_MemberPassword_Check").val();
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
	
	function update_Check() {
		if($("#update_MemberPassword").val() == "") {
			$("#update_MemberPassword").focus();
			alert("비밀번호를 입력하세요");
			return false;
		}
		if($("#update_MemberPassword_Check").val() == "") {
			$("#update_MemberPassword_Check").focus();
			alert("비밀번호 확인을 입력하세요.")
			return false;
		}
		if($("#update_MemberPassword").val() != $("#update_MemberPassword_Check").val()) {
			$("#update_MemberPassword").focus();
			alert("비밀번호를 다시 확인해주세요.")
			return false;
		}
		if($("#update_MemberID").val() == $("#update_MemberPassword").val()) {
			$("#update_MemberPassword").focus();
			alert("아이디와 비밀번호를 다르게 입력해주세요.");
			return false;
		}
		if($("#update_MemberName").val() == "") {
			$("#update_MemberName").focus();
			alert("이름을 입력해주세요.");
			return false;
		}
		if($("#update_MemberAddr").val() == "") {
			$("#update_MemberAddr").focus();
			alert("주소을 입력해주세요.");
			return false;
		}
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		if($("#update_MemberEmail").val() == "") {
			$("#update_MemberEmail").focus();
			alert("이메일을 입력해주세요.");
			return false;
		} else if(!getMail.test($("#update_MemberEmail").val())) {
			$("#update_MemberEmail").focus();
			alert("이메일 형식에 맞게 입력해주세요.");
			return false;
		}
		var update_Action = confirm("회원정보를 수정 하시겠습니까?");
		if(update_Action == true) {
			frm.submit();
		}
	}
	function update_Cancel() {
		var update_cancel = confirm("회원정보 수정을 취소하시겠습니까?");
		if(update_cancel == true) {
			location.href="/member/Info_Page?memberID=${memberDTO.memberID}";
		}
	}
</script>
</html>