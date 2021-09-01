<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int ri= Integer.parseInt(request.getAttribute("ri").toString()); 
	if(ri == 1) {
%>
	<script language = "javascript">
		alert("아이디가 이미 존재 합니다.");
		history.back();
	</script>
	
<% } else if(ri == 2){ %>

    	<script language = "javascript">
    		alert("회원가입에 성공했습니다.");
    		document.location.href="login.jsp";
    	</script>
    	
<% } else if(ri == 0){ %>

    	<script language = "javascript">
    		alert("회원가입에 실패했습니다.");
    		document.location.href="login.jsp";
    	</script>
    	
<% } %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>