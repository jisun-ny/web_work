<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 얘는 navbar에만 반응하면 됨 -->
    
    <nav class="navbar bg-primary navbar-expand-md" data-bs-theme="dark">
	<!--  nav는 div라고 보면 됨. div class ="nav" 
		// 베경이 어두우면 data-bs-theme="dark" 설정을 통해 글씨를 밝게해줌
		// navbar-expand-md는 md영역 이상에서 navbar-collapse가 펼처지도록 한다.		
	 -->
	  <div class="container"> <!--  container-fluid는 폭을 다 쓰는 것! -->
	    <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">
	      <img src="http://getbootstrap.com/docs/5.3/assets/brand/bootstrap-logo.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
	      Jiseon
	    </a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText">
            <span class="navbar-toggler-icon"></span>
        </button>
        <%
        	//어느 페이지에 포함되었는지 정보를 얻어오기
        	String current = request.getParameter("current"); //"index" or "member" or "guest"
        	
        
        %>
       <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav">
              <li class="nav-item">
                   <a class="nav-link <%=current.equals("member")? "active":"" %>"  href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
              </li>
              <li class="nav-item ">
                   <a class="nav-link <%=current.equals("guest")? "active":"" %> " href="${pageContext.request.contextPath }/guest/list.jsp">방명록</a>
              </li>
            </ul>
       </div>
	  </div>
	</nav>