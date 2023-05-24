<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//MemberDao 객체의 참조값 얻어오기
GuestDao dao = GuestDao.getInstance();
//회원 목록 얻어오기
List<GuestDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/list.jsp</title>
</head>
<body>
	<div class="container">
		<h1>방명록 목록 입니다</h1>
		<table>
			<thead>
				<tr>
					<th>글 번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>등록일</th>
				</tr>
			</thead>

			<tbody>
				<%
				for (GuestDto temp : list) {
				%>
				<tr>
					<td><%=temp.getNum()%></td>
					<td><%=temp.getWriter()%></td>
					<td><%=temp.getContent()%></td>
					<td><%=temp.getRegdate()%></td>
				</tr>
				<%
				}
				%>
			</tbody>

		</table>
	</div>
</body>
</html>