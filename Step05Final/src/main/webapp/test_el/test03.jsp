<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//CafeDto 객체를 생성해서 글 하나의 정보를 담고
	CafeDto dto = new CafeDto();
	dto.setNum(1);
	dto.setWriter("김구라");
	dto.setTitle("나는 구라다");
	
	//"dto"라는 키 값으로 request scope에 담기
	request.setAttribute("dto", dto);
%>    
<%--여기 위 내용은 Servlet 아래는 jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_el/test03.jsp</title>
</head>
<body>
	<div class="container">
	
	<%--EL을 사용하지 않고 dto에 담은 값 출력하기 --%>
		<% 
			CafeDto result = (CafeDto)request.getAttribute("dto");
										//request가 반환해주는건 Object type이기 때문에 원레 타입을 기억해 뒀다가 casting해야한다.
										
		%>
		<p>글번호: <strong><%= result.getNum()%></strong></p>
		<p>작성자: <strong><%= result.getWriter()%></strong></p>
		<p>제목: <strong><%= result.getTitle()%></strong></p>		
	
	<%--EL을 사용해서 dto에 담은 값 출력하기 --%>
		<p>글번호: <strong>${requestScope.dto.getNum() }</strong></p>
		<p>작성자: <strong>${dto.getWriter() }</strong></p> <%--requestScope. 생략 가능 --%>
		<%--필드명만 적으면 자동으로 getter 메소드를 호출해주기도 한다. --%>
		<p>제목: <strong>${dto.Title() }</strong></p>		
	</div>
</body>
</html>