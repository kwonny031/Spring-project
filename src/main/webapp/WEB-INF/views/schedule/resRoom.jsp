<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script> -->
<!-- [CDN 설정 실시] -->
<!-- <link rel="stylesheet" href="https://amsul.ca/pickadate.js/css/main.css"> -->
<link rel="stylesheet" href="https://amsul.ca/pickadate.js/vendor/pickadate/lib/themes/default.css" id="theme_base">
<link rel="stylesheet" href="https://amsul.ca/pickadate.js/vendor/pickadate/lib/themes/default.date.css" id="theme_date">
<link rel="stylesheet" href="https://amsul.ca/pickadate.js/vendor/pickadate/lib/themes/default.time.css" id="theme_time">
<!-- ===================[ sweetAlert ]================================-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<!-- ===================[ sweetAlert ]================================-->
<style>
.picker__select--month, .picker__select--year{
	border: transparent;
    padding: 0;
}
#pickadate{
	border:1px solid #9c9ea1;
    height: 50px;
    width: 97%;
    text-align: center;
    font-size: x-large;
    margin-left: -10px;
}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://amsul.ca/pickadate.js/vendor/pickadate/lib/picker.js"></script>
<script src="https://amsul.ca/pickadate.js/vendor/pickadate/lib/picker.date.js"></script>
<script src="https://amsul.ca/pickadate.js/vendor/pickadate/lib/picker.time.js"></script>
<script type="text/javascript">

let resList;
let sessionId = '${SessionInfo.empNo }';
// alert(typeof sessionId);

$(function(){
   
	$.extend($.fn.pickadate.defaults, {
        monthsFull: [ "1월","2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월",],
        monthsShort: [ "1월", "2월", "3월", "4월", "5월", "6월","7월", "8월", "9월", "10월", "11월", "12월",],
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
//         max: true, // 이 옵션이 ture면 오늘까지밖에 날짜 선택을 못한다
        closeOnSelect: true,
        onSet: function (e) {
          if (e.select) {
            this.close();
          }
        },
      });
   
      testMain();
   
      ///////////////////// 여기가 예약 정보 불러오는 내용/////////////////////////////////
      let temp = ${jsonMrres};
    	  
      console.log('temp',temp);
      resList = [];
      
      for(let i=0; i<temp.length; i++){
         resList.push(JSON.parse(temp[i]));
      }      
      
      console.log("resList" , resList);
    	  
     dataChk(temp);
     

      ///////////////////// 여기가 예약 정보 불러오는 내용/////////////////////////////////

      
//    $("#timeSelect").on("change", function(){
// //       console.log("change...!");
//       var rmTime = $("#rmTime").text();
//       var rmTimeSplit = rmTime.trim().split("-");
//       var rmTimeSplitFirst = rmTimeSplit[0].split(":");
//       var rmTimeSplitSecond = rmTimeSplit[1].split(":");
//       var firstTime = parseInt(rmTimeSplitFirst);
//       var secondTime = parseInt(rmTimeSplitSecond);
      
//       var times = "";
//       var firstTimes = firstTime + parseInt($(this).val());
// //       var secondTimes = secondTime + parseInt($(this).val());
      
//       $("#rmTime").text(rmTimeSplit[0] + " - " + firstTimes + ":00");
      
//    });
   
   // 날짜를 바꿧을 때 함수 실행   
   $("#pickadate").on("change",function(){
	//    alert("날짜 바뀜");
	
	   // 예약정보 초기화
	   $('.room').attr('style', 'background-color:transparent'); 
	   $('.room').empty(); 
	   
	   dataChk(temp);
   });
      
   
   $(".accordion-body").on("click", function(){
	   location.href="/sch/resRoom";
   })
   
   
});

	function dataChk(p_temp){
		for(let i=0; i < p_temp.length; i++){
			let date = resList[i]['schStart'].split('T')[0];		// 날짜 (2023-04-13)
			let roomCode = resList[i]['mrCode'];					// 회의실 코드(MROOM1_101)
			let startRTime = resList[i]['schStart'].split('T')[1];	// 시작시간 (09:00)
			let endRTime = resList[i]['schEnd'].split('T')[1];		// 종료시간 (10:00)
			let resId = resList[i]['empNo'];						// 예약자 사번
			let schCode = resList[i]['schCode'];					// 일정 코드
// 			alert(typeof startRTime);
			
			let splitSTime = startRTime.split(':')[0];				// 시간(09)
			let splitETime = endRTime.split(':')[0];				// 시간(10)
			console.log("splitSTime : " , splitSTime);
			
// 			console.log("temp[",i,"] allDateList : ", resList[i]['schStart'].split('T')[0]);			// 날짜

			if($('#pickadate').val() == date){
				console.log("==========================================");
				console.log("temp[",i,"] date : ", date);				// 날짜
				console.log("temp[",i,"] startRTime : ", startRTime);	// 시작시간
				console.log("temp[",i,"] endRTime : ", endRTime);		// 종료시간
				
// 				$("#timeTbl").find("td:eq("+ 4 +")").attr('id').split('-')[0]);	// 회의실 코드 (MROOM1_101)
// 				$("#timeTbl").find("td:eq("+ 4 +")").attr('id').split('-')[1]);	// 시간 (09)
				
				let StartId = roomCode+"-"+splitSTime;
				let EndId = roomCode+"-"+(parseInt(splitETime)-1);
// 				alert("StartId : " + StartId + "EndId : " + EndId);
				
				// rgb(221 176 210) : 다른 사원이 예약한 회의실 배경색 바꾸기
				
				document.getElementById(StartId).innerHTML = "[ 예약 ]<input type='hidden' class='hideEmpNo' data-SchCode="+ schCode +" value="+ resId +">";
				if(sessionId == resId){
					document.getElementById(StartId).style.backgroundColor = '#abece1';
					document.getElementById(StartId).style.color = '#0bb7af';
				}else{
					document.getElementById(StartId).style.backgroundColor = '#f7b3bf';
					document.getElementById(StartId).style.color = '#f64e60';
				}
				
				// 만약 3시간을 예약한 경우 중간 시간
				if(parseInt(splitETime) - parseInt(splitSTime) == 3){
					let midId = roomCode+"-"+(parseInt(splitSTime) + 1);
					console.log("midId : " , midId);
					document.getElementById(midId).innerHTML = "[ 예약 ]<input type='hidden' class='hideEmpNo' data-SchCode="+ schCode +" value="+ resId +">";
					if(sessionId == resId){
						document.getElementById(midId).style.backgroundColor = '#abece1';
						document.getElementById(midId).style.color += '#0bb7af';
					}else{
						document.getElementById(midId).style.backgroundColor = '#f7b3bf';
						document.getElementById(midId).style.color += '#f64e60';
					}
				}
				// 예약을 2시간 이상 한 경우 
				if((parseInt(splitETime) - parseInt(splitSTime)) >= 2){
					console.log("end : ", EndId)
					document.getElementById(EndId).innerHTML = "[ 예약 ]<input type='hidden' class='hideEmpNo' data-SchCode="+ schCode +" value="+ resId +">";
					if(sessionId == resId){
						document.getElementById(EndId).style.backgroundColor = '#abece1';
						document.getElementById(EndId).style.color += '#0bb7af';
					}else{
						document.getElementById(EndId).style.backgroundColor = '#f7b3bf';
						document.getElementById(EndId).style.color += '#f64e60';
					}
				}

				// console.log("id : ", document.getElementById.split("-")[0] );

				console.log("temp[",i,"] : ", resList[i]['mrCode']);
			}
			
		}		
	}

   function testMain(){
      
      let nowDate = new Date().toISOString().substring(0, 10);
      $(".pickadate").attr("value", nowDate );
      
      $( '.datepicker' ).pickadate({
          disablePicker: true
      });
      
      // [타입 지정 및 초기화 실시]
       $('.pickadate').pickadate();
   //     $('.pickatime').pickatime();   
   } 

   const f_modal = function(e){   // 모달 오픈 함수

// 	   console.log("e",);
// 	   console.log("일정 코드 : ", e.children[0].dataset.schcode);

	  let nodes = [...e.parentElement.children];
      let index = nodes.indexOf(e);
      
      // 회의실 코드 (DB에 장소 저장시 회의실 코드 값으로 저장해야함)
      let mrCode = e.parentElement.parentElement.parentElement.children[0].children[1].children[index].id;
      $("#locaCode").val(mrCode);
      
      
      //부모3자식0자식1자식index
      let roomName = e.parentElement.parentElement.parentElement.children[0].children[1].children[index].innerHTML;
      let resTime = e.parentElement.children[0].innerHTML;
      
      
      document.getElementById('rmName').innerHTML = roomName;
//       document.getElementById('rmTime').innerHTML = resTime;
      
      let resTimeSplit = resTime.trim().split("-");
      let resTimeFirst = resTimeSplit[0].split(":");
      
      console.log("시간 :",resTimeSplit[0],", 종료시간12 : ", resTimeSplit[1] );
      var rmSTime = resTimeSplit[0].trim();	// 09:00
      var rmETime = resTimeSplit[1].trim();	// 10:00
      
      $("#rmSTime").val(rmSTime);
      $("#rmETime").val(rmETime);
      
//       if(parseInt(resTimeFirst) == 21){
//          document.querySelector("#timeSelect").style.display = "none";
//       }else{
//          document.querySelector("#timeSelect").style.display = "block";
//       }
      
	  // 예약된 회의실인 경우 모달오픈 막기
	  if(e.innerText == "[ 예약 ]"){
		  resId = e.children[0].value;
// 		  console.log("예약자 사번 : ", resId);
// 	      alert('chk : '+ index + ", " + roomName + ", 시간 : " + resTime + ", 일정코드  : " + e.children[0].dataset.schcode);
		  
		  if(sessionId == resId){			// 내가 예약한 회의실인 경우
			  
// 			  alert("내가 예약한 회의실이야!!");
			  $(".bckdrop").attr("style", "display:block; opacity:0.5;");
		      $("#resModal").attr("style", "display:block; z-index:100; position:fixed; top:30%; left:40%; width:420px");
		      $("#addBtn").attr("style", "display:none");
		      $("#modBtn").attr("style", "display:inline");
		      $("#delBtn").attr("style", "display:inline");
		  	  
		      //내가 예약한 회의실인 경우 수정, 삭제 버튼이 보임 -> 취소버튼을 누른 경우 
// 		      $(".btn-close").on("click",function(){
		    	  
// 		      });
		      
		      //---resList
		      for(let i=0; i<resList.length; i++){
		    	  if(resList[i].schCode == e.children[0].dataset.schcode){
		    		  console.log('sch',resList[i]);
		    		  // resList[i]값을 모달에넣기
		    		  var eSchStart = resList[i].schStart;		// 2023-04-17T09:00
		    		  var eSchEnd = resList[i].schEnd;			// 2023-04-17T12:00
		    		  var eContent = resList[i].schContent;		// 보안기술부 주간회의
		    		  var splitSTime = eSchStart.split("T")[1];	// 09:00
		    		  var splitETime = eSchEnd.split("T")[1];	// 12:00
// 		    		  var eTime = parseInt(splitETime.split(":")[0]) - parseInt(splitSTime.split(":")[0]);
		    		  
// 				      $("#rmTime").html(splitSTime + "-"+splitETime);
				      $("#rmSTime").val(splitSTime.trim());
				      $("#rmETime").val(splitETime.trim());
// 				      $("#timeSelect").val(eTime);
				      $("#schContent").val(eContent);
				      
				      
				      $("#modBtn").on("click",function(){	// 수정버튼을 클릭한 경우!!
					      // 수정한 데이터 
					      var schCode = resList[i].schCode;
					      var modData = $("#pickadate").val();			// 예약날짜
					      var rmSTime = $("#rmSTime").val();			// 예약 시작시간
					      var rmETime = $("#rmETime").val();			// 예약 종료시간
					      var modSchContent = $("#schContent").val();	// 이용목적
					      var loca = $('#locaCode').val();				// 예약호실 (MROOM1_102)
					      
					      var sT = rmSTime.split(":")[0];				// 09
					      var eT = rmETime.split(":")[0];				// 10
// 					      alert("수정클릭@");
// 					      alert("수정 정보 : " + modSchContent + "예약 호실 : "+ loca);
					      console.log("시간 계산 : ", parseInt(eT) - parseInt(sT));
					      
// 					      if(parseInt(sT) < 9 || parseInt(eT) > 22){
// 					    	  Swal.fire("회의실 예약은 오전 9시부터 오후 10시까지만 가능합니다 .","","warning");
// 							  return false;
// 					      }
					      
						  if(parseInt(eT) - parseInt(sT) > 3){
							  Swal.fire("회의실 예약은 3시간 까지만 가능합니다.","","warning");
							  return false;
						  }
					      
						  if(parseInt(eT) - parseInt(sT) < 1){
							  Swal.fire("종료시간이 시작시간보다 이전입니다.","","warning");
							  return false;
						  }
						  
						  
					      let data = {
					    		  	'schCode'		 : schCode,
					                 'empNo'         : sessionId,
					                 'schTitle'      : '[예약]',
					                 'schContent'    : modSchContent,
					                 'schStart'      : modData+"T"+rmSTime,
					                 'schEnd'        : modData+"T"+rmETime,
					                 'schLocation'   : loca,
					                 'schType'       : '회의실 예약',
					                 'schRead'       : 'N',					// 공개여부 - N:공개, Y:비공개
					                 'schColor'      : 'orange',			// 예약 - orange 고정
					                 'allDay'        : false
					       }
						   	 $.ajax({
						   		 type : "post",
						   		 url : "/sch/update",
						   		 data : data,
						   		 async: false,		// 이걸 안써주면 데이터를 받기 전에 reload되서 바뀐 정보가 나타나지 않음
						   		 dataType : "json",
						   		 success: function(data){
						   			 console.log("수정 결과 ::: ",data);
						   		 }
						   	 });	//ajax end
						      location.href = '/sch/resRoom';
						      $("#addBtn").attr("style", "display:none");
						      $("#modBtn").attr("style", "display:none");
						      
				      });	// 수정 end
				      
				      $("#delBtn").on("click",function(){
				    	  var schCode = resList[i].schCode;  
					  	  var data = {
					  				schCode : schCode,
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
				  			        	
				  		                Swal.fire
				  		                (
			  		                		'회의실 예약이 취소되었습니다.',
			  		                		'',
			  		                		'success'
				  		                ).then(function(){
					  		             	$("#resModal").attr("style", "display:none;");
					  		             	location.reload();
				  		                });
				  		              }
				  			        });
				      });
				      
		    	  }
		      }
		      
		  }else{							// 내가 예약하지 않은 회의실인 경우
		  
			  $(".bckdrop").attr("style", "display:none;");
		      $("#resModal").attr("style", "display:none;");
                Swal.fire('예약중인 회의실입니다.', '', 'info');
		  }
	      
		  
		  
	      // 여기서 수정, 삭제 처리
	      
	  }else{	// 예약 가능한 회의실인 경우 등록 모달 오픈
	      $(".bckdrop").attr("style", "display:block; opacity:0.5;");
	      $("#resModal").attr("style", "display:block; z-index:100; position:fixed; top:30%; left:40%; width:420px");
	  }
   }
   
   const closeBtn = function(){
	  // 버튼 초기화
	  $("#addBtn").attr("style", "display:inline");
	  $("#modBtn").attr("style", "display:none");
	  $("#delBtn").attr("style", "display:none");
	  
	  //모달 닫기
      $(".bckdrop").attr("style", "display:none");
      $("#resModal").attr("style", "display:none");
      
      // 이용 목적 초기화
      $("schContent").value = "";
   }

   const addBtn = function(e){      // 추가버튼
      
      let empNo = '${SessionInfo.empNo }';
      let resName = $('.resModalTable').find('div:eq(0)').text();                     	 // 회의실 이름 (schLocation)
      let resDate = $("input[name='_submit']").val()                             		 // 예약 일시
      let resStart = $('#rmSTime').val();		    									// 예약 시간_시작시간 (schStart)
      let resEnd = $('#rmETime').val()    												// 예약시간_종료시간(schEnd)
      let selectTime = $('select[name=resTime]').val();                           		// 이용시간
      let resContent = $('#schContent').val();                                 			// 이용 목적 (schContent)
      let loca = $('#locaCode').val();
      
      var sT = resStart.split(":")[0];				// 09
      var eT = resEnd.split(":")[0];				// 10
      console.log("시간 확인 : ", sT, eT)  
	
      if(parseInt(eT) - parseInt(sT) > 3){
		  Swal.fire("회의실 예약은 3시간 까지만 가능합니다.","","warning");
		  return false;
	  }
      
	  if(parseInt(eT) - parseInt(sT) < 1){
		  Swal.fire("종료시간이 시작시간보다 이전입니다.","","warning");
		  return false;
	  }
	  
      let data = {
                    'empNo'         : empNo,
                    'schTitle'      : '[예약]',
                    'schContent'    : resContent,
                    'schStart'      : resDate+"T"+resStart,
                    'schEnd'        : resDate+"T"+resEnd,
                    'schLocation'   : loca,
                    'schType'       : '회의실 예약',
                    'schRead'       : 'N',
                    'schColor'      : 'orange',
                    'allDay'        : false
         }
      
      $.ajax({
            type : "POST",
            url : "/sch/register",
            data : JSON.stringify(data),
            contentType: "application/json;charset=utf-8",
            dataType:"text",
                 success : function(res){
//                     alert("일정이 추가되었습니다.");
                    location.reload();
                 }
            
           });
//       console.log("selectTime : " + selectTime);
//       console.log("resName : ", resName + ", resDate : " + resDate + ", resStart : " + resStart + ", resEnd : " + resEnd + ", resContent : " + resContent);
   }
   
   
</script>
<style>
li{
	list-style:none;
}
tr{
   height: 60px;
}
th{
   width: 120px;
}

.modalTr .modalTd{
/*    border: 1px solid #eee; */
   padding: 5px;
}

#schContent{
   border: 1px solid #eee;
   border-radius: 5px;
   width: 300px;
   height: 50px;
}
a{
	color : black;
}
.accordion-item, .accordion-header{
	background-color: transparent;
}
.table{
	border-color: #9c9ea1;
}
</style>

<div class="email-app">
	<div class="left-part" style="width: 200px; background-color:#d2e0f5;">
	 <a class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none" href="javascript:void(0)"></a>
	 <div class="scrollable" style="height: 100%">
	   <div class="p-3">
	   		<h3 style="text-align: center;">예약</h3>
	   </div>
		<div style="margin:10px; 0">	
			<div>
			    <h5><strong><a href="/sch/resRoom">회의실 예약</a></strong></h5>
				<!-- =====회의실 예약 accordion=====  -->
				<div class="accordion accordion-flush" id="accordionFlushExample" style="font-size: 12px; background-color:#d2e0f5;">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" 
								aria-expanded="false" aria-controls="flush-collapseOne" style="background-color: transparent;">1층 회의실</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse show"
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
<!-- 				<h5><strong><a href="/sch/room">임시페이지</a></strong></h5> -->
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
		            <span>Home > 회의실 예약</span>
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
		<div class="container-fluid" style="text-align:center;">
			<div style="background-color: #fbeccd; border-radius:5px; height:110px; ">
				<div style="padding:10px; text-align:left; font-size:small; font-weight: bold;">
					<p>1. 회의실은 반드시 예약 후 이용해주시길 바랍니다.</p>
					<p>2. 회의실 예약은 최대 3시간까지 가능합니다. </p>
					<p>3. 회의실 사용 후 내부 쓰레기 등을 반드시 수거하여 회의실의 청결 유지를 부탁드립니다.</p>
				</div>
			</div>
		   <div >
		      <div class="input-group" style="height:50px; margin:10px 20px;">
		         <input type="date" value="" id="pickadate" class="pickadate"/>
		      </div>
		   </div>
		   <div style="text-align:left;">
		    <div style="display:inline-block; margin: 0 25px">
			   	<div style="background-color:rgb(247, 179, 191);display:inline-block; padding:6px"></div>
			   	<div style="display:inline-block;"> : 다른 사원이 예약한 회의실</div>
		    </div>
		    <div style="display:inline-block;">
			   	<div style="background-color:rgb(171, 236, 225); display:inline-block; padding:6px;"></div>
			   	<div style="display:inline-block;"> : 내가 예약한 회의실</div>
		    </div>
		   </div>
		   <div class="row" style="background-color: white; margin:10px 0; height: 1000px; font-size:small">
		      <div class="col-md-5" style="width:46%;">
		         <table class="table table-sm table-bordered reserv-table" id="timeTbl">
		            <thead>
		               <tr style="height: 30px;">
		                  <th style="width: 5rem;">시간대</th>
		                  <th colspan="5">본사 1층 회의실</th>
		               </tr>
		               <tr style="height: 50px;">
		                  <th>구분</th>
		                  <td id="MROOM1_101" style="background-color: #d2e0f5;">101호 회의실</td>
		                  <td id="MROOM1_102" style="background-color: #d2e0f5;">102호 회의실</td>
		                  <td id="MROOM1_103" style="background-color: #d2e0f5;">103호 회의실</td>
		               </tr>
		            </thead>
		            <tbody>
		               <tr>
		                  <th>09:00 - 10:00</th>
		                  <td class="room" id="MROOM1_101-09"onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-09" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-09" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>10:00 - 11:00</th>
		                  <td class="room" id="MROOM1_101-10" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-10" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-10" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>11:00 - 12:00</th>
		                  <td class="room" id="MROOM1_101-11" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-11" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-11" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>12:00 - 13:00</th>
		                  <td class="room" id="MROOM1_101-12" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-12" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-12" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>13:00 - 14:00</th>
		                  <td class="room" id="MROOM1_101-13" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-13" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-13" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>14:00 - 15:00</th>
		                  <td class="room" id="MROOM1_101-14" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-14" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-14" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>15:00 - 16:00</th>
		                  <td class="room" id="MROOM1_101-15" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-15" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-15" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>16:00 - 17:00</th>
		                  <td class="room" id="MROOM1_101-16" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-16" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-16" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>17:00 - 18:00</th>
		                  <td class="room" id="MROOM1_101-17" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-17" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-17" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>18:00 - 19:00</th>
		                  <td class="room" id="MROOM1_101-18" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-18" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-18" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>19:00 - 20:00</th>
		                  <td class="room" id="MROOM1_101-19" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-19" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-19" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>20:00 - 21:00</th>
		                  <td class="room" id="MROOM1_101-20" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-20" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-20" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>21:00 - 22:00</th>
		                  <td class="room" id="MROOM1_101-21" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_102-21" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM1_103-21" onclick="f_modal(this)"></td>
		               </tr>
		            </tbody>
		         </table>
		      </div>
		      <div class="col-md-6" style="width:54%">
		         <table class="table table-sm table-bordered reserv-table">
		            <thead>
		               <tr style="height: 30px;">
		                  <th style="width: 5rem;">시간대</th>
		                  <th colspan="4">본사 3층 회의실</th>
		               </tr>
		               <tr style="height: 50px;">
		                  <th>구분</th> 
		                  <td id="MROOM3_301" style=" background-color: #d2e0f5;">301호 회의실</td>
		                  <td id="MROOM3_302" style=" background-color: #d2e0f5;">302호 회의실</td>
		                  <td id="MROOM3_303" style=" background-color: #d2e0f5;">303호 회의실</td>
		                  <td id="MROOM3_304" style=" background-color: #d2e0f5;">304호 회의실</td>
		               </tr>
		            </thead>
		            <tbody>
		               <tr>
		                  <th>09:00 - 10:00</th>
		                  <td class="room" id="MROOM3_301-09" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-09" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-09" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-09" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>10:00 - 11:00</th>
		                  <td class="room" id="MROOM3_301-10" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-10" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-10" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-10" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>11:00 - 12:00</th>
		                  <td class="room" id="MROOM3_301-11" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-11" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-11" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-11" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>12:00 - 13:00</th>
		                  <td class="room" id="MROOM3_301-12" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-12" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-12" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-12" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>13:00 - 14:00</th>
		                  <td class="room" id="MROOM3_301-13" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-13" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-13" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-13" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>14:00 - 15:00</th>
		                  <td class="room" id="MROOM3_301-14" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-14" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-14" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-14" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>15:00 - 16:00</th>
		                  <td class="room" id="MROOM3_301-15" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-15" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-15" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-15" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>16:00 - 17:00</th>
		                  <td class="room" id="MROOM3_301-16" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-16" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-16" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-16" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>17:00 - 18:00</th>
		                  <td class="room" id="MROOM3_301-17" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-17" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-17" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-17" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>18:00 - 19:00</th>
		                  <td class="room" id="MROOM3_301-18" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-18" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-18" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-18" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>19:00 - 20:00</th>
		                  <td class="room" id="MROOM3_301-19" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-19" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-19" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-19" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>20:00 - 21:00</th>
		                  <td class="room" id="MROOM3_301-20" onclick="f_modal(this)"></td>
		                  <td  class="room" id="MROOM3_302-20" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-20" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-20" onclick="f_modal(this)"></td>
		               </tr>
		               <tr>
		                  <th>21:00 - 22:00</th>
		                  <td class="room" id="MROOM3_301-21" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_302-21" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_303-21" onclick="f_modal(this)"></td>
		                  <td class="room" id="MROOM3_304-21" onclick="f_modal(this)"></td>
		               </tr>
		            </tbody>
		         </table>
		      </div>
		   </div>
		</div>
	</div>
</div>
<!-- =====================[ 회의실 예약 모달 ]=================================-->
<div class="bckdrop" style="display:none;"></div>
<div class="modal" id="resModal" data-bs-backdrop="static"  role="dialog" style="display: none;">
   <div class="modal-content">
      <div class="modal-header">
         <h4>회의실 예약</h4>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeBtn()"></button>
      </div> 
      <div class="modal-body" id="modalBody" style="height: 250px; width: 420px;">
         <table class="resModalTable" style="padding:5px; border-collapse: collapse;">
            <thead>[회의실 예약 정보]</thead>
            <tbody style="margin:3px;">
               <tr class="modalTr">
                  <td class="modalTd">예약 호실</td>
                  <td class="modalTd">
                     <div id ="rmName"style="float:left; width: 70%;">회의실 이름</div>
                     <input type="hidden" id="locaCode" value="">
                  </td>
               </tr>
               <tr class="modalTr">
                  <td class="modalTd">예약 시간</td>
                  <td class="modalTd">
                  	 <input type="time" id="rmSTime" value=""> - <input type="time" id="rmETime" value="">
<!--                      <div id="rmTime" style="float:left; width: 40%; ">예약시간</div> -->
<!--                      <select name="resTime" style="float:right;" id="timeSelect"> -->
<!--                         <option selected>이용 시간 선택</option> -->
<!--                         <option value="1">1시간</option> -->
<!--                         <option value="2">2시간</option> -->
<!--                         <option value="3">3시간</option> -->
<!--                      </select> -->
                  </td>
               </tr>
               <tr class="modalTr">
                  <td class="modalTd">이용 목적</td>
                  <td class="modalTd">
                     <input type="text" id="schContent" name="schContent" value="">
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-warning" id="addBtn" onclick="addBtn(this)">추가</button>
         <button type="button" class="btn btn-warning" id="modBtn" style="display:none">수정</button>
         <button type="button" class="btn btn-delete" id="delBtn" style="display: none">삭제</button>
         <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeBtn()">취소</button>
      </div>   
   </div>
</div>
<!-- =====================[ 회의실 예약 모달 ]=================================-->