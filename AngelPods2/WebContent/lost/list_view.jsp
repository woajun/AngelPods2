<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% 
if(request.getAttribute("Valid-list") == null){ %>
	<jsp:forward page = "l_list.do"/>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤팟 : 분실물 조회 게시판</title>
	<!-- booststrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="../lost/lost.css/list_view.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">

	<style>
	/* ----------------bottom nav ------------------*/

        .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
        .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
        .map_wrap {position:relative;width:100%;height:500px;}
        #menu_wrap {position:absolute;top:0;left:0;width:300px;margin:70px 0 200px 5px;padding:5px;overflow-y:hidden;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
        .bottom-zero {bottom:0;}
        .bg_white {background:#fff;}
        #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
        #menu_wrap .option{margin:5px}
        #placesList {padding-inline-start: 15px;}
        #placesList li {list-style: none;}
        #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
        #placesList .item span {display: block;margin-top:4px;}
        #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        #placesList .item .info{padding:10px 0 10px 5px;}
        #placesList .info .gray {color:#8a8a8a;}
        #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
        #placesList .info .tel {color:#009900;}
        #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
        #placesList .item .marker_1 {background-position: 0 -10px;}
        #placesList .item .marker_2 {background-position: 0 -56px;}
        #placesList .item .marker_3 {background-position: 0 -102px}
        #placesList .item .marker_4 {background-position: 0 -148px;}
        #placesList .item .marker_5 {background-position: 0 -194px;}
        #placesList .item .marker_6 {background-position: 0 -240px;}
        #placesList .item .marker_7 {background-position: 0 -286px;}
        #placesList .item .marker_8 {background-position: 0 -332px;}
        #placesList .item .marker_9 {background-position: 0 -378px;}
        #placesList .item .marker_10 {background-position: 0 -423px;}
        #placesList .item .marker_11 {background-position: 0 -470px;}
        #placesList .item .marker_12 {background-position: 0 -516px;}
        #placesList .item .marker_13 {background-position: 0 -562px;}
        #placesList .item .marker_14 {background-position: 0 -608px;}
        #placesList .item .marker_15 {background-position: 0 -654px;}
        #pagination {margin:10px auto;text-align: center;}
        #pagination a {display:inline-block;margin-right:10px;}
        #pagination .on {font-weight: bold; cursor: default;color:#777;}
        #flush-collapseOne
        { position: absolute;
          top: 0;
          left: 0;
          bottom: 0;
          width: 300px;
          margin: 80px 0px 0px 0px;
          overflow-y: auto;}
        .accordion-button {
          padding: 1rem 6rem;
          background-color: rgba(255,255,255,0);
          }

        @media (min-width: 768px) {
          #menu_wrap { transform:translateX(400px)}
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
            <a class="nav-link text-white" href="../find/write_view.jsp">습득신고</a>
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
    
  <!--지도-->
  <div id="map"></div>

  <div id="menu_wrap" class="bg_white">
    <div class="option">
      <form onsubmit="searchPlaces(); return false;">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="지도 검색" id="keyword" size="15"> 
          <button class="btn btn-outline-dark" type="submit">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
              <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg>
          </button> 
        </div>
      </form>
    </div>
    <hr>

    <div class="accordion accordion-flush" id="accordionFlushExample">
      <div class="accordion-item" style="background-color: rgba(255,255,255,0);">
        <h2 class="accordion-header" id="flush-headingOne">
          <button id="placesListBtn" class="accordion-button collapsed py-0" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
            접기/펴기
          </button>
        </h2>
        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
          <ul id="placesList"></ul>
          <div id="pagination"></div>
        </div>
      </div>
    </div>


  </div>

  <!-- 게시판 -->
  <div id="layoutSidenav" >
    <div id="layoutSidenav_nav" class="bg-light">
        <div class="container ">

          <!-- 습득물/분실물 -->
          <div class="row mt-1" >
            <div class="col-6 d-grid pe-1">
            	<a class = "btn btn-outline-secondary" href="f_list.do">습득물</a>
            </div>
            <div class="col-6 d-grid ps-1">
            	<a class = "btn btn-secondary" href="#">분실물</a>
            </div>
          </div>

          <!-- 검색조건 -->
          
          <form name="searchForm" action="l_search.do" method="post">
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
          <div style = "position:relative;bottom:0;">
            <div id="board">
              <div class="scrollarea">
                <c:forEach items = "${list}" var="dto">
                  <div class="boardItem list-group-item list-group-item-action py-1 mb-1">
                    <div class="row">
                      <div class="col-3 align-items-center d-flex px-1">
                        <img  class="rounded"  src="${pageContext.request.contextPath}/images/lostBoard/${dto.thumbnailImage}" alt="..." width=80px height=80px>
                      </div>
                      <div class="col-9 ps-2">
                          <div class="d-flex align-items-center justify-content-between">
                            <small class="text-muted overflow" style="width: 160px; height: 20px;">
                              ${dto.cName}<span> &#183; </span>${dto.cdName} </small><br/>
                            <small class="date text-muted"></small>
                          </div>
                          <strong class=" overflow" style="width: 240px; height: 20px;">${dto.title}</strong>
                          <div class="d-flex align-items-center justify-content-between">
                            <small class="text-muted">${dto.gue} ${dto.dong} </small><br/>
                          </div>
                          <small class="overflow" style="width: 240px;height: 20px;">${dto.addrDetail}</small>
                          <div class="d-flex align-items-center justify-content-between my-1">
                            <small class="text-muted">채팅 ${dto.chatHit}</small>
                            <button class="btn btn-sm btn-outline-secondary me-1" onclick="location.href='l_content_view.do?lbNum=${dto.lbNum}'" style="line-height:1;"> 게시물보기 </button>
                          </div>
                      </div>
                    </div>
                    <input type="hidden" class = "lbNum" value="${dto.lbNum}">
                    <input type="hidden" class = "userId" value="${dto.userId}">
                    <input type="hidden" class = "thumbnailImage" value="${pageContext.request.contextPath}/images/lostBoard/${dto.thumbnailImage}">
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
                    <input type="hidden" class = "lState" value="${dto.lState}">
                  </div>
                </c:forEach>
              </div>
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
    <button id="btn_write" type="button" onclick = "javascript:window.location='l_write_view.do'"
    	class="btn btn-primary btn-xl" style="
    	position : fixed;
    	right:4vh;
    	">
      	글쓰기
    </button>
  
  <!-- 하단 nav -->
  <div id="bnav">
    <div id ="bnav_nav" >
      <div class = "row row-cols-5 text-center px-4">
          <div class="col position-relative">
            <button type="button" aria-expanded="false" class="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
              </svg>
              <a href="../index.jsp" class="stretched-link"></a>
            </button>
          </div>

          <div class="col position-relative">
            <button type="button" aria-expanded="false" class="btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-grid-3x3-gap-fill" viewBox="0 0 16 16">
                <path d="M1 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2zM1 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V7zM1 12a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-2z"/>
              </svg>
              <a href="../find/list_view.jsp" class="stretched-link"></a>
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
              <li><a class="dropdown-item" href="f_write_view.do">      
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

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da&libraries=services"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script src="../lost/lost.js/list_view.js?v=<%=System.currentTimeMillis() %>"></script> -->
<script>
let boardItem = document.getElementsByClassName("boardItem");
let lbNum = document.getElementsByClassName("lbNum");
let userId = document.getElementsByClassName("userId");
let thumbnailImage = document.getElementsByClassName("thumbnailImage");
let timestamp = document.getElementsByClassName("timestamp");
let sido = document.getElementsByClassName("sido");
let gue = document.getElementsByClassName("gue");
let dong = document.getElementsByClassName("dong");
let addrDetail = document.getElementsByClassName("addrDetail");
let title = document.getElementsByClassName("title");
let contents = document.getElementsByClassName("contents");
let sn = document.getElementsByClassName("sn");
let lat = document.getElementsByClassName("lat");
let lng = document.getElementsByClassName("lng");
let hit = document.getElementsByClassName("hit");
let chatHit = document.getElementsByClassName("chatHit");
let lSatte = document.getElementsByClassName("lState");

let mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
let positions = [];
let overlays = [];

for (let i = 0; i< lat.length;i++){
	 let content = 
	 '<div class="wrap">' + 
     '  <div class="info">' + 
     '    <div class="title">' + 
     '      <div class="overflow">' + 
            title[i].value + 
     '      </div>' + 
     '      <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
     '    </div>' + 
     '    <div class="body">' + 
     '      <div class="img"><img src="' + thumbnailImage[i].value + '" width=73px height=70px ></div>' + 
     '      <div class="desc">' +
     '        <div class="ellipsis mb-1">'+ sido[i].value +' '+ gue[i].value +' '+ dong[i].value + '</div>' + 
     '        <div class="jibun ellipsis mb-2">'+addrDetail[i].value + '</div>' + 
     '        <div><button class="btn btn-sm btn-outline-secondary" onclick="location.href=\'l_content_view.do?lbNum='+lbNum[i].value+'\'" > 게시물보기 </button></div>' + 
     '      </div>' + 
     '    </div>' +    
     '</div>';
		
	positions.push({
		content: content, 
	    latlng: new kakao.maps.LatLng(lat[i].value, lng[i].value)
    });
}
    
for (let i = 0; i < positions.length; i ++) {
    
    // 마커를 생성합니다
    let marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
    });
    

    // 마커 위에 커스텀 오버레이 생성
    let overlay = new kakao.maps.CustomOverlay({
        position: positions[i].latlng,
        content: positions[i].content,
        map: map
    });

    // 게시글에 이벤트를 넣습니다.
    
    overlay.setMap(null);    

    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, overlay));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(overlay));
    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, overlay));
    
    boardItem[i].addEventListener('mouseover',makeOverListener(map, marker, overlay));
    boardItem[i].addEventListener('mouseout',makeOutListener(overlay));
    boardItem[i].addEventListener('click',moveMakeClickListener(map, marker, overlay, positions[i].latlng));

    overlays.push(overlay);
}

let selectedOverlay = null;

function moveMakeClickListener(map, marker, overlay, latlng){
    return function(){
        for (let i = 0; i < overlays.length; i++) {
			overlays[i].setMap(null);
		}
		selectedOverlay = overlay;
		selectedOverlay.setMap(map);
        map.panTo(latlng);
        document.body.classList.toggle('sb-sidenav-toggled');
    }
}

function makeClickListener(map,marker, overlay) {
	return function() {
		for (let i = 0; i < overlays.length; i++) {
			overlays[i].setMap(null);
		}
		selectedOverlay = overlay;
		selectedOverlay.setMap(map);
	}
}

function makeOverListener(map, marker, overlay) {
    return function() {
    	overlay.setMap(map);
    };
}

 function makeOutListener(overlay) {
     return function() {
         overlay.setMap(null);
         if(selectedOverlay != null)
         selectedOverlay.setMap(map);
     };
 }

function closeOverlay() {
	for (let i = 0; i < overlays.length; i++) {
		overlays[i].setMap(null);
	}
	selectedOverlay = null;
}

//"지도보기"눌럿을때 동작
window.addEventListener('DOMContentLoaded', event => {

const sidebarToggle = document.body.querySelector('.sidebarToggle');
if (sidebarToggle) {
    sidebarToggle.addEventListener('click', event => {
        document.body.classList.toggle('sb-sidenav-toggled');
    });
}
});

//현위치 btn
function curPositionBtn(){
  // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
  if (navigator.geolocation) {
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
      let nowlat = position.coords.latitude; // 위도
      let nowlng = position.coords.longitude; // 경도

      panTo(nowlat,nowlng);
      let latlng = new kakao.maps.LatLng(nowlat,nowlng)
    });
  } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    alert('현재 위치 정보를 찾을 수 없습니다.');
  }
}

//좌표로 지도 이동
function panTo(lat, lng) {
  let moveLatlng = new kakao.maps.LatLng(lat, lng);
  map.setLevel(3);      
  map.panTo(moveLatlng);      
}       

//카테고리 관련내용=============================
$("#cNum").on('change', function(){
  var cdItems = document.getElementsByClassName("cdItems");
  var selectedCNum = document.getElementById("cNum").value;
  $('#cdNum').val("%");

  for (let i = 0; i < cdItems.length; i++) {
    cdItems[i].setAttribute("hidden","true");
  }

  for (let i = 0; i < cdItems.length; i++) {
    if(cdItems[i].innerHTML.split('/')[0] == selectedCNum){
      cdItems[i].removeAttribute("hidden");
    }
  }
});

//area 관련내용=============================
	
	
sidoSetting();
gueSetting();

function sidoSetting(){
	const areaSido = document.getElementById('areaSido');
	const sidoSet = new Set()
	
	for (var i = 1; i < areaSido.length; i++) {
		sidoSet.add(areaSido[i].innerHTML);
	};

	var length = areaSido.options.length;
	for (i = length-1; i >= 1; i--) {
	  areaSido.options[i] = null;
	}
	
	const sidoArr = Array.from(sidoSet);
	
 	for (var i = 0; i < sidoArr.length; i++) {
 		let opt = document.createElement('option');
		opt.value = sidoArr[i];
		opt.innerHTML = sidoArr[i];
		areaSido.appendChild(opt);
	}
}	

function gueSetting(){
	const areaGue = document.getElementById('areaGue');
	const gueSet = new Set()
	
	for (var i = 1; i < areaGue.length; i++) {
		gueSet.add(areaGue[i].innerHTML);
	};

	var length = areaGue.options.length;
	for (i = length-1; i >= 1; i--) {
	  areaGue.options[i] = null;
	}
	
	const gueArr = Array.from(gueSet);
	
 	for (var i = 0; i < gueArr.length; i++) {
 		let opt = document.createElement('option');
		opt.value = gueArr[i].split('/')[1];
		opt.label = gueArr[i].split('/')[1];
		opt.innerHTML = gueArr[i];
		opt.setAttribute("hidden","true");
		opt.classList="gueItems";
		areaGue.appendChild(opt);
	}
}	


$("#areaSido").on('change', function(){
  let gueItems = document.getElementsByClassName("gueItems");
  let selectedSido = document.getElementById("areaSido").value;
  $('#areaGue').val("%");
  $('#areaDong').val("%");

  for (let i = 0; i < gueItems.length; i++) {
    gueItems[i].setAttribute("hidden","true");
  }

  for (let i = 0; i < gueItems.length; i++) {
    if(gueItems[i].innerHTML.split('/')[0] == selectedSido){
      gueItems[i].removeAttribute("hidden");
    }
  }
});
 
$("#areaGue").on('change', function(){
  let dongItems = document.getElementsByClassName("dongItems");
  let selectedGue = document.getElementById("areaGue").value;
  $('#areaDong').val("%");

  for (let i = 0; i < dongItems.length; i++) {
    dongItems[i].setAttribute("hidden","true");
  }

  for (let i = 0; i < dongItems.length; i++) {
    if(dongItems[i].innerHTML.split('/')[1] == selectedGue){
      dongItems[i].removeAttribute("hidden");
    }
  }
});

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
<!-- ========================================================================== -->
<script>
	curPositionBtn();
	
	let date = document.getElementsByClassName('date');
  for (let i = 0; i < date.length; i++) {
    
    date[i].innerHTML=timestamp[i].value.substr(5,11);
  }
    

</script>

<script>
  // 장소 검색 객체를 생성합니다
  var ps = new kakao.maps.services.Places();  

  // var markers = [];



// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

  var keyword = document.getElementById('keyword').value;

  if (!keyword.replace(/^\s+|\s+$/g, '')) {
      alert('키워드를 입력해주세요!');
      return false;
  }

  // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
  ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
if (status === kakao.maps.services.Status.OK) {

    // 정상적으로 검색이 완료됐으면
    // 검색 목록과 마커를 표출합니다
    displayPlaces(data);

    // 페이지 번호를 표출합니다
    displayPagination(pagination);

    
    // myCollapse.setAttribute('class','show')
    // placesListBtn.setAttribute('aria-expanded','true');
    
    myCollapse.classList.add('show');
    placesListBtn.setAttribute('aria-expanded','true');
    placesListBtn.classList.remove('collapsed');
    
    chkCollapsed();
    
} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

    alert('검색 결과가 존재하지 않습니다.');
    return;

} else if (status === kakao.maps.services.Status.ERROR) {

    alert('검색 결과 중 오류가 발생했습니다.');
    return;

}
}

const myCollapse = document.getElementById('flush-collapseOne')

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';

    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    // removeMarker();

    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = 
                // '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                   '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
        itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                   '</div>';           
    el.innerHTML = itemStr;
    el.className = 'item';
    el.addEventListener('click',function(){panTo(places.y,places.x)});

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
// function addMarker(position, idx, title) {
//     var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
//         imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
//         imgOptions =  {
//             spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
//             spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
//             offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
//         },
//         markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
//             marker = new kakao.maps.Marker({
//             position: position, // 마커의 위치
//             image: markerImage 
//         });

//     marker.setMap(map); // 지도 위에 마커를 표출합니다
//     markers.push(marker);  // 배열에 생성된 마커를 추가합니다

//     return marker;
// }

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
// function removeMarker() {
//     for ( var i = 0; i < markers.length; i++ ) {
//         markers[i].setMap(null);
//     }   
//     markers = [];
// }

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

//지도클릭
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    myCollapse.classList.remove('show');
    placesListBtn.setAttribute('aria-expanded','false');
    placesListBtn.classList.add('collapsed');
    chkCollapsed()
});

</script>
<script>
  const placesListBtn = document.getElementById('placesListBtn');
  let menuWrap = document.getElementById('menu_wrap');
  
  placesListBtn.addEventListener('click',chkCollapsed);


  function chkCollapsed(){
    let boolean = placesListBtn.getAttribute('aria-expanded');

    if(boolean=='true'){
      menuWrap.setAttribute('class','bottom-zero');
    }else {
      menuWrap.removeAttribute('class','bottom-zero');
    }
  }

</script>
</body>
</html>