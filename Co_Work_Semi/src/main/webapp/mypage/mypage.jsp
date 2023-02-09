<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/main/header.html"></jsp:include>
<title>회원정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
label {
	text-align: center
}

input[type=file] {
	display: none;
}

#showImage1>img, #showImage2>img {
	width: 200px;
	height: 200px;
}
</style>
</head>

<body>
	<div class="page-content ">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="page-title-box d-sm-flex align-items-center justify-content-between">
						<h4 class="mb-sm-0 font-size-18">내 프로필> 수정</h4>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3">
					<form action="updateProcess.my" method="post" enctype="multipart/form-data">
						<div class="card">
							<label>
								<span id="showImage1">
									<c:if test='${empty memberinfo.user_img }'>
										<c:set var='src' value='image/profile.png' />
									</c:if>
									<c:if test='${!empty memberinfo.user_img }'>
										<c:set var='src' value='${"image/" }${memberinfo.user_img }' />
										<input type="hidden" name="check" value="${memberinfo.user_img }">
									</c:if>
									<img src="${src }" alt="profile">
								</span>
								<input class="form-control update" type="file" name="user_img" id="formFile1">
								<input type="hidden" name="user_id" value="${memberinfo.user_id}">
								<input type="hidden" name="value" value="user_img">
							</label>
							<div class="col-md-6">
								<button class="btn btn-success waves-effect waves-light file" type="submit">수정</button>
								<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
							</div>
						</div>
					</form>
					<form action="updateProcess.my" method="post" enctype="multipart/form-data">
						<div class="card">
							<label>
								<span id="showImage2">
									<c:if test='${empty memberinfo.user_card }'>
										<c:set var='src' value='image/card.jpg' />
									</c:if>
									<c:if test='${!empty memberinfo.user_card }'>
										<c:set var='src' value='${"image/" }${memberinfo.user_card }' />
										<input type="hidden" name="check" value="${memberinfo.user_card }">
									</c:if>
									<img src="${src }" alt="card">
								</span>
								<input class="form-control update" type="file" name="user_card" id="formFile2">
								<input type="hidden" name="user_id" value="${memberinfo.user_id}">
								<input type="hidden" name="value" value="user_card">
							</label>

							<div class="col-md-6">
								<button class="btn btn-success waves-effect waves-light file" type="submit">수정</button>
								<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
							</div>
						</div>
					</form>
				</div>

				<div class="col-xl-9">
					<div class="card">
						<div class="card-body">
							<form action="updateProcess.my" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-2 col-form-label">이름</label>
									<div class="col-md-7">
										<input class="form-control" type="text" value="${memberinfo.user_name }" name="user_name" readOnly>
										<input type="hidden" name="user_id" value="${memberinfo.user_id}">
										<input type="hidden" name="value" value="user_name">
									</div>
									<div class="col-md-3">
										<button class="btn btn-success waves-effect waves-light update" type="submit">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-2 col-form-label">부서</label>
									<div class="col-md-7">
										<select class="form-select" name="user_dept" disabled>
											<c:if test="${!empty dept }">
												<c:forEach var="list" items="${dept }" varStatus="i">
													<option value="${list.dept_name }">${list.dept_name}</option>
												</c:forEach>
											</c:if>
										</select>
										<input type="hidden" name="user_id" value="${memberinfo.user_id}">
										<input type="hidden" name="value" value="user_dept">
									</div>
									<div class="col-md-3">
										<button class="btn btn-success waves-effect waves-light update" type="submit">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-2 col-form-label">직함</label>
									<div class="col-md-7">
										<select class="form-select" name="user_job" disabled>
											<c:if test="${!empty job }">
												<c:forEach var="list" items="${job }" varStatus="i">
													<option value="${list.job_name }">${list.job_name}</option>
												</c:forEach>
											</c:if>
										</select>
										<input type="hidden" name="user_id" value="${memberinfo.user_id}">
										<input type="hidden" name="value" value="user_job">
									</div>
									<div class="col-md-3">
										<button class="btn btn-success waves-effect waves-light update" type="submit">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-2 col-form-label">이메일 주소</label>
									<div class="col-md-7">
										<input class="form-control" type="email" value="${memberinfo.user_email }" name="user_email" readOnly>
										<input type="hidden" name="user_id" value="${memberinfo.user_id}">
										<input type="hidden" name="value" value="user_email">

									</div>
									<div class="col-md-3">
										<button class="btn btn-success waves-effect waves-light update" type="submit">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-2 col-form-label">FAX</label>
									<div class="col-md-7">
										<input class="form-control" type="text" value="${memberinfo.user_fax}" placeholder="Enter fax" name="user_fax" readOnly>
										<input type="hidden" name="user_id" value="${memberinfo.user_id}">
										<input type="hidden" name="value" value="user_fax">

									</div>
									<div class="col-md-3">
										<button class="btn btn-success waves-effect waves-light update" type="submit">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>
							<form action="updateProcess.my" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-2 col-form-label">연락처</label>
									<div class="col-md-7">
										<input class="form-control" type="text" value="${memberinfo.user_phone }" placeholder="Enter phone" name="user_phone" readOnly>
										<input type="hidden" name="user_id" value="${memberinfo.user_id}">
										<input type="hidden" name="value" value="user_phone">
									</div>
									<div class="col-md-3">
										<button class="btn btn-success waves-effect waves-light update" type="submit">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>

							<form action="updateProcess.my" method="post" enctype="multipart/form-data">
								<div class="mb-3 row">
									<label for="value-name" class="col-md-2 col-form-label">자기소개</label>
									<div class="col-md-7">
										<textarea class="form-control" placeholder="Enter INTRO" name="user_intro" rows="4" style="resize: none;" readOnly>${memberinfo.user_intro }</textarea>
										<input type="hidden" name="user_id" value="${memberinfo.user_id}">
										<input type="hidden" name="value" value="user_intro">
									</div>
									<div class="col-md-3">
										<button class="btn btn-success waves-effect waves-light update" type="submit">수정</button>
										<input class='btn btn-warning waves-effect waves-light' type="reset" id='second' style="display: none" value="취소">
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>

<jsp:include page="/main/footer.html"></jsp:include>
<script src="mypage_js/mypage.js"></script>

<script>
	$("option[value='${memberinfo.user_dept }']").prop("selected", true);
	$("option[value='${memberinfo.user_job }']").prop("selected", true);
</script>
</html>