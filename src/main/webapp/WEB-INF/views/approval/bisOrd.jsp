<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#center {
	background-color: white;
}

.header {
	padding: 30px;
}

.buttons {
	padding: 20px;
}

.button1 {
	background-color: white;
	width: 80px;
	height: 35px;
}

.button2 {
	background-color: white;
	width: 80px;
	height: 35px;
}

.button3 {
	background-color: white;
	width: 60px;
	height: 35px;
}

.button4 {
	background-color: white;
	width: 80px;
	height: 35px;
}

.report {
	border: 1px;
	margin: 10px;
}

.td1 {
	border: 1px solid black;
	width: 30%%;
	background-color: #dddddd;
	font-weight: bold;
	font-size: 12pt;
}

.td2 {
	border: 1px solid black;
	width: 70% 
}

.td3 {
	border: 1px solid black;
	background-color: #ebe8e8;
	width: 20%;
	height: 40px;
	font-weight: bold;
	text-align: center;
}

.td4 {
	border: 1px solid black;
	width: 80%;
}

.td5 {
	border: 1px solid black;
	background-color: #ebe8e8;
	font-weight: bold;
	width: 150px;
	height: 30px;
}
.td6{
	border: 1px solid black;
}

.signTb {
	width: 100%;
	height: 100%;
	border: 1px solid black;
	text-align: center;
}

#firstRow {
	padding-bottom: 30px;
}
.btnGroup{
	padding-top: 20px;
}
#add_row{
	background-color: white;
	height: 35px;
}
#delete_row{
	background-color: white;
	height: 35px;
}
.report{
	border: 5px double #bdbcbc;
	padding: 30px;
}
.input{
	border: white;
	width: 100%;
	
}
.ta{
	border: 1px solid black;
	width: 100%;
}
.ta_in{
	border: 1px solid white;
	width: 100%;
}
.tb2{
	border: 1px solid black;
	margin-top: 30px;
	width: 100%;
}
.tb2-td1{
	border: 1px solid black;
	background-color: #ebe8e8;
	height: 50px;
	text-align: center;
	font-weight: bold;
	font-size: 13pt;
}

/* ========첫 모달창=============== */

#myModal{
        position: fixed;
        height: 100%;
        width: 100%;
        left: 0;
        top: 0;
        background-color: rgba(101, 102, 103, 0.5);
        display: none;   /*초기값 안보이게*/
}
#myCont {
	border-radius: 10px;
	position: fixed;
 	 top: 50%;
  	left: 50%;
  	transform: translate(-50%, -50%);
	padding: 40px;

	font-size: 12pt;
	width: 35%;
    height: 55%;
	background-color: rgb(255, 255, 255);
	color: rgb(65, 64, 63);
}
#content{
	margin-top: 30px;
	margin-bottom: 40px;
	padding: 30px;
	border: 0.8px solid rgb(161, 160, 160);
}
#modalTb1{
	font-weight: bold;
	width: 50%;
	height: 50px;
}
#mBtn{
	position: relative;
  	left: 35%;
	height: 35px;
	width: 100px;
	background-color: #348ed5;
	border: 1px solid #348ed5;
	color:rgb(255, 255, 255);
	font-style: initial;
	border-radius: 8px;
}

/* =============  결재하기 모달  ================ */
#appModal{
        position: fixed;
        height: 100%;
        width: 100%;
        left: 0;
        top: 0;
        background-color: rgba(101, 102, 103, 0.5);
        display: none;   /*초기값 안보이게*/
}
#appModalCon {
	border-radius: 10px;
	position: fixed;
 	 top: 50%;
  	left: 50%;
  	transform: translate(-50%, -50%);
	padding: 20px;

	font-size: 12pt;
	width: 20%;
	height: 25%;
	background-color: rgb(255, 255, 255);
	color: rgb(65, 64, 63);
}
#appContent{
	margin-top: 30px;
	margin-bottom: 40px;
/* 	padding: 30px; */
}
#pass{
	border: 0.8px solid rgb(161, 160, 160);
	font-weight: bold;
	width: 70%;
	height: 50px;
	text-align:center;
	margin-left:auto; 
    margin-right:auto;
}
#appBtn{
	position: relative;
  	left: 35%;
	height: 35px;
	width: 100px;
	background-color: #348ed5;
	border: 1px solid #348ed5;
	color:rgb(255, 255, 255);
	font-style: initial;
	border-radius: 8px;
}
#close{
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: rgb(161, 160, 160);
}
#keyImage{
	max-width: 70%;
	max-height: 70%;
	filter:invert();
}
.keyTd{
	width: 25%;
	background-color: rgb(177, 176, 176);
	
}
#empBtn{
	position: relative;
  	left: 45%;
	height: 35px;
	width: 100px;
	background-color: #348ed5;
	border: 1px solid #348ed5;
	color:rgb(255, 255, 255);
	font-style: initial;
	border-radius: 8px;
	margin-top: 40px;
}
#modalBody{
	padding-top:30px;
	padding-left:30px;
	margin-left: 30px;
	border: 1px solid rgb(216, 215, 215);
}
</style>


<!-- =======================  << 사이드바 >> ==================================== -->

<!-- <div class="page-wrapper"> -->
        <!-- -------------------------------------------------------------- -->
        <!-- Email App Part -->
        <!-- -------------------------------------------------------------- -->
        <div class="email-app">
          <!-- -------------------------------------------------------------- -->
          <!-- Left Part -->
          <!-- -------------------------------------------------------------- -->
          <div class="left-part" style="width: 200px; background-color: #D2E0F5;">
            <a
              class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none"
              href="javascript:void(0)"
            ></a>
            <div class="scrollable" style="height: 100%">
              <div class="p-3">
	              <h3>전자결재</h3>

              </div>
              <div class="divider"></div>
              <ul class="list-group">
                <li>
                  <small class="p-3 grey-text text-lighten-1 db">결재 양식</small>
                </li>
                <li class="list-group-item">
                  <a
                    href="/approval/bisOrd?apfName=order"
                    class="active list-group-item-action d-flex align-items-center" id="order"
                    ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;발주서
                    </a>
                </li>
                <li class="list-group-item">
                	
                <a href="/approval/bisOrd?apfName=business" class="list-group-item-action" id="business" >
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;
				                출장보고서
                    </a>
                </li>
                <li class="list-group-item">
                  <a href="/approval/recruit" class="list-group-item-action d-flex align-items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;
                    	채용품의서
                    </a
                  >
                </li>
                <li class="list-group-item">
                  <a href="/approval/vacation" class="list-group-item-action">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;
                    	휴가신청서
                    	
                  </a>
                </li>
                <li class="list-group-item">
                  <hr />
                </li>
                <li>
                  <small class="p-3 grey-text text-lighten-1 db">결재 문서</small>
                </li>
                <li class="list-group-item">
                  <a href="/approval/aplineList" class="list-group-item-action d-flex align-items-center" id="order">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit feather-sm"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                    	&emsp;결재할 문서
                    	
                  </a>
                </li>
                
                <li class="list-group-item">
                  <a href="/approval/appList" class="list-group-item-action d-flex align-items-center" id="order">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock feather-sm"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    	&emsp;결재진행 문서
                    	
                  </a>
                </li>
                <li class="list-group-item">
                  <a href="/approval/tempstList" class="list-group-item-action">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-package feather-sm"><path d="M12.89 1.45l8 4A2 2 0 0 1 22 7.24v9.53a2 2 0 0 1-1.11 1.79l-8 4a2 2 0 0 1-1.79 0l-8-4a2 2 0 0 1-1.1-1.8V7.24a2 2 0 0 1 1.11-1.79l8-4a2 2 0 0 1 1.78 0z"></path><polyline points="2.32 6.16 12 11 21.68 6.16"></polyline><line x1="12" y1="22.76" x2="12" y2="11"></line><line x1="7" y1="3.5" x2="17" y2="8.5"></line></svg>
                    	&emsp;임시보관함
                  </a>
                </li>
                <li class="list-group-item">
                  <hr />
                </li>
                <li>
                  <small class="p-3 grey-text text-lighten-1 db">완료 문서함</small>
                </li>
                <li class="list-group-item">
                  <a href="/approval/appendList" class=" list-group-item-action d-flex align-items-center" id="order">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle feather-sm"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                    	&emsp;결재 완료 문서
                    	
                  </a>
                </li>
                <li class="list-group-item">
                  <hr />
                </li>
              </ul>
            </div>
          </div>

<!-- =======================  << 사이드바 END >> ==================================== -->



<body onload="document.getElementById('myModal').style.display='block'">
<div class="row" style="padding-top: 50px;">
	<div class="col-2"></div>
	<div class="col-8" id="center">
		<header class="header">
			<h3>기안서 작성</h3>
		</header>
		<div class="buttons">
			<input type="button" class="button1" value="결재요청" onclick="f_appModal()"/>
			<input type="button" class="button2" value="임시저장" onclick="" />
			<input type="button" class="button3" value="취소" onclick="" />
			<input type="button" class="button4" id="emp" value="결재정보"/>
		</div>
		
		
		<form action="approval/vacationInsert" method="post">
		<input type="hidden" id="empNo" value="${SessionInfo.empNo }"/>
		<input type="hidden" id="apfCode" value="3"/>
		<input type="hidden" id="appStatus" value=""/>
<!-- ====================== << 양식 불러오기 >> ===========================  -->
		<div id="disp">
			${apform.apfContent }
		</div>
<!-- ====================== << 양식 불러오기 END >> ===========================  -->
		</form>
		
	<div class="col-2"></div>
</div>
</div>

<!-- ============================= << 모달창 >> ============================ -->
<div id="myModal">
	<div id="myCont">
		<h4>결재 상세정보</h4>
		<div id="content">
			<div>
				<table>
					<tr>
						<td id="modalTb1">제목</td>
						<td id="title2"></td>
					</tr>
					<tr>
						<td id="modalTb1">기안 작성일</td>
						<td><input type="date" id="now_date" readonly/></td>
					</tr>
					<tr>
						<td id="modalTb1">보존연한</td>
						<td>
							<select name="period" class="period" id="period">
								<option value="5년" selected="selected">기간선택(미설정시 5년)</option>
								<option value="1년">1년</option>
								<option value="3년">3년</option>
								<option value="5년">5년</option>
								<option value="10년">10년</option>
								<option value="영구보존">영구보존</option>
						</select>

						</td>
					</tr>
					<tr>
						<td colspan='2' style="text-align: center; height: 50px; "><input type="checkbox" name="appUrgent" id="appUrgent" value="1">긴급여부</td>
					</tr>
				</table>

			</div>
		</div>
		<input type="button" value="기안작성" id="mBtn" onclick="f_modalClose()"/>
	</div>
</div>

<!-- '결재하기'누르면 나오는 모달창 -->
<div id="appModal">
	<div id="appModalCon">
		<div id="close" onclick="f_modalClose()">X</div><br>
		<h4>&nbsp&nbsp&nbsp기안하기</h4>
		<div id="appContent">
			<table id="pass">
				<tr>
					<td class="keyTd">
						<img src="${pageContext.request.contextPath }/resources/assets/images/key.png" 
						alt="키 이미지" id="keyImage">
					</td>
					<td><input type="password" style="border:0px; text-align: center;" id="Mpassword"/></td>
				</tr>
			</table>
		</div>
		<input type="button" value="기안하기" id="appBtn" onclick="f_pwCheck()"/>
	</div>
</div>

<!-- ============================= << 모달창 END>> ============================ -->

<!-- ------------------------[조직도 modal]------------------------ -->
<div class="modal-backdrop bckdrop hide" id="modalBack"></div>
<div class="modal-dialog modal-xl" id="modalVacation" data-bs-backdrop="static" aria-labelledby="scroll-long-inner-modal"
	role="dialog" style="display: none;">
	<div class="modal-content">
		<div class="modal-header d-flex align-items-center scroll" style="margin-top: 20px; margin-left:30px;">
			<h4>결재 정보</h4>
			<button type="button" class="btn-close1" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="row">
			<div class="col-4" id="modalBody" style="overflow-y: scroll; height: 300px; ">
				<div id="vacationTree"></div>
			</div>
			
			<div class="col-7">
				<table style="width:95%; margin-left: 10px;">
					<thead>
						<tr style="background-color: #f3f1f1; height: 40px;">
							<th style="border:1px solid; border-color: #d6d5d5; width:20%; text-align: center;">순번</th>
							<th style="border:1px solid; border-color: #d6d5d5; width:60%; text-align: center;">성명</th>
							<th style="border:1px solid; border-color: #d6d5d5; width:20%; text-align: center;">삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">1</td>
							<td style="border:1px solid; width:60%; text-align: center; border-color: #d6d5d5;" id="container2"></td>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">
								<img src="${pageContext.request.contextPath }/resources/assets/images/close.png" alt="쓰레기통" id="trash1" style="width:23px; margin: 15px;">
							</td>
						</tr>
						<tr>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">2</td>
							<td style="border:1px solid; width:60%; text-align: center; border-color: #d6d5d5;" id="container3"></td>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">
								<img src="${pageContext.request.contextPath }/resources/assets/images/close.png" alt="쓰레기통" id="trash2" style="width:23px; margin: 15px;">
							</td>
						</tr>
						<tr>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">3</td>
							<td style="border:1px solid; width:60%; text-align: center; border-color: #d6d5d5;" id="container4"></td>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">
								<img src="${pageContext.request.contextPath }/resources/assets/images/close.png" alt="쓰레기통" id="trash3" style="width:23px; margin: 15px;">
							</td>
						</tr>
					</tbody>
				</table>
				<div style="color:#adadad;">
					<br>
					&emsp;&emsp; ** 조직도에서 클릭한 후 드래그하여 결재선을 추가하세요!
				</div>
			</div>
		</div>
		<div class="empButton">
			<input type="button" id="empBtn" value="결재선 확인"/>
		</div>
		<div class="modal-footer">
		</div>
	</div>
</div>
<!-- ------------------------[조직도 modal end]------------------------ -->

</body>
<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->

<script>


//출장보고서 script

$(document).ready(function(){       
    
	//제목불러오기
	var title = $("#title").text();
	$("#title2").text(title);
	
	
	
	
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    //년도 selectbox만들기               
    for(var i = year ; i <= year+10 ; i++) {
        $('#s_year').append('<option value="' + i + '">' + i + '년</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#s_month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#s_day').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
    $("#s_year  > option[value="+year+"]").attr("selected", "true");        
    $("#s_month  > option[value="+mon+"]").attr("selected", "true");    
    $("#s_day  > option[value="+day+"]").attr("selected", "true");    
    
    
    
    //년도 selectbox만들기               
    for(var i = year ; i <= year+10 ; i++) {
        $('#e_year').append('<option value="' + i + '">' + i + '년</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#e_month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#e_day').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
    $("#e_year  > option[value="+year+"]").attr("selected", "true");        
    $("#e_month  > option[value="+mon+"]").attr("selected", "true");    
    $("#e_day  > option[value="+day+"]").attr("selected", "true");       


    
//=================    <<모달창>   ================//
	
	//모달창 기안날짜 오늘날짜로 설정
	document.getElementById('now_date').valueAsDate = new Date();
	
	
	//모달창 보존연한 셀렉트 박스
	var period = "";
	$("#period").on('change',function(){
		period = $("#period option:selected").val();
		console.log("보존연한: ", period);
	});
	
	var dateValue = $("#now_date").val();
	period = $("#period option:selected").val();

	$('#mBtn').click(function() {
		var name = '${SessionInfo.empName}';
		var dep = '${SessionInfo.depCode}';
		
		console.log("dateValue", dateValue);
		console.log("sessionId", name);
		console.log("sessionDep", dep);
		
		$('#sessionDep').html(dep);
		$('#sessionName').html(name);
		$('#app_date').val(dateValue);
		$('#app_year').val(period);
	});
	
	$('input[type=checkbox][name=appUrgent]').change(function(){
		if($(this).is(':checked')){
			$('#appStatus').val('1');
			var appStatus = $('#appStatus').val();
			console.log("appStatus",appStatus);
		}
	});
	
	//=================    <<모달창>   ================//
	
	
	
	$("#appBtn").click(function(){
		var Mpassword = $("#Mpassword").val();
		console.log("Mpassword: ", Mpassword);
		
		$.ajax({
		    type: "POST",
		    url: "/approval/vacation/pwcheck",
		    data: JSON.stringify({"Mpassword": Mpassword}),
		    contentType: "application/json;charset=UTF-8",
		    dataType: "text",
		    success: function(response) {
		    	console.log("체크: ", response);
		        // 전송 성공 시 수행할 작업
				var text = "";
		        if(response == "success"){
		        	
		        	
		        }else{
			        // 전송 실패 시 수행할 작업
		        	alert("회원님의 정보와 일치하지 않습니다.<br>다시 입력해주세요");
			    }
		    }
		    
		   
		});
	});
	
	
	
	//================  << 조직도 모달 >> ===============//
	
// 	let f_empTree = function(){
// 		alert("하이하이");
// 		$("#modalBack").attr("style", "display:block; z-index:400; opacity:0.3");
// 		$("#modalVacation").attr("style", "display:block; z-index:500; position:fixed; top:53%; left:10%; width:450px");
// 	}
	
	//  조직도 그리기
	let json = ${treeJson};
	console.log('json',json);//
	 $('#vacationTree').jstree({
		 'core': {
		     'data': json
		 },
	});	
	
	
	
	$("#vacationTree").on("select_node.jstree", function(evt, data){
		const vacationTree = document.querySelector("#vacationTree");
		console.log("data : " , data.node.original.empNo);
		var data = data.node.original.empNo 
			$.ajax({
				url: "/emp/selectMember",
				type: "post",
				data: data,
				contentType: "application/json",
				dataType: "json",
				success: function(res){
					console.log("[회원정보 조회]res >>> " , res);
					$("#empName").text(res.empName);
					$("#empPose").text(res.empPos);
					$("#empTel").text(res.empTel);
					$("#empEmail").text(res.empEmail);
					
					//드래그이벤트해봤어유
					vacationTree.addEventListener("dragover", (e)=>{
						e.preventDefault();
						//console.log("드래그 요소가 '첫' 번째 박스 영역에 계속 위치하면 발생하는 이벤트");
					});
					vacationTree.addEventListener("drop", (e)=>{
						e.preventDefault();
						console.log("드래그 요소가 '첫'번째 박스 영영에 드롭");
					});

					//=================  << 순번 1 결재선 박스 >>  ==================

					// 드래그 요소가 이동하여 위치할 우측 박스 영역
					const container2 = document.querySelector("#container2");

					container2.addEventListener("dragover", (e) => {
						e.preventDefault();
					//console.log(e);
					//console("드래그 요소가 '두' 번째 박스 영역에 계속 위치하면 발생하는 이벤트");
					});
					container2.addEventListener("drop", (e) => {
						e.preventDefault();
						//console.log(e);
						console.log("드래그 요소가 '두' 번째 박스 영역에 드롭");
						console.log("res.empName", res.empName);
						$("#container2").text(res.empName);
					});
					//=================  << 순번 1 결재선 박스 END>>  ==================



					//=================  << 순번 2 결재선 박스 >>  ==================
					// 드래그 요소가 이동하여 위치할 우측 박스 영역
					const container3 = document.querySelector("#container3");

					container3.addEventListener("dragover", (e) => {
						e.preventDefault();
					//console.log(e);
					//console("드래그 요소가 '두' 번째 박스 영역에 계속 위치하면 발생하는 이벤트");
					});
					container3.addEventListener("drop", (e) => {
						e.preventDefault();
						//console.log(e);
						console.log("드래그 요소가 '세' 번째 박스 영역에 드롭");
						console.log("res.empName", res.empName);
						$("#container3").text(res.empName);
					});
					//=================  << 순번 2 결재선 박스 END>>  ==================



					//=================  << 순번 3 결재선 박스 >>  ==================
					// 드래그 요소가 이동하여 위치할 우측 박스 영역
					const container4 = document.querySelector("#container4");

					container4.addEventListener("dragover", (e) => {
						e.preventDefault();
					//console.log(e);
					//console("드래그 요소가 '두' 번째 박스 영역에 계속 위치하면 발생하는 이벤트");
					});
					container4.addEventListener("drop", (e) => {
						e.preventDefault();
						//console.log(e);
						console.log("드래그 요소가 '넷' 번째 박스 영역에 드롭");
						console.log("res.empName", res.empName);
						$("#container4").text(res.empName);
					});
					//=================  << 순번 3 결재선 박스 END>>  ==================
				}
			});
			
		}
		
	);

	$("#emp").on("click", function(){
		$("#modalBack").attr("style", "display:block; z-index:400; opacity:0.3");
		$("#modalVacation").attr("style", "display:block; z-index:500; position:fixed; top:25%; left:35%; width:800px");
	});
	
	const modalBack = document.getElementById("modalBack");
	const modalTree = document.getElementById("modalTree");
	const treeDetail = document.getElementById("treeDetail");
	const modalVacation = document.getElementById("modalVacation");
	
	$(".btn-close1").on("click",function(){
		modalBack.style.display = "none";
		modalVacation.style.display = "none";
		modalTree.style.display = "none";
		treeDetail.style.display = "none";
// 		$("#modalBack").attr("style", "display:none;");
	});

	// 조직도 모달에서 쓰레기통 클릭시 이벤트
	$("#trash1").on("click", function(){
		$("#container2").empty();
		console.log("1순위 삭제");
	});
	$("#trash2").on("click", function(){
		$("#container3").empty();
		console.log("2순위 삭제");
	});
	$("#trash3").on("click", function(){
		$("#container4").empty();
		console.log("3순위 삭제");
	});

	//'결재선 확인' 버튼 클릭시 이벤트
	$("#empBtn").on("click", function(){
		$("#appLine1").html(container2);
		$("#appLine2").html(container3);
		$("#appLine3").html(container4);
		modalVacation.style.display = "none";
		modalBack.style.display = "none";
		modalTree.style.display = "none";
		treeDetail.style.display = "none";
	});
	
	
});

const appModal = document.getElementById("appModal");
function f_modalClose(){
	myModal.style.display = "none";
	appModal.style.display = "none";
}
function f_appModal(){
	appModal.style.display = "block";
}
 
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
} 

function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function inputOnlyNumberFormat(obj) {
    obj.value = onlynumber(uncomma(obj.value));
}

function onlynumber(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
}


//발주서 스크립트
$('#add_row').click(function() {
		var my_tbody = document.getElementById('my-tbody');
		let first_tr   = my_tbody.firstElementChild;
	    let tr_clone   = first_tr.cloneNode(true);//*1)복제된 node 반환

	    my_tbody.append(tr_clone);
	    clean_first_tr(my_tbody.firstElementChild);
});

	
$('#delete_row').click(function() {
		var my_tbody = document.getElementById('my-tbody');
		if (my_tbody.rows.length < 1)
			return;
		// my_tbody.deleteRow(0); // 상단부터 삭제
		my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제
});

</script>
