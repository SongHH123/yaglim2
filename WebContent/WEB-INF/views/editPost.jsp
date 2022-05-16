<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="sf" uri ="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<title>게시글 수정</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/CSS/bar.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/CSS/post.css">
</head>

<body>

	<script type="text/javascript"></script>
	<nav id="menubar">
		<ul style="margin: 0px;">
			<li><c:if
					test="${pageContext.request.userPrincipal.name == null}">
					<a href="${pageContext.request.contextPath}/signup"
						class="nav-link">회원가입</a>
				</c:if></li>
			<li><a href="${pageContext.request.contextPath}/"
				class="nav-link">홈</a></li>
			<li><a href="${pageContext.request.contextPath}/postform"
				class="nav-link">게시글 작성</a></li>
			<li><c:if
					test="${pageContext.request.userPrincipal.name == null}">
					<a href="${pageContext.request.contextPath}/login" class="nav-link">로그인</a>
				</c:if></li>
			<li><c:if
					test="${pageContext.request.userPrincipal.name != null}">
					<a href="javascript:document.getElementById('logout').submit()">로그아웃</a>
				</c:if></li>
			<form id="logout" action="<c:url value="/logout" />" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</ul>
	</nav>

<c:forEach var="post1" items="${post1}">
	<c:set var="id" value="${post1.post_id}"></c:set>
	<c:set var="content" value="${post1.post_content}"></c:set>
	<c:set var="title" value="${post1.post_title}"></c:set>
	<c:set var="b_title" value="${post1.board_title}"></c:set>
</c:forEach>



	<sf:form method="post" accept-charset="UTF-8"
		action="${pageContext.request.contextPath}/suc_edit" id="PF"
		modelAttribute="post">
		<p style="display:none;">
		<input type="text" name="user_id" value="${pageContext.request.userPrincipal.name}"></p>
		게시글 번호 <input type="text" name="post_id" value="${id}" style="width:15%" readonly>
		<div>
			<label>게시판 종류</label> <select name="board_title">
				<option value="1"
					<c:if test="${b_title eq 1}"> selected </c:if>> 상비약 나눔 게시판</option>
				<option value="2" <c:if test="${b_title eq 2}"> selected </c:if> >질문 게시판</option>
				<option value="3" <c:if test="${b_title eq 3}"> selected </c:if> >정보 나눔 게시판</option>
				<option value="4" <c:if test="${b_title eq 4}"> selected </c:if> >기타(잡담)</option>
			</select>
		</div>

		<div>
			제목 <input type="text" name="post_title" style="width:101.5%" value="${title}"/><br/>
		</div>
		<div>
			내용 <textarea name="post_content" rows="10" cols="50">${content}</textarea><br/>
		</div>

		<input type="submit" value="수정 완료"  />

	</sf:form>



</body>
</html>