<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <link rel="stylesheet" href="https://amsul.ca/pickadate.js/css/main.css"> -->
<link rel="stylesheet" href="https://amsul.ca/pickadate.js/vendor/pickadate/lib/themes/default.css" id="theme_base">
<link rel="stylesheet" href="https://amsul.ca/pickadate.js/vendor/pickadate/lib/themes/default.date.css" id="theme_date">
<link rel="stylesheet" href="https://amsul.ca/pickadate.js/vendor/pickadate/lib/themes/default.time.css" id="theme_time">

<style>
body{
	overflow:hidden;
}
li{
	list-style:none;
}
tr{
   height: 60px;
}
th{
   width: 120px;
}
input{
	border:1px solid #9c9ea1;
	border-redius:3px;
	padding:5px;
}
.table-responsive {
	overflow: hidden;
}
/* label{ */
/* 	display:inline; */
/* } */
.form-select , .form-select form-select-sm mb-2{
	width:100px;
	display:inline;
	margin: 10px;
}
#default_order_filter{
	text-align:right;
}
.form-control, .form-control mb-2 form-control-sm{
	width:200px;
	display:inline;
	margin-left:20px;
}
.picker__select--month, .picker__select--year{
	border: transparent;
    padding: 0;
}
.modalTr .modalTd{
/*    border: 1px solid #eee; */
   padding: 5px;
}

#schContent{
   border: 1px solid #9c9ea1;
   border-radius: 5px;
   width: 300px;
   height: 50px;
}
a{
	color : black;
}
a:hover{
	color: #1a3581;;
}

#pickadate_root{
	display:hidden;
}

#pickadate{
    height: 50px;
    width: 97%;
    text-align: center;
    font-size: x-large;
    margin-left: -10px;
}

#carImg{
	height:400px; 
/* 	border:1px solid #eee; */
	display: block;
    margin: 0px auto
}

.detailTb{
	border: 2px solid white;
	border-collapse: collapse;
	text-size:large; width:70%
} 
.detailTr{
	width:100px;
}
.detailTr, .detailTd{
	border: 2px solid white;
	padding: 20px;
}
#resContent{
	border:1px solid #9c9ea1;
	padding:15px;
}
#resSTime, #resETime{
	margin-left:10px;
}
.col-sm-12 .col-md-6{
	width: 47%; !important;
    margin-right: -3px;
}
.accordion-item, .accordion-header{
	background-color: transparent;
}
.table{
	border-color: #9c9ea1;
}
#default_order_length, #default_order_filter, #default_order_info{
	display:none;
}
</style>

<!-- <script src="https://code.jquery.com/jquery-latest.min.js"></script> -->

<script src="https://amsul.ca/pickadate.js/vendor/pickadate/lib/picker.js"></script>
<script src="https://amsul.ca/pickadate.js/vendor/pickadate/lib/picker.date.js"></script>
<script src="https://amsul.ca/pickadate.js/vendor/pickadate/lib/picker.time.js"></script>
<script type="text/javascript">
$(function(){
	
	$.extend($.fn.pickadate.defaults, {
	         monthsFull: [ "1월","2월", "3월", "4월", "5월", "6월",
	           				"7월", "8월", "9월", "10월", "11월", "12월",
	         ],
	         monthsShort: [ "1월", "2월", "3월", "4월", "5월", "6월",
	           				"7월", "8월", "9월", "10월", "11월", "12월",
	         ],
	         weekdaysFull: ["일", "월", "화", "수", "목", "금", "토"],
	         weekdaysShort: ["일", "월", "화", "수", "목", "금", "토"],
	         selectYears: 10,
	         selectMonths: true,
	         showMonthsShort: false,
	         showWeekdaysFull: false,
	         close: "닫기",
	         clear: false,
	         today: "오늘",
	         format: "yyyy-mm-dd",
	         formatSubmit: "yyyy-mm-dd",
//	          max: true, // 이 옵션이 ture면 오늘까지밖에 날짜 선택을 못한다
	         closeOnSelect: true,
	         onSet: function (e) {
	           if (e.select) {
	             this.close();
	           }
	         },
	       });
	testMain();

	$("#registerBtn").on("click", function(){
		
		let empNo = $("#empNo").val();					// 예약자 사번
		let resContent = $("#resContent").val();		// 이용 목적
		let resSDate = $("#resSDate").val();			// 예약 시작일
		let resEDate = $("#resEDate").val();			// 예약 종료일
		let resSTime = $("#resSTime").val();			// 시작 시간
		let resETime = $("#resETime").val();			// 종료 시간
		let loca = $("#carCode").val();					// 차량 코드
		
		if($("#registerBtn").text() == "예약"){			// 차량을 예약하는 경우
		console.log("차량코드 잘 넘어가니??" , resSDate , " // ", resEDate);
		
		 if(!resSTime){
			 Swal.fire("시작일을 선택해주세요.", "", "info");
			 return false;
		 }	
		 if(!resETime){
			 Swal.fire("종료일을 선택해주세요.", "", "info");
			 return false;
		 }	
		
		 
		  if(resSTime > resETime){
			  Swal.fire("시작 시간은 종료 시간 이전이어야 합니다.","", "info");
			  return false;
		  }		
		  
		  if(resSDate > resEDate){
			  Swal.fire("시작일은 종료일 이전이어야 합니다.","", "info");
			  return false;
		  }		
		
	      let data = {
                  'empNo'         : empNo,
                  'schTitle'      : '[예약]',
                  'schContent'    : resContent,
                  'schStart'      : resSDate+"T"+resSTime,
                  'schEnd'        : resEDate+"T"+resETime,
                  'schLocation'   : loca,
                  'schType'       : '차량 예약',
                  'schRead'       : 'N',				// 공개여부 - N:공개, Y:비공개
                  'schColor'      : 'orange',			// 예약 - orange 고정
                  'allDay'        : false
       }
    
	      
	    $.ajax({
	          type : "POST",
	          url : "/sch/register",
	          data : JSON.stringify(data),
	          contentType: "application/json;charset=utf-8",
	          dataType:"text",
	               success : function(res){
	//                   alert("일정이 추가되었습니다.");
	                  location.reload();
	               }
	          
	         });
		
		
		} // 예약 end
		
		//알람 메일 보내기
// 		function sendEmail() {
// 		    const xhr = new XMLHttpRequest();
// 		    xhr.open('GET', '/sendAlarm', true);
// 		    xhr.send();
// 		  }

// 		  // 현재 시간을 기준으로 예약시간까지의 시간을 계산합니다.
// 		  function getAlarm() {
// 		    const now = new Date();
// 		    const alarmDay = new Date(resSDate);
// 		    const alarmTime = new Date(alarmDay,resSTime);
// 		    return alarmTime - now;
// 		  }

// 		  // 이메일을 보내는 함수를 예약합니다.
// 		  setInterval(function() {
// 		    sendEmail();
// 		  }, getAlarm());
		
		  
		if($("#registerBtn").text() == "수정"){							// 차량 예약을 수정하는 경우
			let schCode = $("#hideSchCode").val();
			let loca = $("#carCode").val();								// 차량 코드
			
			console.log("예약일시 : ", $("#resCarDate").html()); 			// 2023-04-19　10:00<br>2023-04-19　22:00
			
			 if(!resSTime){
				 Swal.fire("시작일을 선택해주세요.", "", "info");
				 return false;
			 }	
			 if(!resETime){
				 Swal.fire("종료일을 선택해주세요.", "", "info");
				 return false;
			 }	
			
			  if(resSDate > resEDate){
				  Swal.fire("시작일은 종료일 이전이어야 합니다.","", "info");
				  return false;
			  }	
			  
			  if(resSTime > resETime){
				  Swal.fire("시작일은 종료일 이전이어야 합니다.","", "info");
				  return false;
			  }	
			
			console.log("schCode : ", schCode, ", carCode : ", loca);
			
	      	let data = {
	    		  	'schCode'		  : schCode,
	                 'empNo'         : empNo,
	                 'schTitle'      : '[예약]',
	                 'schContent'    : resContent,
	                 'schStart'      : resSDate+"T"+resSTime,
	                 'schEnd'        : resEDate+"T"+resETime,
	                 'schLocation'   : loca,
	                 'schType'       : '차량 예약',
	                 'schRead'       : 'N',				// 공개여부 - N:공개, Y:비공개
	                 'schColor'      : 'orange',			// 예약 - orange 고정
	                 'allDay'        : false
	       }
		   	 $.ajax({
		   		 type : "post",
		   		 url : "/sch/update",
		   		 data : data,
		   		 dataType : "json",
		   		 success: function(data){
		   			 console.log("수정 결과 ::: ",data);
		   		 }
		   	 });	//ajax end
		   	 
   			$("#resY").css("display", "none");
   			$("#resN").css("display", "");
 			let sDate = $("#resSDate").val();
			let sTime = $("#resSTime").val();
			let eDate = $("#resEDate").val();
			let eTime = $("#resETime").val();
			let content = $("#resContent").val();
			
			console.log("수정된 content : ", content)
			
			$("#resCarDate").html(sDate + "　" + sTime + "<br>" + eDate + "　" +eTime);
			$("#resCarContent").html(content);
		}
		
	});

});

function f_clickName(p_this){
	let sessionId = '${SessionInfo.empNo }';
	
	let res = $(p_this).parent().find('.myBtn').html();
	let carCode = $(p_this).children('input').val();
	
	// 기본으로 보여지는 화면 가리기
	 $("#defaultDiv").attr("style", "display:none");
	
	console.log("this : ", $(p_this).parent().find('.myBtn').html());
	console.log("carCode : ", $(p_this).children('input').val());
// 	alert($(".carCode").val());
	
	
	$.ajax({
		 type : "post",
		 url : "/sch/selectCar?carCode="+carCode,
		 success: function(req){
			 console.log("첨부파일이름 : ", req);
// 			 let imgUrl = '${pageContext.request.contextPath }/resources/images/'+req;
			 
			//차량 이미지 가져오기
			 $("#resNCarImg").attr('src', '${pageContext.request.contextPath }/resources/images/'+req);
			 $("#resNCarImg").attr('style', 'height:200px;display: block;margin: 0px auto;');
			 $("#resYCarImg").attr('src', '${pageContext.request.contextPath }/resources/images/'+req);
			 $("#resYCarImg").attr('style', 'height:200px;display: block;margin: 0px auto;');
			 $("#carCode").val(carCode);
		 }
	});
	
	$.ajax({
		type: "post",
		url : "/sch/selectCarDetail?carCode="+carCode,
		contentType: "json",		
		success: function(data){
			console.log("data잘 넘어와? : " , data);
			console.log("이름01 : ", data.empName);
			console.log("세션 아이디 : " , sessionId , "// data 아이디 : ", data.empNo, "// date : ", data.schStart, data.schEnd);
			
			let sDate = data.schStart.split("T")[0];
			let sTime = data.schStart.split("T")[1];
			let eDate = data.schEnd.split("T")[0];
			let eTime = data.schEnd.split("T")[1];
			
			$("#resCarName").html("["+ data.depName +"] <br>"+ data.empName +" "+data.empPos);
			$("#resCarDate").html(sDate + "　" + sTime + "<br>" + eDate + "　" +eTime);
			$("#resCarContent").html(data.schContent);
			$("#hideSchCode").val(data.schCode);
			
			// 내가 클릭한 예약정보에 해당하는 자동차 code를 예약취소 버튼안에 심어준다.
			$("#delBtn").attr("data-car", carCode);
			
			if(sessionId != (data.empNo)){
				$("#modifyBtn").css('display','none');
				$("#delBtn").css('display','none');

			}else{
				$("#modifyBtn").css('display','inline-block');
				$("#delBtn").css('display','inline-block');
			}
			
		}
	});
	
	// 수정버튼 클릭시
	$("#modifyBtn").on("click",function(){
		let schCode = $("#hideSchCode").val();
		let loca = $("#carCode").val();								// 차량 코드
		
		var content = $("#resCarContent").html();					// 외근
		console.log("예약일시 : ", $("#resCarDate").html()); 			// 2023-04-19　10:00<br>2023-04-19　22:00
		var startData = $("#resCarDate").html().split("<br>")[0];	// 2023-04-19　10:00 
		var sDate = startData.split("　")[0];						// 2023-04-19
		var sTime = startData.split("　")[1];						// 10:00
			
		var endData = $("#resCarDate").html().split("<br>")[1];		// 2023-04-19　22:00
		var eDate = startData.split("　")[0];						// 2023-04-19
		var eTime = startData.split("　")[1];						// 22:00
		
		$("#resN").css("display", "none");
		$("#resY").css("display", "inline-block");
		$("#registerBtn").html("수정");								// 수정클릭시 [예약]버튼 이름을 [수정]으로 변경
		
		
		$("#empNo").val(sessionId);
		$("#resSDate").val(sDate);
		$("#resSTime").val(sTime);
		$("#resEDate").val(eDate);
		$("#resETime").val(eTime);
		$("#resContent").val(content);
		
// 		alert("schCode : " + schCode);
	});
		
	// 수정 버튼을 눌렀다가 [예약 취소]를 누른 경우 -> 삭제
	$("#delBtn").on("click",function(){
		let schCode = $("#hideSchCode").val();
		let carCode = $(this).data("car");
		
		var data = {
			schCode : schCode,
			carCode : carCode
		}
		
		Swal.fire(
		        {
		          title: "예약을 취소하시겠습니까?",
		          text: "확인버튼을 누르시면 예약이 취소됩니다.",
		          icon: "warning",
		          showCancelButton: true,
		          confirmButtonColor: "rgb(89 61 239)",
		          confirmButtonText: "확인",
		          cancelButtonText: '취소',
		          closeOnConfirm: false,
		        }).then((result) => {
		            if (result.isConfirmed) {
		        	$.ajax({
		             	   type : "POST",
		             	   url : "/sch/remove",
		             	   data : data,
		          	   	   dataType : "json",
		                   success : function(req){	
		                	}
		            });
	                Swal.fire('차량 예약이 취소되었습니다.','','success').then((result)=>{
	                	if(result.isConfirmed){
	                		location.reload();
	                	}
	                });
	                
	              }
		        });
	      
	});
	
	if(res == "예약중"){
		$("#resY").css("display", "none");
		$("#resN").css("display", "");
	}
	if(res == "예약가능"){
	   	 
		$("#resN").css("display", "none");
		$("#resY").css("display", "");
	}
}

function testMain(){
    
    let nowDate = new Date().toISOString().substring(0, 10);
    $(".pickadate").attr("value", nowDate );
    
    $( '.datepicker' ).pickadate({
        disablePicker: true
    })
    // [타입 지정 및 초기화 실시]
     $('.pickadate').pickadate();
 //     $('.pickatime').pickatime();   
 } 
</script>

<div class="email-app">
	<div class="left-part" style="width: 200px; background-color:#d2e0f5;">
	 <a class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none" href="javascript:void(0)"></a>
	 <div class="scrollable" style="height: 100%">
	   <div class="p-3">
	   		<h3 style="text-align: center;">예약</h3>
	   </div>
		<div style="margin:10px;">	
			<div>
			    <h5><strong><a href="/sch/resRoom">회의실 예약</a></strong></h5>
				<!-- =====회의실 예약 accordion=====  -->
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" 
								aria-expanded="false" aria-controls="flush-collapseOne" style="background-color: transparent;">1층 회의실</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<p>101호 회의실 (정원 15명)</p>
								<p>102호 회의실 (정원 20명)</p>
								<p>103호 회의실 (정원 30명)</p>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingTwo">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false"
								aria-controls="flush-collapseTwo" style="background-color: transparent;">2층 회의실</button>
						</h2>
						<div id="flush-collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<p>301호 회의실 (정원 10명)</p>
								<p>302호 회의실 (정원 15명)</p>
								<p>303호 회의실 (정원 20명)</p>
								<p>303호 회의실 (정원 50명)</p>
							</div>
						</div>
					</div>
				</div>	
				<!-- =====회의실 예약 accordion=====  -->
			</div>
			<br>
			<div>
				<h5><strong><a href="/sch/resCar">차량 예약</a></strong></h5>
			</div>
		</div>	
	        
	  </div>
	</div>
    <div class="right-part mail-list bg-white" style="width: calc(100% - 200px); margin-left: 200px; overflow-y: auto; overflow-x: hidden;">
	    <div class="p-3 b-b">
	       <div class="d-flex align-items-center">
		        <div>
		            <h4>예약</h4>
		            <span>Home > 차량 예약</span>
		        </div>
<!-- 		        <div class="ms-auto"> -->
<!-- 		           <input placeholder="Search Mail" id="" type="text" class="form-control" /> -->
<!-- 		        </div> -->
	       </div>
	    </div>
		<!-- 만약에 예약된 상태면 class이름에 를 추가 -->
<!-- 		<div class="page-breadcrumb"> -->
<!-- 		   <h4 class="page title">회의실 예약 </h4> -->
<!-- 		</div> -->
		<div class="container-fluid">
<!-- 			<i class="ri-roadster-fill" style="font-size:20px;">공지사항</i> -->
			<div style="background-color:#fbeccd; border-radius:5px; height:110px; ">
				<div style="padding:10px; text-align:left; font-size:small; font-weight: bold;">
					<p>1. 차량은 신청 후 관리자에게 차키와 운영일지를 수령하고, 사용 후 반납바랍니다.</p>
					<p>2. 차량 반납 시 차량 내부 쓰레기 등을 반드시 수거하여 차량의 청결 유지를 부탁드립니다. </p>
					<p>3. 차량 내부에서는 금연입니다.</p>
				</div>
			</div>
		   <div style="text-align:center;">
		      <div class="input-group" style="height:50px; margin:20px;">
		         <input type="date" value="" id="pickadate" class="pickadate" />
		      </div>
		   </div>
		   <div class="row" style="background-color: white; margin:10px; height: 900px;">
				
			  <!-- --------------------- start Default Ordering ---------------- -->
                <div class="card-body col-lg-5" style="height:800px; font-size:smaller; padding:0px; width:45%">
                  <div class="table-responsive">
                    <table id="default_order" class="table table-striped table-bordered display text-nowrap" style="width: 100%">
                      <thead>
                        <tr class="text-center">
                          <th>차량 이름</th>
                          <th>차량 번호</th>
                          <th>승차인원</th>
                          <th class="text-center">사용여부</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${carList }" var="car">
                        <tr>
                          <td class="carN" onclick="f_clickName(this)"><input class ="carCode" type="hidden" value="${car.carCode }">${car.carName }</td>
                          <td class="text-center">${car.carNum }</td>
                          <td class="text-center">${car.carPerson }</td>
<%--                           <td>${car.afSave }</td> --%>
						  <c:choose>
	                          <c:when test="${car.carUse eq 'Y' }">
		                          <td style="text-align:center"><button class="myBtn btn rounded-pill px-4 btn-light-success font-medium waves-effect waves-light" style="color: rgb(11, 183, 175); display:inline-block; pointer-events: none;">예약가능</button></td>
	                          </c:when>
							  <c:otherwise>
		                          <td style="text-align:center"><button class="myBtn btn rounded-pill px-4 btn-light-danger font-medium waves-effect waves-light" style="color: rgb(246, 78, 96); display:inline-block; pointer-events: none;">예약중</button></td>
							  </c:otherwise>
						  </c:choose>
                        </tr>
                      </c:forEach>
                      </tbody>
                      <tfoot>
                      </tfoot>
                    </table>
                  </div>
                </div>
                <div id="detail" class="card-body col-lg-5" style="border:1px solid #9c9ea1; border-radius:5px; height:797px; width:40%; margin:0 5px;">
                	<!-- 처음 기본적으로 보여주는 화면 -->
                	<div id="defaultDiv" style="padding:20px; display:inline-block;">
                		<div style="width:300px; height:250px; border:1px solid #eee; margin-left:55px;">
	                		<img class="carImg" id="defaultCarImg" style="height:200px; width: 285px;margin:11px" alt="차량 사진" src="${pageContext.request.contextPath }/resources/images/제네시스.png">
                		</div>
                		<br>
                		<h4> 예약 정보 예시</h4>
                		<table class="defaultTb" style="font-weight: bold; font-size:medium">
                			<tr class="defaultTr">
                				<td class="defaultTd" style="background-color:#d2e0f5;padding: 14px;">예약 사원</td>
                				<td class="defaultTd" style="font-wdight:100; font-size:small; padding:5px"> 20010001</td>
                			</tr>
                			<tr class="defaultTr">
                				<td class="defaultTd" style="background-color:#d2e0f5;padding: 14px;">예약 일시</td>
                				<td class="defaultTd" style="font-wdight:100; font-size:small; padding:5px"> 2001-01-01</td>
                			</tr>
                			<tr class="defaultTr">
                				<td class="defaultTd" style="background-color:#d2e0f5;padding: 14px;">이용 목적</td>
                				<td class="defaultTd" style="font-wdight:100; font-size:small; padding:5px"> 외부업체 미팅</td>
                			</tr>
                		</table>
<!--                 		<div style="margin:20px; text-align:right;"> -->
<!-- 	                		<button id="modifyBtn" class="btn waves-effect waves-light btn-outline-warning">수정</button> -->
<!--     	            		<button id="delBtn" class="btn waves-effect waves-light btn-outline-secondary" data-car="" style="margin-left:5px">예약 취소</button> -->
<!--                 		</div> -->
                	</div>
                	<!-- 예약중(예약정보 확인) -->
                	<div id="resN" style="padding:10px 20px 0 20px; display:none;">
                		<img class="carImg" id="resNCarImg" alt="차량 사진" src="">
                		<br>
                		<h4> 예약 정보 </h4><input type="hidden" id="hideSchCode" value="">
                		<table class="detailTb" style="font-size: medium ;font-weight: bold;">
                			<tr class="detailTr">
                				<td class="detailTd" style="background-color:#d2e0f5;">예약 사원</td>
                				<td class="detailTd" id="resCarName" style="font-wdight:100; font-size:small; padding:5px"></td>
                			</tr>
                			<tr class="detailTr">
                				<td class="detailTd" style="background-color:#d2e0f5;">예약 일시</td>
                				<td class="detailTd" id="resCarDate" style="font-wdight:100; font-size:small; padding:5px"></td>
                			</tr>
                			<tr class="detailTr">
                				<td class="detailTd" style="background-color:#d2e0f5;">이용 목적</td>
                				<td class="detailTd" id="resCarContent" style="font-wdight:100; font-size:small; padding:5px"></td>
                			</tr>
                		</table>
                		<div style="margin:20px; text-align:right;">
	                		<button id="modifyBtn" class="btn waves-effect waves-light btn-outline-warning">수정</button>
    	            		<button id="delBtn" class="btn waves-effect waves-light btn-outline-secondary" data-car="" style="margin-left:5px">예약 취소</button>
                		</div>
                	</div>
                	<!-- 예약가능(예약하기, 수정하기) -->
                	<div id="resY" style="padding:10px 20px 0 20px; display:none;">
                		<img class="carImg" id="resYCarImg" alt="차량 사진" src="">
                		<br>
                		<h4> 예약하기 </h4>
                		<table class="detailTb" style="font-size: small;">
                			<tr class="detailTr">
                				<td class="detailTd" style="background-color:#d2e0f5;font-size: larger;font-weight: bold;">사번</td>
                				<td class="detailTd"><input type="text" id="empNo" required="required"><input type="hidden" id="carCode"></td>
                			</tr>
                			<tr class="detailTr">
                				<td class="detailTd" style="background-color:#d2e0f5;font-size: larger;font-weight: bold;">시작일</td>
                				<td class="detailTd"><input type="date" id="resSDate" required="required"><input id="resSTime" type="time" min="09:00" max="22:00" step="1800" id="resTime" required="required"></td>
                			</tr>
                			<tr class="detailTr">
                				<td class="detailTd" style="background-color:#d2e0f5;font-size: larger;font-weight: bold;">종료일</td>
                				<td class="detailTd"><input type="date" id="resEDate" required="required"><input id="resETime" type="time" min="09:00" max="22:00" step="1800" id="resTime" required="required"></td>
                			</tr>
                			<tr class="detailTr">
                				<td class="detailTd" style="background-color:#d2e0f5;font-size: larger;font-weight: bold;">이용 목적</td>
                				<td class="detailTd"><textarea rows="3" cols="30" id="resContent" required="required"></textarea> </td>
                			</tr>
                		</table>
                		<div style="margin:20px; text-align:right;">
	                		<button id="registerBtn" class="btn waves-effect waves-light btn-outline-warning">예약</button>
<!--     	            		<button id="calBtn" class="btn waves-effect waves-light btn-outline-secondary" style="margin-left:5px">취소</button> -->
                		</div>
                	</div>
                </div>
              <!-- --------------------- end Default Ordering ---------------- -->

		   </div> <!-- content body end -->
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net-bs4/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/dist/js/pages/datatable/datatable-basic.init.js"></script>
<!-- ============================================ [ Sweet alert 스크립트] ============================================ -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/dist/sweetalert2.all.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/dist/js/pages/forms/sweetalert2/sweet-alert.init.js"></script> --%>
<!-- ============================================ [ Sweet alert 스크립트] ============================================ -->
