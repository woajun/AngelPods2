//위도, 경도 배열
var fbNum = document.getElementsByClassName("fbNum");
var userId = document.getElementsByClassName("userId");
var cNum = document.getElementsByClassName("cNum");
var cdNum = document.getElementsByClassName("cdNum");
var thumbnailImage = document.getElementsByClassName("thumbnailImage");
var timestamp = document.getElementsByClassName("timestamp");
var sido = document.getElementsByClassName("sido");
var gue = document.getElementsByClassName("gue");
var dong = document.getElementsByClassName("dong");
var addrDetail = document.getElementsByClassName("addrDetail");
var title = document.getElementsByClassName("title");
var contents = document.getElementsByClassName("contents");
var sn = document.getElementsByClassName("sn");
var lat = document.getElementsByClassName("lat");
var lng = document.getElementsByClassName("lng");
var hit = document.getElementsByClassName("hit");
var chatHit = document.getElementsByClassName("chatHit");
var fSatte = document.getElementsByClassName("fState");

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(lat[0].value, lng[0].value), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [];
var overlays = [];

for (var i = 0; i< lat.length;i++){
	 var content = 
	 '<div class="wrap">' + 
     '  <div class="info">' + 
     '    <div class="title">' + 
            title[i].value +
     '      <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
     '    </div>' + 
     '    <div class="body">' + 
     '      <div class="img"><img src="' + thumbnailImage[i].value + '" width=73px height=70px ></div>' + 
     '      <div class="desc">' +
     '        <div class="ellipsis">'+ sido[i].value +' '+ gue[i].value +' '+ dong[i].value + '</div>' + 
     '        <div class="jibun ellipsis">'+addrDetail[i].value + '</div>' + 
     '        <div><a href="f_content_view.do?fbNum='+fbNum[i].value+'" > 게시물보기 </a></div>' + 
     '      </div>' + 
     '    </div>' +    
     '</div>';
		
	positions.push({
		content: content, 
	    latlng: new kakao.maps.LatLng(lat[i].value, lng[i].value)
    });
}
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
    });
    

    // 마커 위에 커스텀 오버레이 생성
    var overlay = new kakao.maps.CustomOverlay({
        position: positions[i].latlng,
        content: positions[i].content,
        map: map
    });
    
    overlay.setMap(null);    

    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, overlay));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(overlay));
    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, overlay));
    
    overlays.push(overlay);
}

var selectedOverlay = null;

function makeClickListener(map,marker, overlay) {
	return function() {
		for (var i = 0; i < overlays.length; i++) {
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
        selectedOverlay.setMap(map);
    };
}

function closeOverlay() {
	for (var i = 0; i < overlays.length; i++) {
		overlays[i].setMap(null);
	}
	selectedOverlay = null;
}


