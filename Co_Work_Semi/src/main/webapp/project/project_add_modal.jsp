<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-12">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#exampleModal" data-bs-whatever="@mdo">프로젝트
			추가</button>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">프로젝트 추가</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="project_Add" action="ProjectAddProcess.po"
							method="post">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">Recipient:</label>
								<input type="text" class="form-control" id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">Message:</label>
								<textarea class="form-control" id="message-text"></textarea>
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">Message:</label>
								<textarea class="form-control" id="message-text"></textarea>
							</div>
							<div class="mb-3 row">

								<div class="col-md-10">
									<label class="col-md-2 col-form-label">Select</label> <select
										class="form-select">
										<option>Select</option>
										<option>Large select</option>
										<option>Small select</option>
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" id="submit_add" class="btn btn-primary">Send
							message</button>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<div
			class="page-title-box d-sm-flex align-items-center justify-content-between">
			<h4 class="mb-sm-0 font-size-18">Projects List</h4>

			<div class="page-title-rig ht">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="javascript: void(0);">Projects</a></li>
					<li class="breadcrumb-item active">Projects List</li>
				</ol>
			</div>

		</div>
	</div>
</div>