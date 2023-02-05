$(function() {
	$("a[name=mypage]").click(function() {
		$.ajax({
			url: "mypagecheck.my",
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

	$("#passwordchange").click(function() {
		$.ajax({
			url: "passwordchange.my",
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

	$("#notify").click(function() {
		$.ajax({
			url: "notify.my",
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

	$("#companyinfo").click(function() {
		$.ajax({
			url: "companyinfo.com",
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
})