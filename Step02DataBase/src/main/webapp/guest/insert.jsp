<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	//1. 폼 전송되는 방명록 작성자, 글 내용, 비밀번호를 읽어온다
	//2. DB에 저장한다 ( -> dao에 만들어서 사용!)
	//3. 응답한다.
%>	
	
<%request.setCharacterEncoding("utf-8");%>

<%
//1.
String writer = request.getParameter("writer"); //request는 jsp에서 쓸수있는 기본 객체
String content = request.getParameter("content");
String pwd = request.getParameter("pwd");
%>
<%
//2.
//위의 3개의 정보를 dto에 담아서
GuestDto dto = new GuestDto();
dto.setWriter(writer);
dto.setContent(content);
dto.setPwd(pwd);
//dto채로 dao에 전달한다.
GuestDao dao = GuestDao.getInstance();

boolean isSuccess = dao.insert(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<title>/guest/insert.jsp</title>
</head>
<body>
	<!-- 이 주석은 웹브라우저에게 출력되지만 웹브라우저가 무시하는 주석 -->
	<%-- 이 주석은 jsp 페이지가 무시하는 주석(웹 브라우저에 출력되지 않는다.) --%>
	<%-- javascript로 응답하기 --%>
	<script>
		<% if(isSuccess) { %>
		<%--여기 출력된 문자열은 클라이언트가 javascript로 해석하기 떄문에 js문법에 어긋나면 안된다. --%>
		//알림창 띄우기
			alert("글을 성공적으로 등록했습니다.");
		//javascript로 페이지 이동
			location.href="${pageContext.request.contextPath }/guest/list.jsp";
		<%}else {%>
		<%--여기 출력된 문자열은 클라이언트가 javascript로 해석하기 떄문에 js문법에 어긋나면 안된다. --%>
			alert("등록 실패");
			location.href="${pageContext.request.contextPath }/guest/insertform.jsp";
		<%}%>
	</script>
	
	<%--
	<div class="container">
		<h1>알림</h1>
		<%
		if (isSuccess) {
		%>
		<p class="alert alert-success">
			<strong><%=writer%></strong> 님의 방명록이 저장되었습니다.
		</p>
		<a href="list.jsp">리스트로</a>
		<%
		} else {
		%>
		<p class="alert alert-success">글 작성 실패</p>
		<a href="insertform.jsp">다시 작성</a>
		<%
		}
		%>
	</div>
	--%> 
</body>
</html>