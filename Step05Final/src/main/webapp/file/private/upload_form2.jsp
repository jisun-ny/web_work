<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
</head>
<body>
	<div class="container">
		<h3>파일 업로드 폼2 입니다.</h3>
	
		<form action="upload2.jsp" method="post" enctype="multipart/form-data" id="myForm">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
			</div>
			<div>
				<label for="myFile">첨부파일</label>
				<input type="file" name="myFile" id="myFile"/>
			</div>
			<button type="submit">업로드</button>
		</form>
	</div>
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	<script>
		//폼에 "submit"이벤트가 일어날 때 실행할 함수 등록
		document.querySelector("#myForm").addEventListener("submit", (e)=> {
			//폼 전송 막기 --> 제출이 안됨
			e.preventDefault();
			//폼에 입력하거나 선택한 정보를 javascript로 직접 전송하기
			//폼에 입력한 데이ㅓ를 FormData에 담고
			let data = new FormData(e.target); // e.target은 form의 참조값이다.
			//fetch() 함수가 리턴하는 Promise객체를
			/*	
			fetch("upload2.jsp",{
	            method:"post",
	            body:data
	         })
	         .then(res=>res.text()) //json이외의 text는 res.text하면 되고 제이슨은 res.json()해주면 바로 오브젝트로 들어옴
	         .then((data)=>{
	        	 //data는 upload2.jsp 페이지가 응답한 JSON 형식의 문자열이다.
	            console.log(data);
	        	 //JSON.parse() 함수를 이용해서 문자열을 실제 object or array로 변환할 수 있다.
	        	 const result = JSON.parse(data);
	        	 //result는 object
	        	 console.log(result);
	         });
			*/
			
			/*
			//fetch 함수의 사용 법
			fetch("upload2.jsp",{
	            method:"post",
	            body:data
	         })
	         .then(res=>res.json())
	         .then((data)=>{
	        	 //data는 object이다.
	            console.log(data);  	
	         });
			*/
			
			//gura_util.js 안에 있는 ajaxFormPromise 함수를 활용하면 아래와 같다
			//전송할 데이터를 넣어주면 알아서 전송해 주는 함수
			ajaxFormPromise(e.target) //이 함수가 패치 함수가 리턴해주는 그 값으 그대로 리턴해주는 함수이기 때문에. 이 함수를 사용하면서 폼의 참조값만 넣어주면 됨. 대신 폼에다가 액션..등등 타입을 확실히 적어놔야함,
			.then(res=>res.json())
	        .then((data)=>{
	        	 //data는 object이다.
	            console.log(data);  	
	         });
	      });
		// JSON형식으로 된 파일을 전달

	</script>
</body>
</html>