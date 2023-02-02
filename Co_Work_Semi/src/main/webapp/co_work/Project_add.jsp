<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style>
.label {
	text-align: left;
}

.modal.modal-center {
	text-align: center;
}

.modal-dialog.modal-center {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
}

@media screen and (min-width: 768px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}
</style>
</head>
<body>
	<div class="modal modal-center fade" id="myCenterModal" tabindex="-1"
		role="dialog" aria-labelledby="myCenterModalLabel">
		<div class="modal-dialog modal-center" role="document">



			<div align=right>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">X</button>
			</div>


			<div class="col-12">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="프로젝트명">
				</div>
				<br>

				<!-- boday -->
				<label>상태</label> <select class="form-select"
						aria-label="Default select example">
						<option value="1">요청</option>
						<option value="2">진행중</option>
						<option value="3">마감</option>
					</select>
				


				<div class="col-12">
					<div class="form-group">
						<label>관리자</label> <input type="text" class="form-control">
					</div>

					<div class="form-group">
						<label>날짜</label> <input type="date" class="form-control">
					</div>

					<label>우선순위</label> <select class="form-select"
						aria-label="Default select example">
						<option value="1">높음</option>
						<option value="2">중간</option>
						<option value="3">낮음</option>
					</select>


					<div class="form-group">
						<label>참여자</label> <input type="text" class="form-control">
					</div>
					<br>

					<!-- footer -->
					<div class="modal-footer">
						<button type="button" id="modal-footer" class="btn btn-primary">완료</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end preview-->
	</div>
</body>