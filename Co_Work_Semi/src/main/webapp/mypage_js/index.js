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
	
	//커뮤니티
	$("#board_notice").off("click").click(function() {
		location.href="NoticeList.bon";
	});
	
	$("#board_free").off("click").click(function() {
		location.href="NoticeList.bon";
	});


})