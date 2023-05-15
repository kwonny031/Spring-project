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
						data-feather="inbox" class="feather-sm fill-white me-2"></i> 사원정보관리</a>
				</li>
				<li class="list-group-item"><a href="/admin/register"
					class="list-group-item-action d-flex align-items-center">
						<i data-feather="send" class="feather-sm fill-white me-2"></i>
						신규사원등록 
				</a></li>
				<li class="list-group-item"><a href="/admin/registerCar"
					class="list-group-item-action"> <i data-feather="star"
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
								<h4 class="mb-0 text-white">사원 정보</h4>
							</div>
							<!-- POST_CODE, BOA_CODE, EMP_NO, POST_TITLE, POST_DATE, POST_HIT, POST_ESS, POST_CONTENT -->
							<form id="empForm">
								<div>
									<div class="card-body">
										<div class="pt-3">
											<div class="col-md-3">
												<div class="mb-3 has-danger row">
													<label class="insertLbl control-label">이름</label> 
													<input name="empName" type="text" id="empName" class="form-control form-control-danger" value="${empVO.empName }" readonly/>
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-5">
													<label class="insertLbl control-label">임시비밀번호</label> 
												<div class="mb-12 has-danger" style="display:inline-block; width: 100%">
													<div style="float: left; width: 50%">
													<input style="display:inline-block; " name="empPw" type="text" id="empPw" value="${empVO.empPw }" class="form-control form-control-danger" readonly />
													</div>
														</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">주민번호</label> 
													<input name="empReg" type="text" id="empReg" value="${empVO.empReg }"class="form-control form-control-danger" readonly />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">연락처</label> 
													<input name="empTel" type="text" id="empTel" value="${empVO.empTel }" class="form-control form-control-danger" readonly />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">이메일</label> 
													<input name="empEmail" type="text" id="empEmail" value="${empVO.empEmail }" class="form-control form-control-danger" readonly />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">부서</label> 
													<input name="depCode" type="text" id="depCode" value="${empVO.depCode }" class="form-control form-control-danger" readonly />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">직급</label> 
													<input name="empPos" type="text" id="empPos" value="${empVO.empPos }" class="form-control form-control-danger" readonly />
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
										</div>
										<!--/row-->
											<!--/span-->
									</div>
									<hr />
									<div class="form-actions">
										<div class="card-body" style="top: -20px; position: relative;">
											<button type="button" id="updateBtn" 
												class="btn btn-success rounded-pill px-4">
												<div class="d-flex align-items-center">
													<i data-feather="save" class="feather-sm me-1 fill-icon"></i> 수정
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
<script type="text/javascript">
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	 /*  var empRegister = $("#empRegister"); */
$('#updateBtn').on('click',function(){
    location.href = '/admin/update?empNo=${empVO.empNo}';
 });
	  
	  
	 
</script>