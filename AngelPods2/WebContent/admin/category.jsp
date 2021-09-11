<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% if(request.getAttribute("Valid") == null){ %>
	<jsp:forward page = "a_category_view.do"/>
<% } %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- booststrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<style>

.accordion-button {
    padding: 0px 0px;
    width: 16px;
    display: inline-flex;
    position: relative;
    margin-right: 6px;
}
.accordion-body {padding: 3px 10px;}
.accordion-button:not(.collapsed)::after {background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23212529'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");transform: rotate(-180deg);}
.accordion-button:not(.collapsed) {color: black;    background-color: white;    box-shadow: 0 0 0 0;}
.accordion-item input{ border:0;}
</style>
</head>
<body>

<%-- <div class="container">
	<div class="row">
        <c:forEach items = "${cList}" var="cDto" varStatus="status">
        	<div id="cNum-${cDto.cNum}" value="${cDto.cNum}">${cDto.name}</div>
	        <c:forEach items = "${cDto.cdList}" var="cdDto">
	        	<div value="${cdDto.cdNum}">${cdDto.name}</div>
			</c:forEach>
		</c:forEach>
	</div>
</div> --%>

<div class="container my-3">
    <div class="row">
        <div class="col-6 col-md-6 col-lg-3 pe-0">
			<div class="accordion">
			  <c:forEach items = "${cList}" var="cDto" varStatus="status">
				  <div id="ctgItem-${cDto.cNum}" class="accordion-item">
				      <div class="accordion-body">
				      	<div value="${cDto.cNum}" onclick="selectCtg(${cDto.cNum})">
				      	    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${status.index}" aria-expanded="true"></button>
                            <input type="text" id="cName-${cDto.cNum}" value="${cDto.name}" readonly>
                            <input type="hidden" id="cNum-${cDto.cNum}" value="${cDto.cNum}">
                            <input type="hidden" id="cIdx-${cDto.cNum}" value="${cDto.idx}">
				      	</div>
				      </div>
				    <c:forEach items = "${cDto.cdList}" var="cdDto">
					    <div id="panelsStayOpen-collapse${status.index}" class="sub-ctg-name accordion-collapse collapse show" >
					      <div class="accordion-body">
				        	<div value="${cdDto.cdNum}" onclick="selectSubCtg(${cdDto.cdNum})">
                              <span id="subCtgName-${cdDto.cdNum}">${cdDto.name}</span>
				        	  <input type="hidden" id="cdNum-${cdDto.cdNum}" value="${cdDto.cdNum}">
				        	  <input type="hidden" id="cdCNum-${cdDto.cdNum}" value="${cdDto.cNum}">
	                          <input type="hidden" id="cdName-${cdDto.cdNum}" value="${cdDto.name}">
	                          <input type="hidden" id="cdNeedSN-${cdDto.cdNum}" value="${cdDto.needSN}">
	                          <input type="hidden" id="cdIdx-${cdDto.cdNum}" value="${cdDto.idx}">
				        	</div>
					      </div>
					    </div>
					</c:forEach>
				  </div>
			  </c:forEach>
			</div>
        </div>
        
        <div id="ctgBox" class="col-6 col-md-6 col-lg-6 ">
            <div class="px-3 border rounded py-3 my-3">
                <dl>
                    <dt>대분류명</dt>
                    <dd>
                        <input id="ctgBox-cName" type="text">
                    </dd>
 
                </dl>
 
                <button onclick="modifyCtg()">수정</button>
                <button id="ctgBox-delete">삭제</button>
            </div>
            <div class="text-end">
                <button>적용</button>
                <button>취소</button>
                
            </div>
        </div>
        <div id="subCtgBox" class="col-6 col-md-6 col-lg-6 ">
            <div class="px-3 border rounded py-3 my-3">
                <dl>
                    <dt>소분류명</dt>
                    <dd>
                        <input id="subCtgBox-cdName" type="text">
                    </dd>
                    
                    <dt>일련번호</dt>
                    <dd >
                        <input type="radio" name="needSn" id="pub_c1"><label for="pub_c1">사용</label>
                        <input type="radio" name="needSn" id="pub_c2" checked><label for="pub_c2" >미사용</label>
                    </dd>

                    <dt>기본 이미지</dt>
                    <dd>
                        <input type="file">
                    </dd>
                </dl>
 
                <button onclick="modifySubCtg()">수정</button>
                <button>삭제</button>
            </div>
            <div class="text-end">
                <button>적용</button>
                <button>취소</button>
                
            </div>
        </div>
        
    </div>
</div>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

const ctgBox = document.getElementById('ctgBox');
const ctgBoxCName = document.getElementById("ctgBox-cName");
const ctgBoxModBtn = document.getElementById('ctgBox-modify');
const ctgBoxdelBtn = document.getElementById('ctgBox-delete');



let sltItem;
let sltNum;
let sltName;
let sltIdx;

function selectCtg(cNum){
    if(!subCtgBox.hasAttribute('hidden')){
        subCtgBox.setAttribute('hidden','true');
    }
    if(ctgBox.hasAttribute('hidden')){
        ctgBox.removeAttribute('hidden')
    }

    sltItem = document.getElementById('ctgItem-'+cNum);
    sltNum = document.getElementById('cNum-'+cNum);   
    sltName = document.getElementById('cName-'+cNum);   
    sltIdx = document.getElementById('cIdx-'+cNum);

    ctgBoxCName.value = sltName.value;
}

function modifyCtg(){
    sltName.value = ctgBoxCName.value;
}

function deleteCtg(){
 
}

let sltCdItem;
let sltCdNum;
let sltCNum;
let sltCdName;
let sltCdNSN;
let sltCdIdx;

const subCtgBox = document.getElementById('subCtgBox');
const subCtgBoxCName = document.getElementById("subCtgBox-cName");
const subCtgBoxCdName = document.getElementById("subCtgBox-cdName");
const subCtgBoxModBtn = document.getElementById('subCtgBox-modify');
const subCtgBoxdelBtn = document.getElementById('subCtgBox-delete');

function selectSubCtg(cdNum){
    if(!ctgBox.hasAttribute('hidden')){
        ctgBox.setAttribute('hidden','true')
    }

    if(subCtgBox.hasAttribute('hidden')){
        subCtgBox.removeAttribute('hidden');
    }

    /* sltCdItem = document.getElementById('ctgItem-'+cdNum); */
    sltCdNum = document.getElementById('cdNum-'+cdNum);
    sltCNum = document.getElementById('cNum-'+cdNum);
    sltCdName = document.getElementById('cdName-'+cdNum);
    sltCdNSN = document.getElementById('cdNSN-'+cdNum);
    sltCdIdx = document.getElementById('cdIdx-'+cdNum);

    subCtgBoxCdName.value = sltCdName.value;
}

</script>
</body>
</html>