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
<title>상비약 관리</title>
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



<table>
	<thead>
		<th>종류</th>
		<th>약 이름</th>
		<th>개봉</th>
		<th>유효기간</th>
	</thead>
	<tbody>
	<c:forEach var="medi1" items="${medi1}">
	<c:if test="${pageContext.request.userPrincipal.name eq medi1['user_id'] }">
	
	<tr>
		<td><c:out value="${medi1['medi_type']}"></c:out></td>
		<td><c:out value="${medi1['medi_name']}"></c:out></td>
		<td><c:out value="${medi1['medi_open']}"></c:out></td>
		<td><c:out value="${medi1['medi_until']}"></c:out></td>

	</tr>
	</c:if>
	</c:forEach>
	
	<tr>
		<sf:form method="post" accept-charset="UTF-8" action="${pageContext.request.contextPath}/suc_medi"
		modelAttribute="post">
	<td><select>
 		 <option value="감기약">감기약</option>
 		 <option value="소화제">소화제</option>
 		 <option value="위장약">위장약</option>
 		 <option value="설사약">설사약</option>
 		 <option value="알레르기">알레르기</option>
 		 <option value="소독약">소독약</option>
 		 <option value="해열진통제">해열진통제</option>
 		 <option value="소염진통제">소염진통제</option>
 		 <option value="상처연고">상처연고</option>
 		 <option value="밴드">밴드</option>
 		 <option value="붕대">붕대</option>
 		 <option value="파스">파스</option>
 		 <option value="기타">기타(개인약품)</option>
		</select></td>
	<td><input type="text" name="medi_name"/></td>
	<td><input type="date" name="medi_open"/></td>
	<td><input type="date" name="medi_until"/>
	<input type="hidden" name="user_id" value="&uml;${pageContext.request.userPrincipal.name}&uml;"/>
	<input type="submit" value="추가"  /></td>
		</sf:form>
	</tr>
	
	
	</tbody>
</table>

<p>
‘의료기관 내 개봉 의약품 관리지침’에 따르면 경구용 약의 경우 
병에 많이 든 알약은 1년, 다량이 든 시럽 병은 6개월, 소분한 시럽 병은 1개월, 가루약은 제조한 날부터 6개월, 연고제는 개봉 후 6개월까지 사용 가능합니다.</p>
<p>약국에서 구입한 약: 낱개 포장의 경우 박스의 유효기간까지 복용 가능하지만
			  낱개 포장이 되지 않은 물약의 경우는 개봉 후 한 달간 복용가능합니다.
</p>

	
	

		


<!-- <input type="checkbox" checked disabled/>체크박스 -->
<div class="checkbox">

<c:forEach var="medilist" items="${medilist}">

    <input type="checkbox" 
    	<c:forEach var="medi1" items="${medi1}">
    		<c:if test="${ medilist['medi_name'] eq medi1['medi_type']
    			&& pageContext.request.userPrincipal.name eq medi1['user_id'] }">checked</c:if></c:forEach> onClick="return false;" >
    		
    <c:out value="${medilist['medi_name']}"></c:out><br/>
    
</c:forEach>


</div>







</body>
</html>