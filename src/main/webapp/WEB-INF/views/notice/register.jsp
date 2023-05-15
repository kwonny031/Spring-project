<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
.cke_top {
    border-bottom: 1px solid #d1d1d1;
    background: #f8f8f8;
    padding: 6px 8px 2px;
    white-space: normal;
}
.cke_bottom {
    padding: 6px 8px 2px;
    position: relative;
    border-top: 1px solid #d1d1d1;
    background: #f8f8f8;
}
</style>
<!-- -------------------------------------------------------------- -->
<!-- Bread crumb and right sidebar toggle -->
<!-- -------------------------------------------------------------- -->
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-5 align-self-center">
			<h4 class="page-title">공지사항</h4>
			<div class="d-flex align-items-center">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Library</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- -------------------------------------------------------------- -->
<!-- End Bread crumb and right sidebar toggle -->
<!-- -------------------------------------------------------------- -->
<!-- -------------------------------------------------------------- -->
<!-- Container fluid  -->
<!-- -------------------------------------------------------------- -->
<div class="container-fluid">
	<!-- -------------------------------------------------------------- -->
	<!-- Start Page Content -->
	<!-- -------------------------------------------------------------- -->
	<!-- basic table -->
	<div class="row"><div class="col-lg-12" style="width: 98.6%; margin-left: 15px;">
						<!-- ---------------------
	                            start Person Info
	                        ---------------- -->
						<div class="card">
							<div class="card-header bg-info"
								style="background-color: #3699ff !important;">
								<h4 class="mb-0 text-white">공지사항</h4>
							</div>
							<!-- POST_CODE, BOA_CODE, EMP_NO, POST_TITLE, POST_DATE, POST_HIT, POST_ESS, POST_CONTENT -->
							<form id="noticeForm" action="/notice/register" method="post" enctype="multipart/form-data">
								<input type="hidden" id="notCode" name="notCode" value="${noticeVO.notCode }"> 
								<input type="hidden" id="empNo" name="empNo"value="${SessionInfo.empNo }">
								<div>
									<div class="card-body">
										<h3 class="card-title">
											필수 입력 항목 <font color="red">*</font>
										</h3>
										<div class="row pt-3">

											<div class="col-md-9">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">제목</label> 
													<input name="notTitle" type="text" id="notTitle" class="form-control form-control-danger" style="border: 1px solid #646363;"/>
													<small style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>
										</div>
										<!--/row-->
										<div class="row">
											<!--/span-->
											<div class="col-md-3">
												<div class="mb-3">
													<label class="insertLbl control-label">시작일</label> <input
														name ="notStart" id="notStart"  style="border: 1px solid #646363;" type="date" class="form-control" />
												</div>
											</div>
											
											<div class="col-md-3">
												<div class="mb-3">
													<label class="insertLbl control-label">종료일</label> <input
														name = "notEnd" id="notEnd" type="date" class="form-control" style="border: 1px solid #646363;"/>
												</div>
											</div>
										</div>
									</div>
									<hr />
									<div class="card-body">
										<!--/row-->
										<label class="insertLbl control-label">상세 내용</label>
										<textarea id="notContent" name="notContent"
											class="form-control" rows="14" style="width: 982px;"></textarea>

										<!--/row-->
										<div class="col-md-4" style="margin-top: 20px;">
											<div class="mb-3">
												<label class="insertLbl control-label">파일 첨부</label> <input
													class="form-control" type="file" id="attFile" name="attFile"
													multiple="">
											</div>
										</div>
									</div>
									<div class="form-actions">
										<div class="card-body" style="top: -20px; position: relative;">
											<button type="submit" id="notRegister"
												class="btn btn-success rounded-pill px-4">
												<div class="d-flex align-items-center">
													<i data-feather="save" class="feather-sm me-1 fill-icon"></i>
													등록
												</div>
											</button>
											<button type="button"
												class="insertBtn btn btn-danger rounded-pill px-4 ms-2 text-white">
												<div class="d-flex align-items-center">
													<i data-feather="x-circle"
														class="feather-sm me-1 fill-icon"></i> 취소
												</div>
											</button>
											<button type="button" id="autoBtn" class="insertBtn btn rounded-pill px-4 ms-2 text-white" style="background-color:#8888b6;">
												<div class="d-flex align-items-center">
													<i data-feather="x-circle" class="feather-sm me-1 fill-icon"></i> 자동완성
												</div>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
						<!-- ---------------------
	                            end Person Info
	                        ---------------- -->
					</div>
					</div>
<script type="text/javascript">
CKEDITOR.config.width = 915;
CKEDITOR.config.height = 260;
CKEDITOR.replace('notContent',{
   footnotesPrefix: 'a',
//      filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload.do'
});      


$(function(){
	var editor = CKEDITOR.instances.notContent;
	var str = "우리회사의 홈페이지와 그룹웨어가 개설이 되었습니다.<br><br><br>"+
			  "각종 근태신청 및 직원들간의 소통 및 각종 업무를 위한 공간으로 형성된 만큼 많은 직원들이 사용하기에, 몇 가지 안내 말씀을 드리고자 합니다.<br><br>"+
		      "□ 홈페이지 및 그룹웨어는 공적인 용도로 제작이 된 것이므로, 사적인 내용의 개재는 자제하여 주시기 바랍니다.<br>"+
	 		  "□ 아래 예시와 같이 게시물이 목적에 맞지 않을 경우 등록된 게시물은 게시자에게 통보 없이 삭제될 수 있습니다.<br>"+
			  "　- 특정 개인 및 단체를 비방하거나 왜곡, 선동 또는 확인되지 않은 사실을 유포하는 행위<br>"+
			  "　- 광고 및 상업적인 게시물에 해당하는 경우<br>"+
			  "　- 동일한 내용을 반복하여 올리는 경우<br>"+
			  "　- 상식 및 통신 예절에 어긋난다고 판단되는 경우<br>"+
			  "　- 관계　법령을 위배하거나 정상적인 운영을 저해한다고 판단되는 경우 등<br>"+
			  "　- 기타 회사와 관계없는 사적 사항 등<br>"+
			  "□ 근태 및 시간외근무 수당 신청의 경우, 급여와 관련된 내용으로, 결재권자분들께서는 상시적으로 확인하시어, 검토 및 결재 해주시기 바랍니다.<br><br>"+
			  "직원 여러분들의 많은 이용과 협조 바랍니다.";
	$("#autoBtn").on("click", function(){
		
		$("#notTitle").val("05/12 추가 공지사항입니다.");
		$("#notStart").val("2023-05-12");
		$("#notEnd").val("2023-05-20");
		
// 		editor.setData('공지사항입니다.');
		editor.insertHtml(str);
		
	});
})
</script>