<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	body{margin:0px;}
	#wrapper{
		width:100%;
		height:700px;
		overflow: hidden;
	}
	#input-area{
		width: 20%;
		height:100%;
		float: left;
		background-color:yellow; 
	}

	#list-area{
		width: 60%;
		height:100%;
		float: left;
		background-color:skyblue;
	}
	#detail-area{
		width: 20%;
		height:100%;
		float: left;
		background-color:pink;
	}
	#input-area input,#detail-area input{
		width: 97%;
	}
</style>

<script type="text/javascript">
/*--------------------------------------------------------------------
 *동기방식의 폼 전송
 ---------------------------------------------------------------------*/
 	function regist(){
		$("#input-form").attr({
			action:"/board/regist",
			method:"post"
		});
		$("#input-form").submit();
	}
 	/*--------------------------------------------------------------------
 	 *비동기 방식의 기존폼을 이용한 Parameter 문자열 전송
 	 ---------------------------------------------------------------------*/
 	function registBySerial(){
		var params = $("#input-form").serialize();
		console.log(params);
	}
 	
 	/*--------------------------------------------------------------------
 	 *비동기 방식의 기존폼을 이용한 json 문자열 전송
 	 ---------------------------------------------------------------------*/
 	function registByJson(){
 		
 	}
 	
 	
	$(function(){
		$($("#input-area button")[0]).click(function(){
			regist();
		});
		
		$($("#input-area button")[1]).click(function(){
			registBySerial();
		});
		$($("#input-area button")[2]).click(function(){
			registByJson();
		});
		
	});
</script>
</head>
<body>
	<div id="wrapper">
		<div id="input-area">
			<form id="input-form">
				<input type="text" name="title" placeholder="제목">
				<input type="text" name="writer" placeholder="작성자">
				<textarea style="width: 98%;height:150px; " placeholder="내용" name="content"></textarea>
				<button type="button">그냥등록</button>
				<button type="button">폼시리얼 등록</button>
				<button type="button">json 등록</button>
			</form>
		</div>
		<div id="list-area">
			<form id="list-form">
				
			</form>
		</div>
		<div id="detail-area">
			<form id="detail-form">
				<input type="text" name="title" placeholder="제목">
				<input type="text" name="writer" placeholder="작성자">
				<textarea style="width: 98%;height:150px; " placeholder="내용"></textarea>
				<button type="button">수정</button>
				<button type="button">삭제</button>
			</form>
		</div>
	</div>
</body>
</html>