function infoConfirm() {
	if(document.reg_frm.userId.value.length == 0) {
		alert("아이디는 필수사항 입니다..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.userId.value.length < 4) {
	alert("아이디는 4자 이상 입력하세요..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.pw.value.length == 0) {
		alert("패스워드는 필수사항입니다..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value) {
		alert("패스워드가 일치하지 않습니다..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.name.value.length == 0) {
		alert("닉네임은 필수사항입니다..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.eMail.value.length == 0) {
		alert("메일은 필수사항입니다..");
		reg_frm.userId.focus();
		return;
	}
	
	document.reg_frm.submit();
}

function updateInfoConfirm(){
	if(document.reg_frm.pw.value == ""){
		alert("패스워드를 입력하세요.");
		document.reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value){
		alert("패스워드가 일치하지 않습니다..");
		reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.name.value.length == 0) {
		alert("닉네임은 필수사항입니다..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.eMail.value.length == 0){
		alert("메일은 필수 사항입니다.");
		reg_frm.eMail.focus();
		return;
	}
	
	document.reg_frm.submit();
	
}

//------------------------------------

var geocoder = new kakao.maps.services.Geocoder();

var callback = function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		
//		alert('지역 명칭 : ' + result[0].address_name);
//		alert('행정구역 코드 : ' + result[0].code);
		var addr = document.getElementById("addr");
		var nowaddr = result[0].address_name;
		addr.value = nowaddr;
//        console.log('지역 명칭 : ' + result[0].address_name);
//        console.log('행정구역 코드 : ' + result[0].code);
	}
};

function addrbtn(){
	var lat = document.getElementById("lat");
	var lon = document.getElementById("lon");
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
			
			var nowlat = position.coords.latitude; // 위도
			var nowlon = position.coords.longitude; // 경도

			lat.value = nowlat; // 위도
			lon.value = nowlon; // 경도
			
			geocoder.coord2RegionCode(nowlon , nowlat, callback);
		});
		
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		
		alert('현재 위치 정보를 찾을 수 없습니다.');
	}
}



