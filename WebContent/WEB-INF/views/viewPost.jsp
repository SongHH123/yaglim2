<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
			 <li><a href="${pageContext.request.contextPath}/manage?user_id=${pageContext.request.userPrincipal.name}" class="nav-link">상비약 관리</a></li>
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
	<img src="${pageContext.request.contextPath}/resources/img/banner.jpg" alt="banner"/>
	<table >
		<c:forEach var="post" items="${post}">
			<tr>
				<td colspan="3" style="text-align:left;">
				<h2 style="margin-bottom: 40px;"><c:if test="${post['board_title'] eq 1}">
						<c:out value="상비약 나눔 게시판"></c:out>
					</c:if> <c:if test="${post['board_title'] eq 2}">
						<c:out value="질문 게시판"></c:out>
					</c:if> <c:if test="${post['board_title'] eq 3}">
						<c:out value="정보나눔 게시판"></c:out>
					</c:if> <c:if test="${post['board_title'] eq 4}">
						<c:out value="기타 게시판"></c:out>
					</c:if></h2> 
					<h4 style="margin-bottom: 15px; margin-left:20px"><c:out value="${post.post_id}" />번 게시물</h4> </td>
			</tr>
			<tr style="border-bottom: 1px solid #444444; background-color: #f3f3f3">
				<td style="width:60%">제목</td>
				<td style="width:20%">글쓴이</td>
				<td style="width:20%">작성 시각</td>
			</tr>
			<tr style="border-bottom: 1px solid #bfbfbf;">
				<td><c:out value="${post.post_title}" /></td>
				<td><c:out value="${post.user_id}" /></td>
				<td><c:out value="${fn:substring(post.post_regdate, 0, 16)}"></c:out></td>
			</tr>

			<tr style="border-bottom: 1px solid #bfbfbf;">
				<td style="height: 300px" colspan="3"><c:out
						value="${post.post_content}" /></td>
			</tr>

			<c:set var="user" value="${pageContext.request.userPrincipal.name}" />
			<c:if test="${post.user_id eq user}">
				<tr style="border-bottom: 1px solid #444444; background-color: #f3f3f3">
					<td colspan="3" style="text-align: right;">
						<button type="button" class="btn btn-success btn-sm me-md-2"
							onClick="location.href='editPost?post_id=${post.post_id}'">수정하기</button>
						<button type="button" class="btn btn-danger btn-sm"
							onClick="location.href='suc_del?post_id=${post.post_id}'">삭제하기</button>
					</td>
				</tr>
			</c:if>
		</c:forEach>
		</table>
		<table style="border-bottom: 1px solid #bfbfbf; margin-top:0px">
		<c:forEach var="post" items="${post}">
		<tr>
			<td colspan="3">
				<sf:form style="margin:10px;" method="post" modelAttribute="new_comment"
				action="${pageContext.request.contextPath}/suc_comment">
				<p style="display:none;"><input type="text" name="user_id" value="${pageContext.request.userPrincipal.name}"></p>
				<p style="display:none;"><input type="text" name="post_id" value="${post.post_id}"></p>
				<input style="width:75%" type="text" name="comment_content" value="" required>
					<button id="new" class="btn btn-success btn-sm" type="submit" style="margin-left:5px;">
					댓글 달기</button>
				</sf:form>
			</td>
		</tr>
		</c:forEach>
		<c:forEach var="comment" items="${comment}">
				 <tr style="border-top: 1px solid #bfbfbf;">
  					<td><c:out value="${comment['user_id']}"></c:out></td>
  					<td style="text-align:right;"><c:out value="${fn:substring(comment['comment_regdate'], 0, 16)}"></c:out></td>
					<c:if test="${comment.user_id eq user}">
  					<td style="text-align:left;"><button id="del_comment" class="btn btn-lg btn-danger btn-sm"
  					onClick="location.href='del_comment?comment_id=${comment.comment_id}'">삭제</button></td>
  					</c:if>
  				</tr>
  				<tr style="border-top: 1px solid #bfbfbf;">
  					<td colspan="3"><c:out value="${comment['comment_content']}"></c:out></td>
  				</tr>
  		</c:forEach>  			
		</table>
</body>

</html>