<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/Step04_fotorama.jsp</title>
	<!-- 플러그 인 css -->
	<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<style>
	.container {
		width: 768px;
		margin: 0 auto;
	}
	
	.fotorama img { 
		max-width: 100%;
	}
</style>
</head>
<body>
	
	<div class="container">
		<h1>fotorama를 활용한 이미지 슬라이더 만들기</h1>
		<div class = "fotorama"  data-allowfullscreen="true" data-nav="thumbs" data-autoplay="true">
									<!--  풀 스크린 화면 가능 -->
			<img data-caption="상품1" src="${pageContext.request.contextPath }/vue2/images/top01.jpg" />
			<img data-caption="상품2" src="${pageContext.request.contextPath }/vue2/images/top02.jpg" />
			<img data-caption="상품3" src="${pageContext.request.contextPath }/vue2/images/top03.jpg" />
			<img data-caption="상품4" src="${pageContext.request.contextPath }/vue2/images/top04.jpg" />
			<img data-caption="상품5" src="${pageContext.request.contextPath }/vue2/images/top05.jpg" />
			<img data-caption="상품6" src="${pageContext.request.contextPath }/vue2/images/top06.jpg" />
		</div>
	</div>
	<!-- lazy loading
		로딩할 때 필요한 이미지만 로딩하고 나머지는 이후에 필요할떄 동적으로 로딩되는 코드
	 -->

<!-- jquery 로딩 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<!-- 플러그인 js로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
</body>
</html>