<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<form action="updateProcess.my" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-xl-3">
						<div class="text-primary p-2">
							<label> <img src="assets/images/users/avatar-1.jpg"
								alt="" width="100%"> <input type="hidden" name="check"
								value="${memberinfo.user_img }"> <input type="file"
								name="user_img" accept="image/*">
							</label>
						</div>
						<!-- end card -->
						<div>사진과 명함을 교체하시려면 각 이미지를 클릭</div>
						<!-- end img -->
						<div class="card">
							<div class="card-body">
								<label> <img src="assets/images/namecard.png" alt=""
									width="100%"> <input type="hidden" name="check"
									value="${memberinfo.user_card }"> <input type="file"
									name="user_card" accept="image/*">
								</label>

							</div>
						</div>
					</div>
					<!-- end card -->

					<div class="col-xl-8">
						<div class="row">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-nowrap table-hover mb-0">
											<tbody>
												<tr>
													<td>이름</td>
													<td><input class="form-control" type="text"
														value="${memberinfo.user_name }" id="example-text-input"
														name="user_name"></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td>부서명</td>
													<td><select class="form-select" name="user_dept">
															<option selected>개발1팀</option>
															<option>영업1팀</option>
															<option>인사팀</option>
													</select></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td>직함</td>
													<td><select class="form-select" name="user_job">
															<option>사원</option>
															<option>대리</option>
															<option>과장</option>
															<option>차장</option>
															<option>부장</option>
															<option>상무</option>
															<option>이사</option>
													</select></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td>이메일</td>
													<td><input class="form-control" type="text"
														value="${memberinfo.user_email }" id="example-text-input"
														name="user_email"></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td>FAX</td>
													<td><input class="form-control" type="text"
														value="${memberinfo.user_fax }" id="example-text-input"
														name="user_fax"></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td>연락처</td>
													<td><input class="form-control" type="text"
														value="${memberinfo.user_phone }" id="example-text-input"
														name="user_phone"></td>
													<td><button type="button" class="btn btn-light btn-sm">수정</button></td>
												</tr>
												<tr>
													<td>내 소개</td>
													<td><textarea class="form-control" rows="3"
															style="resize: none" name="user_intro">${memberinfo.user_intro }</textarea></td>
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
	
</script>