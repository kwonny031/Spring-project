<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.workBtn {
	width: 100px;
	display: inline;
}

.dropDiv {
	margin-top: 10px;
}

.workDrop {
	width: 158px;
}

.cell {
	display: inline-block;
	height: 65px;
	/* 	width: 9px; */
	width: 4px;
	cursor: pointer;
	background-color: #ffffff;
}

.accDate {
	/* 		display: inline-block; */
	/* 		margin-right: 5px; */
	
}
</style>

<!-- -------------------------------------------------------------- -->
<!-- Email App Part -->
<!-- -------------------------------------------------------------- -->
<div class="email-app">
	<!-- -------------------------------------------------------------- -->
	<!-- Left Part -->
	<!-- -------------------------------------------------------------- -->
	<%@ include file="/WEB-INF/views/work/workSide.jsp"%>

	<!-- -------------------------------------------------------------- -->
	<!-- Right Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="right-part mail-list bg-white overflow-auto"
		style="width: calc(100% - 200px); margin-left: 200px;">

		<div class="card-body">
			<h3 class="card-title">
				근태현황 <font id="empLbl" style="display: none; font-weight: 500;"></font>
			</h3>
			<!-- 년월 표시 -->
			<h2 style="text-align: center;">
				<i style="cursor: pointer;"
					class="monthChange fa-solid fa-angle-left"></i> 2023.05 <i
					style="cursor: pointer;"
					class="monthChange fa-solid fa-angle-right"></i>
			</h2>
			<br>
			<div class="row mt-4">
				<!-- Column -->
				<div class="col-md-6 col-lg-3 col-xlg-3">
					<div class="card card-hover">
						<div class="p-2 rounded bg-light-primary text-center"
							style="background-color: #a0cbf5 !important;">
							<h5 class="text-primary">이번 주 누적</h5>
							<h2 id="weekTime" class="fw-light text-primary">0h 0m</h2>
						</div>
					</div>
				</div>
				<!-- Column -->
				<div class="col-md-6 col-lg-3 col-xlg-3">
					<div class="card card-hover">
						<div class="p-2 rounded bg-light-warning text-center">
							<h5 class="text-warning">이번 주 잔여</h5>
							<h2 id="weekRest" class="fw-light text-warning">40h 0m</h2>
						</div>
					</div>
				</div>
				<!-- Column -->
				<div class="col-md-6 col-lg-3 col-xlg-3">
					<div class="card card-hover">
						<div class="p-2 rounded bg-light-success text-center">
							<h5 class="text-success">이번 주 초과</h5>
							<h2 id="weekOver" class="fw-light text-success">0h 0m</h2>
						</div>
					</div>
				</div>
				<!-- Column -->
				<div class="col-md-6 col-lg-3 col-xlg-3">
					<div class="card card-hover">
						<div class="p-2 rounded bg-light-danger text-center">
							<h5 class="text-danger">이번 달 누적</h5>
							<h2 id="monthTime" class="fw-light text-danger">0h 0m</h2>
						</div>
					</div>
				</div>
				<!-- Column -->
			</div>

			<!-- 업무 상태 등록 모달 -->
			<!-- Primary Header Modal -->
			<div id="primary-header-modal" class="modal fade" tabindex="-1"
				aria-labelledby="primary-header-modalLabel" aria-hidden="true">
				<div class="modal-dialog" style="margin-top: 300px;">
					<div class="modal-content" style="width: 400px; margin: 50px;">
						<div
							class="modal-header modal-colored-header bg-primary text-white">
							<h4 class="modal-title" id="primary-header-modalLabel">근무 상태
								등록</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body" style="min-height: 250px; padding: 30px;">
							<table>
								<tbody>
									<tr style="height: 45px;">
										<td style="padding-right: 50px;"><strong>일시</strong></td>
										<td><input type="date" id="inputDate"> <select
											id="inputHour" style="width: 60px;">
										</select> : <select id="inputMinute" style="width: 60px;">
										</select></td>
									</tr>
									<tr style="height: 45px;">
										<td><strong>상태</strong></td>
										<td><select id="inputStatus">
												<!-- 공통코드로 처리 -->
												<option>업무</option>
												<option>업무종료</option>
												<option>출장</option>
												<option>연차</option>
												<option>반차</option>
												<option>교육</option>
												<option>외근</option>
										</select></td>
									</tr>
									<tr style="height: 45px;">
										<td><strong>내용</strong></td>
										<td><input id="inputMemo" type="text"
											placeholder="상태에 대한 간단한 설명을 입력하세요." style="width: 259px;"></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="modal-footer">
							<button id="inputBtn" type="button"
								class="btn btn-light-primary text-primary font-medium">
								저장</button>
							<button id="cancelBtn" type="button" class="btn btn-light"
								data-bs-dismiss="modal">취소</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

			<!-- 업무 상태 "수정" 모달 -->
			<div id="workMod" class="modal fade" tabindex="-1"
				aria-labelledby="primary-header-modalLabel" aria-hidden="true">
				<div class="modal-dialog" style="margin-top: 300px;">
					<div class="modal-content" style="width: 400px; margin: 50px;">
						<div
							class="modal-header modal-colored-header bg-primary text-white"
							style="background-color: #78DBA6 !important;">
							<h4 class="modal-title" id="primary-header-modalLabel">근무 상태
								수정</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body" style="min-height: 250px; padding: 30px;">
							<table>
								<tbody>
									<tr style="height: 45px;">
										<td style="padding-right: 50px;"><strong>일시</strong></td>
										<td><input type="date" id="modDate"> <select
											id="modHour" style="width: 60px;">
										</select> : <select id="modMinute" style="width: 60px;">
										</select></td>
									</tr>
									<tr style="height: 45px;">
										<td><strong>상태</strong></td>
										<td><select id="modStatus">
												<!-- 공통코드로 처리 -->
												<option>업무</option>
												<option>업무종료</option>
												<option>출장</option>
												<option>연차</option>
												<option>반차</option>
												<option>교육</option>
												<option>외근</option>
										</select></td>
									</tr>
									<tr style="height: 45px;">
										<td><strong>내용</strong></td>
										<td><input id="modMemo" type="text"
											placeholder="상태에 대한 간단한 설명을 입력하세요." style="width: 259px;"></td>
									</tr>
									<tr style="height: 45px;">
										<td><strong>변경 사유 <font color="red">*</font></strong></td>
										<td><input id="modReason" type="text"
											placeholder="내용을 입력해주세요." style="width: 259px;"></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="modal-footer">
							<button id="delChkBtn" type="button" data-bs-toggle="modal"
								class="btn btn-light-danger text-danger font-medium">
								삭제</button>
							<button id="modBtn" type="button"
								class="btn btn-light-primary text-primary font-medium">
								저장</button>
							<button id="cancelBtn" type="button" class="btn btn-light"
								data-bs-dismiss="modal">취소</button>
							<button id="delBtn" data-bs-toggle="modal"
								data-bs-target="#delChk" style="display: none;"
								class="btn btn-light-danger text-danger font-medium">
								hide삭제</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

			<!-- 삭제 확인 모달 -->
			<div class="modal fade" id="delChk" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header d-flex align-items-center">
							<h4 class="modal-title" id="myLargeModalLabel">근무 정보 삭제</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>정말 삭제하시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-light-danger text-danger font-medium
                                waves-effect text-start"
								id="realDel">삭제</button>
							<button type="button" class="btn btn-light"
								data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>



			<!-- ---------------------
		              start Accordian
		          ---------------- -->
			<div class="card w-100">

				<div class="card-body">
					<div class="accordion" id="accordionExample">

						<c:forEach begin="1" end="${totalWeek }" step="1" varStatus="i">
							<div class="accordion-item">
								<h2 class="accordion-header" id="heading${i.index }">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#collapse${i.index }" aria-expanded="false"
										aria-controls="collapse${i.index }">${i.index }주차</button>
								</h2>
								<div id="collapse${i.index }"
									class="accordion-collapse collapse"
									aria-labelledby="heading${i.index }"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">

										<table id="demo-foo-row-toggler"
											class="weekTableTag table table-bordered text-nowrap"
											data-toggle-column="first"
											style="background-color: white; text-align: center;
												border-bottom-color: #adabab;">
											<thead style="background-color: #BAC1E4;">
												<tr>
													<!-- 													<th data-breakpoints="xs">일자</th> -->
													<!-- 													<th>업무 시작</th> -->
													<!-- 													<th>업무 종료</th> -->
													<!-- 													<th data-breakpoints="xs sm">총 근무시간</th> -->
													<!-- 													<th data-breakpoints="xs">근무시간 상세</th> -->
													<!-- 													<th data-breakpoints="all" data-title="DOB">변경사항</th> -->
													<th>일자</th>
													<th>업무 시작</th>
													<th>업무 종료</th>
													<th>총 근무시간</th>
													<th>근무시간 상세</th>
													<th style="display: none;">변경사항</th>
												</tr>
												<!-- end row -->
											</thead>
											<tbody>

												<!-- 일월...금토 -->
												<c:choose>
													<c:when test="${totalWeek eq i.index }">
														<!-- 마지막 주인 경우 -->
														<c:forEach begin="0" end="${restDayNum - 1 }" step="1">
															<tr data-expanded="true" class="accTr">
																<td class="accDate"></td>
																<td class="accStart"></td>
																<td class="accEnd"></td>
																<td class="accTime"></td>
																<td class="accDtl"></td>
																<td class="accMod" style="display: none;"></td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach begin="0" end="6" step="1">
															<tr data-expanded="true" class="accTr">
																<td class="accDate"></td>
																<td class="accStart"></td>
																<td class="accEnd"></td>
																<td class="accTime"></td>
																<td class="accDtl"></td>
																<td class="accMod" style="display: none;"></td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
												<!-- 초 단위 계산은 우선 빼는걸로 -->
												<!-- 										일자/업무 시작/업무 종료/총 근무시간/근무시간 상세/변경사항					 -->
												<!-- 				                        <tr data-expanded="true" class="accTr"> -->
												<!-- 				                          <td class="accDate"></td> -->
												<!-- 				                          <td>09:00:00</td> -->
												<!-- 				                          <td>18:24:31</td> -->
												<!-- 				                          <td>8h 24m 31s</td> -->
												<!-- 				                          <td> -->
												<!-- 											기본 7h 40m 0s / 연장 0h 44m 31s / 야간 0h 0m 0s -->
												<!-- 				                          </td> -->
												<!-- 				                          <td></td> -->
												<!-- 				                        </tr>	                         -->


											</tbody>
										</table>

									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- ---------------------
		              end Accordian
		          ---------------- -->
			<!-- 클릭 시 appendChild() / 오류 나서 forEach문 밖으로 뺌. -->
			<div style="display: none;">
				<table id="addTag">
					<tr class="cellTr">
						<td colspan="6"
							style="background-color: #d1d2d5; text-align: center;">
							<div style="display: inline-block;">
								<!-- 시간 표시 -->
								<div style="margin-left: 0px;">
									<c:forEach step="1" begin="7" end="23" varStatus="i">
										<c:choose>
											<c:when test="${i.index < 10 }">
												<font style="margin-right: 17px;">0${i.index }</font>
											</c:when>
											<c:otherwise>
												<font style="margin-right: 17px;">${i.index }</font>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<!-- 07-23 102개(6*17) / cell에 시간 데이터 넣기(시간 7.0으로 들어감) -->
								<div class="cellDiv">
									<c:forEach begin="0" end="${6*17-1 }" varStatus="i">
										<c:choose>
											<c:when test="${i.index % 6 eq 5 }">
												<!-- 6칸마다 margin 다르게 -->
												<!-- minute 0이면 00으로 입력 -->
												<c:choose>
													<c:when test="${(i.index % 6) * 10 eq 0}">
														<div class="cell"
															data-hour="${7 + Math.floor(i.index / 6) }"
															data-minute="0${(i.index % 6) * 10 }"
															style="margin-right: 2px;"></div>
													</c:when>
													<c:otherwise>
														<div class="cell"
															data-hour="${7 + Math.floor(i.index / 6) }"
															data-minute="${(i.index % 6) * 10 }"
															style="margin-right: 2px;"></div>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${(i.index % 6) * 10 eq 0}">
														<div class="cell"
															data-hour="${7 + Math.floor(i.index / 6) }"
															data-minute="0${(i.index % 6) * 10 }"
															style="margin-right: -2px;"></div>
													</c:when>
													<c:otherwise>
														<div class="cell"
															data-hour="${7 + Math.floor(i.index / 6) }"
															data-minute="${(i.index % 6) * 10 }"
															style="margin-right: -2px;"></div>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<!-- workDisp div 출근/퇴근/연결 -->
			<div id="workHide" style="display: none;">
				<div class="workDiv"
					style="background-color: #78DBA6; color: white; width: 60px; height: 20px; margin-top: 10px; z-index: 3; position: relative; cursor: pointer; border-top-left-radius: 9px; border-bottom-left-radius: 9px;"
					data-bs-target="#workMod" data-bs-toggle="modal"></div>

				<div class="workDiv"
					style="background-color: #78DBA6; color: white; width: 60px; height: 20px; margin-top: 10px; z-index: 3; left: -60px; position: relative; cursor: pointer; border-top-right-radius: 9px; border-bottom-right-radius: 9px;"
					data-bs-target="#workMod" data-bs-toggle="modal"></div>

				<div class="workDiv"
					style="background-color: #78DBA6; color: white; width: 0px; height: 20px; margin-top: 10px; z-index: 2; left: 60px; position: relative; border-top-right-radius: 0px; border-bottom-right-radius: 0px; top: -65px;">
				</div>
			</div>



		</div>

	</div>

</div>

<!--Custom JavaScript -->
<script
	src="${pageContext.request.contextPath }/resources/dist/js/feather.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/dist/js/custom.min.js"></script>

<script>

// 과장 이상은 근태 관리 권한 부여
let manageFlag = '${manageFlag}';
//	console.log('flag ::',manageFlag);
if(manageFlag == 'true'){
	manageFlag = true;
}else{
	manageFlag = false;
}
console.log('flag2 ::',manageFlag);

// cell div 띄워져 있는지 여부
let cellFlag = false;

let workList = [];
let todayWorks = []; // [0] 출근 - today를 따로 만들지 말고 그 날의 출근정보를 찾아서
// listIdx를 저장 해놓기. - 그냥 객체를 리스트에 저장?

// 변수에 년도, 월 저장
let year;
let month;
let date;
let hour;
let minute;

// 현재 표시하고 있는 년도, 월
let dispYear;
let dispMonth;
		
// 이번 주 누적, 이번 주 잔여, 이번 주 초과, 이번 달 누적
let weekTime;
let weekRest;
let weekOver;
let monthTime;

// 출근 listIdx
let startWorkIdx;			
let endWorkIdx;	

let chkEmpNo = ${SessionInfo.empNo};

////
// 과장이상 직급이면 사원 근태 목록 확인 가능. side에는 자기 정보 + acc에는 클릭한 사원정보
document.addEventListener('DOMContentLoaded', () => { // 태그 해석만 함
	
	let jsonWorkList = ${jsonWorkList};
	makeWorkList(jsonWorkList);
	
	// 아코디언에 값 넣기
	makeAcc();		
	
	setInterval(showTime,500);  //0.5초마다 갱신		
	
	// 오늘에 해당하는 tr에 cell 띄우기
	// 먼저 1빼고 나머지 구해야 함.
	let todayIndex = (now.getDate() - 1) % 7;
	let todayTr = document.querySelectorAll('.weekTableTag')[weekCount-1].children[1].children[todayIndex];
	
	
	////  empLi > empDiv
	let empLis = document.querySelectorAll('.empLi');
	let empDiv = document.querySelector('#empDiv');
//		let empDiv2 = document.querySelector('#empDiv2'); // div2도 있으면 좋은데

	// empImgList
	let empImgList = '${empImgListJson}';
// 	console.log('img ::',empImgList);
	empImgList = JSON.parse(empImgList);
// 	console.log('img2 ::',empImgList);
	
	let empDivFlag = false;
	let imgSrc = empDiv.children[0].children[0].src; 
	
	// 권한 없으면 근태현황 버튼 비활성화
	if(!manageFlag){
		empDiv.children[2].children[0].setAttribute('disabled','disabled');
	}
	
	// 근태현황 버튼
	let empNamePos;
	
	document.querySelector('#empWork').addEventListener('click',(e)=>{
		console.log('btn empNo ::',e.target.dataset.empNo);
		chkEmpNo = e.target.dataset.empNo;
		
		// ajax 동기로 jsonWorkList 가져오기
		listAndDisp(e.target.dataset.empNo);
		
		console.log('empNamePos ::',empNamePos);
		let empLbl = document.querySelector('#empLbl'); 
		empLbl.innerHTML = '- '+empNamePos;
		empLbl.style.display = 'inline-block';
		
		
	});
	
	for(let i=0; i<empLis.length; i++){
		empLis[i].addEventListener('click',(e)=>{
			console.log('li ::', e.target); // target이 a이거나 i
			console.log('li ::', e.target.href);
			
			e.target.style.backgroundColor = '#D2E0F5';
			
			let targetLi = e.target.parentElement;
			if(!e.target.href){
				targetLi = e.target.parentElement.parentElement;
			}
			
			// target의 index
			let parent = targetLi.parentElement;
			let nodes = [...parent.children];
			let index = nodes.indexOf(targetLi) - 2;	
// 			console.log('idx ::',index); // *51
//				console.log('top ::',empDiv.style.top);	
//				console.log('substr ::',empDiv.style.top.substring(0,empDiv.style.top.length-2));
			console.log('child ::',targetLi.children);
			let empInfo = targetLi.children[0].cloneNode(true);
			let top = Number(empDiv.style.top.substring(0,empDiv.style.top.length-2));

			empInfo.className = '';
			empInfo.style.color = 'black';
			empInfo.style.backgroundColor = 'white';
			empInfo.style.cursor = 'default';
			console.log('empInfo ::',empInfo);
			console.log('empInfo ::',empInfo.className);
//				console.log('click img ::',empImgList[i].afSave);

			empDiv.children[2].children[0].setAttribute('data-emp-no',targetLi.dataset.empNo);

			// 이름 직급 넣기
			console.log('text ?? ::',empInfo.innerText.trim().split(' | ')[0]); 
			empNamePos = empInfo.innerText.trim().split(' | ')[0];
			
			
			if(!empDivFlag){
				empDiv.style.top = -612+(index*51)+51+'px';
				changeTop = index*51;
				
				empDiv.style.display = 'block';
				empDivFlag = true;
				
				empDiv.children[1].appendChild(empInfo);
				if(empImgList[i] != null){
					empDiv.children[0].children[0].src = '${pageContext.request.contextPath }'+
					'/resources/images/'+empImgList[i].afSave;
				}
				
			}else{
				empDiv.style.display = 'none';
				empDivFlag = false;
				
				empDiv.children[1].innerHTML = '';
				empDiv.children[0].children[0].src = imgSrc;
				
			}
		});
	}
	
	
	

	
	// e.target이 tr의 자식인 td라서 todayTr의 아무 자식 요소를 매개변수로 넘기면 됨.
	console.log('tar',todayTr.children[0]);
	addCell(todayTr.children[0]);
	
	// workDiv 클릭 시 수정 모달에 데이터 넣기
	let workDivs = document.querySelectorAll('.workDiv');
	console.log('cellchk',workDivs);
	
	for(let i=0; i<workDivs.length; i++){
		
		workDivs[i].addEventListener('click',(e)=>{
			console.log('div chk',e.target,e.target.dataset.listIdx);
			
			let data = workList[e.target.dataset.listIdx];

			let modMonth = data['workDate'].substring(5,6);
			let modDate = data['workDate'].substring(7,8);
			
			if(modMonth.length == 1) { modMonth = '0'+modMonth; }
			if(modDate.length == 1) { modDate = '0'+modDate; }
			
			let modResult = data['workDate'].substring(0,4)+'-'+modMonth+'-'+modDate;
			document.querySelector('#modDate').value = modResult;
			console.log('data',modResult);
			
			let time = data['workStart'];
			let modHour = time.split(':')[0];
			let modMinute = time.split(':')[1];
			
			for(let i=7; i<24; i++){
				let option = document.createElement("option");
				
				if(i < 10){
					if(i == modHour){
						option.setAttribute('selected','selected');
					}
					option.innerHTML = '0'+i;
				}else{
					if(i == modHour){
						option.setAttribute('selected','selected');
					}
					option.innerHTML = i;
				}
				
				document.querySelector('#modHour').appendChild(option);
			}

			for(let i=0; i<60; i++){
				let option = document.createElement("option");
				
				if(i < 10){
					if(i == modMinute){
						option.setAttribute('selected','selected');
					}
					option.innerHTML = '0'+i;
				}else{
					if(i == modMinute){
						option.setAttribute('selected','selected');
					}
					option.innerHTML = i;
				}
				
				document.querySelector('#modMinute').appendChild(option);
			}		
			
			let status = document.querySelector('#modStatus').children;
			
			for(let i=0; i<status.length; i++){
				if(status[i].innerHTML == data['workType']){
					status[i].selected = true;
				}
			}
			
			if(data['workMemo'] == null){
				data['workMemo'] = '';
			}
			document.querySelector('#modMemo').value = data['workMemo'];
		});
	}		
	
	// 수정 모달 삭제 버튼
	document.querySelector('#delChkBtn').addEventListener('click',(e)=>{
		
		// 사유 체크
		if(checkReason('#modReason')){
			// 삭제 확인 모달 열기
			console.log('열기 체크');
			document.querySelector('#delBtn').click();
		}else{
			alert('변경 사유를 입력해주세요.');
			document.querySelector('#modReason').focus();
		}
	});
	
	document.querySelector('#realDel').addEventListener('click',()=>{
		console.log('삭제 진행');
	});
	
	// 수정 모달 저장 버튼
	document.querySelector('#modBtn').addEventListener('click',()=>{
		
		// 사유 체크
		if(checkReason('#modReason')){
			console.log('변경 진행');
			
		}else{
			alert('변경 사유를 입력해주세요.');
			document.querySelector('#modReason').focus();
		}			
	});
	
	// empDiv 닫기
	window.addEventListener('click',(e)=>{
//			console.log('click e ::',empDivFlag,e.target);
//			console.log('click ee ::',e.target.classList,e.target.classList.contains('empLi'));
		
//			if(e.target != empDiv && empDivFlag){
//				empDiv.style.display = 'none';
//				empDivFlag = false;
//			}
		// window 다른 곳 클릭했을 때 div 닫고싶은데
	});
	
});
// DOM end



	function makeAcc(){
		weekTime = '00h 00m';
		weekRest = '40h 00m';
		weekOver = '00h 00m';
		monthTime = '00h 00m';
		document.querySelector('#weekTime').innerHTML = weekTime;
		document.querySelector('#weekRest').innerHTML = weekRest;
		document.querySelector('#weekOver').innerHTML = weekOver;		
		document.querySelector('#monthTime').innerHTML = monthTime;		
		
		// accDate 일자에 값 넣기
		// new Date(2023, 4, param).getDate(); (param - 0=last day, 1=first day)
		let accDates = document.querySelectorAll('.accDate');
		
		// month는 -1 해서 구해야 함.
		let firstDate = new Date(now.getFullYear(), now.getMonth(), 1).getDay();
		let lastDay = new Date(now.getFullYear(), now.getMonth(), 0);
		
		let accStarts = document.querySelectorAll('.accStart');
		let accEnds = document.querySelectorAll('.accEnd');
		let accTimes = document.querySelectorAll('.accTime');
		let accDtls = document.querySelectorAll('.accDtl');
		let accMods = document.querySelectorAll('.accMod');
		
		let accDateStr = ''; // '01 토'
		
		// accTr 초기화
// 		console.log('accstart ::',accDates);
// 		console.log('accstart ::',accStarts);
// 		console.log('accstart ::',accStarts[0]);
		for(let i=0; i<accDates.length; i++){
// 			console.log('accstart ::',accStarts[i]);
// 			console.log('accstart ::',accStarts[i].innerHTML);
			accStarts[i].innerHTML = '';
			accEnds[i].innerHTML = '';
			accTimes[i].innerHTML = '';
			accDtls[i].innerHTML = '';
			accMods[i].innerHTML = '';
		}
		
		for(let i=0; i<accDates.length; i++){
			
			if((i+1)<10){
				accDateStr = '0'+(i+1)+' '+week[(Number(firstDate)+i)%7];
			}else{
				accDateStr = (i+1)+' '+week[(Number(firstDate)+i)%7];
			}
			
			// td의 부모 tr에 '20230410' 날짜값 넣어놓기.
			accDates[i].parentElement.setAttribute('data-save', dispYear+dispMonth+accDateStr.substring(0,2));

			accDates[i].innerHTML = accDateStr;
			
			let startVO;
			
			// acc tr td에 workList의 값 넣기
			for(let j=0; j<workList.length; j++){
				
// 				console.log('acc chk', dispYear+dispMonth+accDateStr,workList[j]['workDate'],dispYear+dispMonth+accDateStr==workList[j]['workDate']);
				if(dispYear+dispMonth+accDateStr.substring(0,2) == workList[j]['workDate']){
					
					let vo = workList[j];
					
// 					console.log('vo',vo['workStart']);
					if(vo['workType'] == '업무'){ // accStart 업무 시작
						accStarts[i].innerHTML = vo['workStart'];
					
						// 출근 vo 저장해 놓고 총 근무시간 계산에 사용. workType으로도
						// 정렬이 되어있어서 '업무' 항목이 앞에 있음.
						startVO = vo;
					}
					
					if(vo['workType'] == '업무종료'){ // accEnd 업무 종료
						// accTime 총 근무시간
						// 시간 기록을 전부 'workStart'로 통일 
						let timeStr = calTime(startVO['workStart'], vo['workStart'],0);
						accTimes[i].innerHTML = timeStr;
						
// 						console.log('calWeek time', timeStr);
						calWeek(timeStr, vo['workDate']);
							
						accEnds[i].innerHTML = vo['workStart'];
						
						// accDtl 근무시간 상세. 18-22시: 연장, 22-24: 야간
						// 기본 7h 40m 0s / 연장 0h 44m 31s / 야간 0h 0m 0s
						let normal;
						let extend = '00h 00m';
						let night = '00h 00m';
						
						if(Number(vo['workStart'].split(':')[0]) > 22){ // 야간 근무
							night = calTime("22:00",vo['workStart'],0);
							extend = '04h 00m';
							
							weekOver = calTime(weekOver, calTime(night,extend), 1);
							
						}else if(Number(vo['workStart'].split(':')[0]) > 18){ // 연장 근무만 있는 경우
							extend = calTime('18:00',vo['workStart'],0);
						
							weekOver = calTime(weekOver, extend, 1);
						}				
						
// 						accDtls[i].innerHTML = '기본 '+calTime( calTime(timeStr,extend,2),night,2 )???
						accDtls[i].innerHTML = '기본 '+calTime( night,calTime(extend,timeStr,2),2 )
							+' / 연장 '+extend+' / 야간 '+night;
// 						console.log('Times',startVO['workStart'], vo['workStart'],vo['workDate']
// 							, timeStr,calTime( calTime(timeStr,extend,2),night,2 ),
// 							calTime(timeStr,extend,2));
						
						document.querySelector('#weekOver').innerHTML = weekOver;
					}
					
					// accMod 변경사항
				}
				
			}		
		}	
	}
	
	// 시간 계산 - '3h 21m' 반환 // num 0(13:22), 1(02h 31m), 2(02h 31m 빼기)
	function calTime(p_start, p_end, p_num){
		
		if(p_num == 0){
			let sh = p_start.split(':')[0];
			let sm = p_start.split(':')[1];
			let eh = p_end.split(':')[0];
			let em = p_end.split(':')[1];
			
			let calHour = Number(eh)-Number(sh);
			
			// 분 계산 - 나오지 않도록 수정
			let calMinute = Number(em)-Number(sm);
			if(calMinute < 0){
				calMinute += 60;
				calHour--;
			}
			
	// 		let timeMinute = calHour*60.. 
				
			if(calMinute.toString().length == 1){
				calMinute = '0'+calMinute;
			}
			
			if(calHour.toString().length == 1){
				calHour = '0'+calHour;
			}
			
			return calHour+'h '+calMinute+'m';
			
		}else if(p_num == 1){
			let sh = Number(p_start.substring(0,2));
			let sm = Number(p_start.substring(4,6));
			let eh = Number(p_end.substring(0,2));
			let em = Number(p_end.substring(4,6));
			
			let calHour = eh+sh;
			
			// 분 계산 - 나오지 않도록 수정
			let calMinute = em+sm;
			if(calMinute > 59){
				let plusHour = Math.floor(calMinute / 60);
				
				calHour += plusHour;
				calMinute %= 60;
			}
			
			if(calMinute.toString().length == 1){
				calMinute = '0'+calMinute;
			}
			
			if(calHour.toString().length == 1){
				calHour = '0'+calHour;
			}			
			
			return calHour+'h '+calMinute+'m';
			
		}else{
			let sh = Number(p_start.substring(0,2));
			let sm = Number(p_start.substring(4,6));
			let eh = Number(p_end.substring(0,2));
			let em = Number(p_end.substring(4,6));
			
			let calHour = eh-sh;
			
			// 분 계산 - 나오지 않도록 수정
			let calMinute = em-sm;
			if(calMinute < 0){
				calMinute += 60;
				calHour--;
			}
			
			if(calMinute.toString().length == 1){
				calMinute = '0'+calMinute;
			}
			
			if(calHour.toString().length == 1){
				calHour = '0'+calHour;
			}			
			
			return calHour+'h '+calMinute+'m';			
		}
	}
	
	function calWeek(p_time, p_date){
		// 이번 주 누적, 이번 주 잔여, 이번 달 누적 수정.
		monthTime = calTime(monthTime,p_time,1);
		
		// 이번 주는 따로 처리
		// 주차 나타내는 곳이.. weekCount. 1~7, 8~14
// 		console.log('weekCount ::',weekCount);
		
		let checkDate = ''+year+month+(1+(weekCount-1)*7);
		if(1+(weekCount-1)*7 < 10){
			checkDate = ''+year+month+'0'+(1+(weekCount-1)*7);
		}
		
		let checkDate2 = ''+year+month+(7+(weekCount-1)*7);
		if(7+(weekCount-1)*7 < 10){
			checkDate2 = ''+year+month+'0'+(7+(weekCount-1)*7);
		}
		console.log('checkDate ::',checkDate,checkDate2);
		
		if(p_date >= checkDate && p_date <= checkDate2){
			console.log('true ::',p_time);
			weekTime = calTime(weekTime,p_time,1);
			weekRest = calTime(p_time,weekRest,2);
		}
// 		console.log('rest',weekRest);
		
		// 잔여가 -로 되면 00h 00m으로 표시.
		if(Number(weekRest.substring(0,2)) < 0){
			weekRest = '00h 00m';
		}
		
		console.log('weekTime chk ::',weekTime);
		document.querySelector('#weekTime').innerHTML = weekTime;
		document.querySelector('#weekRest').innerHTML = weekRest;
		document.querySelector('#monthTime').innerHTML = monthTime;
	}
	
	function makeWorkList(p_workList){
		
		// jsonWorkList - parse - 오늘 근무 골라서 출력하기
// 		console.log('jwL',p_workList);
		workList = [];
		
		for(let i=0; i<p_workList.length; i++){
			workList.push(JSON.parse(p_workList[i]));
		}
		console.log('wL 출력',workList);
		
		// 다중 조건으로 정렬하기. ||(OR연산자)를 사용해서 앞의 값이 0이 나오는 경우
		// 두 번째 조건으로 다시 정렬하게 됨.
		// +) 문자열 정렬은 '-' 대신 localeCompare() 사용
		workList.sort((a,b)=>{
			return a['workDate'] - b['workDate'] || a['workType'].localeCompare(b['workType']);
		});
		console.log('wL 정렬',workList);
		
// 		console.log('session chk ::',workList[0].empNo);
		console.log('session chk ::','${SessionInfo.empNo}');
		if(workList.length != 0 && workList[0].empNo == '${SessionInfo.empNo}'){
			makeTodayList(year+month+date);
		}
		
	}		
	
	function makeTodayList(p_date){
		todayWorks = [];
		
		//console.log('chk',workList[4]['workDate'],year+month+date,workList[4]['workStart']);
		for(let i=0; i<workList.length; i++){
			// 날짜 일치 && 타입 체크 (같은 날에 업무, 업무종료가 두 개 이상 들어가지 않게 해야 함.)
			if(workList[i]['workDate'] == p_date){
				
				if(workList[i]['workType'] == '업무'){
					todayWorks.push(workList[i]);
					
					startWorkIdx = i;
					
					if(p_date == year+month+date){
						// 오늘 출근 표시.
						let time = workList[i]['workStart'];
						startDisp(time.split(':')[0], time.split(':')[1], 0);
						
						// 업무상태 변경 + empLi 변경
						statusBtn.innerHTML = workList[i]['workType'];
						
						let empLis = document.querySelectorAll('.empLi');
						for(let j=0; j<empLis.length; j++){
							if(empLis[j].dataset.empNo == '${SessionInfo.empNo}'){
								console.log('idx ::',j,empLis[j]);
								let iTag = empLis[j].children[0].children[0];
								iTag.classList.remove('text-warning');
								iTag.classList.add('text-success');
								
								console.log('txt ::',empLis[j].children[0].innerText);
								let font = empLis[j].children[0].children[1];
								font.innerHTML = font.innerHTML.split(' | ')[0] + ' | 업무 중';
							}
						}
					}
				}
				
				if(workList[i]['workType'] == '업무종료'){
					todayWorks.push(workList[i]);
					
					endWorkIdx = i;
					
					if(p_date == year+month+date){
						// 오늘 퇴근 표시.
						let time = workList[i]['workStart'];
						startDisp(time.split(':')[0], time.split(':')[1], 1);
						
						// 업무상태 변경 + empLi 변경
						statusBtn.innerHTML = workList[i]['workType'];
						
						let empLis = document.querySelectorAll('.empLi');
						for(let j=0; j<empLis.length; j++){
							if(empLis[j].dataset.empNo == '${SessionInfo.empNo}'){
								console.log('idx ::',j,empLis[j]);
								let iTag = empLis[j].children[0].children[0];
								iTag.classList.remove('text-success');
								iTag.classList.add('text-danger');
								
								console.log('txt ::',empLis[j].children[0].innerText);
								let font = empLis[j].children[0].children[1];
								font.innerHTML = font.innerHTML.split(' | ')[0] + ' | 업무 종료';
							}
						}
					}
				}
			}
		}		
	}	

	
	function checkReason(p_selector){
		if(document.querySelector(p_selector).value == null || document.querySelector(p_selector).value == ''){
			console.log('ret false');
			return false;
		}
		console.log('ret true');
		return true;
	}
	
	let now = new Date();
	let week = ['일', '월', '화', '수', '목', '금', '토'];
	
	let monthStr = '';
	if((now.getMonth()+1).toString().length == 1){ 
		monthStr = '0'+(now.getMonth()+1);
	}else{
		monthStr = now.getMonth()+1;
	}
	
	let dStr = '';
	if(now.getDate().toString().length == 1){ 
		dStr = '0'+now.getDate();
	}else{
		dStr = now.getDate();
	}

	year = now.getFullYear();
	month = monthStr;
	date = dStr;
	
	dispYear = year;
	dispMonth = month;
		
	let dateStr = year+'-'+month+'-'+date+'('+week[now.getDay()]+')';
	
	let dateDisp = document.querySelector('#dateDisp');
	dateDisp.innerHTML = dateStr;	
	
	function showTime(){
		now = new Date();
		
		let timeDisp = document.querySelector('#timeDisp');
		let timeStr = "";
        
		if(now.getHours().toString().length == 1){
			timeStr += '0'+now.getHours()+':';
			hour = '0'+now.getHours();
		}else{
			timeStr += now.getHours()+':';
			hour = now.getHours();
		}
		
		if(now.getMinutes().toString().length == 1){
			timeStr += '0'+now.getMinutes()+':';
			minute = '0'+now.getMinutes();
		}else{
			timeStr += now.getMinutes()+':';
			minute = now.getMinutes();
		}
		
		if(now.getSeconds().toString().length == 1){
			timeStr += '0'+now.getSeconds();
		}else{
			timeStr += now.getSeconds();
		}
		
		timeDisp.innerHTML = timeStr;
	}
	
	// 출퇴근 시간 표시
	let workTimeDisps = document.querySelectorAll('.workTimeDisp');
	
	
	// 출근하기
	document.querySelector('#startBtn').addEventListener('click', () => {
		makeWork(0);
	});
	// 퇴근하기
	document.querySelector('#endBtn').addEventListener('click', () => {
		makeWork(1);
	});
	
	function makeWork(p_num){ // 0: 출근, 1: 퇴근 

		let workType;
		
		if(p_num == 0){
			// 출근시간 있는 경우 출근 버튼 X
			if(workTimeDisps[0].children[0].innerHTML.length > 3){
				alert('출근시간이 이미 저장되어 있습니다.');
				return;
			}
			
			workType = '업무';
		}else{
			if(workTimeDisps[1].children[0].innerHTML.length > 3){
				alert('퇴근시간이 이미 저장되어 있습니다.');
				return;
			}			
			
			workType = '업무종료';
		}
		
		let jsonData = {
			  "empNo":${SessionInfo.empNo}	/* 사원번호 */
			, "workType":workType
			, "workDate":year+month+date
			, "workTime":""
			, "workStart":hour+':'+minute	
			, "workEnd":""	
			, "workMemo":""
		};
		
		let promise = new Promise((resolve, reject) => {
			let result = insertWork(jsonData); 
			
	        resolve(result);
		});

		promise.then((p_result) => {
			if(p_result == 200){
				startDisp(hour, minute, 0);
				
// 				console.log('pro no ::',workList[0].empNo);
				listAndDisp('${SessionInfo.empNo}');
				
				// 업무상태 변경 + empLi 변경
				statusBtn.innerHTML = workType;
				
				let empLis = document.querySelectorAll('.empLi');
				for(let j=0; j<empLis.length; j++){
					if(empLis[j].dataset.empNo == '${SessionInfo.empNo}'){
						if(workType == '업무'){
							console.log('idx ::',j,empLis[j]);
							let iTag = empLis[j].children[0].children[0];
							iTag.classList.remove('text-warning');
							iTag.classList.add('text-success');
							
							console.log('txt ::',empLis[j].children[0].innerText);
							let font = empLis[j].children[0].children[1];
							font.innerHTML = font.innerHTML.split(' | ')[0] + ' | 업무 중';
						}else{
							console.log('idx ::',j,empLis[j]);
							let iTag = empLis[j].children[0].children[0];
							iTag.classList.remove('text-success');
							iTag.classList.add('text-danger');
							
							console.log('txt ::',empLis[j].children[0].innerText);
							let font = empLis[j].children[0].children[1];
							font.innerHTML = font.innerHTML.split(' | ')[0] + ' | 업무 종료';
						}
					}
				}				
			}
		});				
	}
	
	// workList를 다시 가져오고 나서 cell에 출력
	function listAndDisp(p_empNo){
		// 먼저 workList를 다시 가져오고 나서 cell에 출력
		let result;
		// []는 List로 받아야 함. {}로 수정.
// 		let data = [
// 			{"empNo":p_empNo}
// 		];
		let data = {
			"empNo":p_empNo
		};
		
        let xhr = new XMLHttpRequest();
        xhr.open('post','/work/workList',true);
        xhr.onreadystatechange = ()=>{
            if(xhr.readyState == 4 && xhr.status == 200){
				
				let jsonWorkList = xhr.responseText;
				jsonWorkList = JSON.parse(jsonWorkList);
//					console.log('ajax jwl',JSON.parse(jsonWorkList));
				
            	makeWorkList(jsonWorkList);
            	
            	workDisp(year+month+date);
            	makeAcc();
            }
        }
        xhr.setRequestHeader("Content-Type", "application/json");  
        console.log('json st data ::',JSON.stringify(data));
		xhr.send(JSON.stringify(data)); // post json 방식일 때		
	}
	
	function startDisp(p_hour, p_minute, p_num){
		
		if(p_num == 0){ // 출근
			workTimeDisps[0].innerHTML = '<strong>'+p_hour+':'+p_minute+'</strong>';
		}else{ // 퇴근
			workTimeDisps[1].innerHTML = '<strong>'+p_hour+':'+p_minute+'</strong>';
		}
	}
	
	// 퇴근하기
	
	// 업무상태 변경
	let statusBtn = document.querySelector('.statusBtn');
	let workDrops = document.querySelectorAll('.workDrop');
	
	for(let i=0; i<workDrops.length; i++){
		workDrops[i].addEventListener('click',function(e){
			
			statusBtn.innerHTML = e.target.innerHTML;
		});
	}
	
	// 주차 기준 : 1-7일(1주차), 8-14(2주차), ...
	// collapse 날짜에 따라 주차 선택 기능 추가하기
	// button class(collapsed) aria-expanded(false) / class('') (true)
	// div class('') / (show)
	let weekCount;
	
	if(now.getDate()<8){ weekCount = 1; }
	else if(now.getDate()<15){ weekCount = 2; }
	else if(now.getDate()<22){ weekCount = 3; }
	else if(now.getDate()<29){ weekCount = 4; }
	else{ weekCount = 5; }
	
	let heading = document.querySelector(`#heading\${weekCount}`);
	
	heading.children[0].ariaExpanded = 'true';
	heading.children[0].classList.remove('collapsed');
	
	heading.parentElement.children[1].classList.add('show');
	
	let monthChanges = document.querySelectorAll('.monthChange');
	for(let i=0; i<monthChanges.length; i++){
		
		// 월 변경 monthChange 마우스오버 
		monthChanges[i].addEventListener('mouseover', (e)=>{
			e.target.style.color = '#41BAFF';
		});
		
		monthChanges[i].addEventListener('mouseout', (e)=>{
			e.target.style.color = '#000000';
		});
		
		// 월 변경 기능 추가하기
		monthChanges[i].addEventListener('click', (e)=>{
			if(i == 0){ // 월 앞으로 이동.
				
// 				console.log('월 앞으로 이동');
			}else{
				
			}
		});
	}
	
	
	// 아코디언 마우스오버 처리(cell) - 함수로 만들어서 append할 때 이벤트 추가해 줌.
	function addCellEvent(){
		
		let cellDivs = document.querySelectorAll('.cellDiv');
		for(let i=0; i<cellDivs.length; i++){
			
			// cell에 클래스 추가
			for(let j=0; j<cellDivs[i].children.length; j++){
				cellDivs[i].children[j].setAttribute('data-bs-toggle','modal');
				cellDivs[i].children[j].setAttribute('data-bs-target','#primary-header-modal');
			}
			
			cellDivs[i].addEventListener('mouseover', (e) => {
				
		// 		console.log('mouse',e.target.id);
				if(e.target.className == 'cellDiv'){ return; }
				if(e.target.className == 'workDiv'){ return; }
				
// 				e.target.style.backgroundColor = '#EEEEEE';
				e.target.style.backgroundColor = '#b8ffd9';
			});	
			cellDivs[i].addEventListener('mouseout', (e) => {
				
				if(e.target.className == 'cellDiv'){ return; }
				if(e.target.className == 'workDiv'){ return; }
				
				e.target.style.backgroundColor = '#ffffff';
			});	
			
			// cell 클릭 - 모달 inputDate에 선택한 날짜와 시간 넣기
			cellDivs[i].addEventListener('click', (e) => {
				if(e.target.className == 'workDiv'){ return; }
				
// 				console.log('data',Number(e.target.dataset.hour));
				let selectHour = Number(e.target.dataset.hour);
				let selectMinute = e.target.dataset.minute;
				
				// 부모*4의 인덱스 찾아서 -1 한 tr의 일자 값 가져오기
				let preParent = e.target.parentElement.parentElement.parentElement.parentElement;
				let nodes = [...preParent.parentElement.children];
				let index = nodes.indexOf(preParent);
// 				console.log('idx chk',index);

				let dateVal = nodes[index - 1].children[0].innerHTML;
				dateVal = dateVal.substring(0, dateVal.length-2);
				
				// input date 설정
				let inputDate = document.querySelector('#inputDate');
				inputDate.value = year+'-'+month+'-'+dateVal;

				let inputHour = document.querySelector('#inputHour');
				let inputMinute = document.querySelector('#inputMinute');
				
				inputHour.innerHTML = '';
				inputMinute.innerHTML = '';
				
				// 시간 분 설정
				for(let i=7; i<24; i++){
					let option = document.createElement("option");
					
					if(i < 10){
						if(i == selectHour){
							option.setAttribute('selected','selected');
						}
						option.innerHTML = '0'+i;
					}else{
						if(i == selectHour){
							option.setAttribute('selected','selected');
						}
						option.innerHTML = i;
					}
					
					inputHour.appendChild(option);
				}
				
				for(let i=0; i<60; i++){
					let option = document.createElement("option");
					
					if(i < 10){
						if(i == selectMinute){
							option.setAttribute('selected','selected');
						}
						option.innerHTML = '0'+i;
					}else{
						if(i == selectMinute){
							option.setAttribute('selected','selected');
						}
						option.innerHTML = i;
					}
					
					inputMinute.appendChild(option);
				}
			});
		}
	}
	
	// 아코디언 마우스오버 처리(accTr)
	let accTrs = document.querySelectorAll('.accTr');
	for(let i=0; i<accTrs.length; i++){
		
		accTrs[i].addEventListener('mouseover', (e) => {
			
// 			console.log('child',e.target,e.parent());
			e.target.parentElement.style.backgroundColor = '#D7EBFF';
		});	
		accTrs[i].addEventListener('mouseout', (e) => {
			
			e.target.parentElement.style.backgroundColor = '#ffffff';
		});	
		
		// 일별 cell div 띄우기
		accTrs[i].addEventListener('click', (e) => {
// 			console.log('flag',cellFlag);
			if(cellFlag){ // true인 경우 cell div 닫기
				removeCell(e.target);
			
			}else{ 
				console.log('tar22',e.target);
				addCell(e.target);
			}
		});	
	}
	
	// 페이지 로드 시 오늘 날짜에 cell 띄우도록 함수로 만듦.
	function addCell(myTarget){
		
		// 원하는 위치로 append 하려면 먼저 append를 하고나서 원하는 위치 다음의 모든 요소들을 다시
		// append 해서 붙인 요소 뒤로 옮긴다.
		let weekTable = myTarget.parentElement.parentElement;
		
		// target의 부모(tr)의 인덱스 찾기(전개 연산자?)
		let nodes = [...myTarget.parentElement.parentElement.children];
		let index = nodes.indexOf(myTarget.parentElement);
		
		// table 태그에는 tbody가 자동으로 포함돼서 children의 children으로 잡아야 함.
		let addTag = document.querySelector('#addTag').children[0].children[0].cloneNode(true);
// 		addTag.style.display = 'block';
		
		// appendChild를 하면 그 요소가 해당 위치로 이동됨. 복사를 하고싶으면 cloneNode를 먼저 
		// 써야함. 그리고 해당 요소의 children까지 복제하려면 (true)
		weekTable.appendChild(addTag);
		
		addCellEvent();
		
		console.log('target',myTarget,myTarget.parentElement.dataset.save);
		// cellDiv에 근무 데이터 출력(출근만)
		workDisp(myTarget.parentElement.dataset.save);
		
		for(let i=index+1; i<nodes.length; i++){
			weekTable.appendChild(nodes[i]);
		}
		
		cellFlag = true;		
	}
	
	function workDisp(p_date){
		
		console.log('today ::',workList.length, workList[0].empNo , '${SessionInfo.empNo}');
// 		if(workList.length != 0 && workList[0].empNo == '${SessionInfo.empNo}'){
		if(workList.length != 0 && workList[0].empNo == chkEmpNo){
			makeTodayList(p_date);
		}
		
		console.log('today',todayWorks);
		// workDivs의 마지막 세 개를 제외하고 나머지를 지운 뒤 다시 그리자.
		let workDivs = document.querySelectorAll('.workDiv');
		
		for(let i=0; i<workDivs.length-3; i++){
			workDivs[i].remove();
		}
		
		for(let i=0; i<todayWorks.length; i++){
			let startHour = todayWorks[i]['workStart'].split(':')[0];
			let startMinute = todayWorks[i]['workStart'].split(':')[1];
			
			let startIdx = (Number(startHour)-7)*6 + Number(startMinute.substring(0,1));
			
			// cellDiv 닫은 상태에서 출근하면 안 뜰수도? - hide에는 클래스 넣지 말고 append할 때 addClass?
			let cellDiv = document.querySelectorAll('.cellDiv')[0];

			let addWork;
			
			if(todayWorks[i]['workType'] == '업무'){
				addWork = document.querySelector('#workHide').children[0].cloneNode(true);
				addWork.innerHTML += '출근';
				
				// listIdx 추가(대문자 대신 -로 입력하고 부를 때는 listIdx)
				addWork.setAttribute('data-list-idx', startWorkIdx);
				
			}else if(todayWorks[i]['workType'] == '업무종료'){
				addWork = document.querySelector('#workHide').children[1].cloneNode(true);
				addWork.innerHTML += '퇴근　　';
				
				addWork.setAttribute('data-list-idx', endWorkIdx);
				
				// 같은 div에 있으면(시간 같고 십단위 분 같을 때) 출근의 top을 -30으로
// 				if() // 같은 시간으로 등록하는 경우를 보여주지 않을거면 안만들어도...
				
				// 출근 퇴근 잇는 div append
				let addConn= document.querySelector('#workHide').children[2].cloneNode(true);
				
				// style left & width 계산
				// 먼저 출근 시간 가져와야 함.
				let hourData = todayWorks[0]['workStart'].split(':')[0];
				let minuteData = todayWorks[0]['workStart'].split(':')[1];
// 				let startIdx = (Number(startHour)-7)*6 + Number(startMinute.substring(0,1));

				let defaultLeft = 32;
				let plusLeft = (Number(hourData)-7)*38 + Number(minuteData.substring(0,1))*10;
// 				console.log('data',hourData,minuteData.substring(0,1));
				
				let plusWidth = (Number(startHour)-7)*38 + Number(startMinute.substring(0,1))*10;
				
// 				console.log('left',plusLeft);
// 				console.log('width',plusWidth - defaultLeft - plusLeft - 40);
// 				console.log('width',plusWidth , defaultLeft , plusLeft);
				addConn.style.left = (defaultLeft + plusLeft)+'px';
				addConn.style.width = (plusWidth - defaultLeft - plusLeft - 40)+'px';
				
				cellDiv.appendChild(addConn);
			}
			
			addWork.addEventListener('mouseover', (e)=>{
				e.target.style.backgroundColor = '#66BA8E';
				e.target.style.zIndex = Number(e.target.style.zIndex) + 1;
			});
			
			addWork.addEventListener('mouseout', (e)=>{
				e.target.style.backgroundColor = '#78DBA6';
				e.target.style.zIndex = Number(e.target.style.zIndex) - 1;
			});
			
			console.log('idx ::',startIdx);
			cellDiv.children[startIdx].appendChild(addWork);
		}
		
	}
	
	
	
	
	
	
	
	function findListIdx(p_date,p_time){
		
		for(let i=0; i<workList.length; i++){
			
// 			if(workList[i]['workDate'])
		}
	}
	
	function removeCell(myTarget){
		
		// removeTarget을 index로 찾지 말고 cellDiv를 직접 제거하자.
		// 원본도 있어서 All로 찾고 복제 요소 제거하기. - 가 안되네. 한번 consolelog를
		let removeTargets = document.querySelectorAll('.cellTr');
		
		for(let i=0; i<removeTargets.length - 1; i++){
			removeTargets[i].remove();
		}
		
// 		console.log('tar',removeTargets);
		cellFlag = false;		
	}
	
	let inputBtn = document.querySelector('#inputBtn');
	
	inputBtn.addEventListener('click', () => {
// 		console.log('data chk',inputDate.value,inputHour.value,inputMinute.value,inputStatus.value,inputMemo.value);	
		// 업무시작, 종료 구분해서 시간값 넣기
		
		let jsonData = {
			  "empNo":${SessionInfo.empNo}	/* 사원번호 */
			, "workType":inputStatus.value
			, "workDate":inputDate.value	
			, "workTime":""
			, "workStart":inputHour.value+':'+inputMinute.value	
			, "workEnd":""	
			, "workMemo":inputMemo.value
		};
			
		insertWork(jsonData); 
		
		// 모달 닫기
		document.querySelector('#cancelBtn').click();
	});
	
	function insertWork(p_data){
		let result;
		
        let xhr = new XMLHttpRequest();
        xhr.open('post','/work/insert',false);
        xhr.onreadystatechange = (e)=>{
            if(xhr.readyState == 4 && xhr.status == 200){
//             	console.log('res',e.target.response);
            	alert(e.target.response);
            	result = e.target.status;
            }
        }
		xhr.setRequestHeader("Content-Type", "application/json");    		
		xhr.send(JSON.stringify(p_data)); // post json 방식일 때	
		
		return result;
	}
	
	
	

	
	
	
	
	
	
</script>