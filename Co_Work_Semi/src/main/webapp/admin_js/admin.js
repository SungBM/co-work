function preventClick(e) {
	e.preventDefault()
}

$(function() {
	$("button[name=sub]").on("click", function(e) {
		e.preventDefault();
		var val = $(this).parent().prev().children().first().val();
		var val2 = $(this).parent().prev().children().eq(1).val();
		var val3 = $(this).parent().prev().children().eq(2).val();
			if ($(this).text() == "수정") {
			$(this).parent().prev().children().first().attr("readOnly", false)
			$(this).parent().prev().children().first().attr("disabled", false)
			$(this).parent().prev().children().first().focus()
			$(this).parent().prev().children().first().val('')
			$(this).parent().prev().children().first().val(val)
			$(this).text('확인')
			$(this).next().hide();
			$(this).next().next().show();

		} else if ($(this).text() == "확인") {
			$(this).unbind('click').click()
		}
		e.stopPropagation();
	}) // 수정 버튼 클릭
	// + 버튼 클릭
	$(".bootstrap-touchspin-up").on("click", function() {
		$(this).hide();
		$(this).next().show();
	})


	$(document).on("click", "#second", function() {
		$(this).parent().prev().children().first().attr("readOnly", true)
		$(this).parent().prev().children().first().attr("disabled", true)
		$(this).prev().prev().text('수정')
		$(this).hide()
		$(this).prev().show();
	})

	$("#second").click(function() {
		$(this).parent().prev().children().first().attr("readOnly", true)
		$(this).parent().prev().children().first().attr("disabled", true)
		$(this).prev().prev().text('수정')
		$(this).hide()
		$(this).prev().show();
	})


	$("#comsecond").off("click").on("click", function() {
		$(this).parent().parent().parent().hide()
		$(this).parent().parent().parent().prev().show()
	})

	$(document).on("click", "#comsecond", function() {
		$(this).parent().parent().parent().hide()
		$(this).parent().parent().parent().prev().show()
	})
})