<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="sf" uri ="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<title>게시글 작성</title>
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

	<sf:form method="post" accept-charset="UTF-8"
		action="${pageContext.request.contextPath}/suc_post" id="PF"
		modelAttribute="post">
		<p style="display:none;"><input type="text" name="user_id" value="${pageContext.request.userPrincipal.name}"></p>

		<div>
			<label>게시판 종류</label> <select name="board_title">
				<option value="1">상비약 나눔 게시판</option>
				<option value="2">질문 게시판</option>
				<option value="3">정보 나눔 게시판</option>
				<option value="4">기타(잡담)</option>
			</select>
		</div>

		<div>
			제목 <input type="text" name="post_title" style="width:101.5%" placeholder="제목을 작성해주세요." required/> <br/>
		</div>
		<div>
			내용 <textarea name="post_content" rows="10" cols="50" placeholder="내용을 작성하세요" required></textarea><br/>
		</div>
		<input type="submit" style="margin-left:360px;" class="btn btn-success" value="전송"  />

	</sf:form>



</body>
</html>