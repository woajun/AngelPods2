let boardItem = document.getElementsByClassName("boardItem");
let fbNum = document.getElementsByClassName("fbNum");
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
let fSatte = document.getElementsByClassName("fState");

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

curPositionBtn();

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
  map.panTo(moveLatlng);            
}       





// //주소-좌표간 변환 서비스 객체
// let geocoder = new kakao.maps.services.Geocoder();

// //현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
// searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
// function displayCenterInfo(result, status) {
//     if (status === kakao.maps.services.Status.OK) {
//         let infoDiv = document.getElementById('centerAddr');

//         for(let i = 0; i < result.length; i++) {
//             // 행정동의 region_type 값은 'H' 이므로
//             if (result[i].region_type === 'H') {
//               // alert(map.getCenter());
//                 // infoDiv.innerHTML = result[i].address_name;
//                 break;
//             }
//         }
//     }    
// }
// //중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
// kakao.maps.event.addListener(map, 'idle', function() {
//     searchAddrFromCoords(map.getCenter(), displayCenterInfo);
// });

// function searchAddrFromCoords(coords, callback) {
//     // 좌표로 행정동 주소 정보를 요청합니다
//     geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
// }



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