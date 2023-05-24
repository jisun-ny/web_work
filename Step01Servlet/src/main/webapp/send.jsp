<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    //서블릿에서는 req 객체를 사용하면 되는거고 jsp파일에는 request 객체가 그냥 기본 객체로 들어있기 떄문에 그냥 사용하면 된다.
    	//요청 인코딩 설정(한글이 깨지지 않도록)
    	request.setCharacterEncoding("utf-8");
    	//요청 파라미터 추출
    	String msg = request.getParameter("msg");
    	//콘솔창에 출력하기 (이클립스 버그 때문에 jsp페이지에는 콘솔창에 문자열 출력 불가)
    	//System.out.println("msg:" + msg);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/send.jsp</title>
</head>
<body>
	<p>메세지 잘 받았어 클라이언트야</p>
	<p>전달 받은 메세지 <strong><%=msg %></strong></p>
</body>
</html>