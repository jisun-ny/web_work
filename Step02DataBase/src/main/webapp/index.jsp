<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   //DB 연동 가능한지 테스트
   //new DbcpBean(); //객체 생성했을때 예외가 발생하지 않고 "Connection 얻어오기 성공!"이
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%-- 
	/include/navbar.jsp 페이지에게 이 부분만 응답하도록 한다. 
	
	include되는 jsp페이지에 파라미터를 전달할 수도 있따.
	--%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="current"/>
	</jsp:include>
		
		<!-- ?current=index 커런트라는 이름(파라미터)으로 index라는 문자열 전달 
			String a = request.getParameter("current");
					 = "index"
		-->
   <div class="container">
      <h1>인덱스 페이지 입니다.</h1>
      <p>${pageContext.request.contextPath }</p>
    
      <!-- 
      jsp 페이지는 서버에서 해석되고 해석된 결과가 클라이언트에게 응답이 된다. 
      	jsp page는 \${ }속 문자열은 클라이언트에게 그대로 출력되지 안고 특별하게 해석되서 출력된다
      	contextPath를 하드코딩하면 나중에 다 찾아서 삭제, 수정해야함.
      	자바 코딩 안에서는  request.getContextPath(); 해서 해야함. (httpserveletrequest)를 통해서
      	jsp html영역 안에서는 ${pageContext.request.contextPath } 해서 얻어와야함.
      	
      	
      -->
      <ul>
      	<li><a href="/Step02DataBase/member/list.jsp">회원 목록 보기</a></li>
      	<li><a href="${pageContext.request.contextPath }/guest/list.jsp">방명록 목록 보기</a></li>
      </ul>
      
  
   </div>
   
  
</body>
</html>
