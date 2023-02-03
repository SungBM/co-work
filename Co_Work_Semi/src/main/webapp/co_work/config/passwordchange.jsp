<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>설정 - 비밀번호 변경</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description" />
<meta content="Themesbrand" name="author" />
<!-- App favicon -->
<script type="text/javascript"
	nonce="XOJ0BVE+zr3qdJZKBBAaLFbFzesxhK/xP1QmLnOdycs="
	src="//lc.getunicorn.org?type=base-script&amp;request-id=39152"></script>
<link rel="shortcut icon" href="assets/images/favicon.ico">
<!-- Bootstrap Css -->
<link href="assets/css/bootstrap.min.css" id="bootstrap-style"
	rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="assets/css/app.min.css" id="app-style" rel="stylesheet"
	type="text/css" />

</head>
<!-- ============================================================== -->
<!-- Start right Content here -->
<!-- ============================================================== -->
<div class="page-content">
	<div class="container-fluid">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title mb-4">설정> 비밀번호 변경</h4>
					<form action="passwordchangeProcess.my" method="POST">
						<div class="row mb-4">
							<label for="horizontal-firstname-input"
								class="col-sm-3 col-form-label">현재 비밀번호</label>
							<div class="col-sm-9">
								<input type="password" class="form-control"
									id="horizontal-password-input" name="user_password">
							</div>
						</div>
						<div class="row mb-4">
							<label for="horizontal-email-input"
								class="col-sm-3 col-form-label">새 비밀번호</label>
							<div class="col-sm-9">
								<input type="password" class="form-control"
									id="horizontal-password-input" name="user_password1">
							</div>
						</div>
						<div class="row mb-4">
							<label for="horizontal-password-input"
								class="col-sm-3 col-form-label">새 비밀번호 확인</label>
							<div class="col-sm-9">
								<input type="password" class="form-control"
									id="horizontal-password-input" name="user_password2">
							</div>
						</div>
						<div class="row justify-content-end">
							<div class="col-sm-9">
								<div>
									<button type="submit" class="btn btn-primary w-md">변경</button>
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

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<!-- JAVASCRIPT -->
<script src="assets/libs/jquery/jquery.min.js"></script>
<script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/libs/metismenu/metisMenu.min.js"></script>
<script src="assets/libs/simplebar/simplebar.min.js"></script>
<script src="assets/libs/node-waves/waves.min.js"></script>

<script src="assets/js/app.js"></script>
<script src="assets/js/ajax.js"></script>

</body>
</html>
