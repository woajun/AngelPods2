<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int ri= Integer.parseInt(request.getAttribute("ri").toString()); 
	
	if(ri == 1) {
%>
	<script language = "javascript">
		alert("게시글이 삭제되었습니다.");
  		document.location.href="../find/list_view.jsp";
	</script>
	
<% } else if(ri == -1){ %>

   	<script language = "javascript">
   		alert("게시글 삭제를 실패했습니다.");
   		document.location.href="../find/list_view.jsp";
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