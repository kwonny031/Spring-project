<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.form-control:disabled, .form-control:read-only {
    background-color: #c5c8cb;
    opacity: 1;
}

.sendBtn{
/* 	background-color: #eee; */
}
.col-md-3{
	width: 23%;
	height: 50%;
    border: 1px solid #c7c7c7;
    margin: 5px 5px;
}
.card-img-top{
	width:90px;
	height:100px;
    margin: 10px 19px 0 19px;
}
.col-lg-6{
	width:40%;
}
svg{
	vertical-align: middle;
    width: 17px;
}
th{
	background-color: #dddddd!important;
}
input{
	border-color:#adabab!important;
}
</style>

<!-- 지도 -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d709abb0cc151c4ef71c096c4b67adb"></script> -->
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiWY21ACg4inVRotV8tzrDyzk2n8jHt4c&callback=initMap&v=weekly" defer></script>
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-5 align-self-center">
			<h4 class="page-title">마이페이지</h4>
			<div style="display: none !important;" class="d-flex align-items-center">
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
	<!-- Row -->
	<div class="row">
		<!-- Column -->
		<div class="col-lg-6 col-xlg-3 col-md-5">
			<!-- --------------------- start Hanna Gover ---------------- -->
			<div class="card" style="">
				<div class="card-body">
					<div class="mt-4" style="text-align: center;">
			              <!-- 임시 프로필사진 -->
			              <c:choose>
			              	<c:when test="${empty profile }">
								<img id="profileImg" src="${pageContext.request.contextPath}/resources/images/profile.png" class="rounded-circle"
									width="150" height="150" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#profileImgMod"/>
			              	</c:when>
			              	<c:otherwise>
								<img id="profileImg" src="${pageContext.request.contextPath}/resources/images/${profile.afSave}" class="rounded-circle"
									width="150" height="150" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#profileImgMod"/>
			              	</c:otherwise>
			              </c:choose>					
							
						<h4 class="card-title mt-2">${SessionInfo.empName } ${SessionInfo.empPos }</h4>
						<h6 class="card-subtitle">${depVO.depName }</h6>
						<div style="font-size: 1.8em; padding-top: 5px;" class="row text-center justify-content-md-center">
							<div class="col-5">
								<a href="javascript:void(0)" class="link" data-bs-toggle="tooltip" data-bs-placement="top" title="작성한 게시물 수">
									<i class="fa-regular fa-pen-to-square"></i>
									<font id="postNum" class="font-medium">${postNum }</font>
								</a>
							</div>
							<div class="col-5">
								<a href="javascript:void(0)" class="link" data-bs-toggle="tooltip" data-bs-placement="top" title="받은 좋아요 수">
									<i style="color: red;" class="fa-solid fa-heart"></i>
									<font id="goodNum" class="font-medium">${goodNum }</font>
								</a>
							</div>
						</div>
					</div>
					
					<!-- 프로필 이미지 수정 Modal -->
					<div id="profileImgMod" class="modal fade" tabindex="-1"
						aria-labelledby="primary-header-modalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header modal-colored-header bg-primary text-white">
									<h4 class="modal-title" id="primary-header-modalLabel">
										프로필 이미지 변경
									</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div id="imgDisp" style="text-align: center; margin-bottom: 15px;">
							              <c:choose>
							              	<c:when test="${empty profile }">
												<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="rounded-circle"
													width="150" height="150">
							              	</c:when>
							              	<c:otherwise>
												<img src="${pageContext.request.contextPath}/resources/images/${profile.afSave}" class="rounded-circle"
													width="150" height="150">
							              	</c:otherwise>
							              </c:choose>									
									</div>
									<input class="form-control" type="file" id="imgFile">
								</div>
								<div class="modal-footer">
									<button type="button" id="imgSave"
										class="btn btn-light-primary text-primary font-medium">
										저장</button>
									<button id="imgClose" type="button" class="btn btn-light" data-bs-dismiss="modal">
										취소</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>				
					
					
					
				</div>
				<div>
					<hr />
				</div>
				
				<div class="card-body" style="display: inherit;">
					<c:choose>
						<c:when test="${empty SessionInfo.empMsg}">
							<i class="fa-solid fa-volume-high" style="padding-top: 1px; margin-right: 7px;"></i><h6>안녕하세요 ${depVO.depName} ${SessionInfo.empPos } ${SessionInfo.empName }입니다.</h6>
						</c:when>
						<c:otherwise>
							<i class="fa-solid fa-volume-high"></i><h6>${SessionInfo.empMsg}</h6>
						</c:otherwise>
					</c:choose>
<!-- 					<div class="map-box"> -->
<!-- 						<iframe -->
<!-- 							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d470029.1604841957!2d72.29955005258641!3d23.019996818380896!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e848aba5bd449%3A0x4fcedd11614f6516!2sAhmedabad%2C+Gujarat!5e0!3m2!1sen!2sin!4v1493204785508" -->
<!-- 							width="100%" height="150" frameborder="0" style="border: 0" -->
<!-- 							allowfullscreen></iframe> -->
<!-- 						<div id="map" style="height:450px; width: 450px;"></div> -->
<!-- 					</div> -->
				</div>
			</div>
			<!-- --------------------- end Hanna Gover  ---------------- -->
		</div>
		<!-- Column -->
		
				<!-- Column -->
		<div class="col-lg-7 col-xlg-3 col-md-5">	
			<div class="card" style="height: 420px;">		
<!-- 				<div style="margin:10px;"> -->
<!-- 					<h3>프로필</h3> -->
<!-- 				</div>		 -->
				<ul class="nav nav-pills custom-pills" id="pills-tab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-bs-toggle="pill"
							href="#current-month" role="tab" aria-controls="pills-timeline" aria-selected="true">
							프로필
						</a>
					</li>
				</ul>
				<!-- ==========================================[프로필 Tabs]========================================== -->
				<div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="pills-profile-tab">
					<!-- 프로필 div -->
					<div id="profileInfoDiv">
						<div class="card-body">
							<table class="table no-wrap v-middle" style="border-color:#dbd6d6">
								<tr>
									<th>이　　름</th>
									<td>${SessionInfo.empName }</td>
									<th>주민등록번호</th>
									<td>${SessionInfo.empReg }</td>
								</tr>
								<tr>
									<th>부　　서</th>
									<td>${depVO.depName }</td>
									<th>전화번호</th>
									<td>${SessionInfo.empTel }</td>
								</tr>
								<tr>
									<th>직　　급</th>
									<td>${SessionInfo.empPos }</td>
									<th>이  메  일</th>
									<td>${SessionInfo.empEmail }</td>
								</tr>
								<tr>
									<th>입  사  일</th>
									<td>
										<c:set var="empDate" value="${SessionInfo.empDate }"/>
										${fn:split(empDate, ' ')[0] }
									</td>
									<th>연　　차</th>
									<td>${SessionInfo.empPv }일</td>
								</tr>
								<tr>
									<th colspan="1">주　　소</th>
									<td colspan="3">${SessionInfo.empAddr } ${SessionInfo.empPostcode }</td>
								</tr>
							</table>
							<button id="updateBtn" type="button" style="" class="btn waves-effect waves-light btn-primary">프로필 수정</button>							
						</div>
					</div>
					<!-- 프로필 div -->
					
					<!-- 프로필 수정 div -->
					<form id="updateEmp" action="/emp/update" method="post">								
						<input type="hidden" id="empPw" name="empPw">
						
						<input type="hidden" id="empNo" name="empNo" value="${SessionInfo.empNo }">
						<input type="hidden" id="coCode" name="coCode" value="${SessionInfo.coCode }">
						<input type="hidden" id="" name="empName" value="${SessionInfo.empName }">
						<input type="hidden" id="" name="empPostcode" value="${SessionInfo.empPostcode }">
						<input type="hidden" id="" name="empAddr" value="${SessionInfo.empAddr }">
						<input type="hidden" id="" name="empAddr2" value="null">
						
						<div id="updateDiv" style="display: none;">
							<div class="card-body">
								<table class="table no-wrap v-middle" style="border-color:#dbd6d6;margin-bottom:-15px;">
									<tr>
										<th style="padding:8px;text-align:center;">이　　름</th>
										<td style="padding:8px;"><input class="form-control" name="emp" type="text" value="${SessionInfo.empName }"/></td>
										<th style="padding:8px;text-align:center;">주민등록번호</th>
										<td style="padding:8px;"><input class="form-control" name="empReg" type="text" value="${SessionInfo.empReg }"/></td>
									</tr>
									<tr>
										<th style="padding:8px;text-align:center;">부　　서</th>
										<td style="padding:8px;">
											<p class="text-muted">${depVO.depName }</p>
											<input class="form-control" name="depCode" type="hidden" value="${SessionInfo.depCode}"/>
										</td>
										<th style="padding:8px;text-align:center;">전화번호</th>
										<td style="padding:8px;"><input class="form-control" name="empTel" type="text" value="${SessionInfo.empTel }"/></td>
									</tr>
									<tr>
										<th style="padding:8px;text-align:center;">직　　급</th>
										<td style="padding:8px;">
											<span class="text-muted">${SessionInfo.empPos }</span>
											<input class="form-control" name="empPos" type="hidden" value="${SessionInfo.empPos }"/>
										</td>
										<th style="padding:8px;text-align:center;">이  메  일</th>
										<td style="padding:8px;"><input class="form-control" name="empEmail" type="text" value="${SessionInfo.empEmail }"/></td>
									</tr>
									<tr>
										<th style="padding:8px;text-align:center;">입  사  일</th>
										<td style="padding:8px;">
											<span class="text-muted">
												<c:set var="empDate" value="${SessionInfo.empDate }"/>
												${fn:split(empDate, ' ')[0] }
											</span>
										</td>
										<th style="padding:8px;text-align:center;">연　　차</th>
										<td style="padding:8px;">
											<p class="text-muted">${SessionInfo.empPv }일</p>
											<input class="form-control" name="empPv" type="hidden" value="${SessionInfo.empPv }"/>
										</td>
									</tr>
									<tr>
										<th colspan="1" style="padding:8px;text-align:center;">주　　소</th>
										<td colspan="3" style="padding:8px;">
											<input class="form-control" name="empAddr" type="text" style="width:400px;"
											value="${SessionInfo.empAddr } ${SessionInfo.empPostcode }"/>
										</td>
									</tr>
									<tr>
										<th style="padding:8px;text-align:center;">비 밀 번 호</th>
										<td style="padding:8px;"><input class="form-control" id="pass" type="password" value=""/></td>
										<th style="padding:8px;text-align:center;">비밀번호 확인</th>
										<td style="padding:8px;"><input class="form-control" id="passChk" type="password" value=""/></td>
									</tr>
								</table>
							
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-4 col-xs-6 b-r"> -->
<!-- 										<strong>사원 이름</strong> <br /> -->
<%-- 										<input name="emp" type="text" value="${SessionInfo.empName }"/> --%>
<!-- 									</div> -->
<!-- 									<div class="col-md-4 col-xs-6 b-r"> -->
<!-- 										<strong>직급</strong> <br /> -->
<%-- 										<p class="text-muted">${SessionInfo.empPos }</p> --%>
<%-- 										<input name="empPos" type="hidden" value="${SessionInfo.empPos }"/> --%>
<!-- 									</div> -->
<!-- 									<div class="col-md-4 col-xs-6 b-r"> -->
<!-- 										<strong>부서</strong> <br /> -->
<%-- 										<p class="text-muted">${depVO.depName }</p> --%>
<%-- 										<input name="depCode" type="hidden" value="${SessionInfo.depCode}"/> --%>
<!-- 									</div>				 -->
															
<!-- 								</div> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-4 col-xs-6"> -->
<!-- 										<strong>주민등록번호</strong> <br /> -->
<%-- 										<input name="empReg" type="text" value="${SessionInfo.empReg }"/> --%>
<!-- 									</div> -->
<!-- 									<div class="col-md-4 col-xs-6 b-r"> -->
<!-- 										<strong>전화번호</strong> <br /> -->
<%-- 										<input name="empTel" type="text" value="${SessionInfo.empTel }"/> --%>
<!-- 									</div> -->
<!-- 									<div class="col-md-4 col-xs-6 b-r"> -->
<!-- 										<strong>이메일</strong> <br /> -->
<%-- 										<input name="empEmail" type="text" value="${SessionInfo.empEmail }"/> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-4 col-xs-6 b-r"> -->
<!-- 										<strong>잔여 연차</strong> <br /> -->
<%-- 										<p class="text-muted">${SessionInfo.empPv }</p> --%>
<%-- 										<input name="empPv" type="hidden" value="${SessionInfo.empPv }"/> --%>
<!-- 									</div> -->
<!-- 									<div class="col-md-6 col-xs-6 b-r"> -->
<!-- 										<strong>주소</strong> <br /> -->
<%-- 										<input name="empAddr" type="text" value="${SessionInfo.empAddr } ${SessionInfo.empPostcode }"/> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<br> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-4 col-xs-6"> -->
<!-- 										<strong>입사일</strong> <br /> -->
<%-- 										<p class="text-muted">${SessionInfo.empDate }</p> --%>
<!-- 										<input id="empDate" name="empDate" type="hidden" value=""/> -->
<!-- 									</div> -->
<!-- 									<div class="col-md-4 col-xs-6"> -->
<!-- 										<strong>비밀번호</strong> <br /> -->
<!-- 										<input id="pass" type="password" value=""/> -->
<!-- 									</div> -->
<!-- 									<div class="col-md-4 col-xs-6"> -->
<!-- 										<strong>비밀번호 확인</strong> <br /> -->
<!-- 										<input id="passChk" type="password" value=""/> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<br>
								<button id="updateOk" type="button" style="" class="btn waves-effect waves-light btn-primary">수정하기</button>							
								<button id="updateCancel" type="button" style="" class="btn waves-effect waves-light btn-primary">취소</button>							
							</div>
						</div>			
					</form>		
					<!-- 프로필 수정 div -->
				</div>
				<!-- ==========================================[프로필 Tabs]========================================== -->
			</div>
			
			
		</div>
		
		

	</div>
	<!-- Row -->
	
	<!-- Row -->
	<div class="row">
		<!-- Column -->
		<div class="col-lg-6 col-md-5" >
			<!-- --------------------- start Timeline ---------------- -->
			<div class="card" style="height:500px">
				<!-- Tabs -->
				<ul class="nav nav-pills custom-pills" id="pills-tab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="pills-timeline-tab" data-bs-toggle="pill"
							href="#current-month" role="tab" aria-controls="pills-timeline" aria-selected="true">
							타임라인
						</a>
					</li>
				</ul>
<!-- 				<div class="tab-content" id="pills-tabContent" style="overflow:auto"> -->
					<!-- =====================================[타임라인Tabs]========================================================= -->
					<div style="overflow: hidden;" class="tab-pane fade show active" id="current-month" role="tabpanel" aria-labelledby="pills-timeline-tab">
						<div class="card-body" style="overflow: hidden;">
							<c:choose>
								<c:when test="${empty timlist }">
										<div>타임라인이 존재하지 않습니다.</div>
								</c:when>
								<c:otherwise>
								<ul class="mailbox list-style-none app-invoice">
				                <li>								
		 							<div class="profiletimeline message-center chat-scroll invoice-users ps-container ps-theme-default"
		 								style="margin-top: 0px; position: relative; top: 0px; left:-50px; width: 450px; padding: 0px;">
										<c:forEach items="${timlist }" var="timeline">
											<a id="gettimeline" href="#" class="invoice-user message-item listing-user" style="padding-right: 1px; height: 72px; padding-left: 30px;"> 
												<c:set value="${timeline.timType }" var="str"/>
												<c:choose>
													<c:when test="${fn:substring(str,0,2) eq 'CO'}">
														<img src="${pageContext.request.contextPath }/resources/images/CO.JPG" alt="CO" class="rounded-circle" style="width: 40px; height: 40px;" />
													</c:when> 
													<c:when test="${fn:substring(str,0,2) eq 'FR'}">
														<img src="${pageContext.request.contextPath}/resources/images/FR.JPG" alt="FR" class="rounded-circle" style="width: 40px; height: 40px;"/>
													</c:when> 
													<c:when test="${fn:substring(str,0,2) eq 'RE'}">
														<img src="${pageContext.request.contextPath}/resources/images/RE.JPG" alt="RE" class="rounded-circle" style="width: 40px; height: 40px;" />
													</c:when> 
													<c:when test="${fn:substring(str,0,3) eq 'CON'}">
														<img src="${pageContext.request.contextPath}/resources/images/AD.JPG" alt="CON" class="rounded-circle" style="width: 40px; height: 40px;" />
													</c:when> 
													<c:when test="${fn:substring(str,0,2) eq 'AP'}">
														<img src="${pageContext.request.contextPath}/resources/images/AP.JPG" alt="AP" class="rounded-circle" style="width: 40px; height: 40px;" />
													</c:when> 
													<c:when test="${fn:substring(str,0,2) eq 'SC'}">
														<img src="${pageContext.request.contextPath}/resources/images/SC.JPG" alt="SC" class="rounded-circle" style="width: 40px; height: 40px;" />
													</c:when> 
													<c:when test="${fn:substring(str,0,2) eq 'NO'}">
															<img src="${pageContext.request.contextPath}/resources/images/NO.JPG" alt="NO" class="rounded-circle" style="width: 40px; height: 40px;" /> 
													</c:when>
													<c:otherwise>
															<img src="${pageContext.request.contextPath}/resources/images/4.jpg" alt="user" class="rounded-circle" style="width: 40px; height: 40px;" /> 
													</c:otherwise>
												</c:choose>												
												<div class="mail-contnet">
													<font style="font-size: 1.1em; color: black;" class="tcontent">
														${timeline.timContent }
													</font>
													<br>
													<span class="ttime" style="color: gray;">${timeline.timDate }</span>
												</div>
											</a>				 							
										</c:forEach>
									</div>
								</li>
								</ul>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- =====================================[타임라인Tabs]========================================================= -->
				</div>
		</div>
		<!-- Column -->
		
		
				<!-- Column -->
		<div class="col-lg-7 col-md-5" >
			<!-- --------------------- start Timeline ---------------- -->
			<div class="card" style="height:500px">
				<ul class="nav nav-pills custom-pills" id="pills-tab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="pills-timeline-tab" data-bs-toggle="pill"
							href="#current-month" role="tab" aria-controls="pills-timeline" aria-selected="true">
							부서 사원 프로필
						</a>
					</li>
				</ul>
				<div class="row" style="padding:10px;">
<%-- 				${depEmpList } --%>
<%-- 				${empImgList} --%>
				<c:forEach items="${depEmpList }" var="emp" varStatus="i">
					<!-- ===========[column]=========== -->
<!-- 					col-md-4 single-note-item all-category -->
<!-- 					<div class="col-lg-2"> -->
					<div class="col-md-3 single-note-item all-category">
						<!-- Card -->
						<div class="card" style="margin:0">
							<c:choose>
								<c:when test="${empImgList.get(i.index)  != null}">
									<img class="card-img-top img-responsive" src="${pageContext.request.contextPath}/resources/images/${empImgList.get(i.index).afSave }" 
										alt="Card image cap"/>
								</c:when>
								<c:otherwise>
									<img class="card-img-top img-responsive" src="${pageContext.request.contextPath}/resources/images/profile.png" 
										alt="Card image cap"/>
								</c:otherwise>
							</c:choose>
							<div class="card-body text-center" style="padding: 20px 0 0 0;">
								<input type="hidden" id="recvEmpNo" value="${emp.empNo }">
								<span style="font-size:medium"><strong>${emp.empName } ${emp.empPos}</strong></span>
								<div class="sendBtn">
									<a href="javascript:void(0)" class="link">
							            <i data-feather="phone" class="feather-icon"></i>
							            <span style="font-size: smaller;">${emp.empTel }</span>
									</a>
									<br>
									<a href="javascript:void(0)" class="link"  onclick="openPopup(this)">
							            <i data-feather="mail" class="feather-icon"></i>
							            <span>쪽지</span>
									</a>
								</div>
							</div>
						</div>
						<!-- Card -->
					</div>
					<!-- ===========[column]=========== -->
					</c:forEach>
					
					<!-- ===========[column]=========== -->
<!-- 					<div class="col-md-3 single-note-item all-category"> -->
<!-- 						Card -->
<!-- 						<div class="card"> -->
<%-- 							<img class="card-img-top img-responsive" src="${pageContext.request.contextPath}/resources/images/${profile.afSave}"  --%>
<!-- 								alt="Card image cap"/> -->
<!-- 							<div class="card-body text-center" > -->
<!-- 								<span style="font-size:medium"><strong>김성준 차장</strong></span> -->
<!-- 								<p class="card-text" style="font-size:small">보안기술부</p> -->
<!-- 								<div class="sendBtn"> -->
<!-- 									<a href="javascript:void(0)" class="link"> -->
<!-- 							            <i data-feather="mail" class="feather-icon"></i> -->
<!-- 							            <span>쪽지</span> -->
<!-- 									</a> -->
<!-- 									<a href="javascript:void(0)" class="link"> -->
<!-- 							            <i data-feather="phone" class="feather-icon"></i> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						Card -->
<!-- 					</div> -->
					<!-- ===========[column]=========== -->


					
				</div>
			</div>
		</div>
	</div>			
					
<!-- 				</div> -->
			<!-- --------------------- end Timeline ---------------- -->
	<!-- -------------------------------------------------------------- -->
	<!-- End PAge Content -->
	<!-- -------------------------------------------------------------- -->
	<!-- -------------------------------------------------------------- -->
	<!-- Right sidebar -->
	<!-- -------------------------------------------------------------- -->
	<!-- .right-sidebar -->
	<!-- -------------------------------------------------------------- -->
	<!-- End Right sidebar -->
	<!-- -------------------------------------------------------------- -->
</div>

<!-- 툴팁 -->
<script src="${pageContext.request.contextPath }/resources/assets/extra-libs/prism/prism.js"></script>

<script src="${pageContext.request.contextPath }/resources/dist/js/pages/invoice/invoice.js"></script>


<script type="text/javascript">
	let map;
	
	function initMap() {
	  map = new google.maps.Map(document.getElementById("map"), {
	    center: { lat: -34.397, lng: 150.644 },
	    zoom: 8,
	  });
	}
	
	window.initMap = initMap;

	
	
	let imgFile = document.querySelector('#imgFile');
	let imgDisp = document.querySelector('#imgDisp');
	let image;
	
	imgFile.addEventListener('change',(e)=>{
		console.log('file ch',e.target);
		console.log('file ch',e.target.files[0]);
		
		
        let fileReader = new FileReader(); // 파일 읽어주는 아저씨 생성!
        fileReader.readAsDataURL(e.target.files[0]); // 읽으시옹

        // 읽는 시간이 걸려서 onload 사용해야 함.
        fileReader.onload = function(){ // 다 읽었다면 이거슬 하시옹!
            let readContent = fileReader.result; // 읽은 결과!

            image = document.createElement('img');
            image.width = 175; // 사이즈 조절

//             console.log('read',readContent);
            image.src = readContent;

            imgDisp.innerHTML = '';
            imgDisp.appendChild(image);            
        }
	});
	
	// 이미지 수정 저장
	document.querySelector('#imgSave').addEventListener('click',()=>{
		console.log('img save ::',imgFile.files[0]);
		
        let formData = new FormData(); // 요거이 필요, 자동으로 multipart/form-data

        // formData.append('이름','값');
        formData.append('image',imgFile.files[0]);

        let xhr = new XMLHttpRequest();
        xhr.open('post','/emp/insertAf',true);
        xhr.onreadystatechange = ()=>{
            if(xhr.readyState == 4 && xhr.status == 200){     

                console.log('결과:',xhr.responseText);
                if(xhr.responseText == 1){
                    alert('이미지 수정 완료.');
                    document.querySelector('#imgClose').click();
                    
                    let profileImg = document.querySelector('#profileImg');
                    profileImg.src = image.src;
                }else{
                    alert('이미지 수정 실패.');
                }
            }   
        }
        xhr.send(formData); 		
	});
	
	// 프로필 수정 updateBtn
	document.querySelector('#updateBtn').addEventListener('click',(e)=>{
		console.log('udt ::');
		document.querySelector('#profileInfoDiv').style.display = 'none';
		document.querySelector('#updateDiv').style.display = 'block';
	});
	
	// 프로필 수정 OK
	document.querySelector('#updateOk').addEventListener('click',(e)=>{
		console.log('ok ::', '${SessionInfo.empDate}');
		let empDate = '${SessionInfo.empDate}';
		empDate = empDate.split(' ')[0];
		empDate = empDate.split('-')[0]+'/'+empDate.split('-')[1]+'/'+empDate.split('-')[2];
		console.log('empDate ::',empDate);
// 		document.querySelector('#empDate').value = empDate;
		
		// 비밀번호 체크
		if(document.querySelector('#pass').value != document.querySelector('#passChk').value){
			alert("비밀번호를 확인해주세요.");
			document.querySelector('#pass').focus();
			return;
		}
		
		document.querySelector('#empPw').value = document.querySelector('#pass').value; 
		
		// updateEmp
		document.querySelector('#updateEmp').submit();
	});
	
	// 프로필 수정 cancel
	document.querySelector('#updateCancel').addEventListener('click',(e)=>{
		console.log('cancel ::');
		document.querySelector('#profileInfoDiv').style.display = 'block';
		document.querySelector('#updateDiv').style.display = 'none';
	});
	
	
	// 쪽지 보내기 팝업창 열기
	function openPopup(p_this) {
		let empName = $(p_this).parent().parent()[0].children[1].innerText;	// 김성준 차장
		let splitName = empName.split(" ")[0]
		let recvEmpNo = $(p_this).parent().parent()[0].children[0].value;
		console.log("받는 사람 이름 : ", $(p_this).parent().parent()[0].children[0].innerText);
		console.log("받는 사람 사번 : ", recvEmpNo);
	     window.open("/message/write?empName="+splitName+"&recvEmpNo="+recvEmpNo, "popup", "width=600, height=430, top=100, left=300");
	   }
	   
// 	$(document).ready(function() {
// 	    $('#open-popup-button').click(function() {
// 	        // 팝업을 열기 위한 코드 작성
// 	    });
// 	});
	
	
	
	
	
</script>








