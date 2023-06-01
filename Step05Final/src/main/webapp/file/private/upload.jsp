<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //파일 시스템 상에서 webapp의 upload폴더까지의 절대경로를 얻어낸다.
    String realPath = application.getRealPath("/upload"); //application은 ServletContext type 
    //해당 경로를 access 할 수 있는 파일 객체 생성
    File f = new File(realPath);
    if(!f.exists()){ //만일 폴더가 존재하지 않으면
    	f.mkdir(); //upload폴더 만들기
    }
    
    //cos.jar에 있는 MultipartRequest 클래스로 객체 생성하기 
    MultipartRequest mr =  new MultipartRequest(request,  //내부적으로 필요한 HttpServletRequest객체 전달
    		realPath, //업로드된 파일을 저장할 경로 
    		1024*1024*100, //최대 업로드 사이즈 제한
    		"utf-8", //한글 파일명 깨지지 않도록
    		new DefaultFileRenamePolicy()); //동일한 파일이 존재하면 자도으로 파일을 rename해서 저장하도록
   	/* 
	   	위의 MultipartRequest 객체가 Exception이 발생하지 않고 잘 생성이 되면 파일 업로드는 성공된 것이다.
	   	따라서 mr에 들어있는 참조값을 이용해서 폼전송된 값을 추출해서 DB에 저장만 잘 하면 된다.
   	*/
    // 2. 폼 전송되는 title을 읽어온다
    String title = mr.getParameter("title");
    // 3. 파일의 작성자(업로더)는 HttpSession객체에서 읽어온다
    String writer = (String)session.getAttribute("id");
    // 4.  추가로 원본파일명, 저장된 파일명, 파일사이즈도 얻어내서 FileDto 객체에 담아서
    String orgFileName = mr.getOriginalFileName("myFile");
    String saveFileName = mr.getFilesystemName("myFile");
    long fileSize = mr.getFile("myFile").length();
    //업로드 된 파일의 정보를 FileDto에 담고
    FileDto dto = new FileDto();
    dto.setWriter(writer);
    dto.setTitle(title);
    dto.setOrgFileName(orgFileName);
    dto.setSaveFileName(saveFileName);
    dto.setFileSize(fileSize);
    //DB에 저장하고 응답하기
    boolean isSuccess=FileDao.getInstance().insert(dto);

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/file/private/upload.jsp</title>
</head>
<body>
	<!-- 우리는 업로드한 파일을 webapp에 upload퐇더에 저장할거임 -->
	<%if(isSuccess){ %>
		<p>
			<%=writer %>님이 업로드한 <%=orgFileName %>파일을 저장했습니다.
			<a href="${pageContext.request.contextPath }/file/list.jsp">목록보기</a>
		</p>
		<p><%=realPath %></p>
	<%} %>
</body>
</html>