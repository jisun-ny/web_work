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
</style>

</head>
<body>
	<div class="container">
		<div id="dropZone">
			<p>파일을 끌어다 놓으세요</p>
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
			
		});
		//jqery는 체인형태로 표시할 수 있다.
		
	
		
	</script>
</body>
</html>