<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<h1 class="text-uppercase text-white font-weight-bold">로그인</h1>
					<hr class="divider my-4">
				</div>
				<div class="col-lg-8 align-self-baseline">
					<form method="post" action="/member/loginAction" name="frm" onsubmit="return false;">
						<table style="width:100%;">
							<tr>
								<td>
									<h5 class="text-white">아이디 </h5>
								</td>
								<td colspan="3">
									<input type="text" id="login_MemberID" class="form-control" placeholder="ID" name="memberID" required autofocus><br/>
								</td>
							</tr>
							<tr>
								<td>
									<h5 class="text-white">비밀번호 </h5>
								</td>
								<td colspan="3">
									<input type="password" id="login_MemberPassword" class="form-control" placeholder="Password" name="memberPassword" required><br/>
								</td>
							</tr>
						</table>
						<input class="btn btn-lg btn-primary btn-block" type="submit" onclick="login_Check()" value="로그인"><br/>
						<a href="#" onclick="joinPage_View()">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#" onclick="passwordSearch_View()">비밀번호 찾기</a>
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
	function login_Check() {
		if($("#login_MemberID").val() == "") {
			$("#login_MemberID").focus();
			alert("아이디를 입력하세요.");
			return false;
		} else if($("#login_MemberPassword").val() == "") {
			$("#login_MemberPassword").focus();
			alert("비밀번호를 입력하세요");
			return false;
		} else {
			frm.submit();
		}
	}
	function joinPage_View() {
		location.href = "/member/join_Page";
	}
	function passwordSearch_View() {
		location.href = "/member/passwordSearch_View";
	}
</script>
</html>