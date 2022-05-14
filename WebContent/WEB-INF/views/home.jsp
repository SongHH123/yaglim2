<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<% request.setCharacterEncoding("UTF-8"); %>
<head>
<title>홈</title>
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/CSS/bar.css">
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/CSS/table.css">
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
  <img src="${pageContext.request.contextPath}/resources/img/banner.jpg" alt="banner"/>
  <div id="gap">
  		  <table class="table" style="text-align:center">
  			<thead class="table-light">
  				<tr>
  					<th>번호</th>
  					<th>게시판</th>
  					<th>제목</th>
  					<th>작성자</th>
  					<th>작성시간</th>
  				</tr>
			</thead>
	
			<tbody>
				<c:forEach var="post" items="${post}">
				  <tr>
  					<th><c:out value="${post['post_id']}"></c:out></th>
  					<td><c:if test="${post['board_title'] eq 1}">
  						<c:out value="상비약 나눔"></c:out></c:if>
  						<c:if test="${post['board_title'] eq 2}">
  						<c:out value="질문"></c:out></c:if>
  						<c:if test="${post['board_title'] eq 3}">
  						<c:out value="정보나눔"></c:out></c:if>
  						<c:if test="${post['board_title'] eq 4}">
  						<c:out value="기타"></c:out></c:if>
  					</td>
  					
  					<td><a href="viewPost?post_id=${post['post_id']}">
  					<c:out value="${post['post_title']}"></c:out></a></td>
  					
  					<td><c:out value="${post['user_id']}"></c:out></td>
  					<td><c:out value="${post['post_regdate']}"></c:out></td>
  					</tr>
  				</c:forEach>  			
  			</tbody>	
			</table>
  </div>
	
	<a href="${pageContext.request.contextPath}/viewBoard" class="nav-link">각자 게시판으로 이동</a>

</body>
</html>