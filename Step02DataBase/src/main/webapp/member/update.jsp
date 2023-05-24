<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 깨지지 않도록
	request.setCharacterEncoding("utf-8");
	//1. form 전송되는 수정할 회원의 정보 얻어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	//얘네를 따로 저장하지 않고 MemberDto에 넣어서 MemberDao에 수정반영 메소드를 만들어서 여기에 전달!
	MemberDto dto = new MemberDto(num, name, addr);
	boolean isSuccess = MemberDao.getInstance().update(dto);
	//2. DB에 수정 반영한다.
	
	//3. 결과를 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/update.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5">
	<!-- margin top 5단계 ( 1단계: 4px, 2:8px, 3: 16px, 4: 32px 5:64px -->
		<h1>알림</h1>
		<%if(isSuccess){ %>
		 <p class = "alert alert-success">
		 	<strong><%=num %></strong>번 회원의 정보를 수정했습니다.
		 	<a  class = "alert alert-link" href="list.jsp">목록보기</a>
		 </p>
		<%} else {%>
		 <p class = "alert alert-danger">
		 	 수정실패!
		 	 <a class = "alert alert-link" href ="updateform.jsp?num=<%=num%>">다시 수정</a>
		 </p>
		 <%} %>
	</div>
</body>
</html>