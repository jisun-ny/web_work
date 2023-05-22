<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fortune.jsp</title>
</head>
<body>
<% /*이 영역은 자바 코딩 영역입니다. 즉 servlet의 service() 메소드 안쪽이라고 보면 됨.
	이 영역은 서버에서만 존재. 클라이언트의 웹서버에 나타나지는 않음.
	jsp파일은 나중에 자동으로 마크업된 servlet형태로 바뀜*/ 
	
	//오늘의 운세 5개를 미리 준비해 둔다.
	String[] fortunes = {"동쪽으로 가면 귀인을 만나요",
			"오늘은 집에만 계세요",
			"너무 멀리가지 마세요",
			"오늘은 뭘 해도 되는 날이에요",
			"로또가 당첨되요"};

	//Random 객체를 생성해서
	Random ran = new Random();
	//0~4사이의 랜덤한 정수를 얻어내서
	int ranNum = ran.nextInt(5);
%>
 <p><%out.print(fortunes[ranNum]); %></p>
 <!-- 줄여서 이렇게 쓸 수 있다. 세미콜론 빼줘야함! 
 붙이면 out.print(fortunes[ranNum]; ); 이런 형태가 되는 것-->
 
 <p><%=10 %></p> 
 <p><%=true %></p>
 <p><%="하이" %></p>
 <p><%=fortunes[0] %></p>
 <!-- 줄여서 이렇게 쓸 수 있다. 세미콜론 빼줘야함! -->

</body>
</html>