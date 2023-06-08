<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//아이디
	String id = request.getParameter("id");
	//비밀번호
	String pwd = request.getParameter("pwd");
	//직업
	String job = request.getParameter("job");
	//성별
	String gender = request.getParameter("gender");
	//취미( String[] 스트링 배열 타입) (아무것도 체크하지 않았으면  null이다.)
	String[] hobby = request.getParameterValues("hobby");
	// DB의 hobby column에는 뭘 저장해야하지? 흠.. 
	
			String hobbyResult="";
	if(hobby != null) {
		//반복문 돌면서
		for(int i = 0; i<hobby.length; i++){
			//1번째 방에 있는 선택된 취미를 불러온다.
			String tmp = hobby[i];
			//hobbyResult = hobbyResult+tmp;
			hobbyResult += tmp;
			if(i != hobby.length-1) {
				hobbyResult += "/"; // -> programmer/xxx/xxx;
			}
		}
		//문자열에서 특정 문자 ("/")로 구분해서 String[]을 얻어내기
		String[] result = hobbyResult.split("/"); 
		//문자열에 특정 문자가 포함되어 있는지 여부 알아내기
		boolean isContain = hobbyResult.contains("xxx");

	}
	//null이면 체크를 안한 것이고 null이 아니면 체크를 한 것이다.
			String allowEmail = request.getParameter("allowEmail");
			String allowMessage = request.getParameter("allowMessage");
	
	/*
		textarea에 입력한 문자열은 개형, tab, 공백기호가 모두 포함되어 있따.
		해당 문자열을 DB에 저장했다가 다시 불러와서 textarea에 출력하고 싶으면
		textarea의 innerText에 출력하면 된다.
	*/
	String comment = request.getParameter("comment");
	
	
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/signup.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1>회원가입 결과</h1>
		<p>회원님의 정보를 성공적으로 저장했습니다 </p>
		<p><%=hobbyResult %></p>
		<form action="signup.jsp" method="post">
        <div class="form-floating mb-2">
          <input
            class="form-control"
            value="<%=id %>"
            type="text"
            name="id"
            id="id"
            placeholder="아이디 입력"
          />
          <label class="form-label" for="id">아이디</label>
          <!-- div에 form-floating클래스를 추가하고 input에 placeholder가 있어야 정상 적용. 근데 플레이스 홀더가 뜨는게 아니라 라벨이 뜬다.-->
        </div>

        <div class="form-floating mb-2">
          <input
            class="form-control"
            value="<%=pwd %>"
            type="text"
            name="pwd"
            id="pwd"
            placeholder="비밀번호 입력"
          />
          <!-- name속성을 작성해야 request.getParameter("pwd")해서 서버에서 불러 올 수 있따.-->
          <label class="form-label" for="pwd">비밀번호</label>
        </div>
        <select class="form-select mb-2" id="job" name="job">
        <!-- select는 value가 없다. -->
          <option value="">직업선택</option>
          <option value="programmer" <%=job.equals("programmer")? "selected": "" %>>프로그래머</option>
          <option value="doctor" <%=job.equals("doctor")? "selected": "" %>>의사</option>
        </select>
        <fieldset>
          <legend>성별 체크</legend>
          <!--legend는 fieldset의 레이블 역할-->
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              id="one"
              value="man"
              name="gender"
              <%= gender.equals("man") ? "checked":"" %>
            />
            <label class="form-check-label" for="one" >남자</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              id="two"
              value="woman"
              name="gender"
              <%= gender.equals("woman") ? "checked":"" %>
            />
            <label class="form-check-label" for="two">여자</label>
          </div>
          <!--request.getParameter("gender") 하면 "man" or "woman" 전달됨-->
        </fieldset>
        <!-- checkbox는 name속성을 똑같이 해도 그룹으로 묶이지 않음. -->
        <fieldset>
          <legend>취미 체크</legend>
          <div class="form-check">
            <input
              type="checkbox"
              class="form-check-input"
              id="piano"
              name="hobby"
              value="piano"
              <%=hobbyResult.contains("piano")? "checked" : ""%>
            />
            <label for="piano" class="form-check-label">피아노</label>
          </div>
          <div class="form-check">
            <input
              type="checkbox"
              class="form-check-input"
              id="game"
              name="hobby"
              value="game"
              <%=hobbyResult.contains("game")? "checked" : ""%>
            />
            <label for="game" class="form-check-label">게임</label>
          </div>
          <div class="form-check">
            <input
              type="checkbox"
              class="form-check-input"
              id="etc"
              name="hobby"
              value="etc"
              <%=hobbyResult.contains("etc")? "checked" : ""%>
            />
            <label for="etc" class="form-check-label">기타</label>
          </div>
        </fieldset>
        <!-- 같은 name으로 여러개의 value를 읽어올 때는 request.getParameterValues("hobby")를 사용해서 읽어옴 String[] type 스트링 배열 타입을 리턴함.-->
        
        <div>
        	<label class="form-label" for="comment">하고싶은 말</label>
        	<textarea class="form-control" name="comment" id="comment" rows="10"><%=comment %></textarea>
        </div>
        
        <fieldset>
          <legend>개인정보 활용 동의</legend>
          <div class="form-check form-switch">
            <input type="checkbox" class="form-check-input" id="allowAll" />
            <label for="allowAll" class="form-check-label">전체 동의</label>
          </div>
          <div class="form-check form-switch">
            <input
              type="checkbox"
              class="form-check-input allow"
              value="email"
              name="allowEmail"
              id="allowEmail"
               <%=allowEmail != null ? "checked":"" %>
            >
            <label for="allowEmail" class="form-check-label"
              >이메일 수신 여부</label
            >
          </div>
          <div class="form-check form-switch">
            <input
              type="checkbox"
              class="form-check-input allow"
              value="message"
              name="allowMessage"
              id="allowMessage"
              <%=allowMessage != null ? "checked": "" %>
            >
            <label for="allowMessage" class="form-check-label"
              >광고성 문자 수신 여부</label
            >
          </div>
        </fieldset>
	</div>
</body>
</html>