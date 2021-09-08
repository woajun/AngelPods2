<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem") != null){ %>
<script>
alert("로그인 상태에는 회원가입 할 수 없습니다.")
location.href="../index.html";
</script>
<% } %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤팟 : 회원가입</title>

<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">


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
    <div style="padding-top: 60px;"></div>


    <!-- 회원가입 설명 -->


    <div class="container">
      <div class="row justify-content-center">
        <div class="py-2 text-center">
          <h2 class = "py-3">회원가입</h2>
          <p class="lead">환영합니다! 최고의 분실물 조회 서비스를 제공하기 위해 최선을 다하겠습니다.</p>
        </div>
        
        <div class="col-lg-8 ">
          <hr>
          <h4 class="mb-3">필수정보</h4>
          <form action = "join.do" id="joinForm" method = "post" name = "reg_frm" >
            <div class="row g-3">
              
              <div class="col-12">
                <label for="userId" class="form-label">ID</label>
                <input type="text" class="form-control need-validate" id="userId" name="userId" placeholder="영어,숫자 4~15자" minlength="4"maxlength="15" required>
                <div class="invalid-feedback">
                  영어 소문자와 숫자로 4자 이상, 15자 이내로 입력해주세요.
                </div>
              </div>

              <div class="col-sm-6">
                <label for="pw" class="form-label">password</label>
                <input type="password" class="form-control pw need-validate" id="pw" name="pw" placeholder="비밀번호" minlength="4" required>
                <div class="invalid-feedback">
                  비밀번호는 4자 이상 입력해주세요.
                </div>
              </div>
          
              <div class="col-sm-6 ">
                <label for="pwChk" class="form-label">password-check</label>
                <input type="password" class="form-control pw need-validate" id="pwChk" placeholder="비밀번호 확인" value=""  required>
                <div class="invalid-feedback">
                  비밀번호가 일치하지 않습니다.
                </div>
              </div>

              <div class="col-12">
                <label for="username" class="form-label">Username</label>
                <div class="input-group has-validation">
                  <input type="text" class="form-control need-validate" id="name" name="name" placeholder="닉네임 입력" maxlength ="15" required="" >
                <div class="invalid-feedback">
                    닉네임을 입력해주세요.(2~15자)
                  </div>
                </div>
              </div>
              
              <div class="col-12">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control need-validate" id="eMail" name = "eMail" placeholder="honggildong@example.com" required>
                <div class="invalid-feedback">
                  올바른 이메일 주소를 입력해주세요.
                </div>
              </div>
              
              <div class="col-12">
                <label for="address" class="form-label">초기 검색 위치</label>
                <!-- <div class="form-check">
                  <input type="checkbox" class="form-check-input" id="same-address">
                  <label class="form-check-label" for="same-address">위치정보제공동의</label>
                </div> -->

                <div class="form-check mb-3">
                  <input type="checkbox" class="form-check-input" id="addrChk" onclick="addrChkFunc()" required>
                  <label class="form-check-label">위치정보제공동의<span class="text-muted"> (현재 위치를 얻기위해, 위치정보 제공에 동의해주세요)</span></label>
                </div>
                
                <div class="input-group mb-3">
                  <button class="btn btn-secondary" type="button" id="addrBtn" name = "addr" onclick="addrBtnFunc()" disabled>동네확인</button>
                  <input id="addrVO" type="text" class="form-control bg-white" placeholder="버튼을 누르면, 현재 위치가 입력됩니다." readonly>
                </div>
              </div>  

              <input type = "hidden" id ="lat" name = "lat" /><br/>
              <input type = "hidden" id ="lng" name = "lng" /><br/>

            <!-- <button class="w-100 btn btn-primary btn-lg mb-5" type="submit" onclick = "infoConform()">회원정보 등록하기</button> -->
            <input id = "submitBtn" class="w-100 btn btn-primary btn-lg mb-5" type="button" value="회원정보 등록하기">
          </form>
        </div>
      </div>
    </div>
    
        <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da&libraries=services"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
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
      var lng = document.getElementById("lng");
      // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
      if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
          
          var nowlat = position.coords.latitude; // 위도
          var nowlng = position.coords.longitude; // 경도

          lat.value = nowlat; // 위도
          lng.value = nowlng; // 경도
          
          geocoder.coord2RegionCode(nowlng , nowlat, callback);
        });
        
      } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
        alert('현재 위치 정보를 찾을 수 없습니다.');
      }
    }
    
    </script>
    <script>
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