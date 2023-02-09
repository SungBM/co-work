<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/main/header.html"></jsp:include>
<link href="project_Css/project.css" rel="stylesheet" type="text/css"/>
<div class="page-content">
    <div class="container-fluid">
        <!-- start page title -->
    <jsp:include page="/project/project_add_modal.jsp"></jsp:include>
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
                                    <th scope="col">상태</th>
                                    <th scope="col">PROGRESS</th>
                                    <th scope="col">시작일</th>
                                    <th scope="col">종료일</th>
                                    <th scope="col">우선순위</th>
                                    <th scope="col">참여자</th>
                                    <th scope="col">관리자</th>
                                </tr>
                            </thead>
                            <tbody>
	                          
                            	<c:forEach var="p" items="${projectList }">
                            	
                            	<tr>
                         		<c:if test="${p.row_num <= 6 }">
                            	 	<td><img src="assets/images/companies/img-${p.row_num }.png" alt="" class="avatar-sm"></td>
                            	</c:if>
                            	<c:if test="${p.row_num > 6  }">
                            		  <td><img src="assets/images/companies/img-${p.row_num -6}.png" alt="" class="avatar-sm"></td>
                            	</c:if>
                            
                                    <td>
                                        <h5 class="text-truncate font-size-14"><a href="#" class="text-dark">
											<c:out value="${p.project_name }"/>
										</a></h5>
                                        
                                    </td>
                                    <td>
                                    	<h5 id="getState" aria-valuenow = "${p.project_state }" class="text-truncate font-size-14" >
                                    		<c:out value="${p.project_state }"/>
										</h5>
                                    </td>
                                    <td>
                                    	<div class="">
                           					<div class="progress">
                                				<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"
                                    			aria-valuenow="${p.project_prog }" aria-valuemin="100" aria-valuemax="100" style="width: ${p.project_prog}%">
                                    			${p.project_prog }%
                                    			</div>
                            				</div>
                        				</div>
                                    </td>
                                     <td>	<c:out value="${p.project_start.substring(0,10) }"/></td>
                                    <td>
                               		<c:out value="${p.project_end.substring(0,10) }"/>
                                    <c:if test="${p.project_end == null}" >
                                    		미정
                                    </c:if>	
                                    </td>
                                    <td><span class="badge " aria-valuenow="${p.project_state }" style="width: 50%">${p.project_priority }</span></td>
                                    <td>
                                    <div class="avatar-group">
                                    	<c:forEach var='u' items="${p.project_parti }" varStatus="status">
                                    		<c:if test="${status.index > 3 }">
                                    			<div>
                                            		<a href="#" class="dropdown-toggle card-drop" 
                                            		data-bs-toggle="modal" data-bs-target="#myModal" aria-expanded="false">
                                                		<i class="mdi mdi-dots-horizontal font-size-18"></i>
                                            		</a>
                                            		<jsp:include page="/project/project_team_modal.jsp"></jsp:include>
                                            	</div>
                                    		</c:if>
                                    		<c:if test="${status.index <= 3 }">
                                    		  <div class="avatar-group-item">
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="image/users/${u.USER_IMG }" alt="" class="rounded-circle avatar-xs" id="more_team">
                                                </a>
                                              </div>
                                            </c:if>
                                    	</c:forEach>
                                    </div>
                                    </td>
                                    <td>
                                        <div class="avatar-group">
                                             <div class="avatar-group-item">
                                             <!-- 프로필 페이지로 연결 -->
                                                <a href="javascript: void(0);" class="d-inline-block">
                                                    <img src="image/users/${p.project_admin_img }" alt="" class="rounded-circle avatar-xs">
                                                </a>
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
                  <!--   
                  <a href="javascript:void(0);" class="text-success"><i class="bx bx-loader bx-spin font-size-18 align-middle me-2"></i> Load more </a>
				   -->                
                </div>
            </div> <!-- end col-->
        </div>
        <!-- end row -->
    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->
</body>
<jsp:include page="/main/footer.html"></jsp:include>
	<script src="project_js/project_add.js"></script>
	<script src="project_js/project_list_onload.js"></script>
</html>





