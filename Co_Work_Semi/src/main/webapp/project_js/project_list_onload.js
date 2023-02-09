$(function(){
		var prog_arr = new Array();
		$(".progress-bar").each(function(){
			prog_arr.push($(this).attr("aria-valuenow"));
			var prog_num = $(this).attr("aria-valuenow");
			console.log("this의 속성값" + prog_num);
			if(prog_num >= 100 ) {
				$(this).removeClass("progress-bar progress-bar-striped progress-bar-animated");
			} else {
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
			}
			
		});
		
		$(".badge").each(function(){
			var state = $(this).attr("aria-valuenow");
			switch(state) {
				case "마감 임박" :
					$(this).addClass('bg-danger');
					break;
				case "진행중" :
					$(this).addClass('bg-info');
					break;
				case "마감" :
					$(this).css('background-color','darkgray');
					break;	
				case "요청 확인" :
					$(this).addClass('bg-danger');
					break;
			}
			
		});
		
		
		$(".text-truncate").each(function(){
			var state = $(this).attr("aria-valuenow");
			console.log("state의 속성값" + state);
			switch(state) {
				case "마감 임박" :
					$(this).css('color','#f46a6a');
					break;
				case "진행중" :
					$(this).css('color','#50a5f1');
					break;
				case "마감" :
					$(this).css('color','darkgray');
					break;	
				case "요청 확인" :
					$(this).css('color','#f1b44c');
					break;
			}
			
		});
		
		$(".team_a").click(function(){
			console.log("a 클릭");
			$(".team_btn").click();
			console.log("a 클릭 after");
		})
		
		
		
})
	