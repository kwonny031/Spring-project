<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath }/resources/dist/js/pages/notes/notes.js"></script>
<!-- ===================[ sweetAlert ]================================-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<!-- ===================[ sweetAlert ]================================-->
<style>
.card{
	margin:0;
}
#note-full-container{
	padding: 15px 15px 25px;
}
.tab-content{
/* 	background-color: #eef5f9; */
    height: 890px; 
}
.card-body{
	width: 170px;
    height: 170px;
/*     padding: 15px 0 15px 15px!important; */
    padding: 15px!important;
}
.col-md-4 {
   flex: 0 0 auto;
    width: 180px;
    margin: 20px 10px;
    border: 2px solid #c3c3c3;
    border-radius: 5px;
    padding-left:3px;
}
#folderIcon{
	display:block;
	margin: 10px auto;
	width:100px;
}
.note-content{
/* 	margin:20px; */
}
.note-content{
	display: inherit;
}
.ckBox{
	position: absolute;
	top: 25%;
	width:20px;
	height:20px;
/* 	accent-color: #eee; */
}
.accordion-item, .accordion-header{
	background-color: transparent;
}
.bg-light{
	background-color : #d2e0f5 !important;
}
</style>
<div class="email-app">
	<div class="left-part" style="width: 200px;background-color:#d2e0f5;">
		<a class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none" href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="p-3">
				<h4>클라우드</h4>
<!-- 				<a id="uploadFile" class="waves-effect waves-light btn btn-danger d-block" href="#" >파일 업로드</a> -->
			</div>
			<div style="margin: 10px;">
				<div>
					<h5>클라우드 용량</h5>
					<div class="progress" style="height: 18px; margin-bottom:10px">
						<div class="progress-bar bg-success" style="width: 0%;" role="progressbar"> 0%</div>
					</div>
						<span style="text-align:right" id="progress"></span>
				</div>
				<br>
				<!-- ============================= Accordion============================ -->
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" 
								aria-expanded="false" aria-controls="flush-collapseOne" style="background-color: transparent;">부서자료실</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<!-- 여기도 foreach로 부서 자료실 목록 가져오기 -->
								<p>2022년 프로젝트 자료실</p>
								<p>2023년 프로젝트 자료실</p>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingTwo">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false"
								aria-controls="flush-collapseTwo" style="background-color: transparent;">개인 자료실</button>
						</h2>
						<div id="flush-collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
							<!-- 여기도 foreach 사용해서 개인 자료실 목록 가져오기 -->
								<p>내 문서</p>
								<p>내 그림</p>
							</div>
						</div>
					</div>
				</div>	
				<!-- ============================= Accordion============================ -->
			</div>
		</div>
	</div>
	<div class="right-part mail-list bg-white" style="width: calc(100% - 200px); margin-left: 200px;">
		<div class="p-3 b-b">
			<div class="d-flex align-items-center">
				<div>
					<h4>클라우드</h4>
					<span><a href="/cloud/home?empNo=${SessionInfo.empNo }">Home</a></span>
				</div>
			</div>
		</div>
		<!-- ============================================================================================ -->
		<div class="bg-light p-3 d-md-flex align-items-center">
			<div class="btn-group mt-1 mb-1">
				<div class="form-check">
<!-- 					<input type="checkbox" class="form-check-input sl-all" id="cstall" /> -->
<!-- 					<label class="form-check-label" for="cstall">Check All</label> -->
				</div>
			</div>
			<div class="ms-auto">
				<div class="btn-group me-2" role="group"
					aria-label="Button group with nested dropdown">
					<button type="button" class="btn btn-outline-secondary fs-5" id="refreshBtn">
						<i class="bi-arrow-clockwise"></i>
					</button>
<!-- 					<button type="button" class="btn btn-outline-secondary fs-5"> -->
<!-- 						<i class="ri-delete-bin-7-fill"></i> -->
<!-- 					</button> -->
				</div>
				<div class="btn-group me-2" role="group"
					aria-label="Button group with nested dropdown">
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle"
							data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="ri-folder-fill fs-5"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
							<div class="dropdown-item" id="createFlo">파일(zip) 다운로드</div>
<!-- 							<a class="dropdown-item" href="javascript:void(0)">폴더 생성</a>  -->
<!-- 							<a class="dropdown-item" href="javascript:void(0)">Dropdown link</a> -->
						</div>
					</div>
<!-- 					<div class="btn-group" role="group"> -->
<!-- 						<button id="btnGroupDrop1" type="button" -->
<!-- 							class="btn btn-outline-secondary dropdown-toggle" -->
<!-- 							data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 							<i class="ri-price-tag-fill fs-5"></i> -->
<!-- 						</button> -->
<!-- 						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> -->
<!-- 							<a class="dropdown-item" href="javascript:void(0)">Dropdown link</a> -->
<!-- 							<a class="dropdown-item" href="javascript:void(0)">Dropdown link</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
		<!-- ============================================================================================ -->
		<div class="container-fluid note-has-grid">
			<div class="tab-content">
				<div id="note-full-container" class="note-has-grid row">
					<!-- ===================================== card body ===================================== -->
					<!-- 부서 자료실(depCloud) -->  
						<div class="col-md-4 single-note-item all-category" >
							<div class="card card-body">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0" data-noteHeading="Book">
									부서 자료실
									<input id="depCode" type="hidden" value="${depCloud[0].depCode }">
								</h5>
	<!-- 							<p class="note-date fs-2 text-muted">11 March 2009</p> -->
	<!-- 							<input class="ckBox" type="checkbox" style="display:none"> -->
								<div class="note-content" id="depCloud">
									<img src="${pageContext.request.contextPath }/resources/images/folder(2).png" id="folderIcon">
								</div>
							</div>
						</div>
						<!-- ===================================== card body ===================================== -->
						<!-- ===================================== card body ===================================== -->
						<!-- 개인 자료실 (empCloud) -->
						<div class="col-md-4 single-note-item all-category note-important">
							<div class="card card-body">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0" data-noteHeading="Go for lunch">
									개인 자료실
									<input id="empNo" type="hidden" value="${empCloud[0].empNo }">
								</h5>
	<!-- 							<input class="ckBox" type="checkbox" style="display:none"> -->
								<div class="note-content" id="myCloud">
									<img src="${pageContext.request.contextPath }/resources/images/folder(2).png" id="folderIcon">
								</div>
							</div>
						</div>
					<!-- ===================================== card body ===================================== -->
				</div>
			</div>
			
			<!-- =================================[템플릿 modal 사용할지는 모르겠지만 일단 킵]=============================================== -->
<!-- 			<div class="modal fade" id="addnotesmodal" tabindex="-1" -->
<!-- 				role="dialog" aria-labelledby="addnotesmodalTitle" -->
<!-- 				aria-hidden="true"> -->
<!-- 				<div class="modal-dialog modal-dialog-centered" role="document"> -->
<!-- 					<div class="modal-content border-0"> -->
<!-- 						<div class="modal-header bg-info text-white"> -->
<!-- 							<h5 class="modal-title text-white">Add Notes</h5> -->
<!-- 							<button type="button" class="btn-close btn-close-white" -->
<!-- 								data-bs-dismiss="modal" aria-label="Close"></button> -->
<!-- 						</div> -->
<!-- 						<div class="modal-body"> -->
<!-- 							<div class="notes-box"> -->
<!-- 								<div class="notes-content"> -->
<!-- 									<form action="javascript:void(0);" id="addnotesmodalTitle"> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-md-12 mb-3"> -->
<!-- 												<div class="note-title"> -->
<!-- 													<label>Note Title</label> <input type="text" -->
<!-- 														id="note-has-title" class="form-control" minlength="25" -->
<!-- 														placeholder="Title" /> -->
<!-- 												</div> -->
<!-- 											</div> -->

<!-- 											<div class="col-md-12"> -->
<!-- 												<div class="note-description"> -->
<!-- 													<label>Note Description</label> -->
<!-- 													<textarea id="note-has-description" class="form-control" -->
<!-- 														minlength="60" placeholder="Description" rows="3"></textarea> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</form> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="modal-footer"> -->
<!-- 							<button class="btn btn-danger" data-bs-dismiss="modal">Discard</button> -->
<!-- 							<button id="btn-n-add" class="btn btn-info" disabled>Add</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<!-- =================================[템플릿 modal 사용할지는 모르겠지만 일단 킵]=============================================== -->
		
		</div>
	</div>
</div>
<!-- ===================[ sweetAlert ]================================-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- ===================[ sweetAlert ]================================-->
<script type="text/javascript">
$(function(){
	let totalUse = ( ${empCloud[0].cloUse} + ${depCloud[0].cloUse} );	// 사용용량 (개인 자료실 사용량 + 부서 자료실 사용량)
	let total = ${empCloud[0].cloMax} + ${depCloud[0].cloMax}
	let totalPer = (totalUse / total) * 100;
	console.log("사용 용량 : ", totalUse, " // 사용 용량(퍼센트) : " , (totalPer.toString()).slice(0,4));
	
	$("#progress").html("사용량 <strong style='color:#0bb7af'>"+ (totalUse.toString()).slice(0,4) +" GB</strong> / "+ total +".0 GB");
	$(".progress-bar").css("width", (totalPer.toString()).slice(0,4)+"%");
	$(".progress-bar").html((totalPer.toString()).slice(0,4) + "%");
	
	
	$("#depCloud").on("click",function(){
		var depCode = $("#depCode").val();
		location.href = "/cloud/depCloud?depCode="+depCode;
	});
	
	$("#myCloud").on("click",function(){
		location.href = "/cloud/myCloud?empNo="+${SessionInfo.empNo };
	});
	
	// ZIP 파일로 다운로드
	$("#createFlo").on("click", function(){
		Swal.fire("파일 다운로드는 준비중입니다.","여기를 누르면 zip파일 다운로드 되게 할 예정!","info");
	});
	
	// 새로고침 버튼
	$("#refreshBtn").on("click", function(){
		location.reload();
	});
	
});
</script>