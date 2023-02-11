<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/main/header.html"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src=board_js/notice/write.js></script>
<style>


#upfile{display:none}
img{width:20px;}

.container-fluid{
	width:60%;
	margin: 0 auto;
}

.float-name{
	float: left;
	width:90%;
}
.float-id{
	float: left;
	width:10%;
}
.bottom-active{
	margin-top: 1em;
}
.file-value{
	float:left;
	width:85%;
}
.button{
	float:right;
}

label {
	text-align: right
}

	
</style>
<head>
<title>공지사항 작성</title>
</head>
<body>
<div class="page-content">
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
					<h4 class="mb-sm-0 font-size-18">커뮤니티 > 공지사항 > 작성</h4>
                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
						<form action="NoticeAddAction.bon" method="post" enctype="multipart/form-data" name="noticeform">
						<div class="float-name">
							<input name="notice_subject" id="notice_subject" type="text" maxlength="100"
									 class="form-control" placeholder="제목 입력">
						</div>
					
						<div class="float-id">
							<input name="notice_name" id="notice_name" value="${id}"	readOnly
									 type="text"	class="form-control"
									 placeholder="Enter notice_name">
						</div>
						
						<div class="form-group">
							<textarea name="notice_content" id="notice_content"
										 rows="15" class="form-control"
										 placeholder="내용을 입력하세요"></textarea>
						</div>
				
						<div class="bottom-active" >
							<div class="file-value">
								<label class="form-control" >
								<span id="filevalue"></span>
									<input type="file" id="upfile" name="notice_file">
									<img src="image/board/attach.png">
								</label>
								
							</div>
							<div class="button">
								<button type=reset class="btn btn-danger">취소</button>
								<button type=submit class="btn btn-primary">등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
    <!-- end row -->
    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
<jsp:include page="/main/footer.html"></jsp:include>
</body>
</html>