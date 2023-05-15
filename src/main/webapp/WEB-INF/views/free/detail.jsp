<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
#freeUpdate {
	border-color: #21d3c1;
	background-color: white;
	color: #21d3c1;
}

#freeDelete {
	border-color: orange;
	background-color: white;
	color: orange;
}
#submitBtn{
	border-color: orange;
	background-color: white;
	color: orange;
	width:90px;
	padding:5px;
	border-radius: 50rem!important;
	margin: 10px 0 0 820px;
}
#addCommContent{
    padding: 0.375rem 0.75rem;
    font-size: .875rem;
    font-weight: 400;
    line-height: 1.5;
    color: #3e5569;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #e9ecef;
    appearance: none;
    border-radius: 4px;
}
</style>
<!-- -------------------------------------------------------------- -->
<!-- Bread crumb and right sidebar toggle -->
<!-- -------------------------------------------------------------- -->
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-5 align-self-center">
			<h4 class="page-title">자유게시판</h4>
			<div class="d-flex align-items-center" style="display: none !important;">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">홈</a></li>
						<li class="breadcrumb-item active" aria-current="page">자유게시판</li>
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
<!-- 	<div class="row"> -->
		<div class="col-lg-8">
			<!-- --------------------- start Ticket Replies ---------------- -->
			<div class="card" style="width: 975px;">
				<div class="card-body">
					<input type="hidden" id="freeCode" value="${freeVO.freeCode }" />
					<h4 class="card-title">${freeVO.freeTitle }</h4>
					<img src="${pageContext.request.contextPath }/resources/images/${afVO.afSave}"
						alt="users" class="rounded-circle" style="width:40px; height: 40px;"/> ${empVO.empName} ${ccVO.ccName}
					　<fmt:formatDate value="${freeVO.freeDate }" pattern="yyyy/MM/dd"></fmt:formatDate>
					　조회수 ${freeVO.freeHit }
					
					
					<button class="listBtn btn ext-secondary font-medium" style="float:right;"> 목록</button>
					<hr>

					<div style="min-height: 200px;">${freeVO.freeContent }</div>
					<br> <br>

					<h4>
						<i data-feather="paperclip" class="feather-sm me-2 mb-2"></i> 첨부파일
						<span></span>
					</h4>
					<div class="row" style="margin-bottom: 20px; text-align: center;">

						<c:set value="${attFile.afExt }" var="ext" />
						<c:choose>
							<c:when test="${empty attFile }">
								등록된 첨부파일이 없습니다.
							</c:when>
							<c:when test="${ext eq 'JPG' }">
								<div class="col-md-2">
									<a id="fileDown" href="javascript:void(0)"
										style="color: black;"> <img
										src="${pageContext.request.contextPath }/resources/images/${attFile.afSave}"
										style="width: 100px; height: 100px;"> 
										<br><font style="font-size: 1.1em;">${attFile.afName }</font>
									</a>
								</div>
							</c:when>
							<c:when test="${ext eq 'PNG' }">
								<div class="col-md-2">
									<a id="fileDown" href="javascript:void(0)"
										style="color: black;"> <img
										src="${pageContext.request.contextPath }/resources/images/${attFile.afSave}"
										style="width: 100px; height: 100px;"> 
										<br><font style="font-size: 1.1em;">${attFile.afName }</font>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-md-2">
									<a id="fileDown" href="javascript:void(0)"
										style="color: black;"> <i class="fas fa-file-alt"
										style="color: gray; font-size: 5em; padding-top: 13px; padding-bottom: 17px;"></i>
										<br> <font style="font-size: 1.1em;">${attFile.afName }</font>
									</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>


					<img src="${pageContext.request.contextPath }/resources/images/good.png" width="23" style="cursor: pointer;
						position: relative; top: -2px;" id="goodBtnFree"> 
					<span id="goodCount" style="cursor: pointer;">좋아요</span> 
					<c:if test="${not empty goodList }">
						<font id="goodDisp">${goodList.size() }</font>
					</c:if>

					<i class="bi-chat-dots" style="font-size: 1.4em; margin-left: 10px; margin-right: 5px;"></i>
					<c:set value="${CommList.size() }" var="commNum"></c:set>
					댓글 <font id="commNum">${commNum }</font>
					
					<div style="display:inline-block; float:right;">
						<button type="button" id="freeUpdate" class="freeUpdate btn btn-success rounded-pill px-4" data-no="${freeVO.freeCode }">
							<div class="d-flex align-items-center">
								<i data-feather="save" class="feather-sm me-1 fill-icon"></i>  수정
							</div>
						</button>
						<button type="button" id="freeDelete" class="btn btn-success rounded-pill px-4">
							<form method="post" action="/free/delete" id="delForm">
								<input type="hidden" name="freeCode" value="${freeVO.freeCode }" />
								<div class="d-flex align-items-center">
									<i data-feather="trash-2" class="feather-sm me-1 fill-icon"></i> 삭제
								</div>
							</form>
						</button>
					</div>

					<hr>
					<!-- ==================================[ 댓글 목록 출력 ]===============================================================-->
					<div id="listDisp" class="list-unstyled" style="margin-top: 0px;">
						<div class="card-body" id="commTr" style="overflow:none;">
							<h4>댓글</h4>
							<c:choose>
								<c:when test="${empty CommList }">
									<div>등록된 댓글이 존재하지 않습니다.</div>
								</c:when>
								<c:otherwise>
									<div class="comment-widgets">
										<!-- Comment Row -->
										<c:forEach items="${CommList }" var="comment" varStatus="i">
											<div class="d-flex comment-row" style="border: 1px solid #eee;">
											<!-- ==============================댓글등록 사원 프로필 이미지 ====================-->
												<div class="p-2">
													<c:set value="${commProfileList.get(i.index).afSave }" var="commProfile"></c:set>
													<c:if test="${empty commProfile }">
														<c:set value="profile.png" var="commProfile"></c:set>
													</c:if>
													<img src="${pageContext.request.contextPath }/resources/images/${commProfile }"
														alt="users" width="50" class="rounded-circle" style="width:40px; height: 40px;"/>
												</div>
											<!-- ==============================댓글등록 사원 프로필 이미지 ====================-->
												<div style="width:640px; margin-left: 15px;">
													<input type="hidden" class="font-medium" value="${comment.empNo }"/>
													<div class="text-muted ms-auto mt-2 mt-md-0" style="">
														<font color="black" style="font-size: 1.1em;">
															${comment.empVO.empName } ${comment.empVO.empPos }
														</font>
														${comment.commDate }
													</div>
													<div class="mb-3 d-block" id="commContent" style="font-size: 1.0em; width: 500px;">${comment.commContent }</div>
												</div>
												<c:if test="${comment.empNo == SessionInfo.empNo}">
													<div class="button-group" style="display:inline-block; float:right; position: relative; top: 23px; left: 36px;">
														<button type="button" id="update_btn" style="float: right;" data-no="${comment.commCode }"
															class="update_btn btn waves-effect waves-light btn-outline-info">수정</button>
														<button type="button" id="delete_btn" style="float: right;" data-no="${comment.commCode }"
															class="delete_btn btn waves-effect waves-light btn-outline-danger">삭제</button>
													</div>
												</c:if>
											</div>
										</c:forEach>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						
						<!-- ============================================= [ 댓글 입력 ] =============================================-->
						<div style="margin-bottom:20px;">
							<textarea name="commContent" id="addCommContent" class="" rows="3" placeholder="댓글을 남겨보세요."
								style="width: 900px; margin-left: 33px;"></textarea>
							<button id="submitBtn" type="button" class="btn">
								<i data-feather="edit" class="feather-sm me-1 fill-icon"></i>
								등록
							</button>
						</div>
						
						<!-- ============================================[ 댓글 수정창 ]========================================================-->
						<div class="comment-hidden" style="display: none;">
							<form method="post" class="comment-contents">
								<input type="hidden" id="commCodeMod" />
								<textarea name="upcommContent" id="upcommContent" placeholder="댓글을 수정하세요." class="form-control" rows="5" style=""></textarea>
								<br>
								<div class="text-end">
									<button type="button" id="updateBtn" class="btn btn-light-info text-info font-medium">수정</button>
									<button type="button" class="listBtn btn btn-light-secondary text-secondary font-medium">목록</button>
								</div>
							</form>
						</div>
						<!-- ============================================[ 댓글 수정창 ]========================================================-->
						
						
						
						
					</div>
				</div>
					
					<!-- ajax 처리 -->
					<div id="commAjax" style="display: none;">
						<div class="comment-widgets">
							<!-- Comment Row -->
							<c:forEach items="${CommList }" var="comment">
								<div class="d-flex comment-row" style="border: 1px solid #eee;">
								<!-- ==============================댓글등록 사원 프로필 이미지 ====================-->
									<div class="p-2">
										<c:set value="${commProfileList.get(i.index).afSave }" var="commProfile"></c:set>
										<c:if test="${empty commProfile }">
											<c:set value="profile.png" var="commProfile"></c:set>
										</c:if>
										<img src="${pageContext.request.contextPath }/resources/images/${commProfile }"
											alt="users" width="50" class="rounded-circle" style="width:40px; height: 40px;"/>
									</div>
								<!-- ==============================댓글등록 사원 프로필 이미지 ====================-->
									<div style="width:640px; margin-left: 15px;">
										<input type="hidden" class="font-medium" value="${comment.empNo }"/>
										<div class="text-muted ms-auto mt-2 mt-md-0" style="">
											<font color="black" style="font-size: 1.1em;">
												${comment.empVO.empName } ${comment.empVO.empPos }
											</font>
											${comment.commDate }
										</div>
										<div class="mb-3 d-block" id="commContent" style="font-size: 1.0em; width: 500px;">${comment.commContent }</div>
									</div>
									<c:if test="${comment.empNo == SessionInfo.empNo}">
										<div class="button-group" style="display:inline-block; float:right; position: relative; top: 23px; left: 36px;">
											<button type="button" id="update_btn" style="float: right;" data-no="${comment.commCode }"
												class="update_btn btn waves-effect waves-light btn-outline-info">수정</button>
											<button type="button" id="delete_btn" style="float: right;" data-no="${comment.commCode }"
												class="delete_btn btn waves-effect waves-light btn-outline-danger">삭제</button>
										</div>
									</c:if>
								</div>
							</c:forEach>
						</div>					
					</div>
					
					
					<!-- ===================================================[ 좋아요 목록 ]===============================================================-->
		
					<div id="goodList" class="list-unstyled" style="display: none;">
						<div class="card">
							<div class="row">
								<h4 style="margin-left: 38px;">좋아요</h4>
								
								<c:choose>
									<c:when test="${empty goodList }">
											<div
												class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
												<div class="card w-100">
													<div class="p-3">
														<div class="row" style="margin-left: 8px;">
															　받은 좋아요가 없습니다.
														</div>
													</div>
												</div>
											</div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${goodList }" var="good" varStatus="i">
											<div
												class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
												<div class="card w-100">
													<div class="p-3">
														<div class="row">
															<div
																class="col-4 col-xl-2 col-md-3 d-flex align-items-center">
																<c:set value="${afList.get(i.index).afSave}" var="goodPro"></c:set>
																<c:if test="${empty afList.get(i.index) }">
																	<c:set value="profile.png" var="goodPro"></c:set>
																</c:if>
																<img style="cursor: pointer; position: relative; width: 40px; height: 40px; left: 20px;" 
																	src="${pageContext.request.contextPath }/resources/images/${goodPro }"
																	class="rounded-circle"/>
															</div>
															<div
																class="col-8 col-xl-10 col-md-9 d-flex align-items-center">
																<div>
																	<a href="javascript:void(0)"
																		class="card-title fs-4 link lh-sm">
																		${empList.get(i.index).empName }
																		${posList.get(i.index).ccName }
																	</a>
																	<h6 class="card-subtitle mt-2 mb-0 fw-normal">${timeList.get(i.index).ccName }</h6>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
		
							</div>
						</div>
		
					</div>
					
					<!-- 좋아요 비동기 div -->
					<div id="goodAjax" style="display: none;">
						<div
							class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
							<div class="card w-100">
								<div class="p-3">
									<div class="row">
										<div
											class="col-4 col-xl-2 col-md-3 d-flex align-items-center">
											<img style="cursor: pointer; position: relative; width: 40px; height: 40px; left: 20px;" 
												src="${pageContext.request.contextPath }/resources/images/"
												class="rounded-circle"/>
										</div>
										<div
											class="col-8 col-xl-10 col-md-9 d-flex align-items-center">
											<div>
												<a href="javascript:void(0)"
													class="card-title fs-4 link lh-sm">
													</a>
												<h6 class="card-subtitle mt-2 mb-0 fw-normal"></h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>				
					</div>
					<!-- ===================================================[ 좋아요 목록 ]===============================================================-->					
					
					
					<!-- ==================================[ 댓글 목록 출력 ]===============================================================-->
				</div>					

			</div>

		</div>


		<!-- -------------------------------------------------------------- -->
		<!-- End Container fluid  -->
		<!-- -------------------------------------------------------------- -->

<!-- sweet alert -->		
<script src="${pageContext.request.contextPath}/resources/assets/libs/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/pages/forms/sweetalert2/sweet-alert.init.js"></script>

<script type="text/javascript">

	if(document.querySelector('#fileDown') != null){
		document.querySelector('#fileDown').addEventListener('click',(e)=>{
			location.href = '/free/download?afTcode=${attFile.afTcode}';
		});
	}






   $(".action-icons").on("mouseup",function(){
      $(this).attr("style","visibility: block;");
      
   });

   $('#freeUpdate').on('click',function(){
      location.href = '/free/update?freeCode=${freeVO.freeCode}';
   });
   $('#freeDelete').on('click',function(){
      if (confirm("정말로 삭제하시겠습니까?")) {
         delForm.submit();
      } else {
         delForm.reset();
      }
   });
   
   
   $('#commTr').on("click", "#update_btn",function(e){
      $('.comment-hidden').attr('style','display:block');
      console.log('this',this,this.dataset.no);
      $("#commCodeMod").val(this.dataset.no);
   });
   
   $('#commTr').on("click", "#delete_btn",function(e){
      console.log('this',this,this.dataset.no);
      $("#commContent").val(this.dataset.no);
   });
   
   
var data = {};
   
   // good insert
   function insertFree(data){
      $.ajax({
         url:'/good/insertFree',
         type:"post",
         async: false,
         contentType:"application/json;charset=utf-8",
         data : JSON.stringify(data),
         success: function(){
            console.log(123);
         }
      });
   }
   
   // good update 좋아요 취소하는 경우
   function updateGood(data){
      $.ajax({
         url:'/good/updateGood',
         type:"post",
         async: false,
         contentType:"application/json;charset=utf-8",
         data : JSON.stringify(data),
         success: function(){
            console.log('update good');
         }
      });
   }
   
   
   
   $(function() {
      $(".listBtn").on('click', function() {

         event.preventDefault();
         location.href = "/free/home";
      });

      $(".topBtn").on('click', function() {
         event.preventDefault();

         $('html').scrollTop(0);
      });

      // goodFlag 좋아요 처리
      let goodFlag = ${goodFlag};
      console.log('goodFlag ::',goodFlag);
      if(goodFlag){
	  	  document.querySelector('#goodBtnFree').setAttribute('src', '${pageContext.request.contextPath}/resources/images/good2.png');		    	  
      }
      
      
      console.log('g btn ::',$("#goodBtnFree"));
		$("#goodBtnFree").on('click',function() {
			console.log('btn.. ::');
			// /resources/images/good.png
			if ($(this).attr('src').includes('good2')) {
			   // 좋아요 취소 처리
			   
			   $(this).attr('src','${pageContext.request.contextPath}/resources/images/good.png');
			   //       $("#goodCount")
			   
			   data = {
			      "goodType" : document.querySelector('#freeCode').value,
			      empNo : ${SessionInfo.empNo}
			   };
			   
			   updateGood(data);			   
			   
			   // 좋아요 목록 새로고침 
			   makeGoodList(data);
			   

			} else {
			   // 좋아요 등록 처리
			   if('${empVO.empNo}' == '${SessionInfo.empNo}'){
			       Swal.fire('', '자신의 게시물에는 좋아요을 누를수 없습니다.','error');   
			       return;
			   }
			   
			   $(this).attr('src','${pageContext.request.contextPath}/resources/images/good2.png');
			   
			   data = {
			      "goodType" : document.querySelector('#freeCode').value,
			      empNo : ${SessionInfo.empNo}
			   };
			   
			   insertFree(data);
			   
			   // 좋아요 목록 새로고침 
			   makeGoodList(data);
			}
		
		});		

      let commListHtml;
      let goodListHtml;

      // 좋아요 목록 열려있는지 여부.
      let goodListFlag = false;

      $("#goodCount").on('click', function() {
         if (!goodListFlag) { // 좋아요 목록 열기

            goodListFlag = true;
//             console.log('html',$("#listDisp").html()); 

//             commListHtml = $("#listDisp").html();
//             $("#listDisp").html('');

            $("#listDisp").css('display', 'none');
            $("#goodList").css('display', 'block');
         } else { // 좋아요 목록 닫기

            goodListFlag = false;
            $("#goodList").css('display', 'none');
            $("#listDisp").css('display', 'block');
         }

      });

      /* //댓글 목록에서 수정버튼 클릭했을때 이벤트
      $("#commTr").on("click","update_btn",function(){
         var commCode = $(this).parents("td").find("commCode").text();
         var commContent = $(this).parents("td").find("commContent").text();
         console.log('cc',commCode,$(this).parents("td").find("commCode").val());
         
         $("#commCode").val(commCode);
         $("#commContent").val(commContent);
      }) */
      
      
      var submitBtn = $("#submitBtn");
      var updateBtn = $("#updateBtn");
      var delete_btn = $("#delete_btn");
      
      
      $('#commTr').on("click", "#delete_btn",function(){
         console.log('no',this.dataset.no);
         
         var data = {
//                commCode : $("#commContent").val()
               commCode : this.dataset.no
         };
         
         $.ajax({
            url : '/comment/deleteComm',
            type : "post",
            data : JSON.stringify(data),
            contentType:"application/json;charset=utf-8",
            dataType : "text",
            success : function(data) {
               if(data ==="success"){
               getComList();
               }
               getComList();
               
            }
         })
      })
      
      
      
      
      $('#updateBtn').on("click",function(){
         var data = {
            commType : $("#freeCode").val(),
            commCode : $("#commCodeMod").val(),
            commContent : $("#upcommContent").val(),
            empNo : ${SessionInfo.empNo}
      }
         $.ajax({
            url:'/comment/updateComm',
            type: 'post',
            data : JSON.stringify(data),
            contentType:"application/json;charset=utf-8",
            dataType : "text",
            success : function(data) {
               console.log("체크",data);
               
               if(data ==="success"){
               getComList();
               }
               getComList();
            }
         })
      })
      
      
      

      submitBtn.on("click", function() {
         var data = {
            commType : $("#freeCode").val(),
            commContent : $("#addCommContent").val(),
            empNo : ${SessionInfo.empNo}
         };

         $.ajax({
            url : '/comment/insertComm',
            type : "post",
            data : JSON.stringify(data),
            contentType:"application/json;charset=utf-8",
            dataType : "text",
            success : function(data) {
               if(data ==="success"){
               		getComList();
               }
               
          		getComList();
          		
          		// 입력창 비우기
          		$("#addCommContent").val('');
            }
         })
      })
      
      
      
		function getComList() {
			$.ajax({
				url : "/comment/list/${freeVO.freeCode}",
				type : "get",
				success : function(res) {
					console.log('res ::',res);
					console.log('res ::',res.length);
					// 그냥 vo 받으면 js 객체가 되나?
							
					// 댓글 수 수정
					document.querySelector('#commNum').innerHTML = res.length;
					
					// 댓글 등록한 이후니까 size는 1이상
					var html = "<h4>댓글</h4>";
						html += '	<div class="comment-widgets">';
					
					res.map(function(value, idx) {
						html += '<div class="d-flex comment-row" style="border: 1px solid #eee;">';
						html += '	<div class="p-2">';
						
						let imgStr = '';
						if(value.afVO != null){
							imgStr = value.afVO.afSave;
						}else{
							imgStr = 'profile.png';
						}
						console.log('afVO ::',value.afVO);
						console.log('imgStr ::',imgStr);
						
						html += '		<img src="${pageContext.request.contextPath }/resources/images/'+imgStr+'"';
						html += '			alt="users" width="50" class="rounded-circle" style="width:40px; height: 40px;"/>';
						html += '	</div>';
						html += '	<div style="width:640px; margin-left: 15px;">';
						html += '		<input type="hidden" class="font-medium" value="'+value.empNo+'"/>';
						html += '		<div class="text-muted ms-auto mt-2 mt-md-0" style="">';
						html += '			<font color="black" style="font-size: 1.1em;">';
						html += '				'+value.empVO.empName+' '+value.empVO.empPos;
						html += '			</font>';
						html += '			'+value.commDate;
						html += '		</div>';
						html += '		<div class="mb-3 d-block" id="commContent" style="font-size: 1.0em; width: 500px;">'+value.commContent+'</div>';
						html += '	</div>';
						
						if(value.empNo == '${SessionInfo.empNo}'){
							html += '		<div class="button-group" style="display:inline-block; float:right; position: relative; top: 23px; left: 36px;">';
							html += '			<button type="button" id="update_btn" style="float: right;" data-no="'+value.commCode+'"';
							html += '				class="update_btn btn waves-effect waves-light btn-outline-info">수정</button>';
							html += '			<button type="button" id="delete_btn" style="float: right;" data-no="'+value.commCode+'"';
							html += '				class="delete_btn btn waves-effect waves-light btn-outline-danger">삭제</button>';
							html += '		</div>';
						}
						html += '</div>';						
						
						
					});
					
					$("#commTr").html(html);
				}
			});
		   
		}
   
   
   
   });
   // $function end
   
	function makeGoodList(p_data){
		console.log('list chk ::', p_data);
		  
		$.ajax({
			url:'/free/goodList',
			type:"post",
			contentType:"application/json;charset=utf-8",
			data : JSON.stringify(data),
			async: false,
			success: function(e){
			   console.log('list',e);
			   let newGoodList = JSON.parse(e[0]);
			   console.log('new',newGoodList);
			   console.log('new',newGoodList.empList);
			   
			   
			   let goodList = document.querySelector('#goodList');
			   goodList.children[0].children[0].innerHTML = '';
			   
			   for(let i=0; i<JSON.parse(newGoodList.afList).length; i++){
				   let goodAjax = document.querySelector('#goodAjax').cloneNode(true);
				   
				   // display 변경
// 				   goodAjax.style.display = 'block';
				   
				   let ajaxImg = goodAjax.children[0].children[0].children[0].children[0].children[0].children[0];
				   
				   // img null 따로 처리
				   console.log('JSON.parse(newGoodList.afList)[i] ::',JSON.parse(newGoodList.afList)[i]);
				   if(JSON.parse(newGoodList.afList)[i] == null){
					   ajaxImg.src = ajaxImg.src+'profile.png';
				   }else{
					   ajaxImg.src = ajaxImg.src+JSON.parse(newGoodList.afList)[i].afSave;
				   }
				   console.log('img src ::', goodAjax.children[0].children[0].children[0].children[0].children[0].children[0].src );
				   
				   let ajaxA = goodAjax.children[0].children[0].children[0].children[0].children[1].children[0].children[0];
				   ajaxA.innerHTML = JSON.parse(newGoodList.empList)[i].empName+" "+JSON.parse(newGoodList.empList)[i].empPos;
				   console.log('ajax a ::',ajaxA.innerHTML);
				   
				   let ajaxH = goodAjax.children[0].children[0].children[0].children[0].children[1].children[0].children[1];
				   ajaxH.innerHTML = JSON.parse(newGoodList.timeList)[i].ccName;
				   console.log('ajax h ::',ajaxH);
				   console.log('ajax h ::',JSON.parse(newGoodList.timeList)[i].ccName);
				   console.log('ajax h ::',ajaxH.innerHTML);	
				   
				   console.log('g a ::',goodAjax);
				   
				   // div 안에 넣어야 함.
				   goodList.children[0].children[0].appendChild(goodAjax.children[0]);
			   }
			   
			   console.log('g l ::',goodList);
			   
			   // 좋아요 수 변경
			   document.querySelector('#goodDisp').innerHTML = JSON.parse(newGoodList.afList).length;
			   console.log('JSON.parse(newGoodList.afList).length ::',JSON.parse(newGoodList.afList).length);
			}
		});	   
	   
	}
   
      
      
      
      


</script>
		<!-- 
   spring scheduler 
   
   task 설정 추가. -> 2scheduled로 사용(application 영역에서 실행)
   
   
   spring 정리법
   
   라이브러리(pom.xml) - 웹 설정(web.xml) - 스프링 설정 - 사용법
      
-->
