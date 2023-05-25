<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	//1.수정할 글 번호를 읽어온다
	int num = Integer.parseInt(request.getParameter("num"));
	
	//2. 글 번호에 해당하는 글의 정보를 DB에서 얻어온다.
	GuestDto dto = GuestDao.getInstance().getData(num);
	//3. 수정 폼을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/update_form.jsp</title>
</head>
<body>
	<div class="container">
		<h1>글 수정 페이지 입니다.</h1>

		<form action="${pageContext.request.contextPath }/guest/update.jsp" method="get">
			<div>
				<label for="num">글번호</label>
				<input type="text" id="num" value ="<%=dto.getNum()%>" name="num" readonly>
			</div>
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" value="<%=dto.getWriter()%>" name="writer">
			</div>
			<div>
				<label for="pwd">글 작성시 입력했던 비밀번호</label>
				<input type="password" id="pwd" name="pwd">
			</div>
			<div>
				<label for="content">내용</label>
				<textarea id="content" name="content" rows = "5"><%=dto.getContent()%></textarea>
			</div>
			<button type="submit">수정</button>
			<button type="reset">지우기</button>
		</form>

		<a href="list.jsp">글 목록으로</a>
	</div>
</body>
</html>