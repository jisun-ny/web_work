<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//1. post방식으로 전송되는 회원의 이름, 주소를 추출한다. // HttpServeletRequest활용 --> request. 해서 기능 활용
    	request.setCharacterEncoding("utf-8");
    	String name = request.getParameter("name"); //input 요소의 name 속성이 같아야함!! name = "name"
    	String addr = request.getParameter("addr"); //name = "addr"
    	
    	//추가할 회원 정보를  MemberDto 객체에 담는다
    	MemberDto dto = new MemberDto();
    	dto.setName(name);
    	dto.setAddr(addr);
    	
    	//2. DB에 저장한다. // MemberDao 클래스에 insert기능을 만들어서 활용
    	MemberDao dao = MemberDao.getInstance();
    	boolean isSuccess = dao.insert(dto); //작업이 성공 여부가 리턴된다.
    	
    	//3. 응답한다. //밑에 html을 활용해서 응답
    	

    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>insert.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5">
	<h1>알림</h1>
	<% if(isSuccess){%>
		<p class = "alert alert-success">
			<strong><%=name %></strong>님의 정보가 저장되었습니다.
			<a class = "alert-link"href="list.jsp">확인</a>
		</p>
	<%}else{%>
		<p class = "alert alert-warning">
			회원정보 저장 실패!
			<a class = "alert-link" href="insertform.jsp">다시 작성</a>
		</p>
		<%}%>
	</div>
</body>
</html>