$(function() {
	//ajax호출할때마다 실행되는 함수 (페이지이동시)

	$.ajax({
		url: "main/index.jsp", //매개변수로 넘겨받은 url주소
		cache: false,
		dataType: "html",
		type: "GET",
		success: function(data) {
			$("#result").empty();
			$("#result").html(data);
			window.location.hash = page;
			$(window).scrollTop(0);
		}
	});


})


<form name="project_Add" action="ProjectAddProcess.po" method="post">
				<input type="text" name="project_name" placeholder="프로젝트 명"><br>

				<!-- boday -->
						<label class="col-sm-2 control-label" for="lg">상태</label> 
						<select class="form-select" name="project_prog" aria-label="Default select example" style="width:180" >
							<option class=center>요청</option>
							<option class=center>진행중</option>
							<option class=center>마감</option>
						</select>
					</div><br>
			
					<div>
						<label>관리자</label> <input type="text" name="project_admin" value="${PROJECT.PROJECT_ADMIN}">
						<button>+</button>
					</div><br>

					<div>
						<label>날짜</label> <input type="date" name="project_start" class="form-control" style="width:180">
					</div><br>
					
					<div>
					<label>우선순위</label> <select class="form-select" name="project_priority"
						aria-label="Default select example" style="width:150">
						<option class=center>높음</option>
						<option class=center>중간</option>
						<option class=center>낮음</option>
					</select></div><br>


					<div>
						<label>참여자</label> <input type="text" name="project_partici" value="${PROJECT.PROJECT_PARTICI}">
						<button>+</button>
					</div>
					<br>
</form>