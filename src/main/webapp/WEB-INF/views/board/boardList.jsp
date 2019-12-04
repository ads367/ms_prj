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
					<h1 class="text-uppercase text-white font-weight-bold">자유게시판</h1>
					<hr class="divider light my-4">
					<div class="row" style="padding-top: 30px;">
						<table class="table table-striped" id="boardlist" style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">번호</th>
									<th style="background-color: #eeeeee; text-align: center;">제목</th>
									<th style="background-color: #eeeeee; text-align: center;">작성자</th>
									<th style="background-color: #eeeeee; text-align: center;">작성일</th>
									<th style="background-color: #eeeeee; text-align: center;">조회수</th>
									<th style="background-color: #eeeeee; text-align: center;">♥</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ list }" var="boardDTO">
									<tr>
										<td style="background-color: #FFFFFF; text-align:center;">${ boardDTO.boardIDX }</td>
										<td style="background-color: #FFFFFF; text-align:center;">
											<a href="/board/boardRead?boardIDX=${ boardDTO.boardIDX }">${ boardDTO.boardTitle }</a>
										</td>
										<td style="background-color: #FFFFFF; text-align:center;">${ boardDTO.memberID }</td>
										<td style="background-color: #FFFFFF; text-align:center;">${ boardDTO.regDate }</td>
										<td style="background-color: #FFFFFF; text-align:center;">${ boardDTO.red_Count }</td>
										<td style="background-color: #FFFFFF; text-align:center; text-color:red;">${ boardDTO.like_Count }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class = "row-footer">
						<ul class="pagination justify-content-center">
							<c:if test="${ pageMaker.prev }">
							    <li>
							        <a href="/board/boardList${ pageMaker.makeQuery(pageMaker.startPage - 1) }"><i class="fa fa-chevron-left"></i></a>
							    </li>
						    </c:if>
						        <c:forEach begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" var="idx">
								    <li>
								        &nbsp;&nbsp;<a href="/board/boardList${ pageMaker.makeQuery(idx) }">${ idx }&nbsp;&nbsp;</a>
								    </li>
						    </c:forEach>
						    <c:if test="${ pageMaker.next && pageMaker.endPage > 0 }">
							    <li>
							        <a href="/board/boardList${ pageMaker.makeQuery(pageMaker.endPage + 1) }"><i class="fa fa-chevron-right"></i></a>
							    </li>
						    </c:if>
						</ul>
					</div>
					<div class="form-inline" style="display: inline-block;">
						<p style="text-align: center;">
							<select class="custom-select" name="searchOption" id="searchOptionSel">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="user">작성자</option>
							</select>
							<input class="form-control mr-sm-2" type="text" placeholder="검색어를 입력하세요" aria-label="Search" id="keyword" name="keyword" value="${ pageMaker.cri.keyword }" style="width: 300px;">
							<button onclick="searchAction()" class="btn btn-outline-success my-2 my-sm-0">검색</button>
						<p>
					</div>
						<p style="text-align: right;">
							<a class="btn btn-primary pull-right" href="#" onclick="writePage_View()">글쓰기</a>
						</p>
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
	function searchAction() {
		var OptionVal = $('#searchOptionSel').val();
		var keywordVal = $('#keyword').val();
		if(keywordVal == "") {
			alert("검색어를 입력하세요");
			$('#keyword').focus();
			return false;
		}
		var url = "/board/boardListPage?page=1"
				+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
				+ "&searchOption=" + OptionVal
				+ "&keyword=" + encodeURIComponent(keywordVal);
		window.location.href= url;
	}
	function writePage_View() {
		location.href = "/board/write_Page";
	}
</script>
</html>