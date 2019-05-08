<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<style>
	p {
		text-align: right;
	}
</style>
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
					<h2 class="text-white mt-0">글 내용</h2>
					<hr class="divider light my-4">
					<div class="row" style="padding-top: 30px;">
						<table class="table table-striped" id="boardlist" style="text-align: center; border: 1px solid #dddddd">
							<tr>
								<td colspan="2" style="height: 50px; width: 99%; background-color: #eeeeee; border: 1px solid #eeeeee;">
									<input type="hidden" name="boardIDX" id="boardIDX" value="${ boardDTO.boardIDX }">
									<input type="hidden" id="sessionMemberID" value="${ sessionMemberID }">
									${ boardDTO.boardTitle }
								</td>
							</tr>
							<tr>
							<c:if test="${!empty sessionMemberID }">
								<td style="height: 20px; font-size: small; background-color: #eeeeee; text-align: left;">
									 <br/>
									 <button type="button" id="likeBtn" onclick="lickCheck_Action()">
									 	<c:choose>
										    <c:when test="${alreadyCheckUser eq 'true'}">
										        좋아요 취소
										    </c:when>
										    <c:otherwise>
										        좋아요
										    </c:otherwise>
										</c:choose>
									 </button>
								</td>
							</c:if>
								<td style="height: 20px; font-size: small; background-color: #eeeeee; text-align: right;">
									♥ :	<input type="hidden" id="like_Count" name="like_Count" value="${ boardDTO.like_Count }">
										<a id="cnt" href="#">${ boardDTO.like_Count }</a><br/>
										작성자 : ${ boardDTO.memberID }&nbsp;&nbsp;
										작성일 : ${ boardDTO.regDate }
								</td>
							</tr>
							<% pageContext.setAttribute("newLineChar", "\n"); %>
							<tr>
								<td colspan="2" style="height: 350px; width: 99%; background-color: white; text-align:left;">
									${fn:replace(boardDTO.boardContent, newLineChar, "<br/>")}
								</td>
							</tr>
						</table>
					</div>
					<p>
						<a class="btn btn-success pull-right" href="#" onclick="listPage_View()">목록</a>
						<c:if test="${ sessionMemberID eq boardDTO.memberID }">
							<a class="btn btn-primary pull-right" href="#" onclick="updatePage_View()">수정</a>
							<a class="btn btn-danger pull-right" href="#" onclick="delete_Check()">삭제</a>
						</c:if>
					</p>
					<div class="container">
						<h5 class="text-white mt-0" style="text-align:left;">Comment</h5>
						<table style="width: 100%;" id="commentWrite">
							<tr>
								<td colspan="3">
									<textarea id="commentContent_Write" placeholder="댓글내용을 입력하세요." name="commentContent"
		                        			style="width: 90%;border-radius: 0.25em;height: 38px;vertical-align: middle;"></textarea>
									<span class="input-group-btn">
										<button class="btn btn-info" type="button" onclick="commentWriteAction()">작성</button><br/>
									</span>
								</td>
							</tr>
						</table>
					</div>
					<div class="container">
						<table style="width: 100%;" id="commentListView">
							<c:forEach items="${ clist }" var="commentDTO">
								<tr>
									<td colspan= "3" style="height: 20px; font-size: small; background-color: #eeeeee; text-align: left;">
										<input type="hidden" name="commentIDX" id="commentIDX" value="${ commentDTO.commentIDX }">
										작성자: ${ commentDTO.memberID }&nbsp;&nbsp;
										작성일 : ${ commentDTO.regDate }
									</td>
								</tr>
								<tr>
									<td colspan="2" style="background-color: white; text-align: left;">
										${ commentDTO.commentContent }
									</td>
									<td style="background-color: white; text-align: right;">
										<c:if test="${ commentDTO.memberID eq sessionMemberID }">
											<a href="/comment/commentDelete?commentIDX=${ commentDTO.commentIDX }&boardIDX=${ commentDTO.boardIDX }&type=single">삭제</a>
										</c:if>
									</td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</c:forEach>
						</table>
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
	function listPage_View() {
		location.href = "/board/boardList";
	}
	function updatePage_View() {
		location.href = "/board/update_Page?boardIDX=${boardDTO.boardIDX}&memberID=${boardDTO.memberID}";
	}
	function delete_Check() {
		var delete_check = confirm("글을 삭제하시겠습니까?");
		if(delete_check == true) {
			location.href = "/board/boardDelete_Action?boardIDX=${boardDTO.boardIDX}&memberID=${boardDTO.memberID}&type=multi";
		}
	}
	function lickCheck_Action() {
		$.ajax({
			type : "POST",
			url : "/like/like_Check",
			data : "memberID="+$("#sessionMemberID").val()
				+"&boardIDX="+$("#boardIDX").val()
				+"&like_Count="+$("#like_Count").val(),
			dataType : "json",
			success : function(result) {
				$("#cnt").text(result);
				if($("#likeBtn").text() === "좋아요"){
					$("#likeBtn").text("좋아요 취소");
				}else{
					$("#likeBtn").text("좋아요");
				}
			},
			error : function(error) {
				alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
			}
		});
	}
	function commentWriteAction() {
		if($("#sessionMemberID").val() == "" || $("#sessionMemberID").val() == null) {
			alert('로그인 후 사용가능합니다');
			/* location.href = "/member/login_Page"; */
			return false;
		} else {
			$.ajax({
				type : "POST",
				url : "/comment/commentWriteAction",
				data : "boardIDX="+$("#boardIDX").val()
					+"&memberID="+$("#sessionMemberID").val()
					+"&commentContent="+$("#commentContent_Write").val(),
				dataType : "json",
				success : function(result) {
					commentList();
					$("#commentContent_Write").val('');
				},
				error : function(error) {
					alert("댓글 작성 오류 발생!");
					alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
				}
			});
		}
	}
	function commentList() {
		$.ajax({
			type : "GET",
			url : "/comment/commentList",
			data : "boardIDX="+$("#boardIDX").val(),
			dataType : "json",
			success : function(result) {
				var innerHTML = '';
				for(var i = 0; i < result.length; i++) {
					innerHTML += '<tr><td colspan= "3" style="height: 20px; font-size: small; background-color: #eeeeee; text-align: left;">';
					innerHTML += '<input type="hidden" name="commentIDX" value="'+result[i].commentIDX+'">';
					innerHTML += '<input type="hidden" name="memberID" id="memberID" value="'+result[i].memberID+'">';
					innerHTML += '작성자: '+result[i].memberID+'&nbsp;&nbsp;작성일 : '+result[i].regDate+'</td></tr>';
					innerHTML += '<tr><td colspan="2" style="background-color: white; text-align: left;">'+result[i].commentContent+'</td>';
					innerHTML += '<td style="background-color: white; text-align: right;">';
					if(result[i].memberID == $("#sessionMemberID").val()) {
						innerHTML += '<a href="/comment/commentDelete?commentIDX='+result[i].commentIDX+'&boardIDX=${ commentDTO.boardIDX }&type=single">삭제</a>';
					}
					innerHTML += '</td></tr>';
					innerHTML += '<tr><td></td></tr>';
				}
				$("#commentListView").html(innerHTML);
			},
			error : function(error) {
				alert("댓글 리스트 불러오기 실패!");
				alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
			}
		});
	}
</script>
</html>