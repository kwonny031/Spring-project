<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#center {
	background-color: white;
}

.header {
	padding: 30px;
}

.buttons {
	padding: 20px;
}

.button1 {
	background-color: white;
	width: 80px;
	height: 35px;
}

.button2 {
	background-color: white;
	width: 80px;
	height: 35px;
}

.button3 {
	background-color: white;
	width: 60px;
	height: 35px;
}

.button4 {
	background-color: white;
	width: 80px;
	height: 35px;
}

.report {
	border: 1px;
	margin: 10px;
}

.td1 {
	border: 1px solid black;
	width: 30%%;
	background-color: #dddddd;
	font-weight: bold;
	font-size: 12pt;
}

.td2 {
	border: 1px solid black;
	width: 70%
}

.td3 {
	border: 1px solid black;
	background-color: #dddddd;
	width: 20%;
	height: 40px;
	font-weight: bold;
	text-align: center;
}

.td4 {
	border: 1px solid black;
	width: 80%;
}

.td5 {
	border: 1px solid black;
	height: 30px;
}

.signTb {
	width: 100%;
	height: 100%;
	border: 1px solid black;
	text-align: center;
}

#firstRow {
	padding-bottom: 30px;
}

.btnGroup {
	padding-top: 20px;
}

#add_row {
	background-color: white;
	height: 35px;
}

#delete_row {
	background-color: white;
	height: 35px;
}

.report {
	border: 5px double #bdbcbc;
	padding: 30px;
}

.input {
	width: 100%;
	height: 100%;
}

.ta {
	width: 100%;
	height: 100px;
}

.reason {
	height: 35px;
}

.tb2 {
	border: 1px solid black;
	margin-top: 30px;
	width: 100%;
}

.tb2-td1 {
	border: 1px solid black;
	background-color: #dddddd;
	height: 50px;
	text-align: center;
	font-weight: bold;
	font-size: 13pt;
}

/* ========첫 모달창=============== */
#myModal {
	position: fixed;
	height: 100%;
	width: 100%;
	left: 0;
	top: 0;
	background-color: rgba(101, 102, 103, 0.5);
	display: none; /*초기값 안보이게*/
}

#myCont {
	border-radius: 10px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 40px;
	font-size: 12pt;
	width: 20%;
	height: 48%;
	background-color: rgb(255, 255, 255);
	color: rgb(65, 64, 63);
}

#content {
	margin-top: 30px;
	margin-bottom: 30px;
	padding: 30px;
	border: 0.8px solid rgb(161, 160, 160);
}

#modalTb1 {
	font-weight: bold;
	width: 50%;
	height: 50px;
}

#mBtn {
	position: relative;
	left: 35%;
	height: 35px;
	width: 100px;
	background-color: #348ed5;
	border: 1px solid #348ed5;
	color: rgb(255, 255, 255);
	font-style: initial;
	border-radius: 8px;
}

/* =============  결재하기 모달  ================ */
#appModal {
	position: fixed;
	height: 100%;
	width: 100%;
	left: 0;
	top: 0;
	background-color: rgba(101, 102, 103, 0.5);
	display: none; /*초기값 안보이게*/
}

#appModalCon {
	border-radius: 10px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	font-size: 12pt;
	width: 20%;
	height: 25%;
	background-color: rgb(255, 255, 255);
	color: rgb(65, 64, 63);
}

#appContent {
	margin-top: 30px;
	margin-bottom: 40px;
	/* 	padding: 30px; */
}

#pass {
	border: 0.8px solid rgb(161, 160, 160);
	font-weight: bold;
	width: 70%;
	height: 50px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

#appBtn {
	position: relative;
	left: 35%;
	height: 35px;
	width: 100px;
	background-color: #348ed5;
	border: 1px solid #348ed5;
	color: rgb(255, 255, 255);
	font-style: initial;
	border-radius: 8px;
}

#close {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: rgb(161, 160, 160);
}

#keyImage {
	max-width: 70%;
	max-height: 70%;
	filter: invert();
}

.keyTd {
	width: 25%;
	background-color: rgb(177, 176, 176);
}

#empBtn {
	position: relative;
	left: 45%;
	height: 35px;
	width: 100px;
	background-color: #348ed5;
	border: 1px solid #348ed5;
	color: rgb(255, 255, 255);
	font-style: initial;
	border-radius: 8px;
	margin-top: 40px;
}

#modalBody {
	padding-top: 30px;
	padding-left: 30px;
	margin-left: 30px;
	border: 1px solid rgb(216, 215, 215);
}
</style>

<!-- <div class="page-wrapper"> -->
<!-- -------------------------------------------------------------- -->
<!-- Email App Part -->
<!-- -------------------------------------------------------------- -->
<div class="email-app">
	<!-- -------------------------------------------------------------- -->
	<!-- Left Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="left-part" style="width: 200px; background-color: #D2E0F5;">
		<a
			class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none"
			href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="p-3">
				<h3>전자결재</h3>

			</div>
			<div class="divider"></div>
			<ul class="list-group">
				<li><small class="p-3 grey-text text-lighten-1 db">결재
						양식</small></li>
				<li class="list-group-item"><a
					href="/approval/bisOrd?apfName=order"
					class="active list-group-item-action d-flex align-items-center"
					id="order"><svg xmlns="http://www.w3.org/2000/svg" width="24"
							height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-file-text feather-sm">
							<path
								d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline></svg> &emsp;발주서 </a></li>
				<li class="list-group-item"><a
					href="/approval/bisOrd?apfName=business"
					class="list-group-item-action" id="business"> <svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-file-text feather-sm">
							<path
								d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline></svg> &emsp; 출장보고서
				</a></li>
				<li class="list-group-item"><a href="/approval/recruit"
					class="list-group-item-action d-flex align-items-center"> <svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-file-text feather-sm">
							<path
								d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline></svg> &emsp; 채용품의서
				</a></li>
				<li class="list-group-item"><a href="/approval/vacation"
					class="list-group-item-action"> <svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-file-text feather-sm">
							<path
								d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
							<polyline points="14 2 14 8 20 8"></polyline>
							<line x1="16" y1="13" x2="8" y2="13"></line>
							<line x1="16" y1="17" x2="8" y2="17"></line>
							<polyline points="10 9 9 9 8 9"></polyline></svg> &emsp; 휴가신청서

				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
				<li><small class="p-3 grey-text text-lighten-1 db">결재
						문서</small></li>
				<li class="list-group-item"><a href="/approval/aplineList"
					class="list-group-item-action d-flex align-items-center" id="order">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-edit feather-sm">
							<path
								d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
							<path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
						&emsp;결재할 문서

				</a></li>

				<li class="list-group-item"><a href="/approval/appList"
					class="list-group-item-action d-flex align-items-center" id="order">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-clock feather-sm">
							<circle cx="12" cy="12" r="10"></circle>
							<polyline points="12 6 12 12 16 14"></polyline></svg> &emsp;결재진행 문서

				</a></li>
				<li class="list-group-item"><a href="/approval/tempstList"
					class="list-group-item-action"> <svg
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-package feather-sm">
							<path
								d="M12.89 1.45l8 4A2 2 0 0 1 22 7.24v9.53a2 2 0 0 1-1.11 1.79l-8 4a2 2 0 0 1-1.79 0l-8-4a2 2 0 0 1-1.1-1.8V7.24a2 2 0 0 1 1.11-1.79l8-4a2 2 0 0 1 1.78 0z"></path>
							<polyline points="2.32 6.16 12 11 21.68 6.16"></polyline>
							<line x1="12" y1="22.76" x2="12" y2="11"></line>
							<line x1="7" y1="3.5" x2="17" y2="8.5"></line></svg> &emsp;임시보관함
				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
				<li><small class="p-3 grey-text text-lighten-1 db">완료
						문서함</small></li>
				<li class="list-group-item"><a href="/approval/appendList"
					class=" list-group-item-action d-flex align-items-center"
					id="order"> <svg xmlns="http://www.w3.org/2000/svg" width="24"
							height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-check-circle feather-sm">
							<path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
							<polyline points="22 4 12 14.01 9 11.01"></polyline></svg> &emsp;결재 완료
						문서

				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
			</ul>
		</div>
	</div>



	<div class="row" style="padding-top: 50px;">
		<div class="col-2" style="width: 22%;"></div>
		<div class="col-9" id="center">
			<header class="header">
				<h3>휴가신청서</h3>
			</header>

			<div class="buttons">
				<input type="button" class="button1" value="재기안" id="reApp" /> 
				<input type="button" class="button2" value="기안삭제" id="delete" /> 
				<input type="button" class="button3" value="뒤로" id="cancel" />
			</div>


			<input type="text"
				style="width: 98%; text-align: right; border: 0px;"
				value="** 반려 버튼을 클릭하여 반려 사유를 확인하세요.">
			<!-- 		<div id="appContent"> -->
			<%-- 			<input type="hidden" id="empNo" name="app.empNo" value="${SessionInfo.empNo }"/> --%>
			<input type="hidden" id="appStatus" name="app.appStatus"
				value="${appList.app.appStatus} " />
			<!-- 			<input type="hidden" id="appUrgent" name="app.appUrgent" value=""/> -->
			<!-- 			<input type="hidden" id="appTitle" name="app.appTitle" value="휴가신청서"/> -->
			<!-- 			<input type="hidden" id="appYear" name="app.appYear" value="5"/> -->
			<input type="hidden" id="appCode" name="appCode"
				value="${vacationIngForm.get(0).vacation.appCode }" />
			<div class="report">
				<h2 style="text-align: center; padding-bottom: 30px;" id="appTitle"
					name="app.appTitle" value="휴가신청서">휴가신청서</h2>
				<div class="row" id="firstRow">
					<div class="col-5">
						<table style="width: 100%;">
							<tr>
								<td class="td1">문서번호</td>
								<td class="td2"><input type="text"
									value="${vacationIngForm.get(0).vacation.appCode }" /></td>
							</tr>
							<!-- 								<tr> -->
							<!-- 									<td class="td1">부서</td> -->
							<%-- 									<td class="td2">${vacationIngForm.get(0).depCode }</td> --%>
							<!-- 								</tr> -->
							<tr>
								<td class="td1">기안일</td>
								<td class="td2">${vacationIngForm.get(0).app.appDate }</td>
							</tr>
							<tr>
								<td class="td1">기안자</td>
								<td class="td2">${vacationIngForm.get(0).emp.empName }</td>
							</tr>
							<tr>
								<td class="td1">보존 기한</td>
								<td class="td2">
									<!-- 										<input type="text" id="appYear"  readonly="readonly" style="border: 0px;"> -->
									5년
								</td>
							</tr>

						</table>
					</div>
					<div class="col-1"></div>
					<div class="col-6">
						<form action="vacation/" method="post" id="vacation">
							<div class="row">
								<c:forEach items="${vacationIngForm }" var="vVO" varStatus="i">

									<div class="col-4">
										<table class="signTb">
											<tr>
												<td rowspan='4' class="td3">결재선</td>
												<td class="td4" id="appLine1" name="apline.apline1">${vVO.apline.aplName }</td>
												<input type="hidden" id="aplResult" name="aplResult" value="${vVO.apline.aplResult }" />
												<!--<input type="hidden" id="appStatus" name="appStatus" -->
												<%-- value="${vVO.app.appStatus }" /> --%>

											<c:set var="aplResult" value="${vVO.apline.aplResult }" />
											</tr>
											<tr>
												<td rowspan='2' class="td4" height="70px">
												<c:if test="${aplResult eq '1'}">
													<img src="/resources/images/${vVO.apline.aplName }.png" alt="" style="width: 70px; height: 60px;">
												</c:if> 
												<c:if test="${aplResult eq '2'}">
													<input type="hidden" name="aplResult" id="aplResult" value="2" />
													<a tabindex="0" class="btn btn-light-danger d-inline-flex align-items-center text-danger font-medium"
														role="button" data-bs-toggle="popover"
														data-bs-trigger="focus" title=""
														data-bs-content="${vVO.apline.aplComment }"
														data-bs-original-title="반려 사유"><svg
															xmlns="http://www.w3.org/2000/svg" width="24"
															height="24" viewBox="0 0 24 24" fill="none"
															stroke="currentColor" stroke-width="2"
															stroke-linecap="round" stroke-linejoin="round"
															class="feather feather-alert-octagon feather-sm fill-white me-2">
													<polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon>
														<line x1="12" y1="8" x2="12" y2="12"></line>
														<line x1="12" y1="16" x2="12" y2="16"></line></svg>반려</a>
													<!-- <img src="/resources/images/reject.png" alt="" style="width: 70px; height:60px;"> -->
												</c:if>
												</td>
											</tr>
											<tr>
											</tr>
											<tr>
												<td height="20px"></td>
											</tr>
										</table>
									</div>



								</c:forEach>
							</div>
						</form>
					</div>
				</div>
				<table border=1 width="100%">
					<tbody id="my-tbody">

						<tr>
							<td class="td3">휴가 종류</td>
							<td class="td4">&emsp;
								${vacationIngForm.get(0).vacation.vacType }</td>
						</tr>


						<tr>
							<td class="td3">기간 및 일시</td>
							<td class="td4"><input type="hidden"
								name="vacation.vacStart" id="vacStart" value="" /> <input
								type="hidden" name="vacation.vacEnd" id="vacEnd" value="" />
								&emsp; 시작날짜 &nbsp; ${vacationIngForm.get(0).vacation.vacStart }
								&emsp;~&emsp; 종료날짜&nbsp;
								${vacationIngForm.get(0).vacation.vacEnd } &emsp; &emsp;</td>
						</tr>
						<!-- 							<tr> -->
						<!-- 								<td class="td3">반차 여부</td> -->
						<!-- 								<td class="td4"> -->
						<!-- 									&emsp;  -->
						<!-- 									<input type='checkbox' name='startHalf' id="startHalf" value='startHalf' onclick="is_checked()" /> -->
						<!-- 									&nbsp; -->
						<!-- 									시작일 ( &nbsp;&nbsp;  -->
						<!-- 									<input type="radio" name="radio1" class="radio1" id="startHalf2am" value="0.5" disable/>&nbsp;&nbsp;오전&nbsp;&nbsp; -->
						<!-- 									<input type="radio" name="radio1" class="radio2" id="startHalf2pm" value="0.5" />&nbsp;&nbsp;오후 -->
						<!-- 									) &emsp; &emsp; &emsp; -->

						<!-- 									<input type='checkbox' name='endHalf' id="endHalf" value='endHalf' />&nbsp;&nbsp; -->
						<!-- 									종료일 (&nbsp;&nbsp;  -->
						<!-- 									<input type="radio" name="radio2" class="radio3" id="endHalf2am" value="0.5" />&nbsp;&nbsp;오전&nbsp;&nbsp; -->
						<!-- 									<input type="radio" name="radio2" class="radio4" id="endHalf2pm" value="0.5" />&nbsp;&nbsp;오후 -->
						<!-- 									) -->
						<!-- 								</td> -->
						<!-- 							</tr> -->
						<tr>
							<td class="td3">연차 일수</td>
							<td class="td4">&emsp; 잔여 연차: &nbsp; <input type="text"
								value="${vacationIngForm.get(0).emp.empPv }"
								style="width: 100px;" readonly /> &emsp; 신청 일수: &nbsp; <input
								type="text" id="vacDay" name="vacation.vacDay"
								style="width: 100px;"
								value="${vacationIngForm.get(0).vacation.vacDay }" readonly />
							</td>
						</tr>
						<tr>
							<td class="td3">휴가 사유</td>
							<td class="td4"><textarea class="ta" id="vacContent"
									name="vacation.vacContent" readonly>${vacationIngForm.get(0).vacation.vacContent }</textarea></td>
						</tr>
						<tr>
							<td class="td3">긴급연락처</td>
							<td class="td4">&emsp;<input type="text" id="vacTel"
								name="vacation.vacTel"
								value="${vacationIngForm.get(0).vacation.vacTel }" readonly /></td>
						</tr>
						<tr>
							<td colspan='2' class="td1"><br /> &emsp;1. 연차의 사용은 근로기준법에
								따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다.<br> &emsp;&emsp;
								단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.<br>
								&emsp;2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br>
								&emsp;3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출<br> &emsp;
							</td>
						</tr>

					</tbody>
				</table>
				<table class="tb2">
					<tr>
						<td class="tb2-td1">파일첨부</td>
						<td class="tb2-td2">&emsp;&emsp;<input type="file" /></td>
					</tr>
				</table>

				<!-- 				<div class="btnGroup"> -->
				<!-- 					<button id="add_row">행 추가하기</button> -->
				<!-- 					<button id="delete_row">행 삭제하기</button> -->
				<!-- 				</div> -->
			</div>
			<form action="vacationModify" method="get" id="vacationMo">
				<input type="hidden" name="appCode" id="appCode"
					value="${vacationIngForm.get(0).vacation.appCode }">
				<%-- 						<input type="hidden" name="apfCode" id="apfCode" value="${recruitIngForm.get(0).app.apfCode }"> --%>
			</form>
		</div>
	</div>
	<div class="col-1"></div>
</div>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<!-- ===================[ sweetAlert ]================================-->
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- ===================[ sweetAlert ]================================-->
<!-- <script src="../../assets/extra-libs/prism/prism.js"></script> -->
<script>
$(document).ready(function(){  
	
		var aplResult = $("#aplResult").val();
// 		var appStatus = $("#appStatus").val();
		console.log("aplResult알려줘어어엉: ", aplResult);
		console.log("재기안 버튼 띄워말어??");
		console.log('aplresult ::',aplResult);
		if(aplResult != '2'){
			document.getElementById("reApp").style.display="none";
		}
	
		var vacationForm = $("#vacationMo");
		//재기안 버튼 클릭이벤트
		$("#reApp").on("click", function(){
			console.log("재기안좀 하고싶다");
			console.log("appCode: ", appCode);
			vacationForm.submit();
		});
	
	//현재날짜 가져오기
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    
   
	
	//승인하기 버튼 클릭이벤트
	$("#confirmBtn").on("click",function(){
		Swal.fire({
		  title: '승인하시겠습니까?',
// 		  text: "You won't be able to revert this!",
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '승인하기'
		}).then((result) => {
		  if (result.isConfirmed) {
// 		    Swal.fire(
// 		      '승인 완료!',
// 		      '결재가 승인되었습니다.',
// 		      'success'
// 		    )
		    Swal.fire({
		      icon:'success',
		      title: '결재승인',
		      timer : 1500,
		      showConfirmButton : false
		      
		    })
		    //APL_RESULT 값 '1'로 바꿔주는 부분
		    setTimeout(function listView(appCode){
		    	const form = document.createElement('form');
		    	  form.method = 'POST';
		    	  form.action = '/approval/aplineListUpdate';
		    	  
		    	  const input = document.createElement('input');
		    	  input.type = 'hidden';
		    	  input.name = 'appCode';
		    	  input.value = '${vacationIngForm.get(0).vacation.appCode }';
		    	  
		    	  form.appendChild(input);
		    	  document.body.appendChild(form);
		    	  form.submit();
// 		    	  location.href="/approval/aplineListUpdate?appCode="+${vacationIngForm.get(0).app.appCode }.val();
		    	}, 1000);
		  }
		})
	});
		
	
	//삭제하기 버튼 클릭이벤트
 	$("#delete").on("click",function(){
 		const swalWithBootstrapButtons = Swal.mixin({
			  customClass: {
			    confirmButton: 'btn btn-success',
			    cancelButton: 'btn btn-danger'
			  },
			  buttonsStyling: false
			})
			
			swalWithBootstrapButtons.fire({
			  title: '정말 삭제하시겠습니까?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  reverseButtons: true,
			  showCancelButton: true,
			  confirmButtonText: '삭제하기',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
				  Swal.fire({
				      icon:'success',
				      title: '삭제 완료!',
				      timer : 1500,
				      showConfirmButton : false
				      
				    })
				    setTimeout(function del(appCode){
				    	const form = document.createElement('form');
				    	  form.method = 'POST';
				    	  form.action = '/approval/approvalDelete';
				    	  
				    	  const input = document.createElement('input');
				    	  input.type = 'hidden';
				    	  input.name = 'appCode';
				    	  input.value = '${vacationIngForm.get(0).vacation.appCode }';
				    	  
				    	  form.appendChild(input);
				    	  document.body.appendChild(form);
				    	  form.submit();
//		 		    	  location.href="/approval/aplineListUpdate?appCode="+${vacationIngForm.get(0).app.appCode }.val();
				    	}, 1000);
			  } else if (
			    /* Read more about handling dismissals below */
			    result.dismiss === Swal.DismissReason.cancel
			  ) {
			    swalWithBootstrapButtons.fire(
			      '삭제하기 취소!',
			      'Your imaginary file is safe :)',
			      'error'
			    )
			  }
			  
			})
 	});
	
	//취소버튼 클릭이벤트
	$("#cancel").click(function() {
		if (window.confirm("임시보관 문서 화면으로 이동합니다.")) {
	          console.log("안쓴댜");
	          location.replace("/approval/appList");
			
	        } else {
	          console.log("취소안한댜");
	        }
	});
	

});

const appModal = document.getElementById("appModal");
function f_modalClose(){
	myModal.style.display = "none";
	appModal.style.display = "none";
}
function f_appModal(){
	appModal.style.display = "block";
}
 
</script>