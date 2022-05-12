<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
%>
<head>
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/bar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/view_details.css">

</head>
<body style="margin: 0px;">
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
	<table id="PF">
		<c:forEach var="post" items="${post}">
			<tr>
				<td><c:out value="${post.post_id}" />번 게시물</td>
				<td><c:if test="${post['board_title'] eq 1}">
  						<c:out value="상비약 나눔"></c:out></c:if>
  						<c:if test="${post['board_title'] eq 2}">
  						<c:out value="질문"></c:out></c:if>
  						<c:if test="${post['board_title'] eq 3}">
  						<c:out value="정보나눔"></c:out></c:if>
  						<c:if test="${post['board_title'] eq 4}">
  						<c:out value="기타"></c:out></c:if></td>
				<td><c:out value="${post.user_id}" /></td>
			</tr>

			<tr>
				<td colspan="2"><c:out value="${post.post_title}" /></td>
				<td><c:out value="${post.post_regdate}"/>...</td>
			</tr>

			<tr>
				<td style="height:300px" colspan="3"><c:out value="${post.post_content}" />adfasdfasdfasdf</td>
			</tr>

			<c:set var="user" value="${pageContext.request.userPrincipal.name}" />
			<c:if test="${post.user_id eq user}">
				<tr>
					<td colspan="3"><button type="button"
							onClick="location.href='editPost?post_id=${post.post_id}'">수정하기</button>
						<button type="button"
							onClick="location.href='editPost?post_id=${post.post_id}'">삭제하기</button></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>

</html>