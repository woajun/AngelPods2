<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem") == null){ %>
<script>
alert("로그인이 필요합니다.");
location.href="../member/login.jsp?url=${pageContext.request.requestURL}";
</script>
<% } %> 
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <title>엔젤팟 : 기기등록</title>
      
      <!-- Bootstrap core CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
      <style>
        .title {font-weight:bold;display:block;}
        .curBtn {position:fixed;right:4vh;top:10px;border-radius: 2px; z-index:1;padding:5px; margin-top: 55px;}
        .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        #map {width:100%; height:100vh; z-index:-1; overflow:hidden;}
        #mapBody {width:100%;height:91vh;position:fixed;margin-top: 55px;}
      </style>
      <style><!-- 지도검색창 -->
        .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
        .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
        .map_wrap {position:relative;width:100%;height:500px;}
        #menu_wrap {position:absolute;top:0;left:0;width:300px;margin:10px 0 150px 10px;padding:5px;overflow-y:hidden;background:rgba(255, 255, 255, 0.7);z-index: 2;font-size:12px;border-radius: 10px;}
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

    <div class="postion-relative" id = "mapBody" >
      <div id="map">
      </div>

      <div id="menu_wrap" class="bg_white">
        <div class="option">
          <form onsubmit="searchPlaces(); return false;">
            <div class="input-group">
              <input type="text" class="form-control" value="이태원 맛집" id="keyword" size="15"> 
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

      <form action = "f_write_view.do" method = "post" name="addr_frm" id="addrForm">
        <div class="container position-absolute bottom-0 start-50 translate-middle-x">
            <div class="row justify-content-center position-relative" >
              <div class="col-lg-6 form-control" >
                <div class="col-12 fw-bold">
                  <label>선택된 주소 : <span id = "selectAddr" >지도를 클릭하세요.</span></label><br/>
                  <input class="form-control" type = "text" id="addrDetail" name = "addrDetail" placeholder = "발견한 상세위치 입력 : 예시) 버스정류장에서 발견했어요"></input>
                </div>
                <div class ="row my-2">
                    <div class = "col-12 text-center">
                      <div class="d-grid gap-2 col-6 mx-auto mt-2">
                        <input id = "submitBtn" class="btn btn-dark" type="button" value = "확인">
                      </div>
                    </div>
                </div>
              </div>
            </div>
        </div>
        <input type ="hidden" id= "lat" name="lat">
        <input type ="hidden" id= "lng" name="lng">
        <input type ="hidden" id= "selectSido" name="sido">
        <input type ="hidden" id= "selectGue" name="gue">
        <input type ="hidden" id= "selectDong" name="dong">
      </form>
    </div>



    <div class="curBtn text-end">
      <button type="button" class="btn btn-dark" onclick = "curPositionBtn()" >
       	현위치
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
          <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
        </svg>
      </button>
    </div>

    <!-- JavaScript Bundle with Popper -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da&libraries=services"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script>

	  curPositionBtn();
	  
      //지도 필드값
      let mapContainer = document.getElementById('map'), // 지도를 표시할 div  
          mapOption = {
              center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
              level: 2 // 지도의 확대 레벨
          };

      //지도생성
      let map = new kakao.maps.Map(mapContainer, mapOption);

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
      
      //마커 그리기 메소드
      function paintMarker(latlng){

        searchDetailAddrFromCoords(latlng, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                let detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                
                let content = '<div class="bAddr">' +
                                '<span class="title">습득 주소정보</span>' + 
                                detailAddr + 
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
                document.getElementById("selectSido").value = sido;
                document.getElementById("selectGue").value = gue;
                document.getElementById("selectDong").value = dong;
                document.getElementById("selectAddr").innerHTML = sido+" " + gue + " " + dong;
            }   
        });
      } 

    
      // 지도 클릭 이벤트
      kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        let latlng = mouseEvent.latLng;
        paintMarker(latlng);
      });
      
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