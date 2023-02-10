<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                             
                                                <div class="modal-body">                                         
                                                        <div class="mb-3">
                                                            <label for="recipient-name" class="col-form-label">프로젝트명</label>
                                                            <input type="text" class="form-control" id="project_name" name="project_name">
                                                        </div>
                                                        <div class="col-md-12">
                                                          <label class="col-md-2 col-form-label">상태</label>
                                                           <select class="form-select" id="project_prog" name="project_prog">
                                                               <option value=0>요청</option>
                                                               <option value=1>진행중</option>
                                                               <option value=2>마감</option>
                                                           </select>
                                                       </div>
                                                        <div class="mb-3">
                                                            <label for="message-text" class="col-form-label">관리자</label>
                                                            <textarea class="form-control" id="project_admin" name="project_admin" ></textarea>
                                                        </div>
                                                       <div class="mb-3 row">
                                                 <label for="example-date-input" class="col-md-3 col-form-label" >시작일</label>
                                                 <div class="col-md-12">
                                                <input class="form-control" type="date" value="2023-02-06" id="project_start" name="project_start">
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                 <label for="example-date-input" class="col-md-3 col-form-label" >종료일</label>
                                                 <div class="col-md-12">
                                                <input class="form-control" type="date" value="2023-02-06" id="project_end" name="project_end">
                                                    </div>
                                                </div>
                                                       <div class="col-md-12">
                                                          <label class="col-md-2 col-form-label">우선순위</label>
                                                           <select class="form-select" id="project_priority" name="project_priority">
                                                               <option>높음</option>
                                                               <option>중간</option>
                                                               <option>낮음</option>
                                                           </select>
                                                       </div>
                                              <div class="mb-3">
                                                            <label for="message-text" class="col-form-label">참여자</label>
                                                            <textarea class="form-control" id="project_admin" name="project_admin"></textarea>
                                                        </div>      
                                                   </div>   
                                                <div class="modal-footer">                                                                       
                                                    <button type="submit" id="submit_add" class="btn btn-primary">완료</button>
                                           
                                                </div>
                                                                  
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>