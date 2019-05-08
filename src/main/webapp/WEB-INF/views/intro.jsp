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
<link href="/resources/css/creative.css" rel="stylesheet">
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
				<img src="/resources/img/cat123.jpg" alt="..." class="rounded-circle">
				<div class="container">
					<p class="text-white-75 font-weight-light mb-5">
						기본적인 CRUD 기능이 가능한 홈페이지 입니다. 페이징 처리와 검색, 댓글, 좋아요 기능을 추가해봤습니다.<br/>
						ajax로 아이디 중복체크와 댓글 기능 및 좋아요 기능을 구현하였습니다. 새로 회원가입을 통해 기능들을 확인해 보셔도 되고<br/>
						ID : admin, PW : 123123을 이용하셔도 됩니다.<br/>
						아래 아이콘를 클릭하시면 코드를 확인하실 수 있습니다.
					</p>
				</div>
				<div class="social-icons">
					<!-- <a href="http://naver.com">
						<i class="fab fa-linkedin-in"></i>
					</a> -->
					<a href="#">
						<i class="fab fa-github"></i>
					</a>
					<!-- <a href="#">
						<i class="fab fa-facebook-f"></i>
					</a> -->
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
</html>