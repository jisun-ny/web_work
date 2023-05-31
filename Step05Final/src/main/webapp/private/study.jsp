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
	//즉 로그인이 안되어있따면 순간적으로 응답을 2번하는거!! study.jsp 응답 후 바로 리다일렉트로 loginform.jsp 응답!
	//로그인을 해야하는 것들마다 다 이 코드를 써넣기 힘듬 --> 필터를 이용하자
	//특정 경로에서 로그인을 했는지 확인해서 안했으면 filter에서  
*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/private/study.jsp</title>
</head>
<body>
	<h1>공부 페이지 입니다.</h1>
	<p><%=id %>님 공부 열심히 하세요!</p>
</body>
</html>