<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
GuestDao dao = GuestDao.getInstance();
List<GuestDto> list = dao.getList();

// 이 두줄을 한줄로 List<GuestDto> list = GuestDao.getInstance().getList();로 쓸 수 있음.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<title>/guest/list.jsp</title>
</head>
<body>
	<%-- navbar 출력하기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="guest" name="current"/>
	</jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-left">방명록 목록</h3>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>글 번호</th>							
							<th>writer</th>
							<th>content</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (GuestDto tmp : list) {
						%>
						<tr>
							<td><%=tmp.getNum()%></td>
							<td><textarea rows="10" readonly><%=tmp.getContent()%></textarea></td>
							<!-- textarea안에다가 무언가를 출력할때는 value가 아니라 innerText에 입력 -->
							<td><%=tmp.getWriter()%></td>
							
							<td><a href="${pageContext.request.contextPath }/guest/updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
							<td>
								<form action="delete.jsp" method="post">
								<input type="hidden" name="num" value="<%=tmp.getNum() %>" />
								<input type="password" name = "pwd" placeholder="비밀번호..." />
								<button type="submit">삭제</button>
								</form>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<a href="${pageContext.request.contextPath }/guest/insertform.jsp">방명록 작성</a>
			</div>
		</div>
	</div>
</body>
</html>