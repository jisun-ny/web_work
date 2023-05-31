<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET방식 파라미터로 전달되는 아이디 읽어내기
	String inputId = request.getParameter("inputId");
	//2. DB에 이미 존재하는 아이디인지 알아내서 사용가능 여부를 판정한다.
	boolean canUse = true; //초기값 true
	if(inputId.equals("gura") || inputId.equals("monkey")){
		canUse = false; 
		//즉 gura랑 monkey는 이미 있다고 가정하고 구라나 몽키면 사용할수 없는 아이디라고 알려주기
	}
	//3. json으로 사용 가능 여부를 응답한다.
%>
{"canUse":<%=canUse %>}



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/checkid.jsp</title>
</head>
<body>

</body>
</html>