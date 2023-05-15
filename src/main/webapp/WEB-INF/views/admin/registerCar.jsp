<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="email-app">
	<div class="left-part">
		<a
			class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none"
			href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="divider"></div>
			<ul class="list-group">
				<li class="list-group-item"><a href="/admin/home"
					class="active list-group-item-action d-flex align-items-center"><i
						data-feather="clipboard" class="feather-sm fill-white me-2"></i> 사원정보관리</a>
				</li>
				<li class="list-group-item"><a href="/admin/register"
					class="list-group-item-action d-flex align-items-center">
						<i data-feather="edit" class="feather-sm fill-white me-2"></i>
						신규사원등록 
				</a></li>
				<li class="list-group-item"><a href="/admin/registerCar"
					class="list-group-item-action"> <i data-feather="package"
						class="feather-sm fill-white me-2"></i> 자산등록
				</a></li>
				<li class="list-group-item">
					<hr />
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
										<div class="pt-3">
											<div class="col-md-3">
												<div class="mb-3 has-danger row">
													<label class="insertLbl control-label">이름</label> 
													<input name="empName" type="text" id="empName" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-5">
													<label class="insertLbl control-label">임시비밀번호</label> 
												<div class="mb-12 has-danger" style="display:inline-block; width: 100%">
													<div style="float: left; width: 50%">
													<input style="display:inline-block; " name="empPw" type="text" id="empPw" placeholder="임시비밀번호" class="form-control form-control-danger" />
													</div>
													<div style="float: left; width: 50%">
													<button type="button" onclick="ontempPassword()">임시 비밀번호 발급</button>
														</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">주민번호</label> 
													<input name="empReg" type="text" id="empReg" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">연락처</label> 
													<input name="empTel" type="text" id="empTel" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">이메일</label> 
													<input name="empEmail" type="text" id="empEmail" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">부서</label> 
													<input name="depCode" type="text" id="depCode" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">직급</label> 
													<input name="empPos" type="text" id="empPos" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-5">
													<label class="insertLbl control-label">우편번호</label> 
												<div class="mb-12 has-danger" style="display:inline-block; width: 100%">
													<div style="float: left; width: 50%">
													<input style="display:inline-block; " name="empPostcode" type="text" id="empPostcode" placeholder="우편번호" class="form-control form-control-danger" />
													</div>
													<div style="float: left; width: 50%">
													<input style="display:inline-block; margin-left: 5px; " name="" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
														</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">도로명주소</label> 
													<input name="" type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3" s>
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">지번주소</label> 
													<input name="empAddr" type="text" id="empAddr" placeholder="지번주소" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">상세주소</label> 
													<input name="empAddr2" type="text" id="empAddr2" placeholder="상세주소" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">참고항목</label> 
													<input name="" type="text" id="sample4_extraAddress" placeholder="참고항목" class="form-control form-control-danger" />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3">
													<label class="insertLbl control-label">입사일</label> <input
														name ="empDate" id="empDate" type="date" class="form-control" />
												</div>
											</div>
										</div>
										<!--/row-->
											<!--/span-->
									</div>
									<hr />
									<div class="card-body">
										<!--/row-->
										<label class="insertLbl control-label">상세 내용</label>
										<textarea id="empMsg" name="empMsg"
											class="form-control" rows="14" style="width: 982px;"></textarea>

										<!--/row-->
									</div>
									<div class="form-actions">
										<div class="card-body" style="top: -20px; position: relative;">
											<button type="submit" 
												class="btn btn-success rounded-pill px-4">
												<div class="d-flex align-items-center">
													<i data-feather="save" class="feather-sm me-1 fill-icon"></i> 등록
												</div>
											</button>
											<button type="button"
												class="insertBtn btn btn-danger rounded-pill px-4 ms-2 text-white">
												<div class="d-flex align-items-center">
													<i data-feather="x-circle"
														class="feather-sm me-1 fill-icon"></i> 취소
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
    	var tempPW = tempPassword(4);
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
</script>