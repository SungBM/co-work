<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

    <meta charset="utf-8" />
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="co_work/assets/images/favicon.ico">

    <!-- Bootstrap Css -->
    <link href="co_work/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="aco_work/ssets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="co_work/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
<script src="co_work/member_js/jquery-3.6.3.js"></script>
<script>
$(function(){
	let checkid=false;
	let checkemail=false;
	
	$("input[name=id]").on('keyup', function(){
		$("#message").empty(); //처음에 pattern에 적합하지 않은 경우 메시지 출력 후 적합한 데이터를 입력해도
							   //계속 같은 데이터 출력하므로 이벤트 시작할 때마다 비워둡니다.
		//[A-Za-z0-9_]의 의미는 \w
		const pattern = /^\w{6,15}$/;
		const id = $("input:eq(0)").val();
		if(!pattern.test(id)){
			$("#message").css('color','red').html("영어 숫자 _로 6~15자 가능합니다.");
			checkid=false;
			return;
		}
		
		$.ajax({
			url : "idcheck.net",  //id값을 컨트롤러로 보내고
			data : {"id" : id},
			success : function(resp){
				if(resp == -1){ //db에 해당 id가 없는 경우
					$("#message").css('color','green').html("사용 가능한 아이디입니다.")
					checkid=true;
				}else{ //db에 해당 id가 있는 경우(0)
					$("#message").css('color', 'blue').html("사용중인 아이디입니다.")
					checkid=false;
					}
				}
			
			})//ajax end
		});//id keyup end
		
		$("input[name=email]").on('keyup', function(){
			//$("#email_message").empty();
			//[A-Za-z0-9_]와 동일한 것이 \w입니다.
			//+는 1회 이상 반복을 의미하고 {1,}와 동일합니다.
			//\w+는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
			const pattern = /^\w+@\w+[.]\w{3}$/;
			const email_value = $(this).val();
			console.log(email_value)
			if(!pattern.test(email_value)){
				$("#email_message").css('color', 'red').html("이메일 형식이 맞지 않습니다.");
				checkemail=false;
			}else{
				$("#email_message").css('color', 'green').html("이메일 형식에 맞습니다.")
				checkemail=true;
			}
		}); //on
		
		let pwChecked=false;
        $(".form-control").focusout(function() { // 아이디를 입력할때 마다 중복검사 실행
            checkPw($(this).val())
        })
        function checkPw(pw){
          if(pw==""){
              $("#checkId").text("");
              return; // 아직 입력된 상태가 아니라면 아무런 문구를 출력하지 않는다
          }

          if($('#pw1').val()!=$('#pw2').val()){
              // 만약 pw1과 pw2가 알치하지 않는다면
              $("#checkPw").html('비밀번호가 일치하지 않습니다'); // 문구 출력
              $("#checkPw").attr('color', 'red');
              $('#pw2').val(''); // 값을 비움
              $('#pw2').focus(); // 포인터를 pw2 로 맞춘다
              pwChecked=false;
          }
          else{
              $("#checkPw").html('비밀번호가 일치합니다'); // 문구 출력
              $("#checkPw").attr('color', 'green');
              pwChecked=true;
          }
          setAble();
        }
        
        $('form').submit(function(){
        	if(!checkid){
				alert("사용 가능한 id로 입력하세요.");
				$("input[name=id]").val('').focus();
				return false;
			}
			
			if(!checkemail){
				alert("email 형식을 확인하세요.");
				$("input[name=email]").focus();
				return false;
			}
		});//submit
})//ready
</script>
</head>

<body>
	<form name="joinform" action="joinProcess.net" method="post">
    <div class="account-pages my-5 pt-sm-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card overflow-hidden">
                        <div class="bg-primary bg-soft">
                            <div class="row">
                                <div class="col-7">
                                    <div class="text-primary p-4">
                                        <h5 class="text-primary">회원가입</h5>
                                    </div>
                                </div>
                                <div class="col-5 align-self-end">
                                    <img src="assets/images/profile-img.png" alt="" class="img-fluid">
                                </div>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <div>
                                <a href="index.html">
                                    <div class="avatar-md profile-user-wid mb-4">
                                        <span class="avatar-title rounded-circle bg-light">
                                            <img src="assets/images/logo.svg" alt="" class="rounded-circle" height="34">
                                        </span>
                                    </div>
                                </a>
                            </div>
                            <div class="p-2">
                                <form class="needs-validation" novalidate action="index.html">
                                
                                	<div class="mb-3">
                                        <label for="userId" class="form-label">아이디</label>
                                        <input type="text" class="form-control" id="id" name="id"
                                            placeholder="아이디(6~15자 영문, 숫자, _로 가능합니다.)" required>
                                            <span id="message"></span>
                                    </div>
                                    	
                                    <div class="mb-3">
                                        <label for="userpassword" class="form-label">비밀번호</label>
                                        <input type="password" class="form-control" id="pw1" name="pass"
                                            placeholder="비밀번호(6~15자 영문, 숫자, _로 가능합니다.)" required>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="userpassword_ch" class="form-label">비밀번호 확인</label>
                                        <input type="password" class="form-control" id="pw2" name="password_ch"
                                            placeholder="비밀번호를 다시 입력하세요" required>
                                             <td><font id="checkPw"></font></td>
                                    </div>

                                    <!-- <div class="mb-3">
                                    <div class="float-end">
                                                    <a href="auth-recoverpw-2.html" class="text-muted">인증번호 전송</a>
                                                </div> -->
                                        <label for="useremail" class="form-label">이메일</label>
                                        <input type="email" class="form-control" id="useremail" name="email"
                                            placeholder="e-mail@naver.com" required>
                                            <span id="email_message"></span>
                                    </div>
                                    
                                   <!--  <div class="mb-3">
                                        <label for="code" class="form-label">인증번호</label>
                                        <input type="text" class="form-control" id="code"
                                            placeholder="인증번호" required>
                                    </div> -->

                                    <div class="mb-3">
                                        <label for="name" class="form-label">이름</label>
                                        <input type="text" class="form-control" id="name" name="name"
                                            placeholder="이름을 입력하세요" required>
                                    </div>


                                    <div class="mt-4 d-grid">
                                        <button class="btn btn-primary waves-effect waves-light"
                                            type="submit">회원가입</button>
                                    </div>
                                    
                                    <div class="mt-4 d-grid">
                                        <button class="btn btn-primary waves-effect waves-light"
                                            type="reset">취소</button>
                                    </div>

                                    <div class="mt-4 text-center">
                                        <h5 class="font-size-14 mb-3">Sign up using</h5>

                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <a href="javascript::void()"
                                                    class="social-list-item bg-primary text-white border-primary">
                                                    <i class="mdi mdi-facebook"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript::void()"
                                                    class="social-list-item bg-info text-white border-info">
                                                    <i class="mdi mdi-twitter"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript::void()"
                                                    class="social-list-item bg-danger text-white border-danger">
                                                    <i class="mdi mdi-google"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="mt-4 text-center">
                                        <p class="mb-0">By registering you agree to the Skote <a href="#"
                                                class="text-primary">Terms of Use</a></p>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="mt-5 text-center">

                        <div>
                            <p>Already have an account ? <a href="login.net" class="fw-medium text-primary">
                                    Login</a> </p>
                            <p>©
                                <script>document.write(new Date().getFullYear())</script> Skote. Crafted with <i
                                    class="mdi mdi-heart text-danger"></i> by Themesbrand
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- JAVASCRIPT -->
    <script src="co_work/assets/libs/jquery/jquery.min.js"></script>
    <script src="co_work/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="co_work/assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="co_work/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="co_work/assets/libs/node-waves/waves.min.js"></script>

    <!-- validation init -->
    <script src="co_work/assets/js/pages/validation.init.js"></script>

    <!-- App js -->
    <script src="co_work/assets/js/app.js"></script>
</form>
</body>

</html>