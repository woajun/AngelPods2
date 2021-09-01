<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width ="1000" cellpadding = "0" cellspacing = "0" border = "1">
		<tr>
			<td>userId</td>
			<td>name</td>
			<td>pw</td>
			<td>eMail</td>
			<td>rDate</td>
			<td>addr</td>
			<td>rankId</td>
			<td>lat</td>
			<td>lon</td>
			<td>profilImage</td>
		</tr>	

		<c:forEach items = "${mList}" var="dto">
		<tr>
			<td>${dto.userId}</td>
			<td>${dto.name}</td>
			<td>${dto.pw}</td>
			<td>${dto.eMail}</td>
			<td>${dto.rDate}</td>
			<td>${dto.addr}</td>
			<td>${dto.rankId}</td>
			<td>${dto.lat}</td>
			<td>${dto.lon}</td>
			<td>${dto.profilImage}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan = "10"><a href="main.jsp">돌아가기</a></td>
		</tr>
	</table>
	
</body>
</html>