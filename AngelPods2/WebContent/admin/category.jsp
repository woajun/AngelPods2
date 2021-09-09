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

.accordion-button {padding: 3px 10px;}
.accordion-body {padding: 3px 20px;}
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
				  <div class="accordion-item">
				    <h2 class="accordion-header" >
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${status.index}" aria-expanded="true">
				      	<div id="cNum-${cDto.cNum}" value="${cDto.cNum}">${cDto.name}</div>
				      </button>
				    </h2>
				    <c:forEach items = "${cDto.cdList}" var="cdDto">
					    <div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse show" >
					      <div class="accordion-body">
				        	<div value="${cdDto.cdNum}">${cdDto.name}</div>
					      </div>
					    </div>
					</c:forEach>
				  </div>
			  </c:forEach>
			</div>
        </div>
        
        <div class="col-6 col-md-6 col-lg-6 ">
            <div id="changeBox" class="px-3 border rounded py-3 my-3">
                <dl>
                    <dt>대분류명</dt>
                    <dd>
                        <input id="cNameBox" type="text">
                    </dd>
 
                    <dt>소분류명</dt>
                    <dd>
                        <input id="ipt-cdName" type="text">
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
 
                <button onclick="cSltChange()">수정</button>
                <button>삭제</button>
            </div>
            <div class="text-end">
                <button>적용</button>
                <button>취소</button>
                
            </div>
        </div>
        
    </div>
</div>

<!--
<div class="container my-3">
    <div class="row">
        <div class="col-6 col-md-4 col-lg-3 pe-0">
            <select id="cSlt" class="form-select" size="8">
              <option id="cNum-0" value="0" >무선이어폰</option>
              <option id="cNum-1" value="1">지갑</option>

              <c:forEach items = "${cList}" var="cDto">
                <option id="cNum-${cDto.cNum}" value="${cDto.cNum}">${cDto.name}
                </option>
			  </c:forEach>
            </select>
            <div class="text-end">
	          <button>+</button>
	          <button>△</button>
	          <button>▽</button>
            </div>
         </div>
         <div class="col-6 col-md-4 col-lg-3 ps-0 ">
             <select id="cdSlt" class="form-select" size="8">
                 <option value="0">Open this select menu</option>
                 <option value="1">One</option>
                 <option value="2">Two</option>
                 <option value="3">Three</option>
             </select>
             <div class="text-end">
                 <button>+</button>
                 <button>△</button>
                 <button>▽</button>
             </div>
         </div>
 -->
         <div class="col-12 col-md-4 col-lg-6 ">
            <div id="changeBox" class="px-3 border rounded py-3 my-3">
                <dl>
                    <dt>대분류명</dt>
                    <dd>
                        <input id="cNameBox" type="text">
                    </dd>
<!-- 
                    <dt>소분류명</dt>
                    <dd>
                        <input id="ipt-cdName" type="text">
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
 -->
                <button onclick="cSltChange()">수정</button>
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
const cSlt = document.getElementById('cSlt');
const cNameBox = document.getElementById('cNameBox');
let cName;

cSlt.addEventListener('change',function(){cSltView(this)});

function cSltView(item){
    cName = document.getElementById('cNum-'+item.value).innerHTML;
    cNameBox.value=cName;
}

function cSltChange(){
    cName = document.getElementById('cNum-'+cSlt.value);
    cName.innerHTML = cNameBox.value;
}


//ajax로 cd값 가져오기
</script>
</body>
</html>