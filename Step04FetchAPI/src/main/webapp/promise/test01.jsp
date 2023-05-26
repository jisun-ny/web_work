<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test01</title>
</head>
<body>
	<h3>콜백 지옥이란 무엇인가</h3>
	<script>
	//가상의 주어진 작업을 처리하는 함수 (주어진 작업을 처리한느데 random한 시간이 걸린다고 가정하자)
	function work (job, callback) {
		// 0~5000 사이의 랜덤한 숫자 얻어내기
		let ranTime = Math.random()*5000;
		
		setTimeout(() => {
			console.log(job+" 을(를) 처리(수행) 했습니다");
			callback(); //전달 받은 함수를 호출한다.
		}, ranTime); //0에서 5초 사이에 랜덤하게 호출된다.
	}
	//냉장고 문을 여는 작업을 하고 해당 작업이 끝나면 내가 전달한 함수를 호출해주세요.
	/*
	work("냉장고 문을 연다", function(){});
	work("코끼리를 냉장고에 넣는다", function(){});
	work("냉장고 문을 닫는다", function(){});
	
	이렇게 하면 작업이 순서대로 일어나지 않음. 시간은 랜덤하지만 작업이 순서대로 일어나게 하기 위해서는 아래와 같이 
	함수 안에 함수를 넣고 함수 안에 함수를 넣고... 이런식으로 코딩... 콜백지옥.. 중간에 오류가나면 아주 골치아픔... --> 이 문제를 해결하기 위한 방법 중 하나가.. promise...
	
	*/
	work("냉장고 문을 연다", function(){
		work("코끼리를 냉장고에 넣는다", function(){
			work("냉장고 문을 닫는다", function(){
				//순서를 보장하려면 계속 안으로 안으로...
			});
		});
	});
	
	let p1 = new Promise(function(resolve){
		/*
			함수의 인자로 전달되는 resolve는 함수이다.
			resolve는 작업을 완료 했을때 호출해야하는 함수
			resolve는 함수가 호출되면 .then() 안에 있는 함수가 자동 호출된다.
			
			직접 Promise를 생성해서 설계할 일은 보통 없다.
			그냥 뒤에 .then이 있으면 아 얘는 promise객체를 리턴하는구나 하면 됨... 아마 ..
		*/
		resolve();
	});
	
	p1.then(function() {
		console.log("then안에 있는 함수가 호출되었습니다");
	});
	
	/*
	 new Promise()
	.then(() => {})
	.then(() => {})
	.then(() => {})
	.
	.catch(() => {})
	.
	안으로 안으로 들어가지 않고 실행 순서를 보장하는 방식으로 코딩하기 위해서 promise가 나왔다.
	중간에 작업이 실패되면 .catch(() => {})
	*/
	
	</script>
</body>
</html>