<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>회원정보수정</title>
<style>
input[type=file] {
	display: none;
}
</style>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="page-title-box d-sm-flex align-items-center justify-content-between">
						<h4 class="mb-sm-0 font-size-18">내 프로필> 수정</h4>

					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<form method="POST" id="mypage">
							<div class="row mb-4">
								<label for="horizontal-firstname-input" class="col-sm-3 col-form-label">현재 비밀번호</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="horizontal-password-input" name="user_password">
									<input type="hidden" name="user_id" value="${memberinfo.user_id}">
								</div>
							</div>
							<div class="row justify-content-end">
								<div class="col-sm-9">
									<div>
										<button type="submit" class="btn btn-primary w-md" id="mypageinfo">변경</button>
										<button type="reset" class="btn btn-secondary w-md">취소</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- end card body -->
				</div>
				<!-- end card -->
			</div>
		</div>
	</div>
</body>

<!-- apexcharts -->
<script src="assets/libs/apexcharts/apexcharts.min.js"></script>
<script src="assets/js/pages/profile.init.js"></script>
<script src="assets/libs/jquery/jquery.min.js"></script>
<script src="assets/js/app.js"></script>
<script src="assets/js/ajax.js"></script>
<script src="mypage_js/mypage.js"></script>

<script>
	$(function() {
		$("#mypageinfo").on("click", function() {

			var data = $("#mypage").serialize();

			$.ajax({
				type : "post",
				url : "mypage.my",
				dataType : "html",
				data : data,
				success : function(rdata) {
					$("#result").empty();
					$("#result").html(rdata);
					window.location.hash = page;
					$(window).scrollTop(0);
				}
			})
		})
	})
</script>
</html>