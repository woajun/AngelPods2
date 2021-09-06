<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% if(request.getAttribute("Valid-mypage") == null){ %>
	<jsp:forward page = "my_main_view.do"/>
<% } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- booststrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    
</head>
<body>
	<a href="d_add_view.do" type="button" class="btn btn-primary" >기기 등록하기</a>
	나의 기기
	<div>
	  <c:forEach items = "${devList}" var="dto">
		<p><h3>기종</h3> <span>${dto.devNum}</span> </p>
		<p><h3>일련번호</h3> ${dto.sn} </p>
		<p><h3>등록일</h3> ${dto.timestamp} </p>
	  </c:forEach>
	</div>
	<a href="my_contents_view.do" type="button" class="btn btn-primary" >내가쓴 글 보기</a>
</body>
</html>