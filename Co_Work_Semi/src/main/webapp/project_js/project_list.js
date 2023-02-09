$(function(){
		//ajax호출할때마다 실행되는 함수 (페이지이동시)
		var move_ajax = function(url_add){
			$.ajax({
				url: url_add , //매개변수로 넘겨받은 url주소
				cache: false,
				dataType: "html",
				type: "GET",
				success: function(data) {
					$("#result").empty();
					$("#result").html(data);
					window.location.hash = url_add;
					$(window).scrollTop(0);
				}
			});
		}
		$("#project_list").click(function(){
			move_ajax("ProjectList.po");
		});
		
	
		
		//a 태그 href 이동 막아주는 부분
		//<a id="HTABL" href="blog-list.html" onclick='preventClick(event)'> 태그에 onclick='preventClick(event) 작성해야합니다
		function preventClick(e){
			e.preventDefault()
		}
		
})
	