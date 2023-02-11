<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/main/header.html"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="board_js/notice/list.js"></script>
<script src="board_js/notice/view.js"></script>
<style>

.container-fluid{
	width:60%;
	margin: 0 auto;
	
}
.float-subject{
	float: left;
	width:90%;
}
.float-name{
	float: left;
	width:10%;
}
.float-date{
	float: right;	
}
.bottom-active{
	margin-top: 1em;
}

.file-value{
	float: left;
	width: 80%;
}
.button{
	float: right;	
}
</style>
<head>
<title>공지사항 작성</title>
</head>
<body>
	<input type="hidden" id="loginid" value="${id}" name="loginid"><%--view.js에서 사용하기 위해 추가합니다. --%>
	<div class="page-content">
	    <div class="container-fluid">
	
	        <!-- start page title -->
	        <div class="row">
	            <div class="col-12">
	                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
						<h4 class="mb-sm-0 font-size-18">커뮤니티 > 공지사항 > 상세내용</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	        <!-- view페이지 -->
			<div class="card">
               	<div class="card-body">
					<div class="float-subject">
						<div class="form-control"><c:out value="${noticedata.notice_subject}"/></div>
					</div>
					<div class="float-name">
							<input class="form-control" value="${noticedata.notice_name}" readOnly>
					</div>
					<div class="float-date">
							<span><c:out value="${noticedata.notice_reg_date}"/></span>
					</div>					
					<div class="form-group">
						<textarea class="form-control" rows="10">${noticedata.notice_content}</textarea>
					</div>
			
					<div class="bottom-active" >
						<div class="file-value">
							<label class="form-control" >
								<span id="filevalue"></span>
								<!-- 파일 첨부한 경우 -->
								<c:if test="${!empty noticedata.notice_file}">
									<td>
										<img src="image/board/down.png" width="10px">
										<a href="NoticeFileDown.bon?filename=${noticedata.notice_file}">${noticedata.notice_file}</a>
									</td>
								</c:if>
							</label>
						</div>
						<div class="button">
							<c:if test="${noticedata.notice_name == 'HTA1'}">
								<%--href의 주소를 #으로 설정합니다. --%>
								<span href="#">
									<button class="btn btn-danger" data-toggle="modal"
										data-target="#myModal">삭제</button>	
								</span>
								<span href="NoticeModifyView.bon?num=${noticedata.notice_num}">
									<button class="btn btn-info">수정</button>
								</span>
							</c:if>	
						</div>
					</div>
				</div>
			</div>	    
		</div> 
	</div><!-- container-fluid -->
	
<!-- End Page-content -->
<jsp:include page="/main/footer.html"></jsp:include>
</body>
</html>