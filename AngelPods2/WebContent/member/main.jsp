<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem") == null){ %>
	<jsp:forward page = "../member/login.jsp"/>
<% } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>${name}님 안녕하세요.</h1>
	<form action = "logout.do" method = "post">
		<input type = "submit" value = "로그아웃">
		<input type = "button" value = "정보수정" onclick = "javascript:window.location='modify_view.do'">
		<input type = "button" value = "회원탈퇴" onclick = "javascript:window.location='member_withdraw.do?userId=${userId}'" >
		<a href = "membersAll.do">모든 회원 정보보기</a>
		<a href = "../board/list_view.jsp">습득 게시글 보기</a>
	</form>
	
</body>
</html>