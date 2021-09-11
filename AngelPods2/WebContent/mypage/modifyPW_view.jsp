<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% if(request.getAttribute("Valid") == null){ %>
	<jsp:forward page = "my_modify_view.do"/>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>엔젤팟 : 마이페이지 정보수정</title>

<!-- booststrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  
<style>
  #userBox .row{--bs-gutter-x:0;}
  #userBox #userInfo td{padding-left: 13px;}
  #userBox #userInfo table{width:90%;margin: 10px 0 10px 20px;}
  #userBox th{width: 93px; font-size: 15px;}
  @media (min-width: 576px) {
  #userBox #userInfo table{margin-left:0px;}
  }
  .pt10px {padding-top: 10px;}
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


<!-- body -->
<div id="userBox" class="container">
  <form action = "my_modify_action.do" method = "post" enctype="multipart/form-data">
    <div class="row">
      <div class="col-lg-2"></div>
      <div class="col-12 col-lg-8">
      <h3 class="fs-5 mt-4"><strong>${mDto.name}</strong> 님의 페이지</h3>
          <div id="userInfo" class="row border rounded shadow-sm py-3 mb-2">
              <div class="col-12 col-sm-4 text-center pt10px">
                
                <label for="inputImg" class="my-1">
                  <img id="userImg" class="rounded" src="../image/person-square.svg" width="100" height="100">
                </label>
                <br/>
                <label class="btn btn-outline-dark py-1" for="inputImg">이미지 선택</label>
                <input type="file" id="inputImg" accept=".jpg, .jpeg, .png" style="display: none;">

              </div>
              <div class="col-12 col-sm-8">
                  <table>
                  <tbody>
                      <tr>
                          <th>아이디</th>
                          <td>${mDto.userId}</td>
                      </tr>
                      <tr>
                          <th>
                            <label for="pw" >비밀번호</label>
                          </th>
                          <td>
                          <input id="pw" name="pw" class="form-control" type="password" >    
                          </td>
                      </tr>
                      <tr>
                          <th>
                            <label for="pw-chk" >비밀번호확인</label>
                          </th>
                          <td>
                          <input id="pw-chk" class="form-control" type="password" >    
                          </td>
                      </tr>
                      <tr>
                          <th>
                            <label for="name">닉네임</label>
                           </th>
                          <td>
                          <input id="name" name="name" class="form-control" type="text" value="${mDto.name}" required>    
                          </td>
                      </tr>
                      <tr>
                          <th>가입일</th>
                          <td>${mDto.rDate}</td>
                      </tr>
                      <tr>
                          <th>
                            <label for="mail">이메일</label>
                           </th>
                          <td>
                          <input id="mail" name="mail" class="form-control" type="text" value="${mDto.eMail}" required>    
                          </td>
                      </tr>
                  </tbody>
                  </table>
              </div>
          </div>
          <div class="col-12 mb-2">
              <button type="submit" class="btn btn-outline-secondary d-grid shadow-sm border">정보수정</button>
          </div>
          <div class="col-12 mb-2">
              <a href="../mypage/main.jsp" class="btn btn-outline-secondary d-grid shadow-sm border">취소</a>
          </div>
      </div>

      <div class="col-12 col-lg-8">
      </div>
    </div>
  </form>
</div>


<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

const userImg = document.getElementById("userImg");
const inputImg = document.getElementById("inputImg");

inputImg.addEventListener('change',imgUpdate);

function imgUpdate(){
	const [file] = inputImg.files;
	if (file) {
	  userImg.src = URL.createObjectURL(file);
	}
	inputImg.setAttribute('name','userImg');
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