<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
select.from-control{
	width: auto;
	margin-bottom: 2em;
	display: inline-block
}

.rows {
	text-align: right;
}

.gray{
	color: gray;
}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(1){width:8%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(2){width:50%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(3){width:14%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(4){width:17%}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(5){width:11%}

</style>
<title>공지사항</title>
</head>
<body>
<!-- 위쪽 헤더 공백 -->
<div class="container" style="margin-top:100px">
	<h4>커뮤니티 > 공지사항</h4>
	<br>
	
	<!-- 검색 -->
	<div class="search-form margin-top first align-right">
		<h3 class="hidden">공지사항 검색폼</h3>
		<form class="table=form">
			<fieldset>
				<legend class="hidden">공지사항 검색 필드</legend>
				<label class="hidden">검색분류</label>
				<select name="f">
					<option value="title">제목</option>
					<option	value="writerId">작성자</option>
				</select>
				<label class="hidden">검색어</label>
				<input type="text" name="q" value=""/>
				<input class="btn btn-search" type="submit" value="검색"/>
			</fieldset>
		</form>
	</div>
	<button type="button" class="btn btn-info float-right">작성</button>








	<%-- 게시글이 있는 경우 --%>
	<c:if test="${listcount > 0}">
		<div class="rows">
			<span>줄보기</span>
			<select class="from-control" id="viewcount">
				<option value="10" selected>10</option>
				<option value="20">20</option>
				<option value="50">50</option>
			</select>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th colspan="3">공지사항 게시판</th>
					<th colspan="2"></th>
					<th>
						<font>등록 : ${listcount}</font>
					</th>
				</tr>
				<tr>
					<th><div>NO.</div></th>
					<th><div>제목</div></th>
					<th><div>작성자</div></th>
					<th><div>날짜</div></th>
					<th><div>조회수</div></th>
				</tr>
			</thead>
			<tbody>
				<c:set var="num" value="${listcount-(page-1)*limit}"/>	
				<c:forEach var="b" items="${noticelist}">
				<tr>
					<td><%--번호 --%>
						<c:out value="${num}"/><%-- num 출력 --%>
						<c:set var="num" value="${num-1}"/>	<%-- num=num-1; 의미--%>
					</td>
					<td><%--제목 --%>
					<div>
						<%-- 답변글 제목앞에 여백 서리 부분
								board_re_lev, board_num,
								board_subject, board_name, board_date,
								board_readcount : property 이름 --%>

 							<c:if test="${b.notice_re_lev != 0}">	<%-- 답글인 경우 --%>
								<c:forEach var="a" begin="0" end="${b.notice_re_lev*2}" step="1">
								&nbsp;
								</c:forEach>
								<img src='image/line.gif'>
							</c:if>
							
							<c:if test="${b.notice_re_lev == 0}">	<%-- 원문인 경우 --%>
								&nbsp;
							</c:if>
							
							<a href="NoticeDetailAction.bon?num=${b.notice_num}">
								<c:if test="${b.notice_subject.length()>=20}">
									<c:out value="${b.notice_subject.substring(0,20)}..."/>
								</c:if>
								<c:if test="${b.notice_subject.length()<20}">
									<c:out value="${b.notice_subject}" />
								</c:if>
							</a>[${b.cnt}]
						</div>
							
					</td>
					<td><div>${b.notice_name}</div></td>
					<td><div>${b.notice_reg_date}</div></td>
					<td><div>${b.notice_readcount}</div></td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
		
		<div class="center-block">
			<ul class="pagination justify-content-center">
				<c:if test="${page <= 1}">
					<li class="page-item">
						<a class="page-link gray">이전&nbsp;</a>
					</li>
				</c:if>
				<c:if test="${page > 1}">
					<li class="page-item">
						<a href="NoticeList.bon?page=${page-1}"
							class="page-link">이전&nbsp;</a>
					</li>
				</c:if>
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == page}">
						<li class="page-item active">
							<a class="page-link">${a}</a>
						</li>
					</c:if>
					<c:if test="${a != page}">
						<li class="page-item">
							<a href="NoticeList.bon?page=${a}"
								class="page-link">${a}</a>
						</li>
					</c:if>
				</c:forEach>
				
				<c:if test="${page >= maxpage}">
					<li class="page-item">
						<a class="page-link gray">&nbsp;다음</a>
					</li>
				</c:if>
				<c:if test="${page >= maxpage}">
					<li class="page-item">
						<a href="NoticeList.bon?page=${page+1}"
							class="page-link">&nbsp;다음</a>
					</li>
				</c:if>
			</ul>
		</div>
	</c:if><%-- <c:if test"${listcount > 0}" > end --%>
	
	<%-- 게시글이 없는 경우 --%>
	<c:if test="${listcount == 0}">
		<h3 style="text-align:center">등록된 글이 없습니다.</h3>
	</c:if>
	
</div> <%-- <div class="container"> end --%>
</body>
</html>