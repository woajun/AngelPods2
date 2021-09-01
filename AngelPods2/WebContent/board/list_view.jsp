<%-- 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% 
if(request.getAttribute("f_list") == null){ %>
	<jsp:forward page = "f_list.do"/>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤팟 : 습득물 조회 게시판</title>
	<!-- booststrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="board.css/list_view.css" rel="stylesheet">


</head>
<body>

  <!-- nav -->
  <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top px-3" >
    <a class="navbar-brand" href="../index.html">Angel Pods</a>
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
            <a class="nav-link text-white" href="../board/list_view.jsp">습득물보기</a>
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
          <a type="button" class="btn btn-light me-2 text-secondary fw-bold  " href = "../member/login.jsp">로그인</a>
          <a type="button" class="btn btn-outline-light text-white " href = "../member/join.jsp">회원가입</a>
        </div>
        <div id ="nav-logout" hidden="true" class="text-white">
          <a href="#" class="text-white">${name}</a> 님
          <a type="button" class="btn btn-outline-light" href = "logout.do">로그아웃</a>
        </div>
        <input id="validMem" value="${ValidMem}" hidden="true">
    </div>
  </nav>
    
  <!--지도-->
  <div id="map"></div>

  <!-- 게시판 -->
  <div id="layoutSidenav" >
    <div id="layoutSidenav_nav" class="bg-light">
        <div class="container ">

          <!-- 습득물/분실물 -->
          <div class="row" >
            <div class="text-center">
              <div class="serchBox mx-3 ">
                <div class="row mt-1">
                  <div class="col-6 d-grid">
                    <input type="radio" class="btn-check" name="options33" id="op1" autocomplete="off" checked>
                    <label class="btn btn-outline-secondary" for="op1">습득물</label>
                  </div>
                  <div class="col-6 d-grid">
                    <input type="radio" class="btn-check" name="options33" id="op2" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="op2">분실물</label>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 검색조건 -->
          <form name="searchForm" action="f_search.do" method="post">
	          <div class="row" >
	            <div class="accordion my-2" id="accordionExample">
	              <div class="accordion-item">
	                <h2 class="accordion-header" id="headingTwo">
	                  
	                  <button id="searchAccordionBtn" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	                      <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
	                    </svg>
	                      &nbsp; 검색조건을 설정해주세요.
	                  </button>
	                </h2>
	                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	                  <div class="accordion-body">
	
	                    <table id="searchTable" class="table" style="padding:0px; border-color:rgb(255, 255, 255)">
	                      <tbody>
	                        <tr>
	                          <th class="align-middle" style="width: 40px;">분류</th>
	                          <td>
	                            <div class="input-group mt-1">
	                              <select id="cNum" name = "cNum" class="form-select" required>
	                                <option selected value="%">대분류</option>
	                                <c:forEach items = "${cList}" var="cDto">
	                                  <option value="${cDto.cNum}">${cDto.name}</option>
	                                </c:forEach>
	                              </select>
	                              <select id="cdNum" name="cdNum" class="form-select" required>
	                                <option selected value="%">소분류</option>
	                                <c:forEach items = "${cdList}" var="cdDto">
	                                  <option class ="cdItems" value="${cdDto.cdNum}" label="${cdDto.name}" hidden="true">${cdDto.cNum}/${cdDto.needSN}</option>
	                                </c:forEach>
	                              </select>
	                            </div>
	                          </td>
	                        </tr>
	                        <tr>
	                          <th class="align-middle" style="width: 40px;">지역</th>
	                          <td>
	                            <div class="input-group mt-1 gap-1">
	                              <select id="areaSido" name ="areaSido" class="form-select" required>
	                                <option selected value="%">시/도</option>
	                                <c:forEach items = "${area}" var="area">
	                                  <option value="${area.sido}">${area.sido}</option>
	                                </c:forEach>
	                              </select>
	                              <select id="areaGue" name="areaGue" class="form-select" required>
	                                <option selected value="%">구/군</option>
	                                <c:forEach items = "${area}" var="area">
	                                  <option class ="gueItems" value="${area.gue}" label="${area.gue}" hidden="true">${area.sido}/${area.gue}</option>
	                                </c:forEach>
	                              </select>
	                              <select id="areaDong" name="areaDong" class="form-select" required>
	                                <option selected value="%">동/읍</option>
	                                <c:forEach items = "${area}" var="area">
	                                  <option class ="dongItems" value="${area.dong}" label="${area.dong}" hidden="true">${area.sido}/${area.gue}/${area.dong}</option>
	                                </c:forEach>
	                              </select>
	                            </div>
	                          </td>
	                        </tr>
	                        <tr>
	                          <th class="align-middle" style="width: 40px;">검색</th>
	                            <td>
	                            <div class="input-group mt-1">
	                              <select name="slcSearch" class="form-select" style="flex:0.3">
	                                <option value="1" selected>제목</option>
	                                <option value="2">내용</option>
	                              </select>
	                              <input type="text" name="strSearch" class="form-control" >
	                            </div>
	                          </td>
	                        </tr>
	                      </tbody>
	                    </table>
	                    <div class="d-grid col-6 mx-auto mt-1">
	                      <button type="submit" class="btn btn-primary">
	                       		검색
	                      </button>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
		  </form>
		  
          <!-- 검색결과 -->
          <div id="board">
            <div class="scrollarea">
              <c:forEach items = "${list}" var="dto">
                <div class="boardItem list-group-item list-group-item-action py-3">
                  <div class="row">
                    <div class="col-3 align-items-center d-flex px-1">
                      <img  class="rounded"  src="${pageContext.request.contextPath}/images/${dto.thumbnailImage}" alt="..." width=80px height=80px>
                    </div>
                    <div class="col-9 ps-2">
                        <div class="d-flex align-items-center justify-content-between">
                          <small class="text-muted">${dto.cdName} </small><br/>
                          <small class="text-muted">채팅 ${dto.chatHit}</small>
                        </div>
                        <strong class="mb-1">${dto.title}</strong><br/>
                        <small class="text-muted">${dto.dong} ${dto.timestamp}</small><br/>
                        <small class="col-10 mb-1 small">${dto.addrDetail}</small>
                    </div>
                  </div>
                  <input type="hidden" class = "fbNum" value="${dto.fbNum}">
                  <input type="hidden" class = "userId" value="${dto.userId}">
                  <input type="hidden" class = "thumbnailImage" value="${pageContext.request.contextPath}/images/${dto.thumbnailImage}">
                  <input type="hidden" class = "timestamp" value="${dto.timestamp}">
                  <input type="hidden" class = "sido" value="${dto.sido}">
                  <input type="hidden" class = "gue" value="${dto.gue}">
                  <input type="hidden" class = "dong" value="${dto.dong}">
                  <input type="hidden" class = "addrDetail" value="${dto.addrDetail}">
                  <input type="hidden" class = "title" value="${dto.title}">
                  <input type="hidden" class = "contents" value="${dto.contents}">
                  <input type="hidden" class = "sn" value="${dto.sn}">
                  <input type="hidden" class = "lat" value="${dto.lat}">
                  <input type="hidden" class = "lng" value="${dto.lng}">
                  <input type="hidden" class = "hit" value="${dto.hit}">
                  <input type="hidden" class = "chatHit" value="${dto.chatHit}">
                  <input type="hidden" class = "fState" value="${dto.fState}">
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
    </div>
  </div>

  <!-- 현위치 버튼 -->
  <button id="curPositionBtn" type="button" class="btn btn-primary" onclick = "curPositionBtn()">
      현위치
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
      <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
    </svg>
  </button>
    
  <!-- 글쓰기 버튼 -->
  <div id ="btn_write" class="fixed-bottom " >
    <div class = "row text-center px-4">
      <div class ="col"></div>
      <div class ="col"></div>
      <div class ="col"></div>
      <div class ="col"></div>
      <div class ="col">
        <button type="button" data-bs-toggle="dropdown" aria-expanded="false" class="btn btn-primary btn-xl">
          글쓰기
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
          <li><a class="dropdown-item" onclick = "javascript:window.location='../find/write_addr_view.jsp'">      
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
              <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
            </svg> 습득물 등록</a></li>
        </ul>
      </div>
      <br>
      <br>
      <br>
    </div>
    <br>
    <br>
    <br>
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
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-grid-3x3-gap-fill" viewBox="0 0 16 16">
                <path d="M1 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2zM1 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V7zM1 12a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-2z"/>
              </svg>
              <a href="#" class="stretched-link"></a>
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
              <li><a class="dropdown-item" href="../regist/regist.new.html">      
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg> 기기 등록</a></li>
              <li><a class="dropdown-item" href="../member/member.mypage.html">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg> 분실신고</a></li>
              <li><a class="dropdown-item" onclick = "javascript:window.location='../find/write_addr_view.jsp'">      
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg> 습득물 등록</a></li>
            </ul>
          </div>

          <div class="col position-relative">
            <button type="button" aria-expanded="false" class="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
              </svg>
              <a href="lost-list/lostlist.html" class="stretched-link"></a>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da&libraries=services"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="board.js/list_view.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html> 

--%>