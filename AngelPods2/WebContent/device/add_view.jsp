<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤팟 : 기기등록</title>


<!-- booststrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<style>
	.myDiv{
	display:none;
    text-align:center;
}  
.myDiv img{
    margin: 0 auto;
    height: auto;
    max-height: 400px;
    width: 280px;
    text-align:center;
}

.zero {
    text-align: center;
}
.zero img{
    margin: 0 auto;
    height: auto;
    max-height: 400px;
    width: 280px;
    text-align:center;
}

/* @media (min-width: 1000px) {
    .zero img {
        width : 50%;
    }
  } */


  #model .portfolio-item {
    /* max-width: 26rem; */
    /* max-height: 26rem; */
    margin-left: auto;
    margin-right: auto;
  }
  #model .portfolio-item .portfolio-link {
    position: relative;
    display: block;
    margin: 0 auto;
  }
  #model .portfolio-item .portfolio-link .portfolio-hover {
    display: flex;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(255, 200, 0, 0.9);
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity ease-in-out 0.25s;
  }
  #model .portfolio-item .portfolio-link .portfolio-hover .portfolio-hover-content {
    font-size: 1.5rem;
    color: white;
  }
  #model .portfolio-item .portfolio-link:hover .portfolio-hover {
    opacity: 1;
  }

  .form-control-inline{
    width:80%;
    float :right;
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


<!-- 기기등록 -->
<div class="container my-3 text-center">
	<h1>기기정보입력</h1>
</div>
<div class="container">
  <div class="row">
	<div class="col-lg-6 ">

	  <div id="showZero" class="zero  ">
		<img src="../image/airpodsMain.jpg">
	  </div>
	  <div id="showOne" class="myDiv  ">
		<img src="../../images/airpods.jpg">
	  </div>
	  <div id="showTwo" class="myDiv ">
		<img src="../../images/airpodsitem.jpeg">
	  </div>
	  <div id="showThree" class="myDiv ">
		<img src="../../images/buds2.jpg">
	  </div>

	  <div id="show${dto.cdNum}" class="myDiv">
		  <img src="${dto.image}">
	  </div>
	</div>
	<div class=" col-lg-6 ">
	  <form action = "d_add.do" method = "post" enctype="multipart/form-data">
		<div class="col-12 fw-bold">
			<div class="form-group">
			<label>모델명</label>
			<select name="cdNum" id="myselection" class="form-control" required >
				<option value="" disabled selected>모델 선택</option>
				<c:forEach items= "${snList}" var="dto">
					<option value="${dto.cdNum}">${dto.name}</option>
				</c:forEach>
			</select>
			</div>
			<div class ="row my-2">
			<div class = "col-12">
				<div class="form-check mt-1">
				<input class="form-check-input mt-2" type="checkbox" value="" id="check1" disabled checked>
				<label class="form-check-label mt-1" for="check1">
					본체
				</label>
				<input type="text" name="bodySN" class="form-control form-control-inline ms-4" placeholder="본체 일련번호" id="box1" disabled required>
				</div>
			</div>
			</div>
			<div class ="row my-2">
			<div class = "col-12">
				<div class="form-check mt-1">
				<input class="form-check-input mt-2" type="checkbox" value="" id="check2" disabled>
				<label class="form-check-label mt-1" for="check2">
					왼쪽
				</label>
				<input type="text" cname="leftSN" class="form-control form-control-inline ms-4" placeholder="왼쪽 일련번호" id="box2" disabled>
				</div>
			</div>
			</div>
			<div class ="row my-2">
				<div class = "col-12">
					<div class="form-check mt-1">
					<input class="form-check-input mt-2" type="checkbox" value="" id="check3" disabled>
					<label class="form-check-label mt-1" for="check3">
						오른쪽
					</label>
					<input type="text" name="rightSN" class="form-control form-control-inline ms-2" placeholder="오른쪽 일련번호" id="box3" disabled>
					</div>
				</div>
			</div>
			<div class ="row mt-3">
				<div class = "col-6 text-center pe-1">
					<div class="d-grid">
						<button class="btn btn-dark" type="submit">등록</button>
					</div>
				</div>
				<div class = "col-6 text-center ps-1">
					<div class="d-grid">
						<a href="../mypage/main.jsp" class="btn btn-outline-dark" type="button">취소</a>
					</div>
				</div>
			</div>
		</div>
	  </form>
	</div>
  </div>
</div>

<!-- 하단 nav -->
<div id="bnav" class="fixed-bottom ">
  <div id ="bnav_nav" >
	<div class = "row text-center px-4">
		<div class="col position-relative">
		  <button type="button" aria-expanded="false" class="btn">
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
			  <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
			</svg>
			<a href="../index.html" class="stretched-link"></a>
		  </button>
		</div>

		<div class="col position-relative">
		  <button type="button" aria-expanded="false" class="btn">
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
			  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
			</svg>
			<a href="lost-list/lostlist.html" class="stretched-link"></a>
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
			<li><a class="dropdown-item" href="../find/find.write.html">      
			  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			  </svg> 기기 등록</a></li>
			<li><a class="dropdown-item" href="../member/member.mypage.html">
			  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			  </svg> 분실신고</a></li>
			<li><a class="dropdown-item" href="../find/find.write.html">      
			  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			  </svg> 습득물 등록</a></li>
		  </ul>
		</div>

		<div class="col position-relative">
		  <button type="button" aria-expanded="false" class="btn">
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-grid-3x3-gap-fill" viewBox="0 0 16 16">
			  <path d="M1 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2zM1 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V7zM1 12a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-2z"/>
			</svg>
			<a href="#" class="stretched-link"></a>
		  </button>
		</div>

		<div class="col position-relative">
		  <button type="button" aria-expanded="false" class="btn">
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
			  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
			</svg>
			<a href="../member/member.mypage.html" class="stretched-link"></a>
		  </button>
		</div>


	</div>
  </div>
</div>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
$(document).ready(function(){
  $('#myselection').on('change', function(){
    var demovalue = $(this).val(); 
      $("div.myDiv").hide();
      $(".zero").hide();
      $("#show"+demovalue).show();
      $("#check2").removeAttr("disabled");
      $("#check3").removeAttr("disabled");
      $("#box1").removeAttr("disabled");
  });

  $(function () {
    $("#check3").click(function () {
        if ($(this).is(":checked")) {
            $("#box3").removeAttr("disabled");
            $("#box3").focus();
        } else {
            $("#box3").attr("disabled", "disabled");
            $("#box3").val("");
        }
    });
  });

  $(function () {
    $("#check2").click(function () {
        if ($(this).is(":checked")) {
            $("#box2").removeAttr("disabled");
            $("#box2").focus();
        } else {
            $("#box2").attr("disabled", "disabled");
            $("#box2").val("");
        }
    });
  });

});


</script>

</body>

</html>