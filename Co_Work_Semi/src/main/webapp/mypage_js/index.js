<<<<<<< HEAD
$(function() {
	//ajax호출할때마다 실행되는 함수 (페이지이동시)
	var move_ajax = function(url_add) {
		$.ajax({
			url: url_add, //매개변수로 넘겨받은 url주소
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

	$("#mypagecheck").click(function() {
		move_ajax("mypagecheck.my");
	});
	$("#mypagedrop").click(function() {
		move_ajax("mypagecheck.my");
	});

	$("#passwordchange").off("click").click(function() {
		move_ajax("passwordchange.my");
	});

	$("#notify").off("click").click(function() {
		move_ajax("notify.my");
	});

	$("#membersinfo").off("click").click(function() {
		move_ajax("membersInfo.com");
	});

	$("#companyinfo").off("click").click(function() {
		move_ajax("companyinfo.com");
	});
	
=======
$(function() {


	$("#mypagecheck").click(function() {
		location.href="mypagecheck.my";
	});
	$("#mypagedrop").click(function() {
		location.href="mypagecheck.my";
	});

	$("#passwordchange").off("click").click(function() {
		location.href="passwordchange.my";
	});

	$("#notify").off("click").click(function() {
		location.href="notify.my";
	});

	$("#membersinfo").off("click").click(function() {
		location.href="membersInfo.com";
	});

	$("#companyinfo").off("click").click(function() {
		location.href="companyinfo.com";
	});
	
>>>>>>> branch 'sungbin' of https://github.com/SungBM/co-work.git
})