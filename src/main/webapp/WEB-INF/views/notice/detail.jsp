<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
	<div class="row">
		<div class="col-lg-8">
			<!-- ---------------------
                    start Ticket Replies
                ---------------- -->
			<div class="card" style="width: 975px;">
				<div class="card-body">
					<input type="hidden" id="notCode" value="${noticeVO.notCode }" />
					<h4 class="card-title">${noticeVO.notTitle }</h4>
					<img
						src="${pageContext.request.contextPath }/resources/images/${afVO.afSave}"
						alt="users" class="rounded-circle" width="40" /> ${empVO.empName}
					${ccVO.ccName}
					<fmt:formatDate value="${noticeVO.notDate }" pattern="yyyy/MM/dd"></fmt:formatDate>
					조회수 ${noticeVO.notHit }
					<hr>
					<div style="min-height: 200px;">${noticeVO.notContent }</div>
					<br> <br>
					<!-- 이 버튼이 이쁘긴 한데 css 고치기가 어려움. -->
					<!--           <button type="button" class="goodBtn btn btn-light-danger btn-circle"> -->
					<!--             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart feather-sm fill-white text-danger"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg> -->
					<!--           </button>      -->

					<!-- <a href="https://kr.freepik.com/free-vector/set-of-line-filled-pixelated-hearts_37166763.htm#query=heart&position=0&from_view=keyword&track=sph">작가 juicy_fish</a> 출처 Freepik -->
					
					
					<h4>
					  <i data-feather="paperclip" class="feather-sm me-2 mb-2"></i>
					  첨부파일 <span></span>
					</h4>
					<div class="row" style="margin-bottom: 20px; text-align: center;">
						
						<c:set value="${attFile.afExt }" var="ext"/>
						<c:choose>
							<c:when test="${ext eq 'JPG' }">
								<div class="col-md-2">
									<a id="fileDown" href="javascript:void(0)" style="color: black;">
										<img src="${pageContext.request.contextPath }/resources/images/${attFile.afSave}"
											style="width: 100px; height: 100px;">
										<br>
										<font style="font-size: 1.1em;">${attFile.afName }</font>
									</a>
								</div>
							</c:when>
							<c:when test="${ext eq 'PNG' }">
								<div class="col-md-2">
									<a id="fileDown" href="javascript:void(0)" style="color: black;">
										<img src="${pageContext.request.contextPath }/resources/images/${attFile.afSave}"
											style="width: 100px; height: 100px;">
										<br>
										<font style="font-size: 1.1em;">${attFile.afName }</font>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-md-2">
									<a id="fileDown" href="javascript:void(0)" style="color: black;">
										<i class="fas fa-file-alt" style="color: gray; font-size: 5em; padding-top: 13px; padding-bottom: 17px;"></i>
										<br>
										<font style="font-size: 1.1em;">${attFile.afName }</font>
									</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					
					
					
					
					
					
					<img
						src="${pageContext.request.contextPath }/resources/images/good.png"
						width="23" style="cursor: pointer;" id="goodBtn">
					<span>좋아요</span>

					<i class="bi-chat-dots"
						style="font-size: 1.4em; margin-left: 10px; margin-right: 3px;"></i>
					댓글 0
					<hr>
					<button type="button" id="notUpdate"
						class="freeUpdate btn btn-success rounded-pill px-4"
						data-no="${noticeVO.notCode }">
						<div class="d-flex align-items-center">
							<i data-feather="save" class="feather-sm me-1 fill-icon"></i> 수정
						</div>
					</button>
					<button type="button" id="notDelete"
						class="btn btn-success rounded-pill px-4">
						<form method="post" action="/notice/delete" id="delForm">
							<input type="hidden" name="notCode" value="${noticeVO.notCode }" />
							<div class="d-flex align-items-center">
								<i data-feather="save" class="feather-sm me-1 fill-icon"></i> 삭제
							</div>
						</form>
					</button>

					<!-- 댓글 목록 출력 -->
					<div id="listDisp" class="list-unstyled" style="margin-top: 0px;">
						<div class="card">
							<div class="card-body" id="commTr">
								<h4 class="card-title"></h4>
								<c:choose>
									<c:when test="${empty CommList }">
										<div>조회하신 댓글이 존재하지 않습니다.</div>
									</c:when>
									<c:otherwise>
										<div class="comment-widgets scrollable" style="height: 560px">
											<!-- Comment Row -->
											<c:forEach items="${CommList }" var="comment">
												<div class="d-flex flex-row comment-row mt-0">
													<div class="p-2">
														<img
															src="${pageContext.request.contextPath }/resources/images/${afVO.afSave}"
															alt="users" width="50" class="rounded-circle" />
													</div>
													<div>
														<div type="hidden" class="font-medium"
															value="${comment.empNo }"></div>
														<div class="mb-3 d-block" id="commContent"
															style="font-size: 1.0em;" value="">${comment.commContent }</div>
														<div class="comment-footer d-md-flex align-items-center">
															<span> <c:if
																	test="${comment.empNo == SessionInfo.empNo}">
																	<div class="button-group" style="float: right;">
																		<button type="button"
																			class="update_btn btn-light-primary text-primary font-medium"
																			data-no="${comment.commCode }">수정</button>
																		<button type="button"
																			class="delete_btn btn-light-success text-success font-medium"
																			data-no="${comment.commCode }">삭제</button>
																	</div>
																</c:if>
																<div class="text-muted ms-auto mt-2 mt-md-0"
																	style="float: right;">${comment.commDate }</div>
															</span>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- Comment Row -->
					</div>
					<!-- 댓글 수정창 -->
					<div class="comment-hidden" style="display: none;">
						<form method="post" class="comment-contents">
							<input type="hidden" id="commCodeMod" />
							<textarea name="upcommContent" id="upcommContent"
								placeholder="댓글을 수정하세요." class="form-control" rows="5"
								style="height: 132px;"></textarea>
							<br>
							<div class="text-end">
								<button type="button" id="updateBtn"
									class="btn btn-light-info text-info font-medium">수정</button>
								<button type="button"
									class="listBtn btn btn-light-secondary text-secondary font-medium">
									목록</button>
							</div>
						</form>
					</div>
				</div>

				<!-- 댓글 입력 -->
				<form method="post">
					<textarea name="commContent" id="addCommContent"
						placeholder="댓글을 남겨보세요." class="form-control" rows="5"
						style="height: 132px; border: 1px solid #646363; width: 95%; margin-left:28px;"></textarea>
					<br>
					<div class="text-end">
						<button id="submitBtn" type="button"
							class="btn btn-light-info text-info font-medium">등록</button>
						<button
							class="listBtn btn btn-light-secondary text-secondary font-medium">
							목록</button>
						<button
							class="topBtn btn btn-light-secondary text-secondary font-medium">
							▲ TOP</button>
					</div>
				</form>

			</div>

			<!-- 좋아요 목록 -->

			<ul id="goodList" class="list-unstyled" style="display: none;">
				<div class="card">
					<div class="row">

						<c:forEach items="${goodList }" var="good" varStatus="i">
							<div
								class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
								<div class="card w-100">
									<div class="p-3">
										<div class="row">
											<div
												class="col-4 col-xl-2 col-md-3 d-flex align-items-center">
												<img style="cursor: pointer;"
													src="${pageContext.request.contextPath }/resources/images/${afList.get(i.index).afSave}"
													class="rounded img-fluid" />
											</div>
											<div
												class="col-8 col-xl-10 col-md-9 d-flex align-items-center">
												<div>
													<a href="javascript:void(0)"
														class="card-title fs-4 link lh-sm">${empList.get(i.index).empName }
														${posList.get(i.index).ccName }</a>
													<h6 class="card-subtitle mt-2 mb-0 fw-normal">${timeList.get(i.index).ccName }</h6>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

						<div class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
							<div class="card w-100">
								<div class="p-3">
									<div class="row">
										<div class="col-4 col-xl-2 col-md-3 d-flex align-items-center">
											<img
												src="${pageContext.request.contextPath }/resources/assets/images/product/prd1.jpg"
												class="rounded img-fluid" />
										</div>
										<div
											class="col-8 col-xl-10 col-md-9 d-flex align-items-center">
											<div>
												<a href="javascript:void(0)"
													class="card-title fs-4 link lh-sm">50% sell on wrist
													watch</a>
												<h6 class="card-subtitle mt-2 mb-0 fw-normal">By Daniel
													Jubile</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
							<div class="card w-100">
								<div class="p-3">
									<div class="row">
										<div class="col-4 col-xl-2 col-md-3 d-flex align-items-center">
											<img
												src="${pageContext.request.contextPath }/resources/assets/images/product/prd2.jpg"
												class="rounded img-fluid" />
										</div>
										<div
											class="col-8 col-xl-10 col-md-9 d-flex align-items-center">
											<div>
												<a href="javascript:void(0)"
													class="card-title fs-4 link lh-sm">Small Cabin Luggage
													(57 cm) </a>
												<h6 class="card-subtitle mt-2 mb-0 fw-normal">By John
													Smith</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
							<!-- ---------------------
                                    start By Nancy Deo
                                ---------------- -->
							<div class="card w-100">
								<div class="p-3">
									<div class="row">
										<div class="col-4 col-xl-2 col-md-3 d-flex align-items-center">
											<img
												src="${pageContext.request.contextPath }/resources/assets/images/product/prd3.jpg"
												class="rounded img-fluid" />
										</div>
										<div
											class="col-8 col-xl-10 col-md-9 d-flex align-items-center">
											<div>
												<a href="javascript:void(0)"
													class="card-title fs-4 link lh-sm">Women Black Heels
													Sandal</a>
												<h6 class="card-subtitle mt-2 mb-0 fw-normal">By Nancy
													Deo</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- ---------------------
                                    end By Nancy Deo
                                ---------------- -->
						</div>
						<div class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
							<!-- ---------------------
                                    start Yellow , On the Ear
                                ---------------- -->
							<div class="card w-100">
								<div class="p-3">
									<div class="row">
										<div class="col-4 col-xl-2 col-md-3 d-flex align-items-center">
											<img
												src="${pageContext.request.contextPath }/resources/assets/images/product/prd4.jpg"
												class="rounded img-fluid" />
										</div>
										<div
											class="col-8 col-xl-10 col-md-9 d-flex align-items-center">
											<div>
												<a href="javascript:void(0)"
													class="card-title fs-4 link lh-sm">Boat BassHeads 900
													Wireless Headset </a>
												<h6 class="card-subtitle mt-2 mb-0 fw-normal">Yellow ,
													On the Ear</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- ---------------------
                                    end Yellow , On the Ear
                                ---------------- -->
						</div>
						<div class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
							<!-- ---------------------
                                    start By Nancy Deo
                                ---------------- -->
							<div class="card w-100">
								<div class="p-3">
									<div class="row">
										<div class="col-4 col-xl-2 col-md-3 d-flex align-items-center">
											<img
												src="${pageContext.request.contextPath }/resources/assets/images/product/prd5.jpg"
												class="rounded img-fluid" />
										</div>
										<div
											class="col-8 col-xl-10 col-md-9 d-flex align-items-center">
											<div>
												<a href="javascript:void(0)"
													class="card-title fs-4 link lh-sm">Beauty Blender
													original makeup blender</a>
												<h6 class="card-subtitle mt-2 mb-0 fw-normal">By Nancy
													Deo</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- ---------------------
                                    end By Nancy Deo
                                ---------------- -->
						</div>
						<div class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
							<!-- ---------------------
                                    start Absolute Comfort
                                ---------------- -->
							<div class="card w-100">
								<div class="p-3">
									<div class="row">
										<div class="col-4 col-xl-2 col-md-3 d-flex align-items-center">
											<img
												src="${pageContext.request.contextPath }/resources/assets/images/product/prd6.jpg"
												class="rounded img-fluid" />
										</div>
										<div
											class="col-8 col-xl-10 col-md-9 d-flex align-items-center">
											<div>
												<a href="javascript:void(0)"
													class="card-title fs-4 link lh-sm">Canvas Shoes For Men</a>
												<h6 class="card-subtitle mt-2 mb-0 fw-normal">Absolute
													Comfort</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- ---------------------
                                    end Absolute Comfort
                                ---------------- -->
						</div>
					</div>
				</div>

				<div class="text-end">
					<button
						class="listBtn btn btn-light-secondary text-secondary font-medium">
						목록</button>
					<button
						class="topBtn btn btn-light-secondary text-secondary font-medium">
						▲ TOP</button>
				</div>

			</ul>

		</div>

		<!-- ---------------------
                    end Ticket Replies
                ---------------- -->

		<div class="col-lg-4">
			<!-- ---------------------
                    start Ticket Info
                ---------------- -->
			
			<!-- ---------------------
                    end Ticket Info
                ---------------- -->
			<!-- ---------------------
                    start User Info
                ---------------- -->
			
			<!-- ---------------------
                    end User Info
                ---------------- -->
			<!-- ---------------------
                    start Ticket Statestics
          
			<!-- ---------------------
                    end Ticket Statestics
                ---------------- -->
		</div>
		<!-- -------------------------------------------------------------- -->
		<!-- End Container fluid  -->
		<!-- -------------------------------------------------------------- -->
<script type="text/javascript">

	document.querySelector('#fileDown').addEventListener('click',(e)=>{
		location.href = '/notice/download?afTcode=${attFile.afTcode}';
	});




	$(".action-icons").on("mouseup",function(){
		$(this).attr("style","visibility: block;");
		
	});

	$('#notUpdate').on('click',function(){
		location.href = '/notice/update?notCode=${noticeVO.notCode}';
	});
	$('#notDelete').on('click',function(){
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
	function insertGood(data){
		$.ajax({
			url:'/good/insert',
			type:"post",
			contentType:"application/json;charset=utf-8",
			data : JSON.stringify(data),
			success: function(){
				console.log(123);
			}
		});
	}
	
	
	$(function() {
		$(".listBtn").on('click', function() {

			event.preventDefault();
			location.href = "/notice/home";
		});

		$(".topBtn").on('click', function() {
			event.preventDefault();

			$('html').scrollTop(0);
		});

		$("#goodBtn")
				.on(
						'click',
						function() {

							// /resources/images/good.png
							if ($(this).attr('src').includes('good2')) {
								// 좋아요 취소 처리 update
								$(this)
										.attr('src',
												'${pageContext.request.contextPath}/resources/images/good.png');
								// 		$("#goodCount")
								
								
							} else {
								// 좋아요 등록 처리 insert

								$(this)
										.attr('src',
												'${pageContext.request.contextPath}/resources/images/good2.png');
								
								
								data = {
									"goodType" : document.querySelector('#notCode').value
								};
								
								insertGood(data);
							}

						});
		
		

		let commListHtml;
		let goodListHtml;

		// 좋아요 목록 열려있는지 여부.
		let goodListFlag = false;

		$("#goodCount").on('click', function() {
			if (!goodListFlag) { // 좋아요 목록 열기

				goodListFlag = true;
				// console.log('html',$("#listDisp").html()); 

				// commListHtml = $("#listDisp").html();
				// $("#listDisp").html('');

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
		var delete_btn = $(".delete_btn");
		
		
		$('#commTr').on("click", "#delete_btn",function(){
			console.log('no',this.dataset.no);
			
			var data = {
// 					commCode : $("#commContent").val()
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
				commType : $("#notCode").val(),
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
				commType : $("#notCode").val(),
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
				}
			})
		})
		
		
		function getComList() {
			$.ajax({
						url : "/comment/list/${noticeVO.notCode}",
						type : "get",
						success : function(res) {
							var html = "";
							res.map(function(value, idx) {
								html += '<div class="d-flex flex-row comment-row mt-0">';
								html += '	<div class="p-2">';
								html += '	<img src="${pageContext.request.contextPath }/resources/images/${profile.afSave}" alt="user" width="50" class="rounded-circle" />';
								html += '	</div>';
								html += '<div>';
								html += '<div type="hidden" class="font-medium" value= "'+value.empNo+'"></div>';
								html += '<div class="mb-3 d-block" style="font-size: 1.0em;" value="">'+value.commContent+'</div>';
								html += '<div class="comment-footer d-md-flex align-items-center">';
								html += '	<span>';
								if(value.empNo == '${SessionInfo.empNo}'){
									html += '	<div class="button-group" style="float:right;">';
									html += '		<button type="button" id="update_btn" class="update_btn btn-light-primary text-primary font-medium" data-no='+value.commCode+'>수정</button>';
									html += '		<button type="button" id="delete_btn" class="delete_btn btn-light-success text-success font-medium" data-no=' +value.commCode+'>삭제</button>';
									html += '	</div>';
								}
								html += '		<div class="text-muted ms-auto mt-2 mt-md-0" style="float: right;">'+value.commDate+'</div>';
								html += '	</span>';
								html += '</div>';
								html += '</div>';
								html += '</div>';
								})
								$("#commTr").html(html);
						}
					})
		}
	
	
	
	
	});
	


	</script>
	