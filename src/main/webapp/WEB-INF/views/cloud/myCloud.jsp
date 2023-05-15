<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="${pageContext.request.contextPath }/resources/dist/js/pages/notes/notes.js"></script>
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
	width: 180px;
    height: 185px;
/*     padding: 15px 0 15px 15px!important; */
    padding: 15px 0 0 10px!important;
}
.col-md-4 {
   flex: 0 0 auto;
    width: 187px;
    margin: 20px 10px;
    border: 2px solid #c3c3c3;
    border-radius: 5px;
    padding-left:3px;
}
#folderIcon, #fileImg{
	display:block;
	margin: 5px auto;
	width:90px;
}
.note-content{
/* 	margin:20px; */
}
.note-content{
	display: inherit;
}
.ckBox{
	position: absolute;
	top: 34%;
	margin-left: 20px;
/* 	right: 80%; */
    width: 20px;
    height: 20px;
    z-index: 2;
/* 	accent-color: #eee; */
}
.note-date{
	margin:0;
}
.accordion-item, .accordion-header{
	background-color: transparent;
}
.bg-light{
	background-color : #d2e0f5 !important;
}
</style>
<!-- 파일 다운로드시 파일이름이 한글로 된 파일 인코딩을 위해 필요 -->
<% request.setCharacterEncoding("UTF-8");%>
<div class="email-app">
	<div class="left-part" style="background-color:#d2e0f5;">
		<a class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none" href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="p-3">
				<h4>클라우드</h4>
				<a id="uploadFile" class="waves-effect waves-light btn btn-danger d-block" href="#" >파일 업로드</a>
				<input type="file" id="file" style="display:none">
			</div>
			<div style="margin: 10px;">
				<div>
					<h5>클라우드 용량</h5>
					<div class="progress" style="height: 18px; margin-bottom:10px">
						<div class="progress-bar bg-success" style="width: ;" role="progressbar"></div>
					</div>
						<span style="text-align:right" id="progress"></span>
				</div>
				<br>
				<!-- ============================= Accordion============================ -->
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button" id="depCloud"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" 
								aria-expanded="false" aria-controls="flush-collapseOne" style="background-color: transparent;">부서자료실</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<!-- 여기도 foreach로 부서 자료실 목록 가져오기 -->
								<p>2022년 자료실</p>
								<p>2023년 자료실</p>
							</div>
						</div>
					</div>
					<div class="accordion-item" style="">
						<h2 class="accordion-header" id="flush-headingTwo" style="">
							<button class="accordion-button collapsed" type="button" style="background-color: transparent;"
							 data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" 
							aria-expanded="false" aria-controls="flush-collapseTwo">개인 자료실</button>
						</h2>
						<div id="flush-collapseTwo" class="accordion-collapse collapse show"
							aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample" style="">
							<div class="accordion-body">
							<!-- 여기도 foreach 사용해서 개인 자료실 목록 가져오기 -->
							<c:forEach items="${empFolderList }" var="empList">
								<c:if test="${empty empList.folParcode}">
									<p>${empList.folName }</p>
								</c:if>
							</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================= Accordion============================ -->
			</div>
		</div>
	</div>
	<div class="right-part mail-list bg-white" style="overflow-y: auto; overflow-x: hidden;">
		<div class="p-3 b-b">
			<div class="d-flex align-items-center">
				<div>
					<h4>클라우드</h4>
					<span id="menuBar"><a href="/cloud/home?empNo=${SessionInfo.empNo }">Home</a> > <a id="empUrl" href="/cloud/myCloud?empNo="${SessionInfo.empNo }>개인 자료실</a></span>
				</div>
			</div>
		</div>
				<!-- ============================================================================================ -->
		<div class="bg-light p-3 d-md-flex align-items-center">
			<div class="btn-group mt-1 mb-1">
				<div class="form-check">
					<input type="checkbox" class="form-check-input sl-all" id="cstall" />
					<label class="form-check-label" for="cstall">전체 선택</label>
				</div>
			</div>
			<div class="ms-auto">
				<div class="btn-group me-2" role="group"
					aria-label="Button group with nested dropdown">
					<button type="button" class="btn btn-outline-secondary fs-5" id="refreshBtn">
						<i class="bi-arrow-clockwise"></i>
					</button>
					<button type="button" class="btn btn-outline-secondary fs-5" id="delBtn">
						<i class="ri-delete-bin-7-fill"></i>
					</button>
				</div>
				<div class="btn-group me-2" role="group" aria-label="Button group with nested dropdown">
					<div class="btn-group" role="group">
						<button id="btnGroupDrop1" type="button"
							class="btn btn-outline-secondary dropdown-toggle"
							data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="ri-folder-fill fs-5"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
							<div class="dropdown-item" id="downloadFol">파일(zip) 다운로드</div>
							<div class="dropdown-item" id="createFlo">폴더 생성</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ============================================================================================ -->
		<div class="container-fluid note-has-grid">
			<div class="tab-content" id="tabContent">
				<input type="hidden" id="depCloCode" value="${empFolderList[0].cloCode }">
				<div id="note-full-container" class="note-has-grid row">
				<!-- =====================================[ card body ]===================================== -->
				<c:forEach items="${empFolderList }" var="folderList" varStatus="stat">
					<!--=========================================[ 부서 최상위 자료실 (depth:1) ]================================================  -->
					<!-- 상위 폴더 : FOL_PARCODE가 null인 폴더 (2022년 프로젝트, 2023년 프로젝트 폴더) -->
					<c:if test="${empty folderList.folParcode}">
						<div class="col-md-4 single-note-item all-category cloudCard1">
							<input class="ckBox" type="checkbox" style="display:none;" value="${stat.count }">
							<div class="card card-body cardBody" onclick="f_cardBody(this)" data-fol="${folderList.folCode }">
								<span class="side-stick"></span>
								<h5 class="note-title text-truncate w-75 mb-0" data-noteHeading="Book">
									${folderList.folName }
								</h5>
								<div></div>
								<input type="hidden" value="${folderList.folCode }" class="hiddenFolCode">
								<p class="note-date fs-2 text-muted"> <fmt:formatDate value="${folderList.folDate }"/></p>
								<div class="note-content ckbox" id="basicFolder">
									<img src="${pageContext.request.contextPath }/resources/images/folder(2).png" id="folderIcon">
								</div>
								<div class="d-flex align-items-center">
									<a href="javascript:void(0)" class="link me-1">
										<i class="ri-star-line fs-5 favourite-note"></i>
									</a> 
									<a href="javascript:void(0)" class="link text-danger ms-2">
										<i class="ri-delete-bin-line fs-5 remove-note"></i>
									</a>
								</div>
							</div>
						</div>
					</c:if>
					<!--=========================================[ 부서 최상위 자료실 (depth:1) ]================================================  -->
					<!--=========================================[ 부서 하위 자료실 (depth:2) ]================================================  -->
						<c:if test="${not empty folderList.folParcode}">
							<div class="col-md-4 single-note-item all-category cloudCard" style="display:none">
							<input class="ckBox" type="checkbox" style="display:none">
								<div class="card card-body" onclick="f_cardBodyChild(this)">
									<span class="side-stick"></span>
									<h5 class="note-title text-truncate w-75 mb-0" data-noteHeading="Book">
										${folderList.folName }
									</h5>
<!-- 									<div></div> -->
									<a href="/resources/images/${folderList.folName }" download class="downloadURL"></a>
									<input type="hidden" value="${folderList.folParcode }" class="hiddenParFolCode">
									<input type="hidden" value="${folderList.folCode }" class="hiddenFolCode">
									<p class="note-date fs-2 text-muted"><fmt:formatDate value="${folderList.folDate }"/></p>
									<div class="note-content ckbox" id="basicFolder">
										<img src="${pageContext.request.contextPath }/resources/images/folder(2).png" id="folderIcon">
									</div>
									<div class="d-flex align-items-center">
										<a href="javascript:void(0)" class="link me-1">
											<i class="ri-star-line fs-5 favourite-note"></i>
										</a> 
										<a href="javascript:void(0)" class="link text-danger ms-2">
											<i class="ri-delete-bin-line fs-5 remove-note"></i>
										</a>
									</div>
								</div>
							</div>
						</c:if>
					<!--=========================================[ 부서 하위 자료실 (depth:2) ]================================================  -->
				</c:forEach>
				<!-- ===================================== card body ===================================== -->
<!-- 					<div class="col-md-4 single-note-item all-category note-important"> -->
<!-- 						<div class="card card-body"> -->
<!-- 							<span class="side-stick"></span> -->
<!-- 							<h5 class="note-title text-truncate w-75 mb-0" data-noteHeading="Go for lunch"> -->
<!-- 								개인 자료실 -->
<!-- 							</h5> -->
<!-- 							<input class="ckBox" type="checkbox" style="display:none"> -->
<!-- 							<p class="note-date fs-2 text-muted">2023-04-25</p> -->
<!-- 							<div class="note-content ckbox"> -->
<%-- 								<img src="${pageContext.request.contextPath }/resources/images/folder(2).png" id="folderIcon"> --%>
<!-- 							</div> -->
<!-- 							<div class="d-flex align-items-center"> -->
<!-- 								<a href="javascript:void(0)" class="link me-1"> -->
<!-- 									<i class="ri-star-line fs-5 favourite-note"></i> -->
<!-- 								</a>  -->
<!-- 								<a href="javascript:void(0)" class="link text-danger ms-2"> -->
<!-- 									<i class="ri-delete-bin-line fs-5 remove-note"></i> -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				<!-- ===================================== card body ===================================== -->
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	
	// [사용 용량 표시] =======================================================================================================
	let totalUse = 0;	// 사용 용량
	
	console.log("확인 : ", ${empFolderList[0].folUse});
	
	<c:forEach items="${empFolderList}" var="list">
		totalUse += ${list.folUse};	
	</c:forEach>

	let totalPer = (totalUse / 5.0) * 100;
	console.log("사용 용량 : ", (totalUse.toString()).slice(0,4), " // 사용 용량(퍼센트) : " , (totalPer.toString()).substring(0,4));
	
	$("#progress").html("사용량 <strong style='color:#0bb7af'>"+ (totalUse.toString()).slice(0,4) +" GB</strong> / 5.0 GB");
	$(".progress-bar").css("width", (totalPer.toString()).substring(0,4)+"%");
	$(".progress-bar").html((totalPer.toString()).substring(0,4) + "%");
	console.log($("#progress").html());
	console.log("progressbar 확인 : ", $(".progress-bar").html());
	// [사용 용량 표시 end] =======================================================================================================
	
	// [체크박스 체크여부] ======================================================================================================
	var flag = true;
	
	$("#tabContent .cloudCard1").mouseover(function(){
		$(this).find(".ckBox").css("display","block");
	})
	
	$("#tabContent .cloudCard1").mouseout(function(){
		if(flag){
			$(this).find(".ckBox").attr("style", "display:none");
		}else{
			$(this).find(".ckBox").attr("style", "display:block");
		}
		
	});
	
	$("#tabContent .cloudCard1").on("click", ".ckBox", function(){
		if($(this).is(":checked")){
			$(this).css("display","block");
			flag = false;
		}else{
			flag = true;			
		}
	});
	// [체크박스 체크여부 end] ======================================================================================================
	
	$("#cstall").on("click", function(){
		$(".ckBox").attr("style", "display:");
		$(".ckBox").attr("checked",true);
	});
	
	// [메뉴 버튼 클릭] =========================================================================================================
	// ZIP 파일로 다운로드
	$("#downloadFol").on("click", function(){
		Swal.fire("파일 다운로드는 준비중입니다.","여기를 누르면 zip파일 다운로드 되게 할 예정!","info");
	});
	
	// 새로고침 버튼
	$("#refreshBtn").on("click", function(){
		location.reload();
	});
	
	//부서 자료실로 이동
	$("#depCloud").on("click",function(){
		location.href = "/cloud/depCloud?depCode=${SessionInfo.depCode}" 
	});
	// [메뉴 버튼 클릭 end] =========================================================================================================
	
	// [전체 삭제 버튼] ========================================================================================================
	$("#delBtn").on("click",function(){
		Swal.fire(
        {
	          title: "폴더를 삭제하시겠습니까?",
	          text: "확인버튼을 누르시면 폴더가 삭제됩니다.",
	          icon: "warning",
	          showCancelButton: true,
	          confirmButtonColor: "rgb(89 61 239)",
	          confirmButtonText: "확인",
	          cancelButtonText: '취소',
	          closeOnConfirm: false,
	        }).then((result) => {
	            if (result.isConfirmed) {
// 	        	$.ajax({
// 	             	   type : "POST",
// 	             	   url : "/sch/remove",
// 	             	   data : data,
// 	          	   	   dataType : "json",
// 	                   success : function(req){	
// 	                	}
// 	            });
                Swal.fire('폴더가 삭제 되었습니다.','','success');
                
              }
	        });
	});
	// [전체 삭제 버튼 end] ========================================================================================================
	
	
	// [폴더 생성] ===========================================================================================================
	$("#createFlo").on("click", function(){
// 		alert("폴더 생성 클릭!!");
		
		let htmlStr = `
			<input class="ckBox" type="checkbox" style="display:none">
			<div class="col-md-4 single-note-item all-category note-important"> 
			 <div class="card card-body">
			 	<span class="side-stick"></span>
			 	<div style="display:inline">
		 			<input type="text" id="NewFolName" placeholder="새 폴더" style="width:100px;">
			 		<input type="button" class="btn btn-danger" id="createBtn" data-folparcode value="생성" style="width: 60px; height: 30px">
			 	</div>
			 	<input class="ckBox" type="checkbox" style="display:none"> 
			 	<div class="note-content ckbox"> 
			 		<img src="${pageContext.request.contextPath }/resources/images/folder(2).png" id="folderIcon"> 
			 	</div>
			 	<div class="d-flex align-items-center"> 
			 		<a href="javascript:void(0)" class="link me-1"> 
			 			<i class="ri-star-line fs-5 favourite-note"></i> 
			 		</a>  
			 		<a href="javascript:void(0)" class="link text-danger ms-2"> 
			 			<i class="ri-delete-bin-line fs-5 remove-note"></i> 
			 		</a> 
			 	</div> 
			 </div> 
			</div> 
	   `;		
		$("#note-full-container").html($("#note-full-container").html() + htmlStr);
		
	   
// 	   var fcEventEle = document.getElementsByClassName("fc-event");
	   var cardFolder = document.getElementsByClassName("col-md-4");
	   var cloCode = $("#depCloCode").val();
	   var box = document.querySelectorAll("#note-full-container .col-md-4");

	   var element = box[box.length-1];
	   element.children[0].children[1].childNodes[3].setAttribute("data-folparcode", box[0].children[1].childNodes[7].defaultValue);
	   
	});
	
	 $("#note-full-container").on("click", "#createBtn", function(){
		   var folName = $("#NewFolName").val();	// 새로 생성하는 폴더 이름
			console.log("파라미터 확인 : ", cloCode, "// 폴더 이름 : ", folName, " // 상위클라우드 코드 : ","pppp", $("#createBtn").data('folparcode'),"pppp");
		   var folparcode = $("#createBtn").data('folparcode');
//		   var folparcode = this.dataset.folparcode;

		   console.log("folparcode 확인 :: ", folparcode);
			// 상위 폴더인 경우 (folParcode가 null)
			var cloCode = $("#depCloCode").val();
			if(folparcode == ''){
// 				alert("[상위 폴더]");
				console.log("[상위 폴더 생성] 클라우드 코드 : ", cloCode, ", 폴더명 : ", folName);
				
				var param = {
					cloCode : cloCode,	// 클라우드 코드
					folName : folName	// 폴더명
				}
				$.ajax({
					type 	 : "post",
					url  	 : "/cloud/createFolder",
					data 	 : JSON.stringify(param),
					dataType : "json",
					async: false,
					contentType: "application/json;charset=utf-8",
					success	 : function(res){

					}
				});
				location.reload();
			}else{
// 				alert("[하위 폴더1]");
				//하위 폴더인 경우
				var param = {
					cloCode    : cloCode,		// 클라우드 코드(CLO06)
					folParcode : folparcode,  	// 상위폴더 코드
					folName    : folName,  		// 폴더명
				}
				
				$.ajax({
					type 	 : "post",
					url  	 : "/cloud/createFolder",
					data 	 : JSON.stringify(param),
					dataType : "json",
					async: false,
					contentType: "application/json;charset=utf-8",
					success	 : function(res){
	
					}
				});
				location.reload();
			}
			
			
			var elm = document.querySelector("#tabContent .cardBody");
			f_cardBodyChild(elm, 'head');
			
	   });	// createBtn end(폴더 생성 버튼)
	// [폴더 생성 end] ===========================================================================================================

	// [파일 업로드] =============================================================================================================
		
		// 첨부파일이 생성되는 경우 파일은 첨부파일에 저장되야하나..?? 아님 폴더에 저장되야하나..??
		$("#uploadFile").on("click",function(){
// 			alert("파일 업로드!");
			$("#file").click();
			

	   		let htmlStr = `
				<input class="ckBox" type="checkbox" style="display:none">
				<div class="col-md-4 single-note-item all-category note-important" > 
				 <div class="card card-body">
				 	<span class="side-stick"></span>
				 	<div style="display:inline">
			 			<input type="text" id="NewFolName" placeholder="새 파일" style="width:100px;">
				 		<input type="button" class="btn btn-danger" id="uploadBtn" data-folparcode data-folsize="0" value="업로드" style="width: 60px; height: 30px">
				 	</div>
				 	<div class="note-content ckbox"> 
				 		<img src="${pageContext.request.contextPath }/resources/images/folder(2).png" id="fileImg"> 
				 	</div>
				 	<div class="d-flex align-items-center"> 
				 		<a href="javascript:void(0)" class="link me-1"> 
				 			<i class="ri-star-line fs-5 favourite-note"></i> 
				 		</a>  
				 		<a href="javascript:void(0)" class="link text-danger ms-2"> 
				 			<i class="ri-delete-bin-line fs-5 remove-note"></i> 
				 		</a> 
				 	</div> 
				 </div> 
				</div> 
		   `;		
			$("#note-full-container").html($("#note-full-container").html() + htmlStr);
			
		    var box = document.querySelectorAll("#note-full-container .col-md-4");
	
		    var element = box[box.length-1];
			var soraTop = document.querySelector("#note-full-container");
			var soraChildren = soraTop.children;
			
			for(let i=0; i<soraChildren.length; i++){
				if(soraChildren[i].style.display == "inline-block"){
// 					alert("찾는거 "+soraChildren[i].querySelector(".hiddenParFolCode").value);
					console.log("찾는거", soraChildren[i].querySelector(".hiddenParFolCode"));
					element.children[0].children[1].childNodes[3].setAttribute("data-folparcode", soraChildren[i].querySelector(".hiddenParFolCode").value);
					break;
				}
			}

			


		    console.log("[element 확인 ] : ", element);
		    
		    for(var i=0; i < box.length; i++){
		    	// box[i].children[1].children[3].defaultValue : 최상위 폴더의 폴더코드 
// 		    	if(box[i].children[1].children[3].defaultValue == $("#hiddenParFolCode").val()){
// 		    		console.log("확인 : ", $("#hiddenParFolCode").val());
// 		    	}
		    }
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			let file = $("#file");
			let fileImg = $("#fileImg")			// 이미지 바뀔 위치
			let image;
			
			file.on("change", (e) => {
				console.log("파일 확인 : ", e.target);			  // <input type="file" id="file" style="display:none">
				console.log("파일 확인 : ", e.target.files[0]);   // File {name: ,size: , type: "application/haansoftxlsx", astModifiedDate: }
				
				let fileSize = e.target.files[0].size*0.001*0.001;
				console.log("파일 사이즈 확인 : ", fileSize);
				$("#NewFolName").val(e.target.files[0].name); // 생성 폴더에 파일 이름 넣기
				$("#uploadBtn").attr("data-folsize" , fileSize); // 생성 폴더에 파일 사이즈 넣기(바이트)
				
				let fileReader = new FileReader();			  // 파일 읽어주는 리더 생성!
				fileReader.readAsDataURL(e.target.files[0]);  // 파일 읽기
				
				// 읽는 시간이 걸려서 onload 사용해야 한다.
				fileReader.onload = function(){				  // 파일을 다 읽고 나면 실행
					let readContent = fileReader.result;	  // 읽은 결과
					
					console.log("파일 읽은 결과 : ", readContent);
					
					image = document.createElement('img');
					image.width = 100;	
					image.src = readContent;
					
					fileImg.innerHTML = '';
					fileImg.append(image);
				} // fileReader.onload
				
			}); // file change end
			
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
		});
	   
		$("#note-full-container").on("click", "#uploadBtn", function(){
			   var folName = $("#NewFolName").val();	// 새로 생성하는 폴더 이름
			   var folparcode = $("#uploadBtn").data('folparcode');
			   var cloCode = $("#depCloCode").val();
			   var fileSize = $("#uploadBtn").attr('data-folsize');
			   
			   console.log("파일 사이즈 확인 : "+ fileSize);
// 			   console.log("folparcode 확인 :: ", folparcode);
// 			   console.log("파라미터 확인 : ", cloCode, "// 폴더 이름 : ", folName, " // 상위클라우드 코드 : ","pppp", $("#uploadBtn").data('folparcode'),"pppp");
				
			   // 상위 폴더인 경우 (folParcode가 null)
				var cloCode = $("#depCloCode").val();
			    
				if(folparcode == ''){
// 					alert("[상위 폴더 업로드]");
					console.log("[상위 폴더 파일 업로드] 클라우드 코드 : ", cloCode, ", 폴더명 : ", folName);
					
					var param = {
						cloCode : cloCode,	// 클라우드 코드
						folName : folName,	// 폴더명
						folUse	: fileSize  // 파일 사이즈
						
					}
					$.ajax({
						type 	 : "post",
						url  	 : "/cloud/createFolder",
						data 	 : JSON.stringify(param),
						dataType : "json",
						async: false,
						contentType: "application/json;charset=utf-8",
						success	 : function(res){}
					});
					location.reload();
				}else{
// 					alert("[하위 폴더 업로드]");
					var param = {
						cloCode    : cloCode,		// 클라우드 코드(CLO06)
						folParcode : folparcode,  	// 상위폴더 코드
						folName    : folName,  		// 폴더명
						folUse	: fileSize  // 파일 사이즈
					}
					
					$.ajax({
						type 	 : "post",
						url  	 : "/cloud/createFolder",
						data 	 : JSON.stringify(param),
						dataType : "json",
						async: false,
						contentType: "application/json;charset=utf-8",
						success	 : function(res){}
					});
					location.reload();
				}
			   
			   // [경로에 파일 업로드] ======================================================
			   console.log("파일 저장 : ", file.files[0]);
			   
			   let formData = new FormData();	// 자동으로  multipart/form-data로 설정
			   
			   formData.append('image', file.files[0]);
			   
			   let xhr = new XMLHttpRequest();
			   xhr.open("post", "/cloud/insertAf", true);
			   xhr.onreadystatechange = ()=>{
				   if(xhr.readyState == 4 && xhr.status == 200){
					   
					   console.log("결과 확인 : ", xhr.responseText);
					   
					   
					   if(xhr.responseText == 1){
// 						   alert('파일업로드 완!!');
						   
						   let profileImg = $("#fileImg");
						   profileImg.src = image.src;
					   }else{
// 						   alert('파일업로드 실패!!');
					   }
				   }
			   }
			   xhr.send(formData);
			   
			   // [경로에 파일 업로드 end] ======================================================
			   
				
				
				var elm = document.querySelector("#tabContent .cardBody");
				f_cardBodyChild(elm, 'head');
		});
	// [파일 업로드 end] =============================================================================================================
		
		
}); //jquery end

	// (depth:1)상위 폴더의 hiddenFolCode == 하위 폴더의 hiddenParFolCode를 찾아서 보여주기(display:inline-block으로 바꾸기)!!
	function f_cardBody(p_this){
		const schCode = p_this.dataset.fol;	// 클릭한 폴더의 FOL_CODE

		const hiddenFolsCode = document.querySelectorAll(".hiddenFolCode");
		const hiddenParFolCode = document.querySelectorAll(".hiddenParFolCode");
		
		console.log(p_this.children[1].innerHTML.trim());	// 클릭한 폴더의 폴더명
		
		$("#menuBar").html("<a href='/cloud/home?empNo=${SessionInfo.empNo }'>Home</a> > <a id='depUrl' href='/cloud/myCloud?empNo="+${SessionInfo.empNo }+"'>개인 자료실</a> > <a href='#' onclick='test(this)'>"+ p_this.children[1].innerHTML.trim() +"</a>");
		console.log("menu 값 : ", $("#menuBar").html());		// menubar에 추가됐는지 확인!
		
		$(".cloudCard1").attr("style", "display:none");
		for(let i=0; i<hiddenParFolCode.length; i++){
			console.log("cloCode 값 확인 : ", hiddenParFolCode[i].value, "// schCode : ", schCode);
			if(hiddenParFolCode[i].value == schCode){
				hiddenParFolCode[i].parentElement.parentElement.style.display="inline-block";
// 				console.log(hiddenParFolCode[i].parentElement);	// 프로젝트1, 프로젝트2, 프로젝트3
			}
		}
	}	
	
	function test(e){
		var elm = document.querySelector("#tabContent .cardBody");
		f_cardBodyChild(elm, 'head');
	}
	
	// (depth:2) 상위 폴더의 hiddenFolCode == 하위 폴더의 hiddenParFolCode를 찾아서 보여주기(display:inline-block으로 바꾸기)!!
	function f_cardBodyChild(p_this, cate){
		//console.log("this : ",  p_this);
		const parCode = p_this.parentElement.querySelector(".hiddenFolCode").value;
		const hiddenFolCode = document.querySelectorAll(".hiddenFolCode");
		const hiddenParFolCodes = document.querySelectorAll(".hiddenParFolCode");
		console.log("parCode : ", parCode)
		
		const reslocat = p_this.children[6].childNodes[1].attributes[0].nodeValue;
		console.log("[reslocat] : ",reslocat);		// /resources/images/img.png
		const sss = reslocat.split("/");
		const res = reslocat.split("/")[sss.length - 1];
		if(res != "folder(2).png"){
			// 다운로드 가능케 구현
			p_this.children[2].click();
			return;
		}
		
		$(".cloudCard").css("display","none");
		
		var suffix = "";
		if(cate == 'head'){
			var splitText = $("#menuBar").html().split(" &gt; ");
			suffix = splitText[0] + " > " + splitText[1] + " > " + splitText[2];
			$("#menuBar").html(suffix);
		}else{
			suffix = " > <a href=#>"+ p_this.children[1].innerHTML.trim() +"</a>";
			$("#menuBar").append(suffix);
		}
		console.log("폴더 이름 : " , p_this.children[1].innerHTML.trim());
		console.log("menu 값1 : ", $("#menuBar").html());
		
		
		for(let i=0; i < hiddenParFolCodes.length; i++){
			const fileName = hiddenParFolCodes[i].parentElement.children[1].innerHTML.trim();
			console.log("chk [i] : ", hiddenParFolCodes[i].parentElement.children[6].children[0]);
			
			if(hiddenParFolCodes[i].value == parCode){
				hiddenParFolCodes[i].parentElement.parentElement.style.display="inline-block";
				console.log("폴더 : ", hiddenParFolCodes[i].parentElement.children[1]);
				console.log("폴더 이름 : ", hiddenParFolCodes[i].parentElement.children[1].innerHTML.trim());
				
				console.log("확장자 : ", fileName.split(".")[1]);
				console.log("이미지 태그 확인: ", hiddenParFolCodes[i].parentElement.children[6].children[0]);
				
				if(fileName.split(".")[1] == "hwp"){	// 파일이 한글 파일인 경우
					hiddenParFolCodes[i].parentElement.children[6].children[0].src = "${pageContext.request.contextPath }/resources/images/hwp.png";
					hiddenParFolCodes[i].parentElement.children[6].children[0].style.width = "90px";
					
					// 여기서 온클릭 이벤트를 막고싶은데 어떻게 하는거죠??? 
// 					event.stopPropagation();
// 					event.returnValue = false;
// 					event.preventDefault();
				}
				if(fileName.split(".")[1] == "xlsx"){	// 파일이 엑셀 파일인 경우
					hiddenParFolCodes[i].parentElement.children[6].children[0].src =  "${pageContext.request.contextPath }/resources/images/xlsx.png";
					hiddenParFolCodes[i].parentElement.children[6].children[0].style.width = "90px";
				}
				if(fileName.split(".")[1] == "docx"){	// 파일이 워드 파일인 경우
					hiddenParFolCodes[i].parentElement.children[6].children[0].src = "${pageContext.request.contextPath }/resources/images/docx.png";
					hiddenParFolCodes[i].parentElement.children[6].children[0].style.width = "90px";
				}
				if(fileName.split(".")[1] == "pdf"){	// 파일이 pdf 파일인 경우
					hiddenParFolCodes[i].parentElement.children[6].children[0].src = "${pageContext.request.contextPath }/resources/images/pdf.png";
					hiddenParFolCodes[i].parentElement.children[6].children[0].style.width = "90px";
				}
				if(fileName.split(".")[1] == "pptx"){	// 파일이 ppt 파일인 경우
					hiddenParFolCodes[i].parentElement.children[6].children[0].src = "${pageContext.request.contextPath }/resources/images/ppt.png";
					hiddenParFolCodes[i].parentElement.children[6].children[0].style.width = "90px";
				}
				
				if(fileName.split(".")[1] == "txt"){	// 파일이 txt 파일인 경우
					hiddenParFolCodes[i].parentElement.children[6].children[0].src = "${pageContext.request.contextPath }/resources/images/txt.png";
					hiddenParFolCodes[i].parentElement.children[6].children[0].style.width = "90px";
				}
				
				if(fileName.split(".")[1] == "jpg" || fileName.split(".")[1] == "jpeg" || fileName.split(".")[1] == "png"){	// 파일이 이미지 파일인 경우
					hiddenParFolCodes[i].parentElement.children[6].children[0].src = "${pageContext.request.contextPath }/resources/images/img.png";
					hiddenParFolCodes[i].parentElement.children[6].children[0].style.width = "90px";
				}
				
				
			}				
		}


		
	}
</script>