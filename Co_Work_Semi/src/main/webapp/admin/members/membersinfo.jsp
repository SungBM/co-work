<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/main/header.html"></jsp:include>
<title>구성원 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<input type="hidden" name="user_id" value="${m.user_id }">
	<div class="page-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="page-title-box d-sm-flex align-items-center justify-content-between">
						<h4 class="mb-sm-0 font-size-18">구성원> 구성원 관리</h4>

					</div>
				</div>
			</div>
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link active" data-bs-toggle="tab" href="#home-1" role="tab" aria-selected="true">
									<span class="d-block d-sm-none">
										<i class="fas fa-home"></i>
									</span>
									<span class="d-none d-sm-block">전체</span>
								</a></li>
							<li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link" data-bs-toggle="tab" href="#profile-1" role="tab" aria-selected="false" tabindex="-1">
									<span class="d-block d-sm-none">
										<i class="far fa-user"></i>
									</span>
									<span class="d-none d-sm-block">승인</span>
								</a></li>
							<li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link" data-bs-toggle="tab" href="#messages-1" role="tab" aria-selected="false" tabindex="-1">
									<span class="d-block d-sm-none">
										<i class="far fa-envelope"></i>
									</span>
									<span class="d-none d-sm-block">승인 대기</span>
								</a></li>
							<li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link" data-bs-toggle="tab" href="#settings-1" role="tab" aria-selected="false" tabindex="-1">
									<span class="d-block d-sm-none">
										<i class="fas fa-cog"></i>
									</span>
									<span class="d-none d-sm-block">이용 중지</span>
								</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content p-3 text-muted">
							<div class="tab-pane active" id="home-1" role="tabpanel">
								<p class="mb-1">작업중입니다.</p>
								<div class="table-responsive">
									<table class="table mb-1 dataTable">
										<thead>
											<tr role="row">
												<th class="sorting_asc" style="width: 13px;" aria-sort="ascending"><input class="form-check-input" type="checkbox" id="formCheck1"></th>
												<th class="sorting" style="width: 40px;">이름</th>
												<th class="sorting" style="width: 50px;">부서</th>
												<th class="sorting" style="width: 50px;">직책</th>
												<th class="sorting" style="width: 30px;">이메일</th>
												<th class="sorting" style="width: 50px;">연락처</th>
												<th class="sorting" style="width: 50px;">가입일</th>
												<th class="sorting" style="width: 60px;">마지막 접속</th>
												<th class="sorting" style="width: 50px;">상태</th>
												<th class="sorting" style="width: 50px;">관리자</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="m" items="${list }">
												<tr>
													<td>
														<input class="form-check-input" type="checkbox" id="formCheck2">
													</td>
													<td>
														<a name="meminfo" href="mypage.my?user_id=${m.user_id }"}">${m.user_name }</a>
													</td>
													<td>${m.user_dept }</td>
													<td>${m.user_job }</td>
													<td>
														<a href="#">${m.user_email }</a>
													</td>
													<td>${m.user_phone }</td>
													<td>${m.user_join_date }</td>
													<td>미구현</td>
													<c:if test="${m.user_state eq 0}">
														<td>이용중지</td>
													</c:if>
													<c:if test="${m.user_state eq 1}">
														<td>정상</td>
													</c:if>

													<c:if test="${m.user_is_admin eq 1}">
														<td>관리자</td>
													</c:if>
													<c:if test="${m.user_is_admin eq 0}">
														<td>사용자</td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="tab-pane" id="profile-1" role="tabpanel">
								<p class="mb-0">승인</p>
							</div>

							<div class="tab-pane" id="messages-1" role="tabpanel">
								<p class="mb-0">승인 대기</p>
							</div>

							<div class="tab-pane" id="settings-1" role="tabpanel">
								<p class="mb-0">이용 중지</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/main/footer.html"></jsp:include>
</html>