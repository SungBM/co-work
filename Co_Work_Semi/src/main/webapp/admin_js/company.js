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
			$("button[type=submit]").not(this).hide();
			$("button[name=del]").hide();
			$(".bootstrap-touchspin-up").not(this).hide();
			$(this).text('확인')
			$(this).next().hide();
			$(this).next().next().show();

		} else if ($(this).text() == "확인") {
			var answer = confirm(val + " 변경 하시겠어요?");
			if (answer) {
				// 수정 완료 시
				$(this).unbind('click').click()
			} else {
				$(this).parent().prev().children().first().focus()
				$(this).parent().prev().children().first().val('')
				$(this).parent().prev().children().first().val(val)
			}
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
		$("button[type=submit]").show();
		$("button[name=del]").show();
		$("button").show();
	})

	$("#second").click(function() {
		$(this).parent().prev().children().first().attr("readOnly", true)
		$(this).parent().prev().children().first().attr("disabled", true)
		$(this).prev().prev().text('수정')
		$(this).hide()
		$(this).prev().show();
	})

	$(document).on("click", "button[name=del]", function() {
		var del = $(this).parent().prev().children().first().val();
		var answer = confirm(del + "  삭제하시겠습니까?");
		if (!answer) {
			return false;
		}
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