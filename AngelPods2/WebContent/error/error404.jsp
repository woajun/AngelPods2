<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>엔젤팟 : error</title>
    <link rel=" shortcut icon" href="../images/logo3.jpg">
    <link rel="icon" href="../images/logo3.jpg">

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- <link href="index.css" rel="stylesheet"> -->
    <style>
    
header.masthead {
  padding-top: 10.5rem;
  padding-bottom: 6rem;
  text-align: center;
  color: #fff;
  background-image: url("image/airpodsMain.jpg");
  background-repeat: no-repeat;
  background-attachment: scroll;
  background-position: center center;
  background-size: cover;
}
header.masthead .masthead-subheading {
  font-size: 1.5rem;
  font-style: italic;
  line-height: 1.5rem;
  margin-bottom: 25px;
  font-family: "Roboto Slab", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}
header.masthead .masthead-heading {
  font-size: 3.25rem;
  font-weight: 700;
  line-height: 3.25rem;
  margin-bottom: 2rem;
  font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
}

@media (min-width: 768px) {
  header.masthead {
    padding-top: 17rem;
    padding-bottom: 12.5rem;
  }
  header.masthead .masthead-subheading {
    font-size: 2.25rem;
    font-style: italic;
    line-height: 2.25rem;
    margin-bottom: 2rem;
  }
  header.masthead .masthead-heading {
    font-size: 4.5rem;
    font-weight: 700;
    line-height: 4.5rem;
    margin-bottom: 4rem;
  }
}

/* ----------------bottom nav ------------------*/
#bnav {
  display: flex;
}
#bnav #bnav_nav {
  transition: transform 0.15s ease-in-out;
  transform: translateY(0px);
  background-color: rgb(255, 255, 255);
  width: 100%;
  height: 60px;
  opacity: 90%;
}

@media (min-width: 992px) {
  #bnav #bnav_nav{
  transform: translateY(+255px);
  }
}
/* ---index 하단 소유주 조회--------------------------------------------------------- */

.about-section {
  padding-top: 10rem;
  background: linear-gradient(to bottom, #000 0%, rgba(0, 0, 0, 0.9) 75%, rgba(0, 0, 0, 0.8) 100%);
}
.about-section p {
  margin-bottom: 5rem;
}

.projects-section {
  padding: 10rem 0;
}
.projects-section .featured-text {
  padding: 2rem;
}
@media (min-width: 992px) {
  .projects-section .featured-text {
    padding: 0 0 0 2rem;
    /* border-left: 0.5rem solid #64a19d; */
    border-left: 0.5rem solid #ffc800;
  }
}
.projects-section .project-text {
  padding: 3rem;
  font-size: 90%;
}
@media (min-width: 992px) {
  .projects-section .project-text {
    padding: 5rem;
  }
  .projects-section .project-text hr {
    border-color: #ffc800;
    /* border-color: #64a19d; */
    border-width: 0.25rem;
    width: 30%;
  }
}

/* index 버튼 노랑색------------------------------------------------------ */

.btn-primary {
  color: #fff;
  background-color: #ffc800;
  border-color: #ffc800;
}
.btn-primary:hover {
  color: #fff;
  background-color: #d9aa00;
  border-color: #cca000;
}
.btn-check:focus + .btn-primary, .btn-primary:focus {
  color: #fff;
  background-color: #d9aa00;
  border-color: #cca000;
  box-shadow: 0 0 0 0.25rem rgba(255, 208, 38, 0.5);
}
.btn-check:checked + .btn-primary, .btn-check:active + .btn-primary, .btn-primary:active, .btn-primary.active, .show > .btn-primary.dropdown-toggle {
  color: #fff;
  background-color: #cca000;
  border-color: #bf9600;
}
.btn-check:checked + .btn-primary:focus, .btn-check:active + .btn-primary:focus, .btn-primary:active:focus, .btn-primary.active:focus, .show > .btn-primary.dropdown-toggle:focus {
  box-shadow: 0 0 0 0.25rem rgba(255, 208, 38, 0.5);
}
.btn-primary:disabled, .btn-primary.disabled {
  color: #fff;
  background-color: #ffc800;
  border-color: #ffc800;
}
.btn-xl {
  padding: 1.25rem 2.5rem;
  font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-size: 1.125rem;
  font-weight: 700;
}
.page-section {
  padding: 6rem 0;
}
.page-section h2.section-heading, .page-section .section-heading.h2 {
  font-size: 2.5rem;
  margin-top: 0;
  margin-bottom: 1rem;
}
.page-section h3.section-subheading, .page-section .section-subheading.h3 {
  font-size: 1rem;
  font-weight: 400;
  font-style: italic;
  font-family: "Roboto Slab", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  margin-bottom: 4rem;
}
    </style>

  </head>
  <!-- body -->
  <body>
  <!-- nav -->
  <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top px-3">
    <a class="navbar-brand" href="index.jsp">Angel Pods</a>
    <div>
      <button class="navbar-toggler collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
      
        <span class="navbar-toggler-icon"></span>

      </button>
    </div>
    
    <div class="navbar-collapse collapse" id="navbarsExample03">
        <ul class="navbar-nav me-auto mb-2 mb-sm-0">
          <li class="nav-item">
            <a class="nav-link text-white" href="find/list_view.jsp">습득물보기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="lost/list_view.jsp">분실물보기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="find/write_view.jsp">습득신고</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="lost/write_view.jsp">분실신고</a>
          </li>
        </ul>
        <div id="nav-login" hidden="true">  
          <a type="button" class="btn btn-light me-2 text-secondary fw-bold  " href="member/login.jsp?url=${pageContext.request.requestURL}">로그인</a>
          <a type="button" class="btn btn-outline-light text-white " href="member/join.jsp">회원가입</a>
        </div>
        <div id="nav-logout" hidden="true" class="text-white">
          <a href="mypage/main.jsp" class="text-white">${name}</a> 님
          <a type="button" class="btn btn-outline-light" href="logout.do">로그아웃</a>
        </div>
        <input id="validMem" value="${ValidMem}" hidden="true">
    </div>
  </nav>
  <div style="padding-top: 80px;"></div>
  
   <!-- error -->
   error404   
      죄송합니다 조속히 수정하겠습니다!
      
      이전 화면으로
   index로 이동


  <!-- 하단 nav -->
  <div id="bnav" class="fixed-bottom ">
    <div id ="bnav_nav" >
      <div class = "row row-cols-5 text-center px-4">
          <div class="col position-relative">
            <button type="button" aria-expanded="false" class="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
              </svg>
              <a href="index.jsp" class="stretched-link"></a>
            </button>
          </div>

          <div class="col position-relative">
            <button type="button" aria-expanded="false" class="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-grid-3x3-gap-fill" viewBox="0 0 16 16">
                <path d="M1 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2zM1 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V7zM1 12a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-2z"/>
              </svg>
              <a href="find/list_view.jsp" class="stretched-link"></a>
            </button>
          </div>
          
          <!-- plus버튼 -->
          <div class="col position-relative">
            <button type="button" data-bs-toggle="dropdown" aria-expanded="false" class="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
              </svg>
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="device/add_view.jsp">      
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg> 기기 등록</a></li>
              <li><a class="dropdown-item" href="lost/write_view.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg> 분실신고</a></li>
              <li><a class="dropdown-item" href="find/write_view.jsp">      
              <!-- <li><a class="dropdown-item" onclick = "javascript:window.location='../find/write_addr_view.jsp'"> -->      
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg> 습득물 등록</a></li>
            </ul>
          </div>

          <div class="col position-relative">
            <button type="button" aria-expanded="false" class="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16"><path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/></svg>
              <a href="*" class="stretched-link"></a>
            </button>
          </div>

          <div class="col position-relative">
            <button type="button" aria-expanded="false" class="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
              </svg>
              <a href="mypage/main.jsp" class="stretched-link"></a>
            </button>
          </div>

      </div>
    </div>
  </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
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