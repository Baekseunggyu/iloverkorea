<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/resources/css/admintable.css/" rel="stylesheet">
<script>
	$(function() {
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});

		$(window).resize(function(e) {
			if ($(window).width() <= 768) {
				$("#wrapper").removeClass("toggled");
			} else {
				$("#wrapper").addClass("toggled");
			}
		});
	});
</script>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-primary">
		<a href="#menu-toggle" id="menu-toggle" class="navbar-brand"> <span
			class="navbar-toggler-icon"></span></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample02" aria-controls="navbarsExample02"
			aria-expanded="false">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarsExample02">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="..">Home <span
						class="sr-only"></span></a></li>
			</ul>
			<form class="form-inline my-2 my-md-0"></form>
		</div>
	</nav>
	<div id="wrapper" class="toggled">

		<div id="sidebar-wrapper">

			<ul class="sidebar-nav">
				<li class="sidebar-brand" onclick="location.href='/admin'">관리자
					페이지</li>
				<li><a href="/admin/noticelist">공지사항</a></li>
				<li><a href="/admin/memberlist">회원목록</a></li>
				<li><a href="/admin/tourlist">관광지</a></li>
				<li><a href="/area/list">지역입력</a></li>
				<li><a href="/city/list">도시입력</a></li>
			</ul>
		</div>

		<div id="page-content-wrapper">
			<div class="container-flouid mt-5">
				<div class="row">
					<div class="col-md-8 mx-auto">
						<h1 style="text-align: center;">공지사항</h1>
						<form>
							<div class="row">
								<div class="col-2">
									<select name="search" class="form-control form-control-sm">
										<option value="0">전체 검색</option>
										<option value="1" ${pager.search == 1 ? 'selected' : ''}>제목</option>
									</select>
								</div>

								<div class="col-2">
									<input type="text" name="keyword"
										class="form-control form-control-sm" value="${pager.keyword}">
								</div>

								<div class="col-1" style="margin-left: auto;">
									<input type="submit" value="검색" class="btn-primary btn-sm mb-1">
								</div>
							</div>
						</form>

						<table class="table bg-white rounded border">
							<thead>
								<tr>
									<th scope="col">게시글번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${list.size() > 0}">
										<c:forEach var="item" items="${list}">
											<tr>
												<td scope="row">${item.noticeId}</td>
												<td><a href="noticeview/${item.noticeId}">${item.nSubject}</a></td>
												<td>${item.nWriter}</td>
												<td><fmt:formatDate value="${item.nDate}"
														pattern="yyyy-MM-dd" /></td>
												<td>${item.nviewCnt}</td>

											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7">등록 된 내용이 없습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="12">
										<div class="pagination pagination-sm"
											style="justify-content: center">
											<div class="page-item">
												<a href="?page=1&${pager.query}" class="page-link">처음</a>
											</div>
											<div class="page-item">
												<a href="?page=${pager.prev}&${pager.query}"
													class="page-link">이전</a>
											</div>

											<c:forEach var="page" items="${pager.list}">
												<div class="page-item ${pager.page == page?'active':''}">
													<a href="?page=${page}&${pager.query}" class="page-link">${page}</a>
												</div>
											</c:forEach>

											<div class="page-item">
												<a href="?page=${pager.next}&${pager.query}"
													class="page-link">다음</a>
											</div>
											<div class="page-item">
												<a href="?page=${pager.last}&${pager.query}"
													class="page-link">마지막</a>
											</div>
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
						<div style="float: right">
							<c:if test="${sessionScope.member.id == 'admin'}">
								<button type="button" class="btn btn-secondary"
									onclick=" location.href = '/admin/noticeadd';">글쓰기</button>
							</c:if>
							<a type="button" href="../" class="btn btn-primary">이전</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>














