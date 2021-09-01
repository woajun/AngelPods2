let checkBox = document.getElementById("addrChk");

let button = document.getElementById("addrBtn");

addrChkFunc();

function addrChkFunc(){

    if(checkBox.checked == true) {
      button.disabled = false;
    } else {
      button.disabled = true;
    }
  }

  
  
  
  //클릭하면 was-validated

  $('.need-validate').focus(function(){
    if($(this).hasClass("is-valid")){
    } else {
      $(this).addClass("is-invalid");
    }
  });

  //아이디
  $('#userId').on("propertychange change keyup paste input", function () {
    var userId = $(this).val();
    if(userId.length > 3 ){
      $(this).removeClass("is-invalid");
      $(this).addClass("is-valid");
    } else {
      $(this).removeClass("is-valid");
      $(this).addClass("is-invalid");
    }
  });

  //비밀번호
  $('#pw').on("propertychange change keyup paste input", function () {
    var pw = $(this).val();
    var pwChk = $("#pwChk").val();
    if(pw.length > 3){
      $(this).removeClass("is-invalid");
      $(this).addClass("is-valid");
      if(pw==pwChk){
        $("#pwChk").removeClass("is-invalid");
        $("#pwChk").addClass("is-valid");
      } else {
        $("#pwChk").removeClass("is-valid");
        $("#pwChk").addClass("is-invalid");
      }
    } else {
      $(this).removeClass("is-valid");
      $(this).addClass("is-invalid");
    }
  });

  //비밀번호 확인
  $('#pwChk').on("propertychange change keyup paste input", function () {
    var pw = $("#pw").val();
    var pwChk = $(this).val();
    if(pw == pwChk){
      $(this).removeClass("is-invalid");
      $(this).addClass("is-valid");
    } else {
      $(this).removeClass("is-valid");
      $(this).addClass("is-invalid");
    }
  });

  //닉네임을 입력해주세요.
  $('#name').on("propertychange change keyup paste input", function () {
    var name = $(this).val();
    if(name.length > 1){
      $(this).removeClass("is-invalid");
      $(this).addClass("is-valid");
    } else {
      $(this).removeClass("is-valid");
      $(this).addClass("is-invalid");
    }
  });

  //이메일을 입력해주세요.
  function validateEmail(email) {
    const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
  }

  $('#eMail').on("propertychange change keyup paste input", function () {
    var eMail = $(this).val();
    if(validateEmail(eMail)){
      $(this).removeClass("is-invalid");
      $(this).addClass("is-valid");
    } else {
      $(this).removeClass("is-valid");
      $(this).addClass("is-invalid");
    }
  });

  $('#submitBtn').click(function () {

        if(document.reg_frm.userId.value.length == 0) {
          reg_frm.userId.focus();
          return;
        }
        
        if(document.reg_frm.userId.value.length < 4) {
          reg_frm.userId.focus();
          return;
        }
        
        if(document.reg_frm.pw.value.length < 4) {
          reg_frm.pw.focus();
          return;
        }
        
        if(document.reg_frm.pw.value != document.reg_frm.pwChk.value) {
          reg_frm.pwChk.focus();
          return;
        }
        
        if(document.reg_frm.name.value.length < 2) {
          reg_frm.name.focus();
          return;
        }
        
        if(validateEmail(document.reg_frm.eMail.value)) {
        } else {
          reg_frm.eMail.focus();
          return;
        }
        
        document.getElementById("joinForm").submit();
      });
      
   // -------------------------------------------
  
  var geocoder = new kakao.maps.services.Geocoder();
  
  var callback = function(result, status) {
  if (status === kakao.maps.services.Status.OK) {
    
    var addr = document.getElementById("addrVO");
    var nowaddr = result[0].address_name;
    addr.value = nowaddr;
  }
};

function addrBtnFunc(){
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

