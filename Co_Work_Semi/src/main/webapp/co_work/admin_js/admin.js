function preventClick(e) {
	e.preventDefault()
}

$(function() {

	$("button[name=sub]").off("click").on("click", function(e) {
		e.preventDefault();
		var val = $(this).parent().prev().children().first().val()

		if ($(this).text() == "수정") {
			$(this).parent().prev().children().first().attr("readOnly", false)
			$(this).parent().prev().children().first().attr("disabled", false)
			$(this).parent().prev().children().first().focus()
			$(this).parent().prev().children().first().val('')
			$(this).parent().prev().children().first().val(val)
			$(this).text('확인')
			$(this).next().show();

		} else if ($(this).text() == "확인") {
			var answer = confirm(val + " 변경 하시겠어요?");
			if (answer) {
				$(this).unbind('click').click()
				$(this).text('수정')
			} else {
				$(this).parent().prev().children().first().focus()
				$(this).parent().prev().children().first().val('')
				$(this).parent().prev().children().first().val(val)
			}
		}
		e.stopPropagation();
	}) // 수정 버튼 클릭

	$(document).off("click").on("click", "#second", function() {
		$(this).parent().prev().children().first().attr("readOnly", true)
		$(this).parent().prev().children().first().attr("disabled", true)
		$(this).prev().text('수정')
		$(this).hide()
	})
})
