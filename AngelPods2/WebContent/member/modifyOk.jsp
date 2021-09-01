<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int ri = Integer.parseInt(request.getAttribute("ri").toString());
	
	if(ri == 1) {
%>
	<script language = "javascript">
		alert("정보수정 되었습니다.")
		document.location.href = "main.jsp";
	</script>
	
<%	} else { %>

	<script language = "javascript">
		alert("정보수정 실패입니다.");
		history.go(-1);
	</script>
	
<%  } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>