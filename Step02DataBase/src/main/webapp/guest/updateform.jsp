<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% //수정하기 위해서는 수정할 회원 정보를 얻어와야한다. 보통 번호 
  int num = Integer.parseInt(request.getParameter("num"));
  MemberDto dto = MemberDao.getInstance().getData(num);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/updateform.jsp</title>
</head>
<body>
	<div>
		<h1>방명록 수정 화면 입니다.</h1>
		<form action="update.jsp" method="post">
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer"/>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="10">내용을 입력하세요.</textarea>
			</div>
			<button type="submit">수정확인</button>
			<button type="reset">취소</button>
		</form>
		
	</div>
</body>
</html>