<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp하면 isp:usebean을 사용해서 밑에와 같이 입력 한 다음 꺽세 퍼센트에서 컨트롤 스페이스를 누르면 cafeDto 객체가 생성된것을 알 수 있다.
겟방식이던 포스트방식이던 자기가 다 추출해서 자동으로 넣어줌

	CafeDto dto = new CafeDto(); //1
	
	int num = Integer.parseInt(request.getParameter("num")); //2
	dto.setNum(num);
	
	String title = request.getParameter("title"); //3
	dto.setTitle(title);
	
	String content = request.getParameter("content"); //4
	dto.setContent(content); 

--%>
<jsp:useBean id="dto" class="test.cafe.dto.CafeDto"/> <!-- 1 -->
<jsp:setProperty property="num" name="dto"/> <!-- 2 -->
<jsp:setProperty property="title" name="dto"/> <!-- 3 -->
<jsp:setProperty property="content" name="dto"/> <!-- 4 -->
<%
   // 위의 jsp 액션테그로 생성된 CafeDto 객체에 담긴 글 내용을 수정반영하고
   boolean isSuccess=CafeDao.getInstance().update(dto);
   //응답하기 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/update.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
   <div class="container pt-5">
      <%if(isSuccess){ %>
            <p class="alert alert-success">
                수정 했습니다.
               <a class="alert-link" href="${pageContext.request.contextPath }/cafe/detail.jsp?num=<%=dto.getNum()%>">확인</a>
            </p>
         <%}else{ %>
            <p class="alert alert-danger">
               수정 실패했습니다.
               <a class="alert-link" href="updateform.jsp?num=<%=dto.getNum() %>">다시 수정하러 가기</a>
            </p>
         <%} %>
   </div>
</body>

</html>