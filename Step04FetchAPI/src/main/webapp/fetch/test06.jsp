<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/test0.jsp</title>
</head>
<body>
	<button id="moreBtn">더보기</button>
	<ul id="msgList">
		<li>하나</li>
		<li>두울</li>
		<li>세엣</li>
	</ul>
	<script>
		document.querySelector("#moreBtn").addEventListener("click", ()=>{
			fetch("get_msg2.jsp")
			.then(res=>res.json())
			//response객체 (object)
			//res.JSON을 하면 test05에서 했던 parse작업을 자동으로 해줌.
			//서버에서 응답한 문자열이 json형식이면 res.json()으로 바꿔준다.
			.then((data)=>{
				//data 는  [ "어쩌구" , "저쩌구" , "이렇쿵" ] 형식의 실제 배열이다.(json배열이 아니기때문에 parse작업 필요없음)
				console.log(data);
				//반복문을 돌면서
				for(let i = 0; i<list.length; i++){
					//backtick을 활용해서 li안에 메세지를 출력하고
					let li = `<li>\${list[i]}</li>`;
					//${}는 클라이언트 웹브라우저에 안보임! jsp파일은 ${}를 특별하게 해석함
					//특별하게 해석하지 않게 하기위해서는 앞에 \를 붙여준다.
					
					//ul요소가 끝나기 직전에 HTML로 평가해서 추가하기
					document.querySelector("#msgList").insertAdjacentHTML("beforeend", li);
				}
			})
			.catch((err)=>{
				//err에는 에러 메세지가 들어있다.
				console.log(err);
			});
			
		});
	
	</script>
</body>
</html>
