<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String pwd = request.getParameter("pwd");
	GuestDto dto = new GuestDto();
	dto.setNum(num);
	dto.setContent(content);
	dto.setWriter(writer);
	dto.setPwd(pwd);
	//GuestDto dto = new GuestDto(num, writer, content, pwd, null); 이렇게 생성자로 전달도 가능.

	//2. db에 수정 반영한다.
	boolean isSuccess = GuestDao.getInstance().update(dto);
	//3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<title>/guest/update.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%
		if (isSuccess) {
		%>
		<p class="alert alert-success">
			<strong><%=writer%></strong> 님이 작성한 글이 수정되었습니다.
		</p>
		<a href="list.jsp">목록보기</a>
		<%
		} else {
		%>
		<p class="alert alert-danger">
			수정 실패 
			<a class="alertlink" href="updateform.jsp?num=<%=num%>">다시 작성</a>
			<a href="list.jsp">리스트로</a>
		</p>
		<%
		}
		%>
	</div>
</body>
</html>