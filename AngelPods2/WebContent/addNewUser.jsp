<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>
  <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		
		<label for="title"><b>제목</b>
		<input type="text" id="title" class="form-control" placeholder="다음"></label><br>
		<label for="address"><b>주소</b>
		<input type="text" id="address" class="form-control" placeholder="https://daum.net"></label><br>
		
		<%-- submit 버튼: 클릭시 폼태그 액션이 수행됨 --%>
		<p><input type="button" id="addBtn" class="btn btn-success" value="추가"></p>
	</div>
		
<script>
$(document).ready(function() {
	
    // (2) jqeury의 AJAX 통신을 이용하기
	$('#addBtn').on('click', function(e) {
		e.preventDefault(); // submit 되는 것을 막는다.
		
		var title = $('#title').val().trim();
		if (title == '') {
			alert("제목을 입력하세요.");
			return;
		}
		
		// validation
		var add = $('#address').val().trim(); // 주소를 가져와서 공백 제거
		//alert(name);
		console.log(add.indexOf('http'));
		if (add.indexOf('http')==-1) {
			
			alert("http 또는 https 로 프로토콜을 입력하세요.");
			return;
		}
		
		
		// AJAX: 폼태그와 상관없이 비동기로 별도 요청(request)  
		$.ajax({
			type: "POST",
			url: "add_bookmark.do",
			data: {"add":add, "title":title},
			success: function(data) {
				location.href = "index.jsp"
			},
			error: function(e) {
				alert("error " + e);
			}
		});
	});
});
</script>
	

</body>
</html>