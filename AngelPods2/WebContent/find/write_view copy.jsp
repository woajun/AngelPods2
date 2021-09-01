<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem") == null){ %>
<script>location.href="../member/login.jsp";</script>
<% } %>     
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>엔젤팟 : 기기등록</title>
      
      <!-- Bootstrap core CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
      <style>
        
        #preview img{
          width: 73px;
          height: 73px;
          object-fit:cover;
        }
        
        #photoBtn{
          width: 73px;
          height: 73px;
          color: darkgrey;
          background-color: white;
        }

        #photoBtn:hover {
          background-color: #f1f1f1;
        }
        
        .form-control-hover:hover{
          background-color: #f1f1f1;
        }

        .selectImage{
          outline: 3px solid yellow;
        }

        /* 스크롤바 만들기 =============== */
        #tab ul{
          white-space:nowrap; 
          overflow-x: auto; 
          text-align:start;
          padding: 0px;
          padding-bottom: 2px;
        }

        #tab ul li{
          display:inline-block; 
          color: darkgrey;
        }

        #tab ul li img:hover:not(.fileSelector){
          opacity: 0.3;
        }

        #tab ul li span:hover{
          opacity: 0.5;
        }

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

        .maxPhoto {
          background-color: #f1f1f1 !important;
        }
        #preview input {
          display: none;
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
    <form action = "f_write_action.do" method = "post" enctype="multipart/form-data">
        <div class="container my-3">
        </div>
        <div class="text-center">
          <h3>습득 게시물 등록</h3>
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
                  </ul>
                </div>
              </div>

              <div class="col-12">
                <div class="row">
                  <label class="fw-bold">카테고리</label>
                  <div class="col-6">
                    <select id="cNum" name = "cNum" class="form-select" required>
                      <option selected disabled value="">대분류</option>
                      <c:forEach items = "${cList}" var="cDto">
                        <option value="${cDto.cNum}">${cDto.name}</option>
                      </c:forEach>
                    </select>

                  </div>
                  <div class="col-6">
                    <select id="cdNum" name="cdNum" class="form-select" required>
                      <option selected disabled value="">소분류</option>
                      <c:forEach items = "${cdList}" var="cdDto">
                        <option class ="cdItems" value="${cdDto.cdNum}" label="${cdDto.name}" hidden="true">${cdDto.cNum}/${cdDto.needSN}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="mt-1 "id="divSN" style="display: none;">
                  <input class="form-control" type = "text" id = "sn" name = "sn" size = "50" placeholder="일련번호">
                </div>
              </div>
              
              <div class="col-12 mt-3 ">
                <label class="fw-bold">위치</label>
                <a class="form-control form-control-hover" style="text-decoration: none;" href="../find/write_addr_view.jsp">
                  <div class="row justify-content-between">
                    <div class="col-8">
                      ${param.sido} ${param.gue} ${param.dong}
                      <input type = "hidden" name = "lat" value = "${param.lat}">
                      <input type = "hidden" name = "lng" value = "${param.lng}">
                      <input type = "hidden" name = "sido" value = "${param.sido}">
                      <input type = "hidden" name = "gue" value = "${param.gue}">
                      <input type = "hidden" name = "dong" value = "${param.dong}">
                    </div>
                    <div class="col-4 text-end">
                      <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
                        <path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
                        </svg>
                    </div>
                  </div>
                </a>
              </div>
              
              <div class="col-12 mt-1">
                <input type="text" name="addrDetail" class="form-control" placeholder="상세장소"value="${param.addrDetail}" required/>
              </div>

              <div class="col-12 mt-3">
                <label class="fw-bold">글 내용</label>
                <input name="title" class="form-control" placeholder="글 제목" required></input>
                <textarea name="contents" class="form-control mt-1" placeholder="글 내용" style="height: 100px" required></textarea>
              </div>  

              <div class="col-12 mt-1">
              </div>
              
              <div class ="row my-2">
                <div class = "col-12 text-center">
                    <div class="d-grid gap-2 col-6 mx-auto mt-2">
                      <input class="btn btn-dark" type="submit" value = "등록" onclick="imgAddName()"></input>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
    
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>

    function imgAddName(){
      let files = preview.querySelectorAll('input');
      console.log(files);
      for (let i = 0; i < files.length; i++) {
        const element = files[i];
        element.setAttribute('name','image' + i);
      }
    }

    const photoBtn = document.getElementById('photoBtn');
    let photoBtnInput = document.getElementById('photoBtnInput');
    const imgCntSpan = document.getElementById('imgCntSpan');
    const preview = document.getElementById('preview');
    let imgCnt = 0;
    let imageIdx = 0;


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
        var cdItems = document.getElementsByClassName("cdItems");
        var selectedCNum = document.getElementById("cNum").value;
        $('#cdNum').val("");
        $("#divSN").hide();
        var sn = document.getElementById("sn");
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
        var cdNumVal = document.getElementById("cdNum").value;
        var cdItems = document.getElementsByClassName("cdItems");

        for (let i = 0; i < cdItems.length; i++) {
          if(cdItems[i].value == cdNumVal){
            if(cdItems[i].innerHTML.split('/')[1] == 'y'){
              //일련번호 나타내기
              $("#divSN").show();
            } else {
              //일련번호 숨기기
              $("#divSN").hide();
              var sn = document.getElementById("sn");
              sn.value="";
            }
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
  </body>
</html>