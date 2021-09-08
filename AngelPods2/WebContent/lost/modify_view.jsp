<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap core CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
 <style>
 
   #preview img{width: 73px;height: 73px;object-fit:cover;}
   #photoBtn{width: 73px;height: 73px;color: darkgrey;background-color: white;}
   #photoBtn:hover {background-color: #f1f1f1;}
   .form-control-hover:hover{background-color: #f1f1f1;}
   .selectImage{outline: 3px solid yellow;}

   /* 스크롤바 만들기 =============== */
   #tab ul{white-space:nowrap; overflow-x: auto; text-align:start;padding: 0px;}
   #tab ul li{display:inline-block; color: darkgrey;}
   #tab ul li img:hover:not(.fileSelector){opacity: 0.3;}
   #tab ul li span:hover{opacity: 0.5;}
   /* 스크롤바===================== */
   ::-webkit-scrollbar {
     /* 스크롤바 전체 영역 */
     width: 5px;
   } 
   ::-webkit-scrollbar-track {
     /* 스크롤이 움직이는 영역  */
     background-color: #ffffff;
   } 
   ::-webkit-scrollbar-thumb {
     /*  스크롤  */
     background-color: rgb(212, 212, 212); 
     border-radius:30px;
   } 
   ::-webkit-scrollbar-button:start:decrement, 
   ::-webkit-scrollbar-button:end:increment {
     /*  스크롤의 화살표가 포함된 영역   */
     display:block;
     height:4px;
     background-color: rgb(255, 255, 255);
   } 

   /* ------------------------------------------- */

   .maxPhoto {background-color: #f1f1f1 !important;}
   #preview input {display: none;}
   @media (min-width: 576px){
     .modal-dialog {max-width: 95%;margin: 1.75rem auto;}
   }
   .modal-header {padding: 0.4rem 1rem;}
   .modal-body {height:80vh;}
   #map {width:100%;height: 100%;}
   .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
   .curBtn {position:absolute;right:3vh;top:3vh;border-radius: 2px; z-index:1;padding:5px;}
   .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
   .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
   .map_wrap {position:relative;width:100%;height:500px;}
   #menu_wrap {position:absolute;top:0;left:0;width:300px;margin:10px 0 40px 10px;padding:5px;overflow-y:hidden;background:rgba(255, 255, 255, 0.7);z-index: 2;font-size:12px;border-radius: 10px;}
   .bottom-zero {bottom:0;}
   .bg_white {background:#fff;}
   #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
   #menu_wrap .option{margin:5px}
   #placesList {padding-inline-start: 15px;}
   #placesList li {list-style: none;}
   #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
   #placesList .item span {display: block;margin-top:4px;}
   .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
   .info{padding:10px 0 0 0;}
   /* #placesList .info .gray {color:#8a8a8a;} */
   .info .gray {color:#8a8a8a;}
   /* #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;} */
   .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
   .info .tel {color:#009900;}
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
     
   <!-- 습득 게시물 등록 -->
   <form id="mForm" action = "l_modify.do" method = "post" enctype="multipart/form-data">
     <input name="lbNum" type="hidden" value="${dto.lbNum}">
       <div class="container my-3">
       </div>
       <div class="text-center">
       </div>

     <div class="container">
       <div class="form-control" >
         <div class="row justify-content-center">
           <div class="col-lg-6">

             <div class="col-12 mt-1 ">
               <div id="tab">
                 <label class="fw-bold">사진</label>
                 <ul id = "preview" class="">
                   <li class="fileSelector mt-3 ">
                     <label type="button" for="photoBtnInput" id="photoBtn" class=" border btn">
                       <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-camera-fill mt-2 " viewBox="0 0 16 16">
                         <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                         <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
                       </svg><br/>
                       <span id="imgCntSpan">0</span>/10
                       <input type="file" id="photoBtnInput" accept=".jpg, .jpeg, .png" >
                     </label>
                   </li>
                   <!-- 선택 이미지 생성 -->
                   <c:forEach items="${lImages}" var = "lImages" varStatus="status">
                     <li class="imgli position-relative me-2">
                       <label for="${status.index}">
                         <img src="${pageContext.request.contextPath}/images/lostBoard/${lImages.imageSystemName}" class="rounded">
                         <input type="file" id="${status.index}" accept=".jpg, .jpeg, .png" value="${lImages.imageSystemName}/${lImages.imageName}">
                       </label>
                       <span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-x-circle-fill position-absolute top-0 start-100 translate-middle" viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"></path></svg></span>
                     </li>
                   </c:forEach>
                 </ul>
               </div>
               <!-- <input type="button" value="aaaa" onclick="imgAddName()"> -->
             </div>

             <div class="col-12">
               <div class="row">
                 <label class="fw-bold">카테고리</label>
                 <div class="col-6">
                   <input id="def-cNum" type="hidden" value="${dto.cNum}-cNum">
                   <select id="cNum" name = "cNum" class="form-select" required>
                     <option disabled value="">대분류</option>
                     <c:forEach items = "${cList}" var="cDto">
                       <option id="${cDto.cNum}-cNum" value="${cDto.cNum}">${cDto.name}</option>
                      </c:forEach>
                    </select>
                    
                  </div>
                  <div class="col-6">
                   <input id="def-cdNum" type="hidden" value="${dto.cdNum}-cdNum">
                   <select id="cdNum" name="cdNum" class="form-select" required>
                     <option disabled value="">소분류</option>
                     <c:forEach items = "${cdList}" var="cdDto">
                       <option id="${cdDto.cdNum}-cdNum" class ="cdItems" value="${cdDto.cdNum}" label="${cdDto.name}" hidden="true">${cdDto.cNum}/${cdDto.needSN}</option>
                     </c:forEach>
                   </select>
                 </div>
               </div>
               <div class="mt-1 "id="divSN" style="display: none;">
                 <input class="form-control" type = "text" id = "sn" name = "sn" size = "50" placeholder="일련번호" value="${dto.sn}">
               </div>
             </div>
             
             <div class="col-12 mt-3 ">
               <label class="fw-bold">위치</label>
               <button type="button" class="form-control form-control-hover" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="openMap();">
                 <div class="row justify-content-between">
                   <div class="col-8 text-start">
                     <span id="sidoGueDong">
                       ${dto.sido} ${dto.gue} ${dto.dong}
                     </span>

                     <input type = "hidden" id="lat" name = "lat" value = "${dto.lat}">
                     <input type = "hidden" id="lng" name = "lng" value = "${dto.lng}">
                     <input type = "hidden" id="sido" name = "sido" value = "${dto.sido}">
                     <input type = "hidden" id="gue" name = "gue" value = "${dto.gue}">
                     <input type = "hidden" id="dong" name = "dong" value = "${dto.dong}">
                   </div>
                   <div class="col-4 text-end">
                     <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
                       <path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
                       </svg>
                   </div>
                 </div>
               </button>
             </div>

             <!-- Modal -->
             <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
               <div class="modal-dialog">
                 <div class="modal-content">
                   <div class="modal-header">
                     <h5 class="modal-title" id="staticBackdropLabel">위치선택</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                     <div id="map"></div>


                     <div id="menu_wrap" class="bg_white">
                       <div class="option">
                         <form onsubmit="searchPlaces(); return false;">
                           <div class="input-group">
                             <input type="text" class="form-control" value="이태원 맛집" id="keyword" size="15"> 
                             <button class="btn btn-outline-dark" type="button" onclick="searchPlaces();">
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

                     <div class="curBtn text-end">
                       <button type="button" class="btn btn-dark" onclick = "curPositionBtn()" >
                          현위치
                         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                           <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                         </svg>
                       </button>
                     </div>

                   </div>
                 </div>
               </div>
             </div>
             
             <div class="col-12 mt-1">
               <input type="text" name="addrDetail" class="form-control" placeholder="상세장소"value="${dto.addrDetail}" required/>
             </div>

             <div class="col-12 mt-3">
               <label class="fw-bold">글 내용</label>
               <input name="title" class="form-control" placeholder="글 제목" value="${dto.title}" required></input>
               <textarea name="contents" class="form-control mt-1" placeholder="글 내용" style="height: 100px" required>${dto.contents}</textarea>
             </div>  

             <div class="col-12 mt-1">
             </div>
             
             <div class ="row my-2">
               <div class = "col-12 text-center">
                   <div class="d-grid gap-2 col-6 mx-auto mt-2">
                     <input class="btn btn-dark" type="button" value = "수정" onclick="imgAddName()"></input>
                   </div>
                 </div>
             </div>
           </div>
         </div>
       </div>
     </div>
   </form>
   
   <!-- JavaScript Bundle with Popper -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da&libraries=services"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script>
     //지도 필드값
     let mapContainer = document.getElementById('map'), // 지도를 표시할 div  
         mapOption = {
             center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
             level: 2 // 지도의 확대 레벨
         };

     let map = new kakao.maps.Map(mapContainer, mapOption);
     
     function openMap(){
       setTimeout(function() {map.relayout();}, 500);
       setTimeout(function() {curPositionBtn();}, 500);
       
     }

   //주소-좌표간 변환 서비스 객체
   let geocoder = new kakao.maps.services.Geocoder();

   // 마커와 인포윈도우
   let marker = new kakao.maps.Marker(); // 클릭한 위치를 표시할 마커입니다
   let infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

   //현위치 btn
   function curPositionBtn(){
     // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
     if (navigator.geolocation) {
       // GeoLocation을 이용해서 접속 위치를 얻어옵니다
       navigator.geolocation.getCurrentPosition(function(position) {
         let nowlat = position.coords.latitude; // 위도
         let nowlng = position.coords.longitude; // 경도

         panTo(nowlat,nowlng);
       });
     } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
       alert('현재 위치 정보를 찾을 수 없습니다.');
     }
   }

   //좌표로 지도 이동
   function panTo(lat, lng) {
     let latlng = new kakao.maps.LatLng(lat,lng)
     map.setLevel(3);
     map.panTo(latlng);
     paintMarker(latlng);            
   }       
   
   // 지도 클릭 이벤트
   kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
     let latlng = mouseEvent.latLng;
     paintMarker(latlng);
     addrDetail = "";
   });


   //마커 그리기 메소드
   function paintMarker(latlng){

     searchDetailAddrFromCoords(latlng, function(result, status) {
       if (status === kakao.maps.services.Status.OK) {
         let detailAddr = !!result[0].road_address ? '<span>' + result[0].road_address.address_name + '</span></br>' : '';
         detailAddr += '<span class="jibun gray"> ' + result[0].address.address_name + '</span>';


         let content = '<div class="bAddr" style="font-size:15px;">' +
                         '<span class="">습득한 곳이 이곳인가요?</span></br>' + 
                         '<div class="info pb-0">' + 
                         detailAddr + '</br></div><div class="text-center">' +
                         '<button type="button" class="btn btn-dark" data-bs-dismiss="modal" onclick="markerClick()">입력</button>' +
                         '</div>' +
                       '</div>';

         // 마커를 클릭한 위치에 표시합니다 
         marker.setPosition(latlng);
         marker.setMap(map);

         // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
         infowindow.setContent(content);
         infowindow.open(map, marker);
         
         // -------------관할구, 관할동, 전체지역명칭
         let sido = result[0].address.region_1depth_name;
         let gue = result[0].address.region_2depth_name;
         let dong = result[0].address.region_3depth_name;
         document.getElementById("lat").value = latlng.getLat();
         document.getElementById("lng").value = latlng.getLng();
         document.getElementById("sido").value = sido;
         document.getElementById("gue").value = gue;
         document.getElementById("dong").value = dong;
         document.getElementById("addrDetail").value = addrDetail;
         // document.getElementById("sidoGueDong").innerHTML = sido+" " + gue + " " + dong;
       }   
     });
   } 
   
   function markerClick() {
     let sido = document.getElementById("sido").value;
     let gue = document.getElementById("gue").value;
     let dong = document.getElementById("dong").value;
     document.getElementById("sidoGueDong").innerHTML = sido+" " + gue + " " + dong;
   }
   
   // 좌표로 법정동 나타내기
   function searchDetailAddrFromCoords(coords, callback) {
     geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
   }

   $('#submitBtn').click(function () {
     if(document.addr_frm.lat.value.length == 0) {
       alert("습득한 장소를 지도에서 클릭해주세요.")
       return;
     }

   document.getElementById("addrForm").submit();
   });


 </script>
<!-- --------------------------------------------------------------------------------------- -->
 <script>
   // 장소 검색 객체를 생성합니다
   var ps = new kakao.maps.services.Places();  

   var markers = [];

   // 키워드로 장소를 검색합니다
 searchPlaces();

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

     
     myCollapse.setAttribute('class','show')
     placesListBtn.setAttribute('aria-expanded','true');
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
 removeMarker();
 
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

 let addrDetail = "";
 // 검색결과 항목을 Element로 반환하는 함수입니다
 function getListItem(index, places) {

     var el = document.createElement('li'),
     itemStr = // '<span class="markerbg marker_' + (index+1) + '"></span>' +
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
     el.addEventListener('click',function(){
       panTo(places.y,places.x);
       addrDetail = places.palce_name;
      });

     return el;
 }

 // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
 function addMarker(position, idx, title) {
     var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
         imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
         imgOptions =  {
             spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
             spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
             offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
         },
         markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
             marker = new kakao.maps.Marker({
             position: position, // 마커의 위치
             image: markerImage 
         });

     marker.setMap(map); // 지도 위에 마커를 표출합니다
     markers.push(marker);  // 배열에 생성된 마커를 추가합니다

     return marker;
 }

 // 지도 위에 표시되고 있는 마커를 모두 제거합니다
 function removeMarker() {
     for ( var i = 0; i < markers.length; i++ ) {
         markers[i].setMap(null);
     }   
     markers = [];
 }

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

 // 이미지 내용========================================================
 const photoBtn = document.getElementById('photoBtn');
 let photoBtnInput = document.getElementById('photoBtnInput');
 const imgCntSpan = document.getElementById('imgCntSpan');
 const preview = document.getElementById('preview');
 let imgCnt = 0;
 let imageIdx = 0;
 

 function setExstImg(){
 let imglis = document.getElementsByClassName('imgli');  
 for (let i = 0; i < imglis.length; i++) {
   const element = imglis[i];
   const label = element.getElementsByTagName('label')[0];
   const fileInput = element.getElementsByTagName('input')[0];
   const closeBtn = element.getElementsByTagName('span')[0];
   
   fileInput.addEventListener('change', function(){
     updateImageDisplay(label,fileInput);
     fileInput.removeAttribute('value');
   });
   closeBtn.addEventListener('click', function(){deleteFileBtn(element)});

   imgCnt++;
   imgCntSpan.innerHTML = imgCnt;
   }
 }  

 setExstImg();  

 function imgAddName(){
   let files = preview.querySelectorAll('input');
   console.log('files.length: '+files.length);
   for (let i = 0; i < files.length; i++) {
     const element = files[i];
     if(element.files.length == 0){element.setAttribute('type','hidden')}
     element.setAttribute('name','image' + i);
   }
   document.getElementById("mForm").submit();
 }

 //이미지 업데이트 이벤트
 photoBtnInput.addEventListener('change', addImageDisplay);


 function addImageDisplay() {
   const { files } = photoBtnInput;

   const curFiles = photoBtnInput.files;
     for(const file of curFiles) {
       const liImg = document.createElement('li');
       liImg.className ="position-relative me-2";
       preview.appendChild(liImg);
       if(validFileType(file)) {

         //이미지
         const image = document.createElement('img');
         image.src = URL.createObjectURL(file);
         image.className = "rounded";

         //기존인풋파일 속성값 변경
         const input = photoBtnInput;
         input.removeEventListener('change', addImageDisplay);
         input.setAttribute('id','imageInput'+imageIdx);

         //새로운 인풋파일 생성
         const inputFile = document.createElement('input');
         inputFile.setAttribute('type','file');
         inputFile.setAttribute('id','photoBtnInput');
         inputFile.setAttribute('accept','.jpg, .jpeg, .png');
         inputFile.addEventListener('change', addImageDisplay);
         photoBtn.appendChild(inputFile);
         photoBtnInput = inputFile;

         //for이벤트 위해 라벨생성
         const label = document.createElement('label');
         label.setAttribute('for','imageInput'+imageIdx)
         
         //삭제버튼
         const closeBtn = document.createElement('span');
         closeBtn.innerHTML = "<svg xmlns=\'http://www.w3.org/2000/svg\' width=\'18\' height=\'18\' fill=\'currentColor\' class=\'bi bi-x-circle-fill position-absolute top-0 start-100 translate-middle\' viewBox=\'0 0 16 16\'><path d=\'M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z\'/></svg>";
         closeBtn.addEventListener('click', function(){deleteFileBtn(liImg)});
         
         //붙이기
         label.appendChild(image);
         label.appendChild(input);
         liImg.appendChild(label);
         liImg.appendChild(closeBtn);

         input.addEventListener('change', function(){updateImageDisplay(label,input)});

       } else {
         alert(`File name ${file.name}: Not a valid file type. Update your selection.`);
       }
       
     }
   imageIdx++;
   imgCnt++;
   imgCntSpan.innerHTML = imgCnt;
   maxPhoto();
 }


 function updateImageDisplay(label,input){
   let element = label.getElementsByTagName("img"), index;

   for (index = element.length - 1; index >= 0; index--) {
       element[index].parentNode.removeChild(element[index]);
   }

   const { files } = input;
   const curFiles = input.files;
     for(const file of curFiles) {
       if(validFileType(file)) {

         //이미지
         const image = document.createElement('img');
         image.src = URL.createObjectURL(file);
         image.className = "rounded";

         //붙이기
         label.appendChild(image);

       } else {
         alert(`File name ${file.name}: Not a valid file type. Update your selection.`);
       }
     }
   if (curFiles.length == 0){
     deleteFileBtn(label.parentNode);
   }
 }


 // 파일 삭제하기
 function deleteFileBtn(liImg){
   preview.removeChild(liImg);
   imgCnt--;
   imgCntSpan.innerHTML = imgCnt;
   maxPhoto();
 }


 const fileTypes = [
     'image/apng',
     'image/bmp',
     'image/gif',
     'image/jpeg',
     'image/pjpeg',
     'image/png',
     'image/svg+xml',
     'image/tiff',
     'image/webp',
     `image/x-icon`
 ];


 function validFileType(file) {
   return fileTypes.includes(file.type);
 }


 function returnFileSize(number) {
   if(number < 1024) {
     return number + 'bytes';
   } else if(number > 1024 && number < 1048576) {
     return (number/1024).toFixed(1) + 'KB';
   } else if(number > 1048576) {
     return (number/1048576).toFixed(1) + 'MB';
   }
 }
 

 function maxPhoto() {
   if(imgCnt == 10 ) {
     photoBtn.setAttribute('for','none');
     photoBtn.classList.add('maxPhoto')
   } else {
     photoBtn.setAttribute('for','photoBtnInput');
     photoBtn.classList.remove('maxPhoto')
   }
 }
 
 //카테고리 관련내용=============================
 $("#cNum").on('change', function(){
     let cdItems = document.getElementsByClassName("cdItems");
     let selectedCNum = document.getElementById("cNum").value;
     $('#cdNum').val("");
     $("#divSN").hide();
     let sn = document.getElementById("sn");
     sn.value="";

     for (let i = 0; i < cdItems.length; i++) {
       cdItems[i].setAttribute("hidden","true");
     }

     for (let i = 0; i < cdItems.length; i++) {
       if(cdItems[i].innerHTML.split('/')[0] == selectedCNum){
         cdItems[i].removeAttribute("hidden");
       }
     }
   });

   $("#divSN").hide();

   $("#cdNum").on('change', function(){
     let cdNumVal = document.getElementById("cdNum").value;
     let cdItems = document.getElementsByClassName("cdItems");

     for (let i = 0; i < cdItems.length; i++) {
       if(cdItems[i].value == cdNumVal){
         if(cdItems[i].innerHTML.split('/')[1] == 'y'){
           //일련번호 나타내기
           $("#divSN").show();
         } else {
           //일련번호 숨기기
           $("#divSN").hide();
           let sn = document.getElementById("sn");
           sn.value="";
         }
       } 
     }
   });

   defCategory();

   //카테고리 선택
   function defCategory(){
     const defCNum = document.getElementById("def-cNum").value;
     const defCdNum = document.getElementById("def-cdNum").value;
     document.getElementById(defCNum).selected = true;
     document.getElementById(defCdNum).selected = true;

     let cdItems = document.getElementsByClassName("cdItems");
     let selectedCNum = document.getElementById(defCNum).value;

     console.log(selectedCNum);
     for (let i = 0; i < cdItems.length; i++) {
       if(cdItems[i].innerHTML.split('/')[0] == selectedCNum){
         cdItems[i].removeAttribute("hidden");
       }
     }
   }
   
   //로그인 확인============================
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