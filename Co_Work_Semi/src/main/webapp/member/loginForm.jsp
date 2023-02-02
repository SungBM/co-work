<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>
<script src="co_work/auth-login.html"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.js"></script>

<title>로그인</title>
<script>
	$(function(){
		$(".join").click(function(){
			location.href = "join.net";
		});
		
		const id = '${USER_ID}';
		if(USER_ID){
			$("#id").val(id);
			$("#remember").prop('checked', true);
		}
	})
</script>
</head>
<body>
 <form name="loginform" action="loginProcess.net" method="post">
  <h1>로그인</h1>
  <hr>
  <b>아이디</b>
  <input type="text" name="id" placeholder="Enter id" id="id" required>
  
  <b>Password</b>
   	<input type="password" name="pass" placeholder="Enter password"  required>
   	<input type="checkbox" id="remember" name="remember" value="store">
   	<span>로그인 상태 유지</span>
   	
   <div class="clearfix">
   	<button type="submit" class="submitbtn">로그인</button>
   	<button type="button" class="join">회원가입</button>
   	<button type="button" class="recoverId">아이디 찾기</button>
   	<button type="button" class="recoverPassword">비밀번호 찾기</button>
   </div>
 </form>
</body>
</html>