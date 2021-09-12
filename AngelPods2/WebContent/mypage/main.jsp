<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% if(request.getAttribute("Valid-mypage") == null){ %>
	<jsp:forward page = "my_main_view.do"/>
<% } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <title>엔젤팟 : 마이페이지</title>

  <!-- booststrap css -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    
  <style>
    #userBox .row{--bs-gutter-x:0;}
    #userBox #userInfo td{padding-left: 13px;}
    
    #myDevices .row{--bs-gutter-x:0;}
    #myDevices .dev-img{display: block; height: 150px; width:200px; margin-left: auto; margin-right: auto;}
    #myDevices .dev-info{position: relative;padding-bottom: 40px;padding-top: 10px;}
    #myDevices .dev-info th{width:72px;}
    #myDevices .dev-info .dev-control{position: absolute; bottom:0; right:0;}
    #myDevices #dev-plus{position:relative; height: 100%;min-height: 198px;}
    
    @media (min-width: 992px) {
	    #myDevices .dev-info{padding-top: 0px;}
        #userBox #userInfo{margin-right: 15px;}
        
   		.py-3 {
		    padding-top: 1rem!important;
		    padding-bottom: 3.1rem!important;
		}
    }

  </style>

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
	<div style="padding-top: 50px;"></div>

  <div id="userBox" class="container">
    <h3 class="fs-5 mt-4"><strong>${mDto.name}</strong> 님의 페이지</h3>
      <div class="row">
        <div class="col-12 col-lg-6 mb-2">
            <div id="userInfo" class="row border rounded shadow-sm py-3 px-3">
                <div class="col-12 col-sm-4 text-center ">
                
					<label for="inputImg" class="my-1">
                  		<img id="userImg" class="rounded" src="${pageContext.request.contextPath}/images/member/${mImg.imageSystemName}" width="100" height="100">
                	</label>
                </div>
                <div class="col-12 col-sm-8">
                    <table>
                    <tbody>
                        <tr>
                            <th>아이디</th>
                            <td>${mDto.userId}</td>
                        </tr>
                        <tr>
                            <th>닉네임</th>
                            <td>${mDto.name}</td>
                        </tr>
                        <tr>
                            <th>가입일</th>
                            <td>${mDto.rDate}</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>${mDto.eMail}</td>
                        </tr>
                    </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-6">
            <div class="col-12 mb-2">
                <a href="my_contents_view.do" class="btn btn-outline-secondary d-grid shadow-sm border">내가쓴글</a>
            </div>
            <div class="col-12 mb-2">
                <a href="../mypage/modify_view.jsp" class="btn btn-outline-secondary d-grid shadow-sm border">정보수정</a>
            </div>
            <div class="col-12 mb-2">
                <a href="../mypage/modifyPW_view.jsp" class="btn btn-outline-secondary d-grid shadow-sm border">비밀번호 변경</a>
            </div>
            <div class="col-12 mb-2">
                <a href="#" class="btn btn-outline-secondary d-grid shadow-sm border">회원탈퇴</a>
            </div>
        </div>
      </div>
  </div>

  <div id="myDevices" class = "container">
    <h3 class="fs-5 mt-4"><strong>나의 기기 목록</strong> </h3>
      
    <div class="row gap-3">
      <!-- 기기추가 -->
      <c:forEach items = "${devList}" var="dto">
        <div class="dev-box col-12 col-sm-12 col-lg-4">
            <div class = "col-12 border rounded row me-2 shadow-sm py-2">
    
              <div class = "col-12 col-sm-6 col-lg-12 py-2 d-grid">
                <img src="${pageContext.request.contextPath}/images/device/${dto.thumbnail}" class="dev-img rounded float-start img-fluid border" alt="기기 이미지">
              </div>
    
              <div class = "dev-info col-12 col-sm-6 col-lg-12 px-3">
                <table>
                      <tbody>
                          <tr>
                              <th>기종</th>
                              <td>${dto.devNum}</td>
                            </tr>
                            <tr>
                                <th>일련번호</th>
                                <td>${dto.bodySN}</td>
                            </tr>
                            <tr>
                                <th>등록일</th>
                                <td>${dto.timestamp}</td>
                            </tr>
                      </tbody>
                </table>
                <div class="dev-control text-end mb-2 me-2">
                    <a href="#" class="py-0 btn btn-outline-dark">분실신고</a>
                    <a href="d_delete.do?devNum=${dto.devNum}" class="py-0 btn btn-outline-dark">삭제</a>
                </div>
              </div>
            </div>
        </div>
      </c:forEach>
      
      
      <div id="dev-plus-box" class="col-12 col-sm-12 col-lg">
        <div id="dev-plus" class = "col-12 rounded row me-2 shadow-sm d-grid">
            <a href="d_add_view.do" class="btn btn-outline-secondary border d-grid">
                <div class="position-absolute top-50 start-50 translate-middle">
                    <h2>기기등록</h2>
                    <br/>
                    <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                </div>
            </a>
        </div>
        
        
      </div>
    </div>
  </div>
  
  
  
  
  
  
  
  
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
let devBox = document.getElementsByClassName('dev-box');
const plusBox = document.getElementById('dev-plus-box');

plusBoxHide();

function plusBoxHide(){
  if(devBox.length >= 3){
    plusBox.remove();
    for (let i = 0; i < devBox.length; i++) {
      const element = devBox[i];
      element.classList.replace('col-lg-4','col-lg')
    }
  }
}

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