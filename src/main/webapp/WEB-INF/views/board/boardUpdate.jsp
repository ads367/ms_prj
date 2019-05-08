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
					<li class="nav-item active">
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

   <!-- About Section -->
	<section class="page-section"
		 style="background: -webkit-gradient(linear, left top, left bottom, from(rgba(92, 77, 66, 0.8)), to(rgba(92, 77, 66, 0.8))),
		 	 linear-gradient(to bottom, rgba(92, 77, 66, 0.8) 0%, rgba(92, 77, 66, 0.8) 100%),
		 	 url('/resources/img/bg-masthead.jpg');">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12 text-center">
					<h2 class="text-white mt-0">글 수정</h2>
					<hr class="divider light my-4">
					<div class="row" style="padding-top: 30px;">
						<form method="post" action="/board/boardUpdate_Action" style="width:1200px;" name="frm" onsubmit="return false;">
							<table class="table table-striped" id="boardlist" style="text-align: center; border: 1px solid #dddddd">
								<tr>
									<td colspan="1" style="padding-top: 21px;">
										<h5 class="text-white font-weight-bold">제목</h5>
										<input type="hidden" name="boardIDX" value="${ boardDTO.boardIDX }">
										<input type="hidden" name="memberID" value="${ boardDTO.memberID }">
									</td>
									<td colspan="3">
										<input type="text" id="update_boardTitle" name="boardTitle" placeholder="제목을 입력하세요."
											style="height: 50px; width: 99%;" value="${ boardDTO.boardTitle }">
									</td>
								</tr>
								<tr>
									<td colspan="1" style="padding-top: 21px;">
										<h5 class="text-white font-weight-bold">내용</h5>
									</td>
									<td colspan="3">
										<textarea class="from-control" id="update_boardContent" name="boardContent" placeholder="내용을 입력하세요."
											style="height: 350px; width: 99%;">${ boardDTO.boardContent }</textarea>
									</td>
								</tr>
							</table>
						<p style="text-align: right;">
							<a class="btn btn-primary pull-right" href="#" onclick="update_Check()">수정</a>
							<a class="btn btn-danger pull-right" href="#" onclick="update_Cancel()">취소</a>
						</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="bg-light py-5">
		<div class="container">
			<div class="small text-center text-muted">
				Copyright &copy; 2019 - Start Bootstrap
			</div>
		</div>
	</footer>
</body>
<script>
	function update_Check() {
		if($("#update_boardTitle").val() == "") {
			$("#update_boardTitle").focus();
			alert("제목을 입력하세요.");
			return false;
		} else if($("#update_boardContent").val() == "") {
			$("#update_boardContent").focus();
			alert("내용을 입력하세요");
			return false;
		} else {
			var update_check = confirm("글을 수정하시겠습니까?");
			if(update_check == true) {
				frm.submit();
			}
		}
	}
	function update_Cancel() {
		var update_cancel = confirm('수정을 취소하시겠습니까?');
		if(update_cancel == true) {
			location.href = "/board/boardRead?boardIDX=${ boardDTO.boardIDX }";
		}
	}
</script>
</html>