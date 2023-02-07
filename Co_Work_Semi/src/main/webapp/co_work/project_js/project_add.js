$(function(){
   
   $(function() {
    $('#adminCheck').click(function() {
            
        var project_name = $('#project_name').val();
        var project_prog = $('#project_prog').val();
        var project_admin = $('#project_admin').val();         
        var project_start = $('#project_start').val();         
        var project_end = $('#project_end').val();         
        var project_priority = $('#project_priority').val();         
        var project_partici = $('#project_partici').val();         
            
        // ajax 호출을 위한 정보 기입
        var request = $.ajax({
            url: "/ProjectAddProcess.po", // 호출 url
            method: "POST", // 전송방식
           data: {project_name, project_prog, project_admin, project_start, project_end, project_priority, project_partici}, // 파라미터
            dataType: "text" // 전송 받을 타입 ex) xml, html, text, json
        });
             
        // 호출 정상일 시 실행되는 메서드
        request.done(function( data ) {
            console.log(data);
        });
 
        // 호출 에러일 시 실행되는 메서드
        request.fail(function( jqXHR, textStatus ) {
            alert( "Request failed: " + textStatus );
        });
 
        // 호출 정상 또는 에러 상관없이 실행
        request.always(function() {
            console.log('완료');
        });
    });
});
      //ajax호출할때마다 실행되는 함수 (페이지이동시)
      
      $("#add_project").click(function(){
         move_ajax("ProjectAdd.po");
      });
      
      $("#submit_add").click(function(){
         move_ajax("ProjectAddProcess.po");
      });
      
      
      //a 태그 href 이동 막아주는 부분
      //<a id="HTABL" href="blog-list.html" onclick='preventClick(event)'> 태그에 onclick='preventClick(event) 작성해야합니다
      function preventClick(e){
         e.preventDefault()
      }
})
   
   