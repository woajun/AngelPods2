<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>엔젤팟 : 분실물조회 서비스</title>
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
  
   <!-- Masthead--> 
    <header class="masthead">
        <div class="container">
            <div class="masthead-subheading">Welcome To Angel Pods!</div>
            <div class="masthead-heading lh-sm">기기를 등록하고<br>분실에 대비하세요!</div>
            <a class="btn btn-primary btn-xl " href="device/add_view.jsp">등록하기</a>
        </div>
    </header>
    <!-- Services-->
    <!-- <section class="page-section bg-white" id="services"> -->
  <section class="page-section bg-white">
    <div class="container">
      <div class="text-center">
          <h2 class="section-heading fw-bold">엔젤팟<small>은요?</small></h2>
          <h3 class="section-subheading text-muted">잃어버린 에어팟을 찾아주신 분은 천사같아요.
            <br>천사님이 더 쉽게 찾아주실 수 있도록 만든 사이트 입니다.</h3>
      </div>
      <div class="row text-center">
          <div class="col-md-4">
              <span class="">
                  <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-earbuds" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M6.825 4.138c.596 2.141-.36 3.593-2.389 4.117a4.432 4.432 0 0 1-2.018.054c-.048-.01.9 2.778 1.522 4.61l.41 1.205a.52.52 0 0 1-.346.659l-.593.19a.548.548 0 0 1-.69-.34L.184 6.99c-.696-2.137.662-4.309 2.564-4.8 2.029-.523 3.402 0 4.076 1.948zm-.868 2.221c.43-.112.561-.993.292-1.969-.269-.975-.836-1.675-1.266-1.563-.43.112-.561.994-.292 1.969.269.975.836 1.675 1.266 1.563zm3.218-2.221c-.596 2.141.36 3.593 2.389 4.117a4.434 4.434 0 0 0 2.018.054c.048-.01-.9 2.778-1.522 4.61l-.41 1.205a.52.52 0 0 0 .346.659l.593.19c.289.092.6-.06.69-.34l2.536-7.643c.696-2.137-.662-4.309-2.564-4.8-2.029-.523-3.402 0-4.076 1.948zm.868 2.221c-.43-.112-.561-.993-.292-1.969.269-.975.836-1.675 1.266-1.563.43.112.561.994.292 1.969-.269.975-.836 1.675-1.266 1.563z"></path>
                  </svg>
              </span>
              <h4 class="my-3 fw-bold">기기등록!</h4>
              <p class="text-muted">기기 일련번호를 미리 등록해둡니다.</p>
          </div>
          <div class="col-md-4">
              <span class="">
                <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                </svg>  
              </span>
              <h4 class="my-3 fw-bold">기기조회!</h4>
              <p class="text-muted">만약 분실하면, 엔젤님이<br> 일련번호를 조회할 수 있습니다.</p>
          </div>
          <div class="col-md-4">
            <span class="">
              <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"></path>
              </svg>  
            </span>
              <h4 class="my-3 fw-bold">매칭완료!</h4>
              <p class="text-muted">미리 등록한 정보로 주인을 찾을 수 있습니다!</p>
          </div>
      </div>
    </div>
  </section>

  <!-- Signup-->
  <section class="about-section text-center" id="about">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-lg-8">
                <h2 class="text-white mb-4">일련번호로 주인을 찾아주세요</h2>
                <div class="text-white-50 mb-5">
                  아래 검색창에 기기일련번호를 입력해서, 기기의 소유주를 조회할 수 있습니다.<br>
                </div>
                <div>
                  <a class="btn btn-primary btn-xl" href="#">소유주 조회</a>
                </div>
            </div>
        </div>
        <img class="img-fluid" src="image/ipad.png" alt="...">
    </div>
</section>
  

<!-- footer -->
  <div class="bg-dark text-white">
    <div class="container">
      <footer class="pt-1 pt-md-5 ">
        <div class="row">
          <div class="col-12 col-md">
            <a class="navbar-brand text-white" href="index.html">Angel Pods</a>
            <small class="d-block mb-3 text-white">© 2021</small>
          </div>
          <div class="col-6 col-md">
            <h5>Features</h5>
            <ul class="list-unstyled text-small">
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Cool stuff</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Random feature</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Team feature</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Stuff for developers</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Another one</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Last time</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Resource</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Resource name</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Another resource</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Final resource</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>About</h5>
            <ul class="list-unstyled text-small">
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Team</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Locations</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Privacy</a></li>
              <li class="mb-1"><a class="text-secondary text-decoration-none" href="#">Terms</a></li>
            </ul>
          </div>
        </div>
      </footer>
    </div> 
  </div>


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
              <li><a class="dropdown-item" href="#">      
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg> 기기 등록</a></li>
              <li><a class="dropdown-item" href="#">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg> 분실신고</a></li>
              <li><a class="dropdown-item" href="find/write_addr_view.jsp">      
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
              <a href="#" class="stretched-link"></a>
            </button>
          </div>

          <div class="col position-relative">
            <button type="button" aria-expanded="false" class="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
              </svg>
              <a href="#" class="stretched-link"></a>
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