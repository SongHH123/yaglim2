<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	alert('잘못된 접근입니다.');
	window.location = "${pageContext.request.contextPath}/"
</script>
<%
	request.setCharacterEncoding("UTF-8");
%>
<head>
<title>Error</title>
</head>
<body style="margin: 0px;">
</body>
</html>
