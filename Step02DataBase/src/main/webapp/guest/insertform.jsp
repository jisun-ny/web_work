<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insertform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>방명록 추가(insert) form</h1>
		<form action="${pageContext.request.contextPath }/guest/insert.jsp" method="post">
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer"/>
				<!-- submit을 하면 writer라는 parameter로 input입력값이 insert.jsp로 넘어감 -->
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="10">내용을 입력하세요.</textarea>
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="text" id="pwd" name="pwd"/>
			</div>
			<button type="submit">등록</button>
			
		</form>
	</div>
</body>
</html>