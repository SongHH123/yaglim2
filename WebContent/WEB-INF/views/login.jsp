<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script>
	var para = document.location.href.split("?");
	if(para[1]==='error') alert("아이디나 비밀번호를 확인해 주세요.");
	else if (para[1]==='logout') alert('성공적으로 로그아웃 되었습니다.');
</script>
<%
	request.setCharacterEncoding("UTF-8");
%>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/CSS/login.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/CSS/bar.css">
</head>
<body style="margin: 0px;">
	<nav id="menubar">
		<ul style="margin: 0px;">
	        <li><c:if test="${pageContext.request.userPrincipal.name == null}">
	        	<a href="${pageContext.request.contextPath}/signup" class="nav-link">회원가입</a>
	        </c:if></li>
	        <li><a href="${pageContext.request.contextPath}/" class="nav-link">홈</a></li>
	        <li><a href="${pageContext.request.contextPath}/postform" class="nav-link">게시글 작성</a></li>
	        <li><c:if test="${pageContext.request.userPrincipal.name == null}">
	        	<a href="${pageContext.request.contextPath}/login" class="nav-link">로그인</a>
	        </c:if></li>
	        <li><c:if test="${pageContext.request.userPrincipal.name != null}">
	  			<a href="javascript:document.getElementById('logout').submit()">로그아웃</a>
			</c:if></li>
			<form id="logout" action="<c:url value="/logout" />"method="post">
				<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
			</form>  
		</ul>
	</nav>
	<form name="fm" method="post">
		<div class="container">
			<table>
				<tr>
					<td><label for="uname"><b>아 이 디</b></label></td>
					<td><input type="text" name="username" id="name" required></input>
					</td>
					<td rowspan="3"><input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />
						<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button></td>
				</tr>
				<tr>
					<td><label for="psw"><b>비밀번호</b></label></td>
					<td><input type="password" name="password" id="password" required>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>