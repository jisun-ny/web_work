<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/Step04_datetime.jsp</title>
<!-- 플러그인 css로딩 -->
<link rel="stylesheet" href="css/jquery.datetimepicker.min.css" />
</head>
<body>
	<!-- 플러그인css와 플러그인js를 이용해서 날짜, 시간 선택을 간편하게 할 수 있다 -->

	<input type="text" id="one" placeholder="날짜 시간 선택"/>
	<input type="text" id="two" placeholder="날짜 선택"/>
	<input type="text" id="three" placeholder="시간 선택"/>
	
	<p>html5에서 추가된 UI</p>
	<input type="text" />
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<!-- 플러그인 javascript 로딩 -->
	<script src="js/jquery.datetimepicker.full.min.js"></script>
	<script>
	//언어 설정
	 $.datetimepicker.setLocale("ko");
	
	 $("#one").datetimepicker();
	 $("#two").datetimepicker({
		 timepicker: false,
		 //UI에 날짜만 선택하게 할 수 있음.
		 format:"Y,m,d"
	 });//동작에 대한 옵션은 오브젝트로 전달
	 $("#three").datetimepicker({
		 datepicker: false,
		 format:"H:i"
	 });
	</script>
</body>
</html>