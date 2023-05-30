<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test02.jsp</title>
</head>
<body>
	<input type="text" id="msg" placeholder="메세지입력..."/>
	<button id = "sendBtn">전송</button>
	<script>
	//문자열을 입력하고 전송 버튼을 눌렀을 때 입력한 문자열을 읽어와서 send.jsp 페이지로 전송이 되도록 하기(페이지 전환 없이!-> fetch)
	document.querySelector("#sendBtn").addEventListener("click", () => {
		//입력한 문자열 읽어오기
		const msg = document.querySelector("#msg").value;
		//fetch 함수를 호출하면서 GET 방식 파라미터로 send.jsp 페이지를 요청하면서 전달한다.
		fetch("send.jsp?msg="+msg)
		.then((res)=>{
			//여기에 따로 코딩할 내용이 없으면
			//그냥 화살표 함수사용 res => res.text();
           return res.text(); 
        })
        .then((data)=>{
           console.log(data);
        });
	});
	</script>
</body>
</html>