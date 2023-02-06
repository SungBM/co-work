<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>회사정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="page-title-box d-sm-flex align-items-center justify-content-between">
						<h4 class="mb-sm-0 font-size-18">회사> 회사정보</h4>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-">
					<div class="card">
						<div class="card-body">

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">회사명</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="${companyinfo.company_name }" name="company_name" readOnly>
										<input type="hidden" name="value" value="company_name">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">전용 URL</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="${companyinfo.company_url }" name="company_url" readOnly>
										<input type="hidden" name="value" value="company_url">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">로고 설정</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="${companyinfo.company_logo }" name="company_logo" readOnly>
										<input type="hidden" name="value" value="company_logo">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>
							<!-- 
							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-search-input" class="col-md-2 col-form-label">부서 설정</label>
									<div class="col-md-8">
										<input class="form-control" type="email" value="${memberinfo.user_email }" name="user_email" readOnly>
										<input type="hidden" name="value" value="user_email">

									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-email-input" class="col-md-2 col-form-label">직함 설정</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="${memberinfo.user_fax}" placeholder="Enter fax" name="user_fax" readOnly>
										<input type="hidden" name="value" value="user_fax">

									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>
 -->
						</div>
					</div>

				</div>
			</div>
			<!-- end row -->

			<!-- list1 -->
			<div class="row">
				<div class="col-xl-6">
					<div class="card">
						<div class="card-body">
							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">회사명</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="CO-WORK" name="company_name" readonly="">
										<input type="hidden" name="value" value="company_name">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">전용 URL</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="" name="company_url" readonly="">
										<input type="hidden" name="value" value="company_url">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">로고 설정</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="" name="company_logo" readonly="">
										<input type="hidden" name="value" value="company_logo">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-search-input" class="col-md-2 col-form-label">부서 설정</label>
									<div class="col-md-8">
										<input class="form-control" type="email" value="" name="user_email" readonly="">
										<input type="hidden" name="value" value="user_email">

									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-email-input" class="col-md-2 col-form-label">직함 설정</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="" placeholder="Enter fax" name="user_fax" readonly="">
										<input type="hidden" name="value" value="user_fax">

									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>
				<!-- list 2 -->
				<div class="col-xl-6">
					<div class="card">
						<div class="card-body">

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">회사명</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="CO-WORK" name="company_name" readonly="">
										<input type="hidden" name="value" value="company_name">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">전용 URL</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="" name="company_url" readonly="">
										<input type="hidden" name="value" value="company_url">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-text-input" class="col-md-2 col-form-label">로고 설정</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="" name="company_logo" readonly="">
										<input type="hidden" name="value" value="company_logo">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-search-input" class="col-md-2 col-form-label">부서 설정</label>
									<div class="col-md-8">
										<input class="form-control" type="email" value="" name="user_email" readonly="">
										<input type="hidden" name="value" value="user_email">

									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="companyupdateProcess.com" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="example-email-input" class="col-md-2 col-form-label">직함 설정</label>
									<div class="col-md-8">
										<input class="form-control" type="text" value="" placeholder="Enter fax" name="user_fax" readonly="">
										<input type="hidden" name="value" value="user_fax">

									</div>
									<div class="col-md-2">
										<button class="btn btn-success waves-effect waves-light" type="submit" name="sub">수정</button>
										<input class="btn btn-warning waves-effect waves-light" type="reset" id="second" style="display: none" value="취소">
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>

			</div>
			<!-- container-fluid -->
		</div>
		<!-- End Page-content -->
	</div>
	<!-- end main content-->
</body>
</html>
<script src="admin_js/admin.js"></script>