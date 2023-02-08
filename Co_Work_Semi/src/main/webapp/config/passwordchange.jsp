<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>설정 - 비밀번호 변경</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<div class="page-content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="page-title-box d-sm-flex align-items-center justify-content-between">
					<h4 class="mb-sm-0 font-size-18">설정> 비밀번호 변경</h4>

				</div>
			</div>
		</div>
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<form action="passwordchangeProcess.my" method="POST">
						<div class="row mb-4">
							<label for="horizontal-firstname-input" class="col-sm-3 col-form-label">현재 비밀번호</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="horizontal-password-input" name="user_password">
							</div>
						</div>
						<div class="row mb-4">
							<label for="horizontal-email-input" class="col-sm-3 col-form-label">새 비밀번호</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="horizontal-password-input" name="user_password1">
							</div>
						</div>
						<div class="row mb-4">
							<label for="horizontal-password-input" class="col-sm-3 col-form-label">새 비밀번호 확인</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="horizontal-password-input" name="user_password2">
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
