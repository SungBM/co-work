$(function(){
		var prog_arr = new Array();
		$(".progress-bar").each(function(){
			prog_arr.push($(this).attr("aria-valuenow"));
			var prog_num = $(this).attr("aria-valuenow");
			console.log("this의 속성값" + prog_num);
			if(prog_num >= 75) {
				console.log("if 들어옴");
				$(this).addClass('bg-danger');
			} else if( prog_num >= 50  ) {
					$(this).addClass('bg-warning');
			} else if ( prog_num >= 25 ) {
					$(this).addClass('bg-info');
			} else if (prog_num >= 0 ) {
				$(this).addClass('bg-success');
			}
		});
		
		console.log(prog_arr);
		
		
})
	