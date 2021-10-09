<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤팟 : 일련번호 조회</title>

<!-- booststrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

</head>
<body>
<!-- nav -->
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top px-3" >
<a class="navbar-brand" href="../index.jsp">Angel Pods</a>
<div>
	<button class="navbar-toggler collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
	
	  <span class="navbar-toggler-icon"></span>
	
	</button>
</div>

	<div class="navbar-collapse collapse" id="navbarsExample03">
	  <ul class="navbar-nav me-auto mb-2 mb-sm-0">
	    <li class="nav-item">
	      <a class="nav-link text-white" href="../find/list_view.jsp">습득물보기</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-white" href="#">분실물보기</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-white" href="f_write_view.do">습득신고</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-white" href="#">분실신고</a>
	    </li>
	  </ul>
	  <div id ="nav-login" hidden="true">  
	    <a type="button" class="btn btn-light me-2 text-secondary fw-bold  " href = "../member/login.jsp?url=${pageContext.request.requestURL}">로그인</a>
	    <a type="button" class="btn btn-outline-light text-white " href = "../member/join.jsp">회원가입</a>
	  </div>
	  <div id ="nav-logout" hidden="true" class="text-white">
	    <a href="#" class="text-white">${name}</a> 님
	    <a type="button" class="btn btn-outline-light" href = "logout.do">로그아웃</a>
	  </div>
	  <input id="validMem" value="${ValidMem}" hidden="true">
</div>
</nav>
<div style="padding-top: 100px;"></div>

<div class ="container">
	<div class = "row">
		<div class = "form-control">
			<label>일련번호</label>
			<input type="text" class="form-control" required>
			<button class="btn btn-dark">조회</button>
		</div>
	</div>
</div>


</body>
</html>