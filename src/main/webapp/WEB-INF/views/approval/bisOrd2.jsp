<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	width: 15%;
	background-color: #ebe8e8;
	font-weight: bold;
	font-size: 12pt;
}

.td2 {
	border: 1px solid black;
 	width: 35%; 
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
</style>




<div class="row" style="padding-top: 50px;">
	<div class="col-2"></div>
	<div class="col-8" id="center">
		<header class="header">
			<h3>기안서 작성</h3>
		</header>
		<div class="buttons">
			<button class="button1">결재요청</button>
			<button class="button2">임시저장</button>
			<button class="button3">취소</button>
			<button class="button4">결재정보</button>
		</div>
		
		
		<div id="disp">
		${apFormVO.apfContent }
<%-- 			<%@ include file="/WEB-INF/views/approval/test.jsp" %> --%>
		</div>
		
		
		
	<div class="col-2"></div>
</div>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>


//출장보고서 script

$(document).ready(function(){       
	
// 	var xhr = new XMLHttpRequest();
// 	xhr.open('POST', '/approval/bisOrd', true);
// 	xhr.send();
	
	
// 	console.log("양식: ", text)
// 	$("#text")
//  	$("#disp").html('${text }');
    
    
    
    
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


});



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