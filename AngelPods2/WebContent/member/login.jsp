<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem") != null) { %>
	<jsp:forward page = "main.jsp"></jsp:forward>
<% } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>엔젤팟 : 로그인</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="../member/member.css/login.css" rel="stylesheet">

</head>
<body class = "login">
    
    <!-- nav -->
  <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top px-3" >
    <a class="navbar-brand" href="../index.jsp">Angel Pods</a>
    <div>
      <button class="navbar-toggler collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
      
        <span class="navbar-toggler-icon"></span>

      </button>
      <button type="button btn-list-map" class=" navbar-toggler sidebarToggle" >
        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="30" fill="currentColor" class="bi bi-map-fill" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.598-.49L10.5.99 5.598.01a.5.5 0 0 0-.196 0l-5 1A.5.5 0 0 0 0 1.5v14a.5.5 0 0 0 .598.49l4.902-.98 4.902.98a.502.502 0 0 0 .196 0l5-1A.5.5 0 0 0 16 14.5V.5zM5 14.09V1.11l.5-.1.5.1v12.98l-.402-.08a.498.498 0 0 0-.196 0L5 14.09zm5 .8V1.91l.402.08a.5.5 0 0 0 .196 0L11 1.91v12.98l-.5.1-.5-.1z"></path>
        </svg>
        지도보기
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
            <a class="nav-link text-white" href="../find/write_addr_view.jsp">습득신고</a>
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
    
    <div style="padding-top: 60px;"></div>


    <div class="form-signin" >
      <form action = "login.do?url=${param.url}" method = "post">
        <!-- 로고 -->
        <!-- <img class="mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
        <h1 class = "text-center">Angel Pods</h1>
        <br>
    
        <div class="form-floating">
          <input type="text" class="form-control" id="floaingInput" name="userId" placeholder="name">
          <label for="floatingInput">아이디</label>
        </div>
        <div class="form-floating">
          <input type="password" class="form-control" id="floatingPassword" name="pw" placeholder="Password">
          <label for="floatingPassword">비밀번호</label>
        </div>
        <div class="checkbox mb-3">
          <label>
            <!-- TODO 쿠키로 구현할 것 -->
            <input type="checkbox" value="remember-me"> 아이디 저장
          </label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
        <br><br>
        아이디 찾기 | 비밀번호 찾기 | <a href = "join.jsp" >회원가입</a>
        <p class="mt-5 mb-3 text-muted">&copy; 2021–2023</p>
      </form>
    </div>
    
<script>
      //============================
      const ValidMem = document.getElementById('validMem').value;
      const navLogin = document.getElementById('nav-login');
      const navLogout = document.getElementById('nav-logout');

      if (ValidMem == "yes") {
        navLogout.removeAttribute("hidden");
      } else {
        navLogin.removeAttribute("hidden");  
      }
</script>
</body>
</html>