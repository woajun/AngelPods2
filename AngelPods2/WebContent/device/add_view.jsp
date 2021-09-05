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
	<form action = "d_add.do" method = "post" enctype = "multipart/form-data">
		<select name ="cdNum" required>
			<option selected disabled value="">기종선택</option>
			<c:forEach items = "${snList}" var="dto">
				<option value="${dto.cdNum}">${dto.name}</option>
			</c:forEach>
		</select>
		<p>
		<label for="sn">일련번호 : </label>
		<input type="text" name="sn" id="sn">
		</p>
		<p><input type="file" name="image1"></p>
		<p><input type="file" name="image2"></p>
		<p><input type="file" name="image3"></p>
		<p><input type="file" name="image4"></p>
		<p><input type="file" name="image5"></p>
		
		<input type="submit" value="등록">
	</form>
</body>
</html>