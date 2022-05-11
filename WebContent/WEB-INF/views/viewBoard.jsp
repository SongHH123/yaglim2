<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<% request.setCharacterEncoding("UTF-8"); %>
<head>
<title>게시판</title>
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/CSS/bar.css">
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

<%--  --%>
게시판 확인


	<c:out value="${post}"> </c:out>





</body>

</html>