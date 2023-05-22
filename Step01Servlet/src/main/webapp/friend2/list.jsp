<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	//친구 목록 (sample data)라고 가정하자
	List<String> names = new ArrayList<>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/friend/list.jsp</title>
</head>
<body>
	
	<h1>친구 목록입니다.</h1>
	<ul>
	<!-- for 문을 이용해서 li요소 여러개 출력하기 --> 
	<!-- 방법 1 -->
	<%for (String tmp: names) {		 %>		
	<li> <%=tmp %>  </li>		
		<% }%>
	</ul>
	<!-- 방법 2 -->
	<ul>
	<%
		for(String tmp:names) {
			out.println("<li>"+tmp+"</li>");
		}
	%>
	</ul>
	
</body>
</html>