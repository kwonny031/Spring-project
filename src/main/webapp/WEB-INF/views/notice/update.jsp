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
							<form id="noticeForm" action="/notice/update/${noticeVO.notCode }" method="post">
								<input type="hidden" id="empNo" name="empNo"value="${SessionInfo.empNo }">
								<div>
									<div class="card-body">
										<div class="row pt-3">
											<div class="col-md-9">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">제목</label> 
													<input name="notTitle" type="text" id="notTitle" class="form-control form-control-danger" />
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
														name ="notStart" id="notStart" type="date" class="form-control" />
												</div>
											</div>
											
											<div class="col-md-3">
												<div class="mb-3">
													<label class="insertLbl control-label">종료일</label> <input
														name = "notEnd" id="notEnd" type="date" class="form-control" />
												</div>
											</div>

											<div class="col-md-3">
												팝업여부
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
													class="form-control" type="file" id="formFileMultiple"
													multiple="">
											</div>
										</div>
									</div>
									<div class="form-actions">
										<div class="card-body" style="top: -20px; position: relative;">
											<button type="submit" id="notUpdate"
												class="btn btn-success rounded-pill px-4">
												<div class="d-flex align-items-center">
													<i data-feather="save" class="feather-sm me-1 fill-icon"></i>
													수정
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
						<!-- ---------------------
	                            end Person Info
	                        ---------------- -->
					</div>
					</div>
<script type="text/javascript">
CKEDITOR.config.width = 915;
CKEDITOR.config.height = 260;
CKEDITOR.replace('freeContent',{
   footnotesPrefix: 'a',
//      filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload.do'
});      
</script>
<!-- -------------------------------------------------------------- -->
<!-- End Container fluid  -->
<!-- -------------------------------------------------------------- -->

<!-- 
	spring scheduler 
	
	task 설정 추가. -> 2scheduled로 사용(application 영역에서 실행)
	
	
	spring 정리법
	
	라이브러리(pom.xml) - 웹 설정(web.xml) - 스프링 설정 - 사용법
		
-->
${replyList.get(i) }






