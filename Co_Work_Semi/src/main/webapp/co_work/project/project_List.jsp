<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-content">
    <div class="container-fluid">

        <!-- start page title -->
       
        <div class="row">
            <div class="col-12">
             <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                            data-bs-whatever="@mdo">프로젝트 추가</button>
                                             <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">프로젝트 추가</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form name="project_Add" action="ProjectAddProcess.po" method="post">
                                                <div class="modal-body">                                         
                                                        <div class="mb-3">
                                                            <label for="recipient-name" class="col-form-label">프로젝트명</label>
                                                            <input type="text" class="form-control" id="recipient-name" name="project_name">
                                                        </div>
                                                        <div class="col-md-10">
									                               <label class="col-md-2 col-form-label">상태</label>
									                                <select class="form-select" name="project_prog">
									                                    <option>요청</option>
									                                    <option>진행중</option>
									                                    <option>마감</option>
									                                </select>
									                            </div>
                                                        <div class="mb-3">
                                                            <label for="message-text" class="col-form-label">관리자</label>
                                                            <textarea class="form-control" id="message-text" name="project_admin" ></textarea>
                                                        </div>
                                                       <div class="mb-3 row">
							                            <label for="example-date-input" class="col-md-3 col-form-label" >날짜</label>
							                            <div class="col-md-10">
								                        <input class="form-control" type="date" value="2023-02-06" id="example-date-input" name="project_start">
								                            </div>
								                        </div>
									                            <div class="col-md-10">
									                               <label class="col-md-2 col-form-label">우선순위</label>
									                                <select class="form-select" name="project_priority">
									                                    <option>높음</option>
									                                    <option>중간</option>
									                                    <option>낮음</option>
									                                </select>
									                            </div>
									                   <div class="mb-3">
                                                            <label for="message-text" class="col-form-label">참여자</label>
                                                            <textarea class="form-control" id="message-text" name="project_partici"></textarea>
                                                        </div>      
									                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">                                          
                                                    <button type="submit" id="submit_add" class="btn btn-primary">완료</button>
                                               
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 
               <br><br>
               
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
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
        <!-- end page title -->
        <div class="row">
            <div class="col-lg-12">
                <div class="">
                    <div class="table-responsive">
                        <table class="table project-list-table table-nowrap align-middle table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col" style="width: 100px">${listcount }PROJECT</th>
                                    <th scope="col">프로젝트</th>
                                    <th scope="col">PROGRESS</th>
                                    <th scope="col">시작일</th>
                                    <th scope="col">종료일</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Team</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
	                          
                            	<c:forEach var="p" items="${projectList }">
                            	<tr>
                                    <td><img src="assets/images/companies/img-${p.row_num }.png" alt="" class="avatar-sm"></td>
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
											<c:out value="${p.project_name }"/>
										</a></h5>
                                        <p class="text-muted mb-0">It will be as simple as Occidental</p>
                                    </td>
                                    <td>
                                    	<div class="">
                           					<div class="progress">
                                				<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar"
                                    			aria-valuenow="${p.project_prog }" aria-valuemin="0" aria-valuemax="100" style="width: ${p.project_prog}%">
                                    			</div>
                            				</div>
                            				<p style="color: black">${p.project_prog }</p>
                        				</div>
                                    </td>
                                     <td>	<c:out value="${p.project_start.substring(0,10) }"/></td>
                                    <td>
                               		<c:out value="${p.project_end.substring(0,10) }"/>
                                    <c:if test="${p.project_end == null}" >
                                    		미정
                                    </c:if>	
                                    </td>
                                    <td><span class="badge bg-success">Completed</span></td>
                                    <td>
                                        <div class="avatar-group">
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="assets/images/users/avatar-4.jpg" alt="" class="rounded-circle avatar-xs">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="assets/images/users/avatar-5.jpg" alt="" class="rounded-circle avatar-xs">
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <div class="avatar-xs">
                                                        <span class="avatar-title rounded-circle bg-success text-white font-size-16">
                                                            A
                                                        </span>
             ek                                        </div>
                                                </a>
                                            </div>
                                            <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="assets/images/users/avatar-2.jpg" alt="" class="rounded-circle avatar-xs">
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <a href="#" class="dropdown-toggle card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="mdi mdi-dots-horizontal font-size-18"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            	</c:forEach>
                          
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->

        <div class="row">
            <div class="col-12">
                <div class="text-center my-3">
                    <a href="javascript:void(0);" class="text-success"><i class="bx bx-loader bx-spin font-size-18 align-middle me-2"></i> Load more </a>
                </div>
            </div> <!-- end col-->
        </div>
        <!-- end row -->
        
    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
<script src="project_js/project_add.js"></script>