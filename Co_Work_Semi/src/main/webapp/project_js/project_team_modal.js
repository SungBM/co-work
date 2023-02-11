$(function(){
   $(".team_icon").click(function(){
	  var p =  $(this).parent().attr("id");
	  console.log(p);
	  var list = new Array();
		<c:forEach items="${projectList}" var="p">
			list.push("${p.project_name}");
		</c:forEach>
		console.log(list);
	  var html = '<div class="row">';
	  html += '<div class="col-lg-6">'
	  html += '	<div id="myModal" class="modal fade" tabindex="-1"'
	  html += '	aria-labelledby="myModalLabel" aria-hidden="true">'
	  html += '<div class="modal-dialog">'
	  html += '<div class="modal-content">'
	  html += '<div class="modal-header">'
	  html += '<h5 class="modal-title" id="myModalLabel">프로젝트 참여자</h5>'
	  html += '	<button type="button" class="btn-close" data-bs-dismiss="modal"'
	  html += 'aria-label="Close"></button>'
	  html += '	</div>'
	  html += '	<div class="modal-body" id="team_m">'
	  html += '	<c:forEach var="p" items="${projectList }" varStatus="status">'
	  html += '<c:if test="${p.project_num ==';
	  html +=p;
	  html += '  }">';
	  
	  html2 = '<div class="team_icon" style="display: inline-block;">';
	  html2 += '	<div class="avatar-group-item" style="width: 100px;">';
	  html2 += '		<a href="javascript: void(0);" class="d-inline-block"> ';
	  html2 += '<img src="image/users/${u.USER_IMG }" alt="" class="rounded-circle" style="width: 52px; height: 52px">		'
	  html2 += '</a>'
	  html2 += '<p><c:out value="${u.USER_NAME }"></c:out> </p>'
	  html2 += '</div>'
	  html2 += '	</div>';
	  <c:forEach var="u" items="${p.project_parti }" varStatus="status">;
			var html.appen()
	  </c:forEach>
	  html += '</c:if>'
	  html += '</c:forEach>'
	  html += '</div>'
	  html += '	<div class="modal-footer"></div>'
	  html += '</div>'
	  html += '	</div>'
	  html += '	</div>'
	  html += '</div>'
	  html += '</div>'
	  
	  $(".team_icon").append(html);
   });   
});
   