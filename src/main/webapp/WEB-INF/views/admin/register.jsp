<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
#empPwBtn, #empPostcodeBtn{
	display:inline-block;
	background-color:#9eafde;;
	color:white;
	padding:3px 5px;
	border:transparent;
	border-radius:3px;
}
input{
	height:30px;
	border: 1px solid #eee;
	border-radius:5px;
}
</style>
<div class="email-app">
	<div class="left-part">
		<a class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none" href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="divider"></div>
			<ul class="list-group">
				<li class="list-group-item">
					<a href="/admin/home" class="active list-group-item-action d-flex align-items-center">
						<i data-feather="clipboard" class="feather-sm fill-white me-2"></i> 사원정보관리
					</a>
				</li>
				<li class="list-group-item">
					<a href="/admin/register" class="list-group-item-action d-flex align-items-center">
						<i data-feather="edit" class="feather-sm fill-white me-2"></i>신규사원등록 
					</a>
				</li>
				<li class="list-group-item">
					<a href="/admin/registerCar" class="list-group-item-action"> 
						<i data-feather="package" class="feather-sm fill-white me-2"></i> 자산등록
					</a>
				</li>
				<li class="list-group-item">
<!-- 					<hr /> -->
				</li>
			</ul>
		</div>
	</div>
	<!-- Right Part -->
		<div class="right-part mail-list bg-white overflow-auto">
		<!-- Action part -->
		<!-- Button group part -->
		<div class="card">
			<div class="card-header bg-info"
				style="background-color: #3699ff !important;">
				<h4 class="mb-0 text-white">신규 사원 등록</h4>
			</div>
			<!-- POST_CODE, BOA_CODE, EMP_NO, POST_TITLE, POST_DATE, POST_HIT, POST_ESS, POST_CONTENT -->
			<form id="empForm" action="/admin/register" method="post">
				<div>
					<div class="card-body">
						<div style="display:inline-block; width:49%;">
							<input type="hidden" name="empNo" id="empNo" value="20230005">
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<span>
									<strong>이　　름</strong>
									<input name="empName" type="text" id="empName" value="" style="display: inline-block;margin: 5px;"/> 
									<small style="display: none;" class="form-control-feedback"> This field has error. </small>
								</span>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<strong>비밀번호</strong>
								<input name="empPw" type="text" id="empPw" placeholder="임시비밀번호" style="margin-left:5px;"/>
								<button type="button" id="empPwBtn" onclick="ontempPassword()">임시 비밀번호</button>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">주민번호</label> 
								<input name="empReg" type="text" id="empReg" style="display:inline-block;margin-left:5px;"/> 
								<small style="display: none;" class="form-control-feedback"> This field has error. </small>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">연   락   처  </label> 
								<input name="empTel" type="text" id="empTel" style="display:inline-block;margin-left:9px;"/> 
								<small style="display: none;" class="form-control-feedback">This field has error. </small>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">이   메   일  </label> 
								<input name="empEmail" type="text" id="empEmail" style="display:inline-block;margin-left:9px;"/> 
								<small style="display: none;" class="form-control-feedback">This field has error. </small>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">부　　서</label> 
								<input name="depCode" type="text" id="depCode" style="display:inline-block;margin-left:5px;"/> 
								<small style="display: none;" class="form-control-feedback">This field has error. </small>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">직　　급</label> 
								<input name="empPos" type="text" id="empPos" style="display:inline-block;margin-left:5px;"/> 
								<small style="display: none;" class="form-control-feedback"> This field has error. </small>
							</div>
						</div>
							
						<div style="display:inline-block; width:49%;">	
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">우편번호</label>
								<input name="empPostcode" type="text" id="empPostcode" placeholder="우편번호" style="display: inline-block;margin-left:18px;"/>
								<input type="button" id="empPostcodeBtn" value="우편번호 찾기" style="display: inline-block; margin-left: 5px;" name="" onclick="sample4_execDaumPostcode()">
								<small style="display: none;" class="form-control-feedback">This field has error. </small>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">도로명주소</label> 
								<input name="" type="text" id="sample4_roadAddress" placeholder="도로명주소" style="width: 270px;display:inline-block;margin-left:5px;"/>
								<small style="display: none;" class="form-control-feedback">This field has error. </small>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">지번주소</label> 
								<input name="empAddr" type="text" id="empAddr" placeholder="지번주소" style="width: 270px;display:inline-block;margin-left:18px;"/> 
								<small style="display: none;" class="form-control-feedback">This field has error. </small>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">참고항목</label> 
								<input name="" type="text" id="sample4_extraAddress" placeholder="참고항목" style="width: 270px;display:inline-block;margin-left:18px;"/>
								<small style="display: none;" class="form-control-feedback">This field has error. </small>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">상세주소</label> 
								<input name="empAddr2" type="text" id="empAddr2" placeholder="상세주소" style="width: 270px;display:inline-block;margin-left:18px;"/> 
								<small style="display: none;" class="form-control-feedback">This field has error. </small>
							</div>
							<!-- ================================================================================ -->
							<div style="margin:8px 0;">
								<label class="insertLbl control-label">입   사   일</label> 
								<input name="empDate" id="empDate" type="date" class="form-control" style="width: 270px;display:inline-block;margin-left:25px;"/>
							</div>
							<!-- ================================================================================ -->
						</div>
					</div>
					
					<div style="padding:20px;">
						<label class="insertLbl control-label">참고사항</label>
						<textarea id="empMsg" name="empMsg" class="form-control" rows="5"></textarea>
					</div>
					
					<div class="form-actions">
						<div class="card-body" style="top: -20px; position: relative;">
							<button type="submit" class="btn btn-success rounded-pill px-4">
								<div class="d-flex align-items-center">
									<i data-feather="save" class="feather-sm me-1 fill-icon"></i>등록
								</div>
							</button>
							<button type="button" id="autoBtn" class="insertBtn btn btn-danger rounded-pill px-4 ms-2 text-white">
								<div class="d-flex align-items-center">
									<i data-feather="x-circle" class="feather-sm me-1 fill-icon"></i>자동완성
								</div>
							</button>
						</div>
					</div>
				
				</div> 
			</form>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net-bs4/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/dist/js/pages/datatable/datatable-basic.init.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	 /*  var empRegister = $("#empRegister"); */

	  
	  
	  function tempPassword(length){
    	 var charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
         var password = "";
         for (var i = 0; i < length; i++) {
             password += charset.charAt(Math.floor(Math.random() * charset.length));
         }
         return password;
    }
    
    function ontempPassword(){
    	var tempPW = tempPassword(6);
    	console.log(tempPW);
    	document.getElementById("empPw").value = tempPW;
    }
    
    function empRegister(){
    	var subjectVal = $('#subject').val();
		var messageVal = $('#message').val();
		var toVal = $('#empEmail');	
		var pwVal = $('#empPw');
    	var Object = {
    			"subject" : subjectVal,
    			"message" : messageVal,
    			"to" : toVal,
    			"empPw" : pwVal
    	};
    	
    	console.log("Object",Object);
    	
    	$.ajax({
    		type : "post",
    		url : "/admin/sendMail",
    		data : JSON.stringify(Object),
    		contentType: "application/json; charset=utf-8",
    		dataType: "text",
    		success : function(result){
    			if(result ==="SUCCESS"){
    				alert("전송완료")
    			}else{
    				alert("전송실패")
    			}
    		}
    	})
    }
  
    
    
    
    
    
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('empPostcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("empAddr").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    

$(function(){
	$("#autoBtn").on("click",function(){
// 		alert("aa123");
		$("input[id=empName]").val("송강");
		$("input[id=empTel]").val("010-1234-1234");
		$("input[id=empEmail]").val("songg05123@gmail.com");
		console.log("ck : ",$("#empName").val(), "//", $("#empTel").val(), "//", $("#empEmail").val());
				
		$("#empReg").val("960212-1234456");
		$("#depCode").val("보안기술부");
		$("#empPos").val("사원");
		$("#empAddr2").val("112동 1506호");
		$("#empDate").val("2023-05-12");
// 		$("#empMsg").html("직전직장 : 나무엑터스 \n지급: 사원 \n경력: 2년");
		
	});
})
</script>