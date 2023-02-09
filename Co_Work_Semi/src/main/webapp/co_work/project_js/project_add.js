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
               window.location.hash = page;
               $(window).scrollTop(0);
            }
         });
      }
      
      $("#add_project").click(function(){
            move_ajax("ProjectAdd.po");
         });
      
         $("body").on("click", '#submit_add', function(event){
	        event.preventDefault();
	        console.log('form[name="project_Add"]')
         $.ajax({
            url: "ProjectAddProcess.po" , //매개변수로 넘겨받은 url주소
            data : {
            project_name : $('#project_name').val(),
            project_prog :  $('#project_prog').val(),
            project_admin :  $('#project_admin').val(),
            project_start :  $('#project_start').val(),
            project_end :  $('#project_end').val(),
            project_priority :  $('#project_priority').val(),
            project_partici :  $('#project_partici').val()          
            },
            
            cache: false,
            dataType: "html",
            type: "GET",
            success: function(data) {
	           if(data==1){  //리스트 호출
		 
	             }
               $("#result").empty();
               $("#result").html(data);
              // window.location.hash = page;
               $(window).scrollTop(0);
            },
            error : function() {
			alert("error");
			}
         });
        });
      
   
      
      //a 태그 href 이동 막아주는 부분
      //<a id="HTABL" href="blog-list.html" onclick='preventClick(event)'> 태그에 onclick='preventClick(event) 작성해야합니다
      function preventClick(e){
         e.preventDefault()
      }
      
})
   