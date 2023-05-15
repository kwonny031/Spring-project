<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.BufferedReader, java.io.FileReader" %>
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
	width: 40%;
	background-color: #dddddd;
	font-weight: bold;
	font-size: 12pt;
}

.td2 {
	border: 1px solid black;
	width: 60%
}

.td3 {
	border: 1px solid black;
	background-color: #dddddd;
	width: 20%;
	font-weight: bold;
}

.td4 {
	border: 1px solid black;
	width: 80%;
}

.td5 {
	border: 1px solid black;
	background-color: #dddddd;
	font-weight: bold;
	text-align: center;
	font-size: 15pt;
}

.td6 {
	border: 1px solid black;
	background-color: #dddddd;
	width: 15%;
	height: 50px;
	font-weight: bold;
	text-align: center;
	font-size: 13pt;
}

.td7 {
	border: 1px solid black;
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
	border: white;
	width: 100%;
	height: 40px;
}

.academic {
	height: 40px;
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
	margin-bottom: 40px;
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
              href="javascript:void(0)"
            ></a>
            <div class="scrollable" style="height: 100%">
              <div class="p-3">
	              <h3>전자결재</h3>

              </div>
              <div class="divider"></div>
              <ul class="list-group">
                <li>
                  <small class="p-3 grey-text text-lighten-1 db">결재 양식</small>
                </li>
                <li class="list-group-item">
                  <a
                    href="/approval/bisOrd?apfName=order"
                    class="active list-group-item-action d-flex align-items-center" id="order"
                    ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;발주서
                    </a>
                </li>
                <li class="list-group-item">
                	
                <a href="/approval/bisOrd?apfName=business" class="list-group-item-action" id="business" >
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;
				                출장보고서
                    </a>
                </li>
                <li class="list-group-item">
                  <a href="/approval/recruit" class="list-group-item-action d-flex align-items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;
                    	채용품의서
                    </a
                  >
                </li>
                <li class="list-group-item">
                  <a href="/approval/vacation" class="list-group-item-action">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;
                    	휴가신청서
                    	
                  </a>
                </li>
                <li class="list-group-item">
                  <hr />
                </li>
                <li>
                  <small class="p-3 grey-text text-lighten-1 db">결재 문서</small>
                </li>
                <li class="list-group-item">
                  <a href="/approval/aplineList" class="list-group-item-action d-flex align-items-center" id="order">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit feather-sm"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                    	&emsp;결재할 문서
                    	
                  </a>
                </li>
                
                <li class="list-group-item">
                  <a href="/approval/appList" class="list-group-item-action d-flex align-items-center" id="order">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock feather-sm"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    	&emsp;결재진행 문서
                    	
                  </a>
                </li>
                <li class="list-group-item">
                  <a href="/approval/tempstList" class="list-group-item-action">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-package feather-sm"><path d="M12.89 1.45l8 4A2 2 0 0 1 22 7.24v9.53a2 2 0 0 1-1.11 1.79l-8 4a2 2 0 0 1-1.79 0l-8-4a2 2 0 0 1-1.1-1.8V7.24a2 2 0 0 1 1.11-1.79l8-4a2 2 0 0 1 1.78 0z"></path><polyline points="2.32 6.16 12 11 21.68 6.16"></polyline><line x1="12" y1="22.76" x2="12" y2="11"></line><line x1="7" y1="3.5" x2="17" y2="8.5"></line></svg>
                    	&emsp;임시보관함
                  </a>
                </li>
                <li class="list-group-item">
                  <hr />
                </li>
                <li>
                  <small class="p-3 grey-text text-lighten-1 db">완료 문서함</small>
                </li>
                <li class="list-group-item">
                  <a href="/approval/appendList" class=" list-group-item-action d-flex align-items-center" id="order">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle feather-sm"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                    	&emsp;결재 완료 문서
                    	
                  </a>
                </li>
                <li class="list-group-item">
                  <hr />
                </li>
              </ul>
            </div>
          </div>



	<body onload="document.getElementById('myModal').style.display='block'">
		<div class="row" style="padding-top: 50px;">
			<div class="col-2" style="width:22%;"></div>
			<div class="col-9" id="center">
				<header class="header">
					<h3>채용품의서</h3>
				</header>
				<form action="recruit/insert" method="post" id="recruit">
					<div class="buttons">
						<input type="button" class="button1" value="승인하기"  id="confirmBtn"/>
						<input type="button" class="button2" value="반려하기" id="companionBtn"/>
						<input type="button" class="button3" value="나가기" id="cancel" />
					</div>


<%-- 					<input type="hidden" id="empNo" name="app.empNo" value="${SessionInfo.empNo }" />  --%>
<!-- 					<input type="hidden" id="apfCode" name="app.apfCode" value="4" />  -->
<!-- 					<input type="hidden" id="appStatus" name="app.appStatus" value="0" />  -->
<!-- 					<input type="hidden" id="appUrgent" name="app.appUrgent" value="" />  -->
<!-- 					<input type="hidden" id="appTitle" name="app.appTitle" value="채용품의서" />  -->
<!-- 					<input type="hidden" id="appYear" name="app.appYear" value="5" /> -->
					<input type="hidden" id="appCode" name="appCode" value="value="${recruitAppForm.get(0).recruit.appCode }" />
					<div class="report">
						<h2 style="text-align: center; padding-bottom: 30px;">채용품의서</h2>
						<div class="row" id="firstRow">
							<div class="col-5">
								<table style="width: 100%;">
									<tr>
										<td class="td1">문서번호</td>
										<td class="td2"><input type="text" value="${recruitAppForm.get(0).recruit.appCode }"/></td>
									</tr>
<!-- 									<tr> -->
<!-- 										<td class="td1">부서</td> -->
<%-- 										<td class="td2">${SessionInfo.depCode }</td> --%>
<!-- 									</tr> -->
									<tr>
										<td class="td1">기안일</td>
										<td class="td2">${recruitAppForm.get(0).app.appDate }</td>
									</tr>
									<tr>
										<td class="td1">기안자</td>
										<td class="td2">${recruitAppForm.get(0).emp.empName }</td>
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
								<div class="row">
								<c:forEach items="${recruitAppForm }" var="vVO" varStatus="i">
									<div class="col-4">
										<table class="signTb">
											<tr>
												<td rowspan='4' class="td3">결재선</td>
												<td class="td4" id="appLine1" name="apline.apline1">${vVO.apline.aplName }</td>
												<input type="hidden" id="aplResult" name="aplResult" value="${vVO.apline.aplResult }"/>
												<c:set var = "aplResult" value = "${vVO.apline.aplResult }"/>
											</tr>
											<tr>
												<td rowspan='2' class="td4" height="70px">
												<c:if test="${aplResult eq '1'}">
													<img src="/resources/images/${vVO.apline.aplName }.png" alt="" style="width: 86.37px; height:70px;">
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
							</div>
						</div>
						<table border=1 width="100%">
							<tbody id="my-tbody">
								<tr>
									<td rowspan='7' class="td5">인력사항</td>
									<td class="td6">이름</td>
									<td class="td7" colspan='3'>&emsp; ${recruitAppForm.get(0).recruit.recName }</td>
								</tr>
								<tr>
									<td class="td6">주민등록번호</td>
									<td class="td7" colspan='3'>&emsp; ${recruitAppForm.get(0).recruit.recReg }</td>
								</tr>
								<tr>
									<td class="td6">학적</td>
									<td class="td7">&emsp; ${recruitAppForm.get(0).recruit.recAcademy }</td>
									<td class="td6">전공</td>
									<td class="td7">&emsp; ${recruitAppForm.get(0).recruit.recMajor }</td>
								</tr>
								<tr>
									<td class="td6">전 직장명</td>
									<td class="td7" colspan='3'>&emsp; ${recruitAppForm.get(0).recruit.recPcom }</td>
								</tr>
								<tr>
									<td class="td6">부서</td>
									<td class="td7">&emsp; ${recruitAppForm.get(0).recruit.recPdep }</td>
									<td class="td6">직급</td>
									<td class="td7">&emsp; ${recruitAppForm.get(0).recruit.recPpos }</td>
								</tr>
								<tr>
									<td class="td6">근무기간</td>
									<td class="td7" colspan='3'>&emsp; ${recruitAppForm.get(0).recruit.recPperiod }</td>
								</tr>
								<tr>
									<td class="td6">이전연봉</td>
									<td class="td7" colspan='3'>&emsp; ${recruitAppForm.get(0).recruit.recPann }</td>
								</tr>


								<tr>
									<td rowspan='5' class="td5">채용내용</td>
									<td class="td6">추천인</td>
									<td class="td7" colspan='3'>&emsp; ${recruitAppForm.get(0).recruit.recRec }</td>
								</tr>
								<tr>
									<td class="td6">사유</td>
									<td class="td7" colspan='3'>&emsp; ${recruitAppForm.get(0).recruit.recReason }</td>
								</tr>
								<tr>
									<td class="td6">부서명</td>
									<c:choose>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP2'}">
											<td class="td7" colspan='3'>&emsp; 기술지원부</td>
										</c:when>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP3'}">
											<td class="td7" colspan='3'>&emsp; 영업부</td>
										</c:when>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP4'}">
											<td class="td7" colspan='3'>&emsp; 관리본부</td>
										</c:when>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP21'}">
											<td class="td7" colspan='3'>&emsp; 네트워크기술부</td>
										</c:when>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP22'}">
											<td class="td7" colspan='3'>&emsp; 보안기술부</td>
										</c:when>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP31'}">
											<td class="td7" colspan='3'>&emsp; 공공사업부</td>
										</c:when>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP32'}">
											<td class="td7" colspan='3'>&emsp; 금융사업부</td>
										</c:when>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP33'}">
											<td class="td7" colspan='3'>&emsp; 기업사업부</td>
										</c:when>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP41'}">
											<td class="td7" colspan='3'>&emsp; 경영지원부</td>
										</c:when>
										<c:when test="${recruitAppForm.get(0).recruit.depCode == 'DEP42'}">
											<td class="td7" colspan='3'>&emsp; 재무회계부</td>
										</c:when>
									</c:choose>
									
								</tr>
								<tr>
									<td class="td6">직급</td>
									<td class="td7" colspan='3'>&emsp; ${recruitAppForm.get(0).recruit.empPos }</td>
										
								</tr>
								<tr>
									<td class="td6">연봉</td>
									<td class="td7" colspan='3'>&emsp; ${recruitAppForm.get(0).recruit.recAnn }</td>
								</tr>


							</tbody>
						</table>
						<table class="tb2">
							<tr>
								<td class="tb2-td1">파일첨부</td>
								<td><a href="/resources/images/채용품의서 .hwp">채용품의서.hwp </a></td>
							</tr>
						</table>
						<!-- 				<div class="btnGroup"> -->
						<!-- 					<button id="add_row">행 추가하기</button> -->
						<!-- 					<button id="delete_row">행 삭제하기</button> -->
						<!-- 				</div> -->
					</div>
				</form>
			</div>
			<div class="col-1"></div>
		</div>

		


		



		

	</body>
	<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<!-- ===================[ sweetAlert ]================================-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<!-- ===================[ sweetAlert ]================================-->
<script>
$(document).ready(function(){  
    
    
	
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
		    	  if('${recruitAppForm.get(2).apline.empNo }' == '${SessionInfo.empNo}'){
			    	  form.action = '/approval/aplineListTopUpdate';
		    	  }else{
			    	  form.action = '/approval/aplineListUpdate';
		    	  }
		    	  
		    	  const input = document.createElement('input');
		    	  input.type = 'hidden';
		    	  input.name = 'appCode';
		    	  input.value = '${recruitAppForm.get(0).recruit.appCode }';
		    	  
		    	  form.appendChild(input);
		    	  document.body.appendChild(form);
		    	  form.submit();
// 		    	  location.href="/approval/aplineListUpdate?appCode="+${vacationAppForm.get(0).app.appCode }.val();
		    	}, 1000);
		  }
		})
	});
		
	
	//반려하기 버튼 클릭이벤트
	$("#companionBtn").on("click",function(){
		Swal.fire({
			  input: 'textarea',
			  inputLabel: '반려결재의견',
			  inputPlaceholder: '반려 의견을 남겨주세요...',
			  inputId: 'textarea',
			  inputAttributes: {
			    'aria-label': 'Type your message here'
			  },
			  showCancelButton: true
			}).then((result) => {
				if (result.isConfirmed) {
					Swal.fire({
					      icon:'success',
					      title: '결재 반려 완료',
					      timer : 1500,
					      showConfirmButton : false
			    	  })
					    setTimeout(function companion() {
					      const form = document.createElement('form');
				    	  form.method = 'POST';
				    	  form.action = '/approval/companion';
				    	  
				    	  const input1 = document.createElement('input');
				    	  input1.type = 'hidden';
				    	  input1.name = 'appCode';
				    	  input1.value = '${recruitAppForm.get(0).recruit.appCode }';
				    	  
				    	  const input2 = document.createElement('input');
				    	  input2.type = 'hidden';
				    	  input2.name = 'aplComment';
				    	  input2.value = result.value;
				    	  
				    	  form.appendChild(input1);
				    	  form.appendChild(input2);
				    	  document.body.appendChild(form);
				    	  form.submit();
					    	}, 1000);
					  }
			})	
	});
	
	//취소버튼 클릭이벤트
	$("#cancel").click(function() {
		if (window.confirm("결재할 문서 화면으로 이동합니다.")) {
	          console.log("안쓴댜");
	          location.replace("/approval/aplineList");
			
			//$("#vacation").submit();
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