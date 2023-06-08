<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/signup_form.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
      <h1>다양한 form 디자인</h1>
      <form action="signup.jsp" method="post">
        <div class="form-floating mb-2">
          <input
            class="form-control"
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
            type="text"
            name="pwd"
            id="pwd"
            placeholder="비밀번호 입력"
          />
          <!-- name속성을 작성해야 request.getParameter("pwd")해서 서버에서 불러 올 수 있따.-->
          <label class="form-label" for="pwd">비밀번호</label>
        </div>
        <select class="form-select mb-2" id="job" name="job">
          <!--request.getParameter("job") 하면 value속성의 값이 전달이 된다. 예르들어 프로그래머를 선택했다면 programmer가 전달됨
        근데 만약에 value값이 없다면 "프로그래머"가 전달됨 만약/ 아무것도 선택하지 않았다면 null이 넘어옴.(직업선택 value ="" 이렇게 비워뒀으니까. 밸류값을 명시 안해줬다면 "직업선택"이 전달)-->
          <option value="">직업선택</option>
          <option value="programmer">프로그래머</option>
          <option value="doctor">의사</option>
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
            />
            <label class="form-check-label" for="one" checked>남자</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              id="two"
              value="woman"
              name="gender"
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
            />
            <label for="etc" class="form-check-label">기타</label>
          </div>
        </fieldset>
        <!-- 같은 name으로 여러개의 value를 읽어올 때는 request.getParameterValues("hobby")를 사용해서 읽어옴 String[] type 스트링 배열 타입을 리턴함.-->
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
            />
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
            />
            <label for="allowMessage" class="form-check-label"
              >광고성 문자 수신 여부</label
            >
          </div>
        </fieldset>

        <button class="btn btn-outline-primary" type="submit">가입</button>
      </form>
    </div>

    <script>
      document.querySelector("#allowAll").addEventListener("change", (e) => {
        // 모두 동의 체크 여부를 알아낸다.
        
        const isChecked = e.target.checked;
        //클래스가 allow인 모든 요소의 참조값을 배열로 얻어내기
        const allows = document.querySelectorAll(".allow");
        //반복문 돌면서
        // for (let i = 0; i < allows.length; i++) {
        //   //모든 checkbox의 check상태를 바꿔주기
        //   allows[i].checked = isChecked;
        // }

        //반복문 대신 forEach() 함수도 활용해 보기
        allows.forEach((item) => {
          item.checked = isChecked;
        });
      });
    </script>
</body>
</html>