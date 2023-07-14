<%@page import="org.json.JSONWriter"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"							
    pageEncoding="UTF-8"%> <%-- 제이슨 응답할땐  application/json --%>
  
<%

	CafeDto dto = new CafeDto();
	dto.setStartRowNum(1);
	dto.setEndRowNum(10);
	//응답할 json을 불러와야함
	//글목록
	List<CafeDto> list = CafeDao.getInstance().getList(dto);
	//jsp 페이지에서 작업을 직접해줘야한다. 스프링에선 컨트롤ㄹ러로 잗ㅇ으로 됐지만 
	//JSONWriter 클래스의 static method를 이용해서 List<CafeDto>를 JSON 문자열로 변환해서
	String json = JSONWriter.valueToString(list);
	//클라이언트에게 json문자열 응답하기(fetch요청에 대한 응답)
%>

<%=json%>