<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>프로젝트 추가</title>
<style>	
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
  
	
</style>
</head>
<body>
	<div class="modal modal-center fade" id="myCenterModal" tabindex="-1"
		role="dialog" aria-labelledby="myCenterModalLabel">
		<div class="modal-dialog modal-center" role="document">

			<div align=right>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" style="background-color:white">X</button>
			</div>
				

				<input type="text" name="project_name" placeholder="프로젝트 명"><br>

				<!-- boday -->
				<div class="center">
						<label class="col-sm-2 control-label" for="lg">상태</label> 
						<select class="form-select" name="project_prog" aria-label="Default select example" style="width:180" >
							<option class=center>요청</option>
							<option class=center>진행중</option>
							<option class=center>마감</option>
						</select>
					</div><br>
			

		
					<div class="center"">
						<label>관리자</label> <input type="text" name="project_admin" value="${user_info.user_id}">
						<button>+</button>
					</div><br>

					<div class="center">
						<label>날짜</label> <input type="date" name="project_start" class="form-control" style="width:180">
					</div><br>
					
					<div class="center">
					<label>우선순위</label> <select class="form-select" name="project_priority"
						aria-label="Default select example" style="width:150">
						<option class=center>높음</option>
						<option class=center>중간</option>
						<option class=center>낮음</option>
					</select></div><br>


					<div class="center">
						<label>참여자</label> <input type="text" name="project_partici" value="${user_info.user_name}">
						<button>+</button>
					</div>
					<br>

					<!-- footer -->
					<div class="center">
					<div class="modal-footer">
					<button type="submit" class="submitbtn" style="width:80">완료</button>
					</div>
				</div>
			</div>
		</div>
</body>