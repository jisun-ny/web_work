<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Step05_example.jsp</title>
<style>
#dropZone {
	width: 200px;
	height: 200px;
	border: 2px dashed red;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#preview {
	display: none;
	object-fit: cover;
	width: 100%;
	height: 100%;
	border-radius: 20px;
}
</style>

</head>
<body>
	<div class="container">
		<div id="dropZone">
			<p>이미지 파일을 끌어다 놓으세요</p>
			<img src="" id="preview" />
			<!-- mime type이 image/xxx로 시작한다면 이미지라는 것을 알 수 있다. -->
			
		</div>
	</div>
	<ul id="infoList">

	</ul>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$("#dropZone").on("dragover", (e) => {
			e.preventDefault();			
		}).on("drop", (e) => {
			e.preventDefault();
			//drop 된 파일에 대한 정보 얻어오기
			const file = e.originalEvent.dataTransfer.files[0];
			//제이쿼리가 e에 다른 제이쿼리 기능들도 추가했기 떄문에 그냥 e라고 하면 순수한 이벤트객체가 아니다. 따라서 e.originalEvent. 해서 사용
			//drop된 파일명
			const fileName = file.name;
			//drop된 파일의 mime type
			const mimeType = file.type;
			//drop된 파일의 정보를 설명할 문자열을 만들어내기
			const info = `파일명: \${fileName} 파일의 type: \${mimeType}`;
			//li요소를 만들어서 정보를 출력하고 #infoList 요소의 첫번째 자식 요소로 추가하기
			$("<li>").text(info).prependTo("#infoList"); //prependTo 맨 위에다가 붙여넣기
			
			<!-- mime type이 image/xxx로 시작한다면 이미지라는 것을 알 수 있다. -->
			//mimeType이 image로 시작하는 문자열인지 확인할 정규 표현식
			const reg = /^image/;
			//만일 image라는 문자열로 시작하지 않는다면 
			if(! reg.test(mimeType)){
				alert("이미지 파일을 끌어다 놓으세요!");
				return;
			}
			//파일 리더 객체를 생성해서
			const reader = new FileReader();
			//읽어들이고
			reader.readAsDataURL(file);
			//다 읽었을 때 실행할 함수 등록
			reader.onload = (event) => {
				const data = event.target.result;
				$("#preview").attr("src", data).show();
				$("#dropZone p").hide();
			};
		});
		//jqery는 체인형태로 표시할 수 있다.
		
	
		
	</script>
</body>
</html>