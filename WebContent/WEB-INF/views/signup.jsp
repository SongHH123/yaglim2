<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/CSS/bar.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/CSS/signup.css">
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

	<sf:form method="post" accept-charset="UTF-8"
		action="${pageContext.request.contextPath}/suc_signup" id="PF"
		modelAttribute="user">
		<table>
			<tr><td>아이디</td><td>:</td><td><input type="text" name="user_id"></td></tr>			
			<tr><td>핸드폰 번호 </td><td>:</td><td><input type="text" name="user_phone"></td></tr>
			<tr><td>비밀번호</td><td>:</td><td><input type="password" name="user_pw"></td></tr>		
		</table>

		<button id="click" class="btn btn-lg btn-primary btn-block" type="submit">회원 가입</button>

	</sf:form>

</body>
</html>