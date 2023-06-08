<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파일 목록을 얻어온다.
	List<FileDto> list=FileDao.getInstance().getList();
	//로그인된 아이디( 로그인이 되어있지 않으면 null 이다)
	String id=(String)session.getAttribute("id");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">업로드 하기</a>
		<br />
		<a href="${pageContext.request.contextPath }/file/private/upload_form2.jsp">ajax 업로드 하기</a>
		<!-- ajax: 페이지 전환 없이 업로드 하는법 학습 -->
		<h1>자료실 목록입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(FileDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td>
						<a href="download.jsp?num=<%=tmp.getNum() %>"><%=tmp.getOrgFileName() %></a>
					</td>
					<td><%=tmp.getRegdate() %></td>
					<td>
						<%-- 글작성자와 로그인된 아이디와 같을때만 삭제 링크 출력하기 --%>
						<%if(tmp.getWriter().equals(id)){ %>						
						<!-- id.equals((tmp.getWriter()) 안된다. 왜냐면 id는 null일 가능성이 있기 때문에 -->
							<a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
							<%} %>
							<!-- 삭제 링크는 조건부 출력해야함! 글 작성자와 로그인된 아이디가 같을 때만 출력되도록
													tmp.getWriter() 	String id=(String)session.getAttribute("id")-->
							
					</td>
				</tr>
			<%} %>	
			</tbody>
		</table>
		<ul class="pagination">
			<%for(int i = 1; i <=10; i++){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
				</li>
			<%} %>
		</ul>
	</div>
</body>
</html>