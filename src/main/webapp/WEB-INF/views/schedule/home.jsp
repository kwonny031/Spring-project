<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ===================[fullcalendar 6.1.4 CDN]===================== -->
<!--  fullcalendar 6.1.4버전 CDN -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
<!-- fullcalendar 6.1.4버전 언어 설정 -->
<script src="${pageContext.request.contextPath }/resources/fullcalendar/ko.global.min.js"></script>

<!-- 툴팁 사용  V4-->
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<!-- ===================[fullcalendar 6.4.1 CDN]===================== -->
<style>
body{
	overflow:hidden;
}
.fc-daygrid {
   width: 900px; /* 일 그리드 전체의 넓이를 설정합니다. */
}

.fc-daygrid-day {
  width: 100px; /* 각 날짜 셀의 넓이를 설정합니다. */
}
 .fc-header-toolbar { 
 	padding-top: 1em; 
 	padding-left: 1em;
 	padding-right: 1em; 
 } 
input{
	background-color: transparent; 
	border-radius: 5px; 
	padding: 3px; 
	border: 1px solid #7c8295; 
	opacity: 0.6;

}
.fc-day-sun a {
   color: red;
   text-decoration: none;
}
.fc-day-sat a {
   color: blue;
   text-decoration: none;
}
 a{
	color: black
}
.border-end{
	border-right: 1px solid #c3d0dd!important;
}
.fc-theme-standard th, .fc-theme-standard td, .fc-scrollgrid, .fc-border-color{
	border: 1px solid #cbc7c7 ; 
}
.popper{ 
    position: absolute; 
    z-index: 9999 !important; 
    background: #FFC107; 
    color: black; 
    width: 150px; 
    border-radius: 3px; 
    box-shadow: 0 0 2px rgba(0,0,0,0.5); 
    padding: 10px; 
    text-align: center; 
} 
.tooltip-inner{
   font-weight: bold;
   font-size: 20px;
   max-width: 500px;
   padding: 0.25rem 0.5rem;
   color: black;
   text-align: center;
   background-color: white;
   border: 1px solid #eee;
   box-shadow:2px 3px 5px 0px;
   border-radius: 4px;
    }
.participants{
	margin-right: 5px;
    display: inline;
    background-color: #ee9d01;
    color: white;
    padding: 5px;
    border-radius: 5px;
} 
#delBtn{
	background-color: transparent;
    border: transparent;
	color : white;
	padding: 0 1px 0 3px;
}
.text-success{
	color: #008000!important;
}
</style>
<script type="text/javascript">
(function(){ 
	
$(function(){
	var empNo = '${SessionInfo.empNo }';
	var depCode = '${SessionInfo.depCode }';
	var param = {
			"empNo" : empNo,
			"depCode" : depCode
	}
	console.log("[param] : ", param);
	
	var req = $.ajax({
		url:"/sch/home",
		type:"post",
		data : JSON.stringify(param),
		contentType: "application/json;charset=utf-8",
		dataType:"json"
	});
	
// 	var req = $.ajax({
// 		url:"/sch/home",
// 		type:"post",
// 		data : JSON.stringify(param),
// 		contentType: "application/json;charset=utf-8",
// 		dataType:"json"
// 	});
	
	req.fail(function(jqXHR, textStatus){
		Swal.fire("오류발생",jqXHR + textStatus, "error");
	});
	
	req.done(function(data){
// 		Swal.fire("잘뜨나요??", "","success");
// 		console.log("넘어온 데이터를 확인합니다 ::: " + JSON.stringify(data));
		console.log(data);
		var modalEl = document.getElementById('calendarModal');
		var modal = new bootstrap.Modal(modalEl);
		
		var empNo = '${SessionInfo.empNo }';
		
		var title = $("#calendar_title");		// 일정 제목
        var content = $("#calendar_content"); 	// 일정 내용
        var start = $("#calendar_start_date");	// 시작일
	    var end = $("#calendar_end_date");		// 종료일
        var startTime = $("#startTime");		// 시작시간
        var endTime = $("#endTime");			// 종료 시간
        
        var loca = $("select[name=loca]").val();
 	    var schType = $("select[name=schType]").val();
 	    var color = $("select[name=color]").val();
 	    var schRead = $("input [name=schRead] checked").val();
        
    	var saveBtn = $("#addCalendar");		// modal [추가] 버튼
    	var closeBtn = $("#closeBtn");			// modal [x] 버튼
    	var modalCloseBtn = $("#modalCloseBtn");// modal [취소] 버튼
    	var deleteBtn = $("#deleteCalendar");	// 삭제 버튼
    	var flag = false;

        saveBtn.on("click", function(info){
       	 
   		var title = $("#calendar_title");		// 일정 제목
        var startTime = $("#startTime");		// 시작시간
        var endTime = $("#endTime");			// 종료 시간
        var start = $("#calendar_start_date");	// 시작일
        var end = $("#calendar_end_date");		// 종료일
        var content = $("#calendar_content"); 	// 일정 내용
            
   		var allDay = $("#allDay");				// 하루종일 여부
//    		var color = $("select[name=color]").val(); // 색상   
        var loca = $("select[name=loca]").val();
 	    var schType = $("select[name=schType]").val();
        
 	    // 30분 간격의 사이값 계산 ( end - start )
 	    // 이렇게하면 딱 30분만 시간 설정이 가능함.... 이걸 변형해서 써야할듯
 	    var calcTime = Date.parse(end.val()+"T"+endTime.val()) - Date.parse(start.val()+"T"+startTime.val())
//  	    if(calcTime > 88200000){
//  	    	Swal.fire("시간은 30분 간격으로만 설정가능합니다!", "", "warning");
//  	    	return false;
//  	    }
 	    
 	    //[일정 참여자 정보]=================================================================
 	    var parts= document.querySelectorAll('.schEmpNo');
 	    var schEmp = '';
 	    console.log("참여자 : " , parts);
 	    
 	    for(let i=0; i<parts.length; i++){
			schEmp += parts[i].defaultValue + "/";	    	
 	    }
		console.log('schEmp : ',schEmp); 	
		// ============================================================================
			
        var saveBtn = $("#addCalendar");			// modal [추가] 버튼
        var closeBtn = $("#closeBtn");				// modal [x] 버튼
        var modalCloseBtn = $("#modalCloseBtn");	// modal [취소] 버튼
        var deleteBtn = $("#deleteCalendar");		// 삭제 버튼
        
        if( $("#allDay").is(":checked")){
        	allDay.value = "T";
        }else{
        	allDay.value = "N";
        }
        
   	 //// 일정 등록 시 조건 ////
   	 	console.log("제목 : ", title.val());
        if(title.val() == ""){
			Swal.fire("일정의 제목을 입력하세요", "", "info");
			title.focus();
			return false;
        }
        
        if(content.val() == ""){
        	Swal.fire("일정의 내용을 입력하세요.", "", "info");
        	content.focus();
			return false;
        }
        
        // 일단 이건 수정필요!!
        if(new Date(endTime.val()) - new Date(end.val()) < 0){
        	Swal.fire("종료일이 시작일보다 먼저입니다.", "", "info");
			return false;
        }
        
        if(schType == null || schType == ""){
        	Swal.fire("일정 타입을 선택해 주세요.", "", "info");
			return false;
        }
  		//// 일정 등록 시 조건 ////
	   		
       	if(flag == true){ 						// 일정 등록
   	     	   titleInput = title.val();
   	     	   contentInput = content.val();
//    	     	   alert("allDay체크 ::"+ allDay.value);
   	     	   
   	     	   if(schRead == null || schRead == ''){
   	     		   schRead = "N";
   	     	   }
   	     	   console.log("schRead : " + schRead);
   	     	   
   	     	   startTimeInput = startTime.val(); 
   	     	   endTimeInput = endTime.val(); 
   	     	   
   	     	   startInput = document.getElementById('calendar_start_date').value;
   	     	   endInput = document.getElementById('calendar_end_date').value;
   	     	   
//    	           console.log("title : " + titleInput + ", content : "+ contentInput + "startDate : " + startInput);
   	     	   console.log("일정참여자 사번 조회", )
   	           // 입력값을 받아와서 디비에 저장
   	           if(allDay.value == 'T'){ //일정이 하루종일인 경우
// 				  alert("일정이 하루종일인 경우!!");
   	           		let data = {
      		     	   		'empNo' 	  : empNo,
       		     		   	'schTitle' 	  : titleInput,
       		     		   	'schContent'  : contentInput,
       		     		    'schStart' 	  : startInput,
       	     		   		'schEnd' 	  : endInput,
       	     		   		'schLocation' : loca,
       	     		   		'schType' 	  : schType,
       	     		   		'schRead' 	  : schRead,
       	     		   		'allDay' 	  : true,
       	     		   		'schEmpNo'	  : schEmp
       		     }
   	        	   
   		           $.ajax({
   		     	   	type : "POST",
   		     	   	url : "/sch/register",
   		     	   	data: JSON.stringify(data),
					contentType: "application/json;charset=utf-8",
					dataType:"text",
   		     	   	success : function(res){

						Swal.fire("일정이 추가되었습니다.", "", "success").then((result)=>{
						})
							
   		     	   		}
						
   		        	});	// ajax end
   	           }else{ //시간을 설정한 경우

				  let data = {
   			     	   		'empNo' 	  	: empNo,
   			     		   	'schTitle' 		: titleInput,
   			     		   	'schContent' 	: contentInput,
   		     		   		'schStart' 		: startInput+"T"+startTimeInput,
   		     		   		'schEnd' 		: endInput+"T"+endTimeInput,
	   		     		   	'schLocation' 	: loca,
	   	     		   		'schType' 		: schType,
	   	     		   		'schRead' 		: schRead,
	   	     		   		'allDay'		: false,
	   	     		   		'schEmpNo'	    : schEmp
   			      }

   	        	   $.ajax({
   			     	   	type : "POST",
   			     	   	url : "/sch/register",
   			     	   	data : JSON.stringify(data),
						contentType: "application/json;charset=utf-8",
						dataType:"text",
   			     	   	success : function(res){
							Swal.fire("일정이 추가되었습니다.", "", "success").then((result)=>{
							});
   			     	   	}
   			        });
   	           }
// 	       		console.log("loca == "+ loca + ", schType : " + schType);
   	           $("#calendar_content").val('');
   	           $("#calendar_start_date").val('');
   	           $("#calendar_end_date").val('');
   	           
   	           // 조직도 모달창 닫기
   	           $("#schTreeModal").attr("style", "display:none");
   	           
   	           modal.hide();
   	          location.reload();
   	                  		
       	}else{	// update
	         
   	     	 schCode = $("#schCode").val();
   	     	 title = $("#calendar_title").val();
   	     	 content = $("#calendar_content").val();
   	     	 startDate = $("#calendar_start_date").val();
   	     	 startTime = $("#startTime").val();
   	     	 endDate = $("#calendar_end_date").val();
   	     	 endTime = $("#endTime").val();
//    	     	 color = $("select[name=color]").val();
	     	 schRead = "Y";
   	     	 openCkBoxVal = $("input[name=schRead]:checked").val();
   	     	 if(!openCkBoxVal){
   	     		 schRead = "N";
   	     	 }
   	     	$("#allDay").attr("checked", false);
   	     	 
	   	    if( $("#allDay").is(":checked")){
	          allDay.val("T");
	        }else{
	          allDay.val("N");
	        }
   	     	
	   	    alert(allDay.val());
	   	    
   	     	if(allDay.val() == 'T'){ //일정이 하루종일인 경우
	   	     	var param={
	  	     			 'schCode' 		: schCode,
	  	     			 'schTitle' 	: title,
	  	     			 'schContent' 	: content,
	  	     			 'schStart' 	: startDate,
	  	     			 'schEnd' 		: endDate,
	  	     			 'schLocation' 	: loca,
	    		   		 'schType' 		: schType,
// 	    		   		 'schColor' 	: color,
	    		   		 'schRead' 		: schRead,
	    		   		 'allDay'		: true
  	     	 }
   	     	}else{					 //일정 시간을 선택한 경우 
   	     		
	   	     	// alert("최종확인: " + schRead); 
	   	     	 console.log(">> 수정 : " + schCode + ", " + title +", "+ content+", " + startDate +", "+ startTime + ", 공개여부!! 왜 안넘어와!!!!!! : "+ schRead);
	   	     	 var param={
	   	     			 'schCode' 		: schCode,
	   	     			 'schTitle' 	: title,
	   	     			 'schContent' 	: content,
	   	     			 'schStart' 	: startDate+"T"+startTime,
	   	     			 'schEnd' 		: endDate+"T"+endTime,
	   	     			 'schLocation' 	: loca,
	     		   		 'schType' 		: schType,
	     		   		 'schRead' 		: schRead,
	     		   		 'allDay'		: false
	   	     	 }
   	     	}
   	     	 $.ajax({
   	     		 type : "post",
   	     		 url : "/sch/update",
   	     		 data : param,
   	     		 dataType : "json",
   	     		 success: function(req){
   	     			 console.log("수정 결과 ::: ",req);
   	     		 }
   	     	 });	//ajax end
//  	     	 Swal.fire("수정이 완료되었습니다.", "", "success");
   	     	 
 	         // 조직도 모달창 닫기
 	         $("#schTreeModal").attr("style", "display:none");
 	         
   	     	 modal.hide();
   	     	 location.reload();
           }
        })//:::saveBtn End    	

        deleteBtn.on("click",function(){	// 삭제버튼 클릭시 이벤트 발생
        	schCode = $("#schCode").val();
       	 var param ={
       			   'schCode' : schCode,
              	   }
   		
       	Swal.fire(
		        {
		          title: "일정을 삭제하시겠습니까?",
		          text: "확인버튼을 누르시면 일정이 삭제됩니다.",
		          icon: "warning",
		          showCancelButton: true,
		          confirmButtonColor: "rgb(89 61 239)",
		          confirmButtonText: "확인",
		          cancelButtonText: '취소',
		          closeOnConfirm: false,
		        }).then((result) => {
		            if (result.isConfirmed) {
// 			            	alert("여기오나용??" + schCode);
		       		$.ajax({
		        	   type : "POST",
		        	   url : "/sch/remove",
		        	   data :param,
		     	   	   dataType : "json",
		               success : function(req){	
		           	   }
		       		});
	                Swal.fire(title+"삭제되었습니다.",'','success').then((result) =>{
			   			location.reload();
	                })
	                
		   			modal.hide();
	                
	              }
		        });
        });
    	
      	// modal [x] 버튼 
        closeBtn.on("click",function(){
         // modal 창 내용 초기화
			$("#schTreeModal").attr("style", "display:none;");
	        $("#schCode").val("");
	       	$("#empNo").val("");
	        $("#calendar_title").val("");
	        $("#calendar_content").val("");
	        $("#calendar_start_date").val("");
	        $("#startTime").val("");
	        $("#calendar_end_date").val("");
	        $("#endTime").val("");
	        $(".schRead").attr("checked", false);
	        $("#allDay").attr("checked", false);
	        $("#schEmp").text("");
// 			$("select[name=color]").val("");  
	        $("select[name=loca]").val("");
	 	    $("select[name=schType]").val("");
         console.log("x버튼 클릭");
         
         // 조직도 모달창 닫기
         $("#schTreeModal").attr("style", "display:none");
         
         modal.hide();
        });
       	
        
     	// modal [취소] 버튼
        modalCloseBtn.on("click",function(){
         // modal 창 초기화
	        $("#schTreeModal").attr("style", "display:none;");
            $("#schCode").val("");
	       	$("#empNo").val("");
	        $("#calendar_title").val("");
	        $("#calendar_content").val("");
	        $("#calendar_start_date").val("");
	        $("#startTime").val("");
	        $("#calendar_end_date").val("");
	        $("#endTime").val("");
	        $(".schRead").attr("checked", false);
	        $("#allDay").attr("checked", false);
	        $("#schEmp").text("");
// 	        $("select[name=color]").val("");  
	        $("select[name=loca]").val("");
	 	    $("select[name=schType]").val("");
         
       	// 조직도 모달창 닫기
        $("#schTreeModal").attr("style", "display:none");
         
         modal.hide();
        });
    	
     	//////////////////////////////////////// [일정 list] /////////////////////////////////////////////////////////
     	
		// calendar element 취득
        var calendarEl = $('#calendar')[0];
    	
    	// full-calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
           height		: '700px', 				// calendar 높이 설정
           expandRows 	: true, 				// 화면에 맞게 높이 재설정
           aspectRatio	: 2,					// 가로세로 비율(가로가 세로의 2배)
           ihandleWindowResize : true,			// 브라우저 창 크기를 조절할 때 달력을 반응형으로 설정
           // 해더에 표시할 툴바
           headerToolbar : {
              left : 'prev,next,today',
              center : 'title',
              right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
           },
           initialView : 'dayGridMonth', 	// 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
           navLinks 	: true, 			// 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
           editable 	: true, 			// 수정 가능 여부
           selectable 	: true, 			// 달력 일자 드래그 설정가능
           nowIndicator : true, 			// 현재 시간 마크
           dayMaxEvents : true, 			// 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
           locale 		: 'ko',
           select: function(info){
        	   console.log("[일장 등록 info] :" + info);
        	   var saveBtn = $("#addCalendar");
        	   flag = true;
        	   $("#deleteCalendar").hide();
        	   modal.show();
        	   
        	   if(flag == true){	// 등록
            	   $("#addCalendar").text("추가");
               }
               
               $('#calendarModal').modal()
               
               let splitNum = parseInt(info.endStr.split("-")[2]-1) 
//                console.log("종료일 계산 : " , info.endStr.split("-")[0],"-",info.endStr.split("-")[1],"-",splitNum);
               console.log("확인!!", info.startStr,", ",info.endStr)
               $("#calendar_start_date").val(info.startStr);			// 일정 시작일
               $("#calendar_end_date").val(info.startStr);				// 일정 종료일
               
               calendar.unselect()	// 일정 선택 취소 시 실행될 코드 작성
           },
           eventClick: function(info){	// 등록된 일정을 클릭했을 경우 이벤트 발생
           	console.log("[eventClick]info >>",info.event); 
           	console.log("[클릭]info.endStr >>",info.event.endStr); 
//                console.log(calendar.getEvents())// 캘린더안에 어떻게 데이터가 담겨있는지 확인할때 사용
//            	console.log("no >>> ",info.event.extendedProps.no);
           	
           	$(".tooltip").removeClass("tooltip");
           	
           	var schEmpNameList = info.event.extendedProps.schEmpName;
           	var schEmpName = '';	// 일정 참여자

           	console.log("[일정 참여자 목록] : ", schEmpNameList);
           	
           	// 일정 참여자 목록
           	for(var i=0; i < schEmpNameList.length; i++){
//            		schEmpName += schEmpNameList[i].empName + ", ";
           		$("#schEmp").append("<div class='participants'><div class='parts' style='display:inline-block;margin-bottom: 10px'>"+schEmpNameList[i].empName+" "+schEmpNameList[i].empPos +"</div><input class='schEmpNo' type='hidden' value="+ data+"><button type='button' id='delBtn' onclick=f_rem(this) >-</button></div>");
           	}
           	console.log("[일정 참여자] : ", schEmpName);
         	
           	
           	if(info.event.startStr.length > 10){		// 시간을 설정한 경우
	           	startDate = info.event.startStr.split('T')[0];
	           	startTime = (info.event.startStr.split('T')[1]).split('+')[0];
	           	endDate = info.event.endStr.split('T')[0];
	           	endTime = (info.event.endStr.split('T')[1]).split('+')[0];
	           	$("#calendar_start_date").val(startDate);
	           	$("#calendar_end_date").val(endDate);
	           	
	           	
	           	
	           	$("#loca").val(info.event.extendedProps.schLocation);	// 장소
	           	$("#schType").val(info.event.extendedProps.schType);	// 타입
	           	$("#allDay").attr("checked", false);
           	}else{										// allDay인 경우
	           	startDate = info.event.startStr;
	           	endDate = info.event.startStr;
	           	$("#allDay").attr("checked", true);
	           	
	           	$("#loca").val(info.event.extendedProps.schLocation);	// 장소
	           	$("#schType").val(info.event.extendedProps.schType);	// 타입
           	}
           	
            if(info.event.extendedProps.schRead == 'Y'){
            	$(".schRead").attr("checked", true);
            }else{
            	$(".schRead").attr("checked", false);
            }
            
            title = info.event.title;
            content = info.event.extendedProps.content;
            deleteBtn = $("#deleteCalendar");
            
            if(title != null || title != ''){
           	 $("#addCalendar").text('수정');
           	 deleteBtn.css("display", "inline");
            }
            
            modal.show();
            
            $('#calendarModal').modal()

            $("#schCode").val(info.event.extendedProps.schCode);
           	$("#empNo").val(info.event.extendedProps.empNo);
            $("#calendar_title").val(title);
            $("#calendar_content").val(content);
            $("#calendar_start_date").val(startDate);
            $("#startTime").val(startTime);
            $("#calendar_end_date").val(endDate);
            $("#endTime").val(endTime);
            local = info.event.extendedProps.schLocation;
//             alert("local: " + local);
           },
           eventDidMount: function(info) {
			 console.log("description : ", info.event.extendedProps.description);  
			 // <div class="popover popover-primary" role="tooltip"><div class="arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div></div>
			 // $(".tooltip-inner").innerHTML += '<div><h3>'+ info.event.title +'</h3><div>'+info.event.extendedProps.description+'</div></div>';
			 var tooltip = new Tooltip(info.el, {	// v4
				 
       	        title: info.event.title,
       	        content: 'content',
       	        placement: 'top',
       	        trigger: 'hover',
       	        container: 'body'
       	      });
       	    },
           events : data,
        });	// var calendar end
        calendar.render();	// 캘린더 랜더링
		});
	
	
		var chkFlag = true;
		var pValue = true;	// 개인 일정
		var dValue = true;	// 회사 일정
		var gValue = true;	// 부서 일정
		
		// 체크박스에 체크한 사원의 일정 목록 조회
		$("#chkGroup").on('click',"input",function(){
			var selectValue = $(this).val();
			if(selectValue == "personal"){
				if($(this).is(":checked")){
					pValue = true;
				}else{
					pValue = false;
				}
			}
			if(selectValue == "department"){
				if($(this).is(":checked")){
					dValue = true;
				}else{
					dValue = false;
				}
			}
			if(selectValue == "group"){
				if($(this).is(":checked")){
					gValue = true;
				}else{
					gValue = false;
				}
			}
			
			var fcEventEle = document.getElementsByClassName("fc-event");
			var fcDaygridEle = document.getElementsByClassName("fc-daygrid-event-dot");
			
			for(var i = 0; i < fcEventEle.length; i++){
				if(!pValue && selectValue == "personal"){
					if(fcEventEle[i].style.borderColor == "blue"){
						fcEventEle[i].style.display = "none";
					}
				}else if(!dValue && selectValue == "department"){
					if(fcEventEle[i].style.borderColor == "red"){
						fcEventEle[i].style.display = "none";
					}
				}else if(!gValue && selectValue == "group"){
					if(fcEventEle[i].style.borderColor == "green"){
						fcEventEle[i].style.display = "none";
					}
				}
			}
			for(var i = 0; i < fcDaygridEle.length; i++){
				if(!pValue && selectValue == "personal"){
					if(fcDaygridEle[i].style.borderColor == "blue"){
						fcDaygridEle[i].parentElement.style.display = "none";
					}
				}else if(!dValue && selectValue == "department"){
					if(fcDaygridEle[i].style.borderColor == "red"){
						fcDaygridEle[i].parentElement.style.display = "none";
					}
				}else if(!gValue && selectValue == "group"){
					if(fcDaygridEle[i].style.borderColor == "green"){
						fcDaygridEle[i].parentElement.style.display = "none";
					}
				}
			}
			
			if(pValue && selectValue == "personal"){
				for(var i = 0; i < fcEventEle.length; i++){
						if(fcEventEle[i].style.borderColor == "blue"){
							fcEventEle[i].style.display = "";	// none을 지움 (block으로 바꾸면 줄 변경)
						}
				}
				for(var i = 0; i < fcDaygridEle.length; i++){
					if(fcDaygridEle[i].style.borderColor == "blue"){
						fcDaygridEle[i].parentElement.style.display = "";
					}
				}
			}
			
			if(dValue && selectValue == "department"){
				for(var i = 0; i < fcEventEle.length; i++){
						if(fcEventEle[i].style.borderColor == "red"){
							fcEventEle[i].style.display = "";
						}
				}
				for(var i = 0; i < fcDaygridEle.length; i++){
					if(fcDaygridEle[i].style.borderColor == "red"){
						fcDaygridEle[i].parentElement.style.display = "";
					}
				}
			}
			
			if(gValue && selectValue == "group"){
				for(var i = 0; i < fcEventEle.length; i++){
					if(fcEventEle[i].style.borderColor == "green"){
						fcEventEle[i].style.display = "";
					}
				}
				for(var i = 0; i < fcDaygridEle.length; i++){
					if(fcDaygridEle[i].style.borderColor == "green"){
						fcDaygridEle[i].parentElement.style.display = "";
					}
				}
			}
			
		}); // click function end
	});
	
})();

const f_rem = function(p_this){
	$(p_this).parent().remove();
};

$(function(){
	let json = '${treeJson}';
	//  조직도 그리기
	if(json){
		json = JSON.parse(json);
	}
// 	console.log('json',json);//
	 $('#schTree').jstree({
		 'core': {
		     'data': json
		 },
	});	
	
	// 모달 클릭시 그 회원의 정보 조회
	$("#schTree").on("select_node.jstree", function(evt, data){	
		var data = data.node.original.empNo 
		
		$.ajax({
			url: "/emp/selectMember",
			type: "post",
			data: data,
			contentType: "application/json",
			dataType: "json",
			success: function(res){
// 				console.log("[일정]res >>> " , res);
				$("#schEmp").append("<div class='participants'><div class='parts' style='display:inline-block;margin-bottom: 10px'>"+res.empName+" "+res.empPos + "</div><input class='schEmpNo' type='hidden' value="+ data+"><button type='button' id='delBtn' onclick=f_rem(this) >-</button></div>");
				
			}	// function(res) End
		})
	});
	
		
	$("#jstreeModal").on("click", function(){
		$("#schTreeModal").attr("style", "display:block; z-index:500; position:fixed; top:0; left:69%; width:270px");
// 		$("#treeDetail").attr("style", "display:none;");
	});
	
	$(".btn-close").on("click",function(){
		$("#schTreeModal").attr("style", "display:none;");
	});
	
	$(".btnDelAll").on("click",function(){
		$("#schEmp").children().remove();
	});
	
});
</script>

  <!-- Bread crumb and right sidebar toggle -->
  <!-- -------------------------------------------------------------- -->
<!--   <div class="page-breadcrumb"> -->
<!--     <div class="row"> -->
<!--       <div class="col-5 align-self-center"> -->
<!--         <h4 class="page-title">일정</h4> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
  <!-- -------------------------------------------------------------- -->
  <!-- End Bread crumb and right sidebar toggle -->
  <!-- -------------------------------------------------------------- -->
  <!-- -------------------------------------------------------------- -->
  <!-- Container fluid  -->
  <!-- -------------------------------------------------------------- -->
<div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <!-- --------------------- start Drag & Drop Event  ---------------- -->
              <div class="card">
                  <div class="row">
                    <div class="col-lg-2 border-end pe-0">
                      <div class="card-body border-bottom">
                      	<h3 class="card-title mt-2">일정 등록 </h3>
                      </div>
                      <div class="card-body">
                        <div class="row">
                          <div class="col-md-12" id="chkGroup">
                            <!-- checkbox -->
                            <div class="form-check">
                              <input type="checkbox" checked="checked" id="personal-schedule" class="form-check-input" value="personal"/>
                              <label class="form-check-label" for="personal-schedule">개인 일정</label>　　
<!--                               <i class="text-info ri-checkbox-blank-circle-fill me-2" style="margin-left: 40px;"></i> -->
                            </div>
                            <div class="form-check">
                              <input type="checkbox" checked="checked" id="department-schedule" class="form-check-input" value="department"/>
                              <label class="form-check-label" for="department-schedule">회사 일정</label>　
<!--                               <i class="text-success ri-checkbox-blank-circle-fill me-2" style="margin-left: 40px;"></i> -->
                            </div>
                            <div class="form-check">
                              <input type="checkbox" checked="checked" id="group-schedule" class="form-check-input" value="group"/>
                              <label class="form-check-label" for="group-schedule">부서 일정</label>　
<!--                               <i class="text-warning ri-checkbox-blank-circle-fill me-2" style="margin-left: 40px;"></i> -->
                            </div>
                            <hr>
                            <div style="margin-left: -38px;">
                            	<h5 style="margin-left:35px;">태그</h5>
                            	<i class="text-warning ri-checkbox-blank-circle-fill me-2" style="margin-left: 40px;">예약</i> <br>
                            	<i class="text-info ri-checkbox-blank-circle-fill me-2" style="margin-left: 40px;">개인 일정</i> <br>
                            	<i class="text-danger ri-checkbox-blank-circle-fill me-2" style="margin-left: 40px;">회사 일정</i> <br>
                            	<i class="text-success ri-checkbox-blank-circle-fill me-2" style="margin-left: 40px;">부서 일정</i> <br>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    
					<!-- ========================[Custom modal start]========================-->
					<div class="modal-backdrop bckdrop hide"></div>
					<div class="modal fade" id="calendarModal" data-bs-backdrop="static" aria-labelledby="scroll-long-inner-modal"
					 	role="dialog" style="display: none; z-index: 110;">
						<div class="modal-dialog" role="document">
							<div class="modal-content" id="modalBox" style="display:block;">
								<div class="modal-header">
									<span id="closeBtn" class="close" data-dismiss="modal" aria-label="Close">X</span>
									<h3 class="modal-title" id="exampleModalLabel" style="margin:0">일정</h3>
									<hr/>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<input type="hidden" id="schCode" name="schCode" value="">		<!-- 일정번호 -->
										<input type="hidden" id="empNo" name="empNo" value="">		<!-- 일정번호 -->
										<div>
											일정 제목 
											<input type="text" class="form-control" id="calendar_title" name="calendar_title" style="border: 1px solid #7c8295"><br/> 
										</div>
										<div>
											일정 참여자
											<input type="button" class="btn" id="jstreeModal" value="+">
				<!-- 							</i> -->
											<input type="button" class="btnDelAll" value="전체삭제" 
												style="background-color: transparent; border-radius: 5px; padding: 3px; border: 1px solid #484b54; opacity: 0.6;"> <br>
											<div id="schEmp" style="margin-bottom: 10px; border: 1px solid #7c8295; border-radius: 5px; padding: 5px; height:60px; overflow-y: auto"></div>
										</div>
										<div>
											시작 날짜
											<div style="margin:15px 0;">
												<input type="date" class="" id="calendar_start_date" name="calendar_start_date" style="width: 200px;display: inline;">
												<input type="time" class="" id="startTime" name="startTime" min="09:00" max="21:00" 
												 style="width: 150px;display: inline;margin:0 10px;"> 
												<input type="checkbox" id="allDay" name="allDaay">하루종일 <br>
											</div>
										</div>
										<div>
											종료 날짜
											<div style="margin:15px 0;">
												<input type="date" class="" id="calendar_end_date" name="calendar_end_date" style="width: 200px;display: inline;">
												<input type="time" class="" id="endTime" name="endTime" style="width: 150px;display: inline;margin:0 10px;"> <br>
											</div>
										</div>
										<div>
											내용<br>
				<!-- 							<label for="taskId" class="col-form-label">일정 내용</label>  -->
											<textarea class="form-control" id="calendar_content" name="calendar_content" rows="10" cols="50" style="border: 1px solid #7c8295;"></textarea> <br><br>
										</div>
										<div>
											<select class="loca" name="loca" id="loca">
											<option value="" selected>장소 선택</option>
											<c:forEach var="room" items="${roomList }">
												<option value="${room.mrCode }">${room.mrName }</option>
											</c:forEach>
											</select>
											
											<select class="schType" name="schType" id="schType">
											<option value="" disabled selected>타입 선택</option>
											<option value="회사일정">회사 일정</option>
											<option value="부서일정">부서 일정</option>
											<option value="개인일정">개인 일정</option>
											</select>
											
				<!-- 							<select class="color" name="color" id="color"> -->
				<!-- 							<option value="" disabled selected>색상 선택</option> -->
				<!-- 							<option value="red">빨간색</option> -->
				<!-- 							<option value="orange">주황색</option> -->
				<!-- 							<option value="yellow">노란색</option> -->
				<!-- 							<option value="green">초록색</option> -->
				<!-- 							<option value="blue">파란색</option> -->
				<!-- 							</select> -->
				<!-- 							<br/><br/>  -->
										</div>
										<div>
											<input type="checkbox" class="schRead" name="schRead" value="Y"> 일정 비공개
										</div>
										<input type="hidden" id="empNo" name="empNo" value=""><br/><br/>	<!-- 사원번호 : 세샨값 가져오기 -->
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-warning" id="addCalendar">추가</button>
									<button type="button" class="btn btn-delete" id="deleteCalendar" style="display: none">삭제</button>
									<button type="button" class="btn btn-secondary" data-dismiss="modal" id="modalCloseBtn">취소</button>
								</div>
							</div>
						</div>
					</div>                    
					<!-- ========================[Custom modal end]========================-->
                    
                    <!-- ========================[calendar]======================== -->
                    <div class="col-lg-9" style="width:80%">	
                      <div class="card-body calender-sidebar">
                        <div id="calendar"></div>
                      </div>
                    </div>
                   <!-- ========================[calendar]======================== -->
                  </div>
              </div>
              <!-- --------------------- end Drag & Drop Event ---------------- -->
            </div>
          </div>
        </div>
  <!-- -------------------------------------------------------------- -->
  <!-- End Container fluid  -->
  <!-- -------------------------------------------------------------- -->

<!--  조직도 모달 -->
<div class="modal-dialog modal-xl" id="schTreeModal" data-bs-backdrop="static" aria-labelledby="scroll-long-inner-modal"
	role="dialog" style="display: none;">
	<div class="modal-content">
		<div class="modal-header d-flex align-items-center scroll">
			<h3>조직도</h3>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body" id="modalBody" style="overflow-y: auto; height: 200px;">
			<div id="schTree"></div>
		</div>
		<div class="modal-footer">
		</div>
	</div>
</div>



