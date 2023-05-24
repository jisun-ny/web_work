<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String context = request.getParameter("context");
	
	GuestDto dto = new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	
	GuestDao dao = GuestDao.getInstance();
	boolean isSuccess = dao.insert(dto);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>insert.jsp</title>
</head>
<body>
	<div>
	<h1>알림</h1>
	<% if(isSuccess) { %>
		<p>
			<strong><%=writer %></strong>님이 작성하신 방명록이 등록되었습니다.
			<a href="list.jsp">확인</a>
		</p>	
	<%} else {%>
		<p>저장에 실패했습니다.
			<a href="insertform.jsp">다시 작성</a>
		</p>
		<%}%>
	</div>
</body>
</html>