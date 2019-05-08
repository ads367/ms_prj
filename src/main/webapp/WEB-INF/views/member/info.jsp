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
					<h1 class="text-uppercase text-white font-weight-bold">회원정보<input type="hidden" name="memberIDX" value="${ memberDTO.memberIDX }"></h1>
					<hr class="divider my-4">
				</div>
				<div class="col-lg-8 align-self-baseline">
					<table style="width:100%;">
					<tr style="border-bottom: 1px solid #dddddd;">
						<td>
							<h3 class="text-white font-weight-bold">아이디 </h3>
						</td>
						<td>
							<h5 class="text-white font-weight-bold">${ memberDTO.memberID }</h5>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #dddddd;">
						<td>
							<h3 class="text-white font-weight-bold">이름</h3>
						</td>
						<td>
							<h5 class="text-white font-weight-bold">${ memberDTO.memberName }</h5>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #dddddd;">
						<td>
							<h3 class="text-white font-weight-bold">주소</h3>
						</td>
						<td>
							<h5 class="text-white font-weight-bold">${ memberDTO.memberAddr }</h5>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #dddddd;">
						<td>
							<h3 class="text-white font-weight-bold">이메일</h3>
						</td>
						<td>
							<h5 class="text-white font-weight-bold">${ memberDTO.memberEmail }</h5>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #dddddd;">
						<td>
							<h3 class="text-white font-weight-bold">가입날짜</h3>
						</td>
						<td>
							<h5 class="text-white font-weight-bold">${ memberDTO.regDate }</h5>
						</td>
					</tr>
					</table>
					<br/>
					<a href="#" onclick="memberInfo_UpdateView()">회원정보 수정</a>
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
	function memberInfo_UpdateView() {
		location.href = "/member/memberInfo_updateView?memberID=${memberDTO.memberID}";
	}
</script>
</html>