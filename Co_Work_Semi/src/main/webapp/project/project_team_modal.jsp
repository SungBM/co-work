<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- sample modal content -->
<div class="row">
	<div class="col-lg-6">
		<div id="myModal" class="modal fade" tabindex="-1"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">프로젝트 참여자</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" id="team_m">
							<div class="team_icon" style="display: inline-block;">
								<div class="avatar-group-item">
									<a href="javascript: void(0);" class="d-inline-block"> 
										<img src="image/users/${u.USER_IMG }" alt="" class="rounded-circle" style="width: 52px; height: 52px; padding: -5px; margin: 15px;" >		
									</a>
								</div>
							</div>
					</div>
					<div class="modal-footer"></div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
</div>
