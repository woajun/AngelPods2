<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>등록일</th>
				<th></th>
			</tr>
			
		  <c:forEach items = "${contentsList}" var="dto">
			 <tr>
			 	<td>${dto.num}</td>
			 	<td>${dto.brdName}</td>
			 	<td>${dto.cdNum}</td>
			 	<td>${dto.title}</td>
			 	<td>${dto.rdate}</td>
			 	<td><a href="#">수정</a><a href="#">삭제</a></td>
			 </tr> 		
		  </c:forEach>
		</table>	  
	  	
	</div>
</body>
</html>