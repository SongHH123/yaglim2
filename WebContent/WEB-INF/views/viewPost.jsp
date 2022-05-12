<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="sf" uri ="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<%-- ,post_title,user_id, Board_title
Post(post_id=1, post_content=첫내용, post_regdate=null, IsDeleted=0, post_title=첫게시글, user_id=a, board_title=1 --%>

게시글 조회<br/>

<c:forEach var="post" items="${post}">

	게시글 번호 <c:out value="${post.post_id}"> </c:out><br/>
	게시판 분류 <c:out value="${post.board_title}"> </c:out><br/>

	작성시각 <c:out value="${post.post_regdate}"> </c:out><br/>
	작성자 <c:out value="${post.user_id}"> </c:out><br/>
	제목 <c:out value="${post.post_title}"> </c:out><br/>
	내용 <c:out value="${post.post_content}"> </c:out><br/>
	
	
	현재 로그인: <c:out value="${pageContext.request.userPrincipal.name}"/><br/>


 <c:set var="user" value="${pageContext.request.userPrincipal.name}"/>
<c:if test="${post.user_id eq user}">

<button type="button" onClick="location.href='editPost?post_id=${post.post_id}'">수정하기</button>
<button type="button" onClick="location.href='suc_del?post_id=${post.post_id}'">삭제하기</button>

</c:if>

	
</c:forEach>
	<br/><br/>






</body>

</html>