<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	

	String writer = (String)session.getAttribute("id");
	String title = request.getParameter("title");
	
	CafeDto dto = new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	
	boolean isSuccess = CafeDao.getInstance().insert(dto);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<%if(isSuccess) {%>
	<p><%=writer %>님이 저장한 제목:<%=title %> 글이 저장 되었습니다. <a href="/cafe/list.jsp">확인</a></p>
	
	<%} else {%>
	<p>저장 실패하였습니다. <a href="insertform.jsp">다시 작성</a></p>
	<%} %>
</body>
</html>