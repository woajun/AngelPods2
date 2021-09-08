<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>엔젤팟 : 분실물 정보</title>
      
      <!-- Bootstrap core CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	  <!-- SimpleLightbox plugin CSS-->
	  <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
         
	 
	 <style>
	  
	  a{
		  text-decoration: none;
		  color : black; 
	  }

	  a:hover{
		  text-decoration: underline;
	  }

	  .carousel-item{
		  height:300px;
	  }

	  .fit-cover{
		  object-fit: cover;
		  object-position: center;
		  width : 100%;
		  height : 100%;
	  }
	  
	  @media (min-width: 992px) {
		  .carousel-item{
			  height:400px;
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
	          <a class="nav-link text-white" href="../find/write_addr_view.jsp">습득신고</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-white" href="#">분실신고</a>
	        </li>
	      </ul>
	      <div id ="nav-login" hidden="true">  
	        <a type="button" class="btn btn-light me-2 text-secondary fw-bold  " href = "../member/login.jsp?url=f_content_view.do?fbNum=${param.fbNum}">로그인</a>
	        <a type="button" class="btn btn-outline-light text-white " href = "../member/join.jsp">회원가입</a>
	      </div>
	      <div id ="nav-logout" hidden="true" class="text-white">
	        <a href="#" class="text-white">${name} </a> 님
	        <a type="button" class="btn btn-outline-light" href = "logout.do">로그아웃</a>
	      </div>
	      <input id="validMem" value="${ValidMem}" hidden="true">
	      <input id="name" value="${name}" hidden="true">
	      <input id="userId" value="${userId}" hidden="true">
	  </div>
	</nav>
    <div style="padding-top: 50px;"></div>
      
    <!-- carousel -->
    <div class="container" style="padding-left: 0px; padding-right: 0px;">
       <div class="row row-cols-1 row-cols-sm-2 border rounded my-4 py-3">
          <div class="col">
              <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
                  <div class="carousel-indicators">
                  <!-- <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 0"></button> -->
                  <c:forEach items="${lImages}" var = "lImages" varStatus="status">
	                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" aria-label="slide-${fImages.idx}" ${status.first ? 'class="active" aria-current="true"' : ''}></button>
                  </c:forEach>
                  </div>
                  <div class="carousel-inner rounded">
                    <!-- <div class="carousel-item active"  >
                        <img src="../image/airpodsMain.jpg" class="w-100" >
                    </div> -->
                    <c:forEach items="${lImages}" var = "lImages" varStatus="status">
                      <div ${status.first ? 'class="carousel-item active"' : 'class="carousel-item"'} >
						<a class="image-box" href="${pageContext.request.contextPath}/images/lostBoard/${lImages.imageSystemName}">
						  <img class="fit-cover" src="${pageContext.request.contextPath}/images/lostBoard/${lImages.imageSystemName}">
						</a>
                      </div>
                    </c:forEach>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                  </button>
              </div>
          </div>
          <!-- carousel - 게시글정보 -->
          <div class="col my-4 px-4">
            <div class="row">
              <div class="col-6 text-wrap">
                <img class="me-1 img-fluid img-profile rounded-circle" src="../image/airpodsMain.jpg" alt="..." style="float:left; width: 30px; height:30px"/>
                <a href="#?userId=${dto.userId}" class="fw-normal ">${writer.name}</a>
                <input id="writerId" value = "${dto.userId}" type="hidden">
              </div>
              <div class="col-6">
                <h5 class="fs-6 fw-bold text-end">${dto.timestamp}</h5>
              </div>
            </div>
            <div class="mt-3 text-break">
              <div class="fw-light">
                <a href>${dto.cName}</a><span> &#183; </span><a href="#">${dto.cdName}</a><br/>
                <a href>${dto.sido} ${dto.gue} ${dto.dong}</a><span> &#183; </span>${dto.addrDetail}
              </div>
              <hr/>
              <h5 class="fs-5 fw-bold">${dto.title}</h5>
              <p class="fs-6 fw-normal">${dto.contents}</p>
            </div>
			<div class="row pt-3">
			  <div class="col-8 d-grid pe-1">
				  <button type = "button" class="btn btn-dark" >1:1채팅</button>
			  </div>
			  <div class="col-4 d-grid ps-1">
				<button type = "button" class="btn btn-outline-dark" onclick="goback()" >
				  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 20">
				  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
				  </svg>
				</button>
			  </div>
			</div>
			<div class="row mt-2" id="modifyDiv" hidden>
			  <dic class="col-6 d-grid pe-1">
			 	<button type = "button" class="btn btn-dark" onclick="location.href='l_modify_view.do?lbNum=${dto.lbNum}'">수정</button>
			  </dic>
			  <dic class="col-6 d-grid ps-1">
				<button type = "button" class="btn btn-dark" onclick="removeCheck()">삭제</button>
			  </dic>
			</div>
          </div>
        </div>
    </div>
  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	<!-- SimpleLightbox plugin JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        
	<script>

		window.addEventListener('DOMContentLoaded', event => {

			// Activate SimpleLightbox plugin for portfolio items
			new SimpleLightbox({
				elements: '.image-box'
			});

		});
    //============================
	    const ValidMem = document.getElementById('validMem').value;
	    
    	const userId = document.getElementById('userId').value;
		const writer = document.getElementById('writerId').value;

		const navLogin = document.getElementById('nav-login');
	    const navLogout = document.getElementById('nav-logout');
		const modifyDiv = document.getElementById('modifyDiv');
	    
	    if (ValidMem == "yes") {
	      navLogout.removeAttribute("hidden");
	    } else {
	      navLogin.removeAttribute("hidden");  
	    }

	    if (userId == writer) {
		    modifyDiv.removeAttribute("hidden");
	    } else {
	        modifyDiv.setAttribute("hidden","true");
	    }
	    
	    function goback(){
    		const backURL = document.referrer;
		    if(backURL.includes('l_list.do')||backURL.includes('l_search.do')){
		    	history.go(-1);
		    } else {
		    	window.location.href = 'l_list.do';
		    }
	    }
	    
	    function removeCheck() {
	    	 if (confirm("정말 삭제하시겠습니까?") == true){
	    	     location.href='l_delete.do?lbNum=${dto.lbNum}'
	    	 }else{
	    	     return false;
	    	 }

    	}
	</script>
</body>
</html>