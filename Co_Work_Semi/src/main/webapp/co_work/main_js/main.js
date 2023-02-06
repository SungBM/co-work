$(function() {
	//ajax호출할때마다 실행되는 함수 (페이지이동시)

	$.ajax({
		url: "main/index.jsp", //매개변수로 넘겨받은 url주소
		cache: false,
		dataType: "html",
		type: "GET",
		success: function(data) {
			$("#result").empty();
			$("#result").html(data);
			window.location.hash = page;
			$(window).scrollTop(0);
		}
	});


})
