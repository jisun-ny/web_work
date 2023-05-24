<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insertform</title>
</head>
<body>
	<div>
		<h1>방명록 추가(insert) form</h1>
		<form action="insert.jsp" method="post">
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer"/>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="10">내용을 입력하세요.</textarea>
			</div>
			<button type="submit">추가</button>
			
		</form>
	</div>
</body>
</html>