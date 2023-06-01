<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  
	
	//로그인 된 아이디가 있는지 확인해서
	String id = (String)session.getAttribute("id");

/* --> 이제 이거 filter사용해서 했기 때문에 따로 명시 안해줘도 됨.
	//만일 로그인하지 않았다면
	if(id == null){
		String cPath = request.getContextPath(); //절대경로를 얻어내기 --> contextpath를 request객체를 이용해서 얻어낸다.
		//로그인 페이지로 리다일렉트 이동 시킨다.
		response.sendRedirect(cPath+"/users/loginform.jsp"); 
	}

*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/private/game.jsp</title>

</head>
<body>
	<h1>게임 페이지 입니다.</h1>
	<p><%=id %>님 게임 열심히 하세요!</p>
</body>
</html>