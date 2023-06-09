<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = request.getParameter(num);

	CafeDto dto = new CafeDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setViewCount(viewCount);
	dto.setRegdate(regdate);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/list.jsp</title>
</head>
<body>
	<div class="container">
		<h1>게시글 목록 입니다</h1>
		<a href="private/insertform.jsp">새 글 작성</a>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<%for (CafeDto tmp : list) { %>
			
			<%} %>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	
	</div>
</body>
</html>