<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>회원정보수정</title>
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

<style>
#View {
	width: 50px;
}

input[type=file] {
	display: none;
}
</style>
</head>

<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- start page title -->
			<div class="row">
				<div class="col-12">
					<div
						class="page-title-box d-sm-flex align-items-center justify-content-between">
						<h4 class="mb-sm-0 font-size-18">내 프로필> 수정</h4>

						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">Contacts</a></li>
								<li class="breadcrumb-item active">Profile</li>
							</ol>
						</div>

					</div>
				</div>
			</div>
			<!-- end page title -->
			<form action="companyupdateProcess.my" method="post"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col ">
						<div class="row">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-nowrap table-hover mb-0">
											<tbody>
												<tr>
													<td><b>회사명</b></td>
												</tr>
												<tr>
													<td><input class="form-control" type="text"
														value="${companyinfo.company_name }"
														id="example-text-input" name="user_name"></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td><b>전용 URL</b></td>
												</tr>
												<tr>
													<td><input class="form-control" type="text"
														value="${companyinfo.company_url }"
														id="example-text-input" name="user_name"></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td><b>로고 설정</b></td>
												</tr>
												<tr>
													<td><input class="form-control" type="text"
														value="${companyinfo.company_logo }"
														id="example-text-input" name="user_name"></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td><b>부서 설정</b></td>
												</tr>
												<tr>
													<td><input class="form-control" type="text"
														value="없음"
														id="example-text-input" name="user_name"></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td><b>직함 설정</b></td>
												</tr>
												<tr>
													<td><input class="form-control" type="text"
														value="없음"
														id="example-text-input" name="user_name"></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
											</tbody>
										</table>
										<div class="d-flex flex-wrap gap-2">
											<button type="submit"
												class="btn btn-primary waves-effect waves-light">
												Submit</button>
											<button type="reset" class="btn btn-secondary waves-effect">
												Cancel</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end row -->
				</div>
			</form>
		</div>
		<!-- container-fluid -->
	</div>
	<!-- End Page-content -->
</body>

<!-- apexcharts -->
<script src="assets/libs/apexcharts/apexcharts.min.js"></script>
<script src="assets/js/pages/profile.init.js"></script>
<script src="assets/libs/jquery/jquery.min.js"></script>
<script src="assets/js/app.js"></script>
<script src="assets/js/ajax.js"></script>
<script>
	$(function() {
		$('input[type=file]').change(function(event) {

			const inputfile = $(this).val().split('\\');
			const filename = inputfile[inputfile.length - 1]; // inputfile.length - 1 = 2
			const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미

			if (pattern.test(filename)) {
				$('#filename').text(filename);

				const reader = new FileReader(); // 파일을 읽기 위한 객체 생성

				// DataURL 형식(접두사 data:가 붙은 URL이며 바잉너리 파일을 Base64로 인코딩하여 ASCII 문자열 형식으로 변환 것)
				// 파일을 읽어옵니다. (참고-Base64 인코딩은 바이너리 데이터를 Text로 변경하는 Encoding 입니다.)
				// 읽어온 결과는 reader객체의 result  속성에 저장됩니다.
				// event.target.filed[0] : 파일리스트에서 첫번째 객체를 가져옵니다.
				reader.readAsDataURL(event.target.files[0]);

				reader.onload = function() { // 읽기에  성공했을 때
					$('#showImage > img').attr('src', this.result);
				};
			} else {
				alert('이미지 파일(gif, jpg, jpeg, png)이 아닌 경우는 무시됩니다.');
				$('#filename').text('');
				$('#showImage > img').attr('src', 'image/profile.png');
				$(this).val('')
				$('input[name=check]').val('');
			}
		}) // change() end
	}) // function end
</script>