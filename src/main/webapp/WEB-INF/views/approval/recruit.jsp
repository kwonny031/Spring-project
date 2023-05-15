<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
/* 	height: 24px; */
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
	width: 35%;
    height: 55%;
	background-color: rgb(255, 255, 255);
	color: rgb(65, 64, 63);
}

#content {
	margin-top: 30px;
	margin-bottom: 25px;
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
	width: 30%;
	height: 30%;
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
	padding-top: 10px;
	padding-left: 10px;
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
			<div class="col-2"style="width: 22%;"></div>
			<div class="col-9" id="center">
				<header class="header">
					<h3>채용품의서</h3>
				</header>
				<form action="recruit/insert" method="post" id="recruit" enctype="multipart/form-data">
					<input type="hidden" id="appCode" name="appCode" value="${recruitMo.get(0).recruit.appCode }"/>
					<div class="buttons">
					<c:set value="결재요청" var="name"/>
						<c:if test="${status eq 'u' }"><c:set value="수정하기" var="name"/></c:if>
						<input type="button" class="button1" value="${name }" onclick="f_appModal()"/>
						<input type="button" class="button2" value="임시저장" id="tempst"/>
						<input type="button" class="button3" value="취소" id="cancel" />
						<input type="button" class="button4" id="emp" value="결재정보"/>
					</div>


					<input type="hidden" id="empNo" name="app.empNo" value="${SessionInfo.empNo }" /> 
					<input type="hidden" id="apfCode" name="app.apfCode" value="4" /> 
					<input type="hidden" id="appStatus" name="app.appStatus" value="0" />  
					<input type="hidden" id="appUrgent" name="app.appUrgent" value="" /> 
					<input type="hidden" id="appTitle" name="app.appTitle" value="채용품의서" /> 
					<input type="hidden" id="appYear" name="app.appYear" value="5" />
					<div class="report">
						<h2 style="text-align: center; padding-bottom: 30px;">채용품의서</h2>
						<div class="row" id="firstRow">
							<div class="col-5">
								<table style="width: 100%;">
									<tr>
										<td class="td1">문서번호</td>
										<td class="td2" name="appCode" id="appCode">${recruitMo.get(0).recruit.appCode }</td>
									</tr>
									<tr>
										<td class="td1">부서</td>
										<td class="td2">${SessionInfo.depCode }</td>
									</tr>
									<tr>
										<td class="td1">기안일</td>
										<td class="td2"><input type="text" id="app_date"
											name="app.appDate" readonly="readonly" style="border: 0px;"></td>
									</tr>
									<tr>
										<td class="td1">기안자</td>
										<td class="td2">${SessionInfo.empName }</td>
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
									<div class="col-4">
										<table class="signTb">
											<tr>
												<td rowspan='4' class="td3">결재선</td>
												<td class="td4" id="appLine1" name="apline.apline1" style="height:24px;">
												<c:choose>
													<c:when test="${recruitMo.get(0).apline.aplName.length() != 0}">${recruitMo.get(0).apline.aplName }</c:when>
													<c:otherwise>결재자</c:otherwise>
												</c:choose>
												</td>
											</tr>
											<tr>
												<td rowspan='2' class="td4" height="70px">서명</td>
											</tr>
											<tr>
											</tr>
											<tr>
												<td height="20px"></td>
											</tr>
										</table>
									</div>
									<div class="col-4">
										<table class="signTb">
											<tr>
												<td rowspan='4' class="td3">결재선</td>
												<td class="td4" id="appLine2" style="height:24px;">
												<c:choose>
													<c:when test="${recruitMo.get(1).apline.aplName.length() != 0}">${recruitMo.get(1).apline.aplName }</c:when>
													<c:otherwise>결재자</c:otherwise>
												</c:choose>
												</td>
											</tr>
											<tr>
												<td rowspan='2' class="td4" height="70px">서명</td>
											</tr>
											<tr>
											</tr>
											<tr>
												<td height="20px"></td>
											</tr>
										</table>
									</div>
									<div class="col-4">
										<table class="signTb">
											<tr>
												<td rowspan='4' class="td3">결재선</td>
												<td class="td4" id="appLine3" style="height:24px;">
												<c:choose>
													<c:when test="${recruitMo.get(2).apline.aplName.length() != 0}">${recruitMo.get(2).apline.aplName }</c:when>
													<c:otherwise>결재자</c:otherwise>
												</c:choose>
												</td>
											</tr>
											<tr>
												<td rowspan='2' class="td4" height="70px">서명</td>
											</tr>
											<tr>
											</tr>
											<tr>
												<td height="20px"></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<table border=1 width="100%">
							<tbody id="my-tbody">
								<tr>
									<td rowspan='7' class="td5">인력사항</td>
									<td class="td6">이름</td>
									<td class="td7" colspan='3'><input type="text"
										name="rec.recName" class="input" value="${recruitMo.get(0).recruit.recName }" /></td>
								</tr>
								<tr>
									<td class="td6">주민등록번호</td>
									<td class="td7" colspan='3'>&emsp; ('-'없이 숫자 13자리만 입력하세요.)<input
										type="text" name="rec.recReg" value="${recruitMo.get(0).recruit.recReg }"></td>
								</tr>
								<tr>
									<td class="td6">학적</td>
									<td class="td7">&emsp; 
									<select name="rec.recAcademy"
										class="academy" id="academy"style="height: 40px;">
											<option value="최종학력">== 최종학력==</option>
											<option value="중학교졸업" <c:if test="${recruitMo.get(0).recruit.recAcademy eq '중학교졸업' }">selected</c:if>>중학교졸업</option>
											<option value="고등학교졸업" <c:if test="${recruitMo.get(0).recruit.recAcademy eq '고등학교졸업' }">selected</c:if>>고등학교 졸업</option>
											<option value="대학교재학중" <c:if test="${recruitMo.get(0).recruit.recAcademy eq '대학교재학중' }">selected</c:if>>대학교 재학중</option>
											<option value="대학교졸업" <c:if test="${recruitMo.get(0).recruit.recAcademy eq '대학교졸업' }">selected</c:if>>대학교 졸업</option>
											
									</select>
									</td>
									<td class="td6">전공</td>
									<td class="td7"><input type="text" class="input"
										name="rec.recMajor" value="${recruitMo.get(0).recruit.recMajor }"/></td>
								</tr>
								<tr>
									<td class="td6">전 직장명</td>
									<td class="td7" colspan='3'><input type="text"
										class="input" name="rec.recPcom" value="${recruitMo.get(0).recruit.recPcom }"></td>
								</tr>
								<tr>
									<td class="td6">부서</td>
									<td class="td7"><input type="text" class="input"
										name="rec.recPdep" value="${recruitMo.get(0).recruit.recPdep }"></td>
									<td class="td6">직급</td>
									<td class="td7"><input type="text" class="input"
										name="rec.recPpos" value="${recruitMo.get(0).recruit.recPpos }"></td>
								</tr>
								<tr>
									<td class="td6">근무기간</td>
									<td class="td7" colspan='3'><input type="text"
										class="input" name="rec.recPperiod" value="${recruitMo.get(0).recruit.recPperiod }"></td>
								</tr>
								<tr>
									<td class="td6">이전연봉</td>
									<td class="td7" colspan='3'><input type="text"
										class="input" name="rec.recPann" value="${recruitMo.get(0).recruit.recPann }"></td>
								</tr>


								<tr>
									<td rowspan='5' class="td5">채용내용</td>
									<td class="td6">추천인</td>
									<td class="td7" colspan='3'><input type="text"
										class="input" name="rec.recRec" value="${recruitMo.get(0).emp.empName }"/></td>
								</tr>
								<tr>
									<td class="td6">사유</td>
									<td class="td7" colspan='3'><input type="text"
										class="input" name="rec.recReason" value="${recruitMo.get(0).recruit.recReason }"/></td>
								</tr>
								<tr>
									<td class="td6">부서명</td>
									<td class="td7" colspan='3'>&emsp; <!-- 								<input type="text" class="input" name="rec.depCode" value=""/> -->
										<select name="rec.depCode" class="depCode" id="depCode"
										style="height: 40px;">
											<option value="" selected="selected">== 부서선택 ==</option>
											<option value="DEP2" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP2' }">selected</c:if>>기술지원본부</option>
											<option value="DEP3" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP3' }">selected</c:if>>영업부</option>
											<option value="DEP4" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP4' }">selected</c:if>>관리본부</option>
											<option value="DEP21" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP21' }">selected</c:if>>네트워크기술부</option>
											<option value="DEP22" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP22' }">selected</c:if>>보안기술부</option>
											<option value="DEP31" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP31' }">selected</c:if>>공공사업부</option>
											<option value="DEP32" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP32' }">selected</c:if>>금융사업부</option>
											<option value="DEP33" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP33' }">selected</c:if>>기업사업부</option>
											<option value="DEP41" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP41' }">selected</c:if>>경영지원부</option>
											<option value="DEP42" <c:if test="${recruitMo.get(0).recruit.depCode eq 'DEP42' }">selected</c:if>>재무회계부</option>
									</select>
									</td>
								</tr>
								<tr>
									<td class="td6">직급</td>
									<td class="td7" colspan='3'>&emsp; <!-- 								<input type="text" class="input" name="rec.empPos" value=""/> -->
										<select name="rec.empPos" class="empPos" id="empPos"
										style="height: 40px;">
											<option value="" selected="selected">== 직급 선택 ==</option>
											<option value="사원" <c:if test="${recruitMo.get(0).recruit.empPos eq '사원' }">selected</c:if>>사원</option>
											<option value="대리" <c:if test="${recruitMo.get(0).recruit.empPos eq '대리' }">selected</c:if>>대리</option>
											<option value="과장" <c:if test="${recruitMo.get(0).recruit.empPos eq '과장' }">selected</c:if>>과장</option>
											<option value="차장" <c:if test="${recruitMo.get(0).recruit.empPos eq '차장' }">selected</c:if>>차장</option>
											<option value="이사" <c:if test="${recruitMo.get(0).recruit.empPos eq '이사' }">selected</c:if>>이사</option>
									</select>
									</td>
								</tr>
								<tr>
									<td class="td6">연봉</td>
									<td class="td7" colspan='3'><input type="text"
										class="input" name="rec.recAnn" value="${recruitMo.get(0).recruit.recAnn }"/></td>
								</tr>


							</tbody>
						</table>
						<table class="tb2">
							<tr>
								<td class="tb2-td1">파일첨부</td>
								<td class="tb2-td2">&emsp;&emsp;<input type="file" name="file" id="file" multiple/></td>
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

		<!-- 화면이동시 바로 뜨는 모달창 -->
		<div id="myModal">
			<div id="myCont">
				<h4>결재 상세정보</h4>
				<div id="content">
					<div>
						<table>
							<tr>
								<td id="modalTb1">제목</td>
								<td>채용품의서</td>
							</tr>
							<tr>
								<td id="modalTb1">기안 작성일</td>
								<td><input type="date" id="now_date" readonly /></td>
							</tr>
							<tr>
								<td id="modalTb1">보존연한(년)</td>
								<td><input type="text" id="appDate" name="app.appYear"
									value="5" style="width: 140px;" readonly /></td>
							</tr>
							<tr>
								<td colspan='2' style="text-align: center; height: 50px;"><input
									type="checkbox" name="appUrgent" id="appUrgent" value="1">긴급여부</td>
							</tr>
						</table>

					</div>
				</div>
				<input type="button" value="기안작성" id="mBtn" onclick="f_modalClose()" />
			</div>
		</div>


		<!-- '결재하기'누르면 나오는 모달창 -->
		<div id="appModal">
			<div id="appModalCon">
				<div id="close" onclick="f_modalClose()">X</div>
				<br>
				<h4>&nbsp&nbsp&nbsp기안하기</h4>
				<div id="appContent">
					<table id="pass">
						<tr>
							<td class="keyTd"><img
								src="${pageContext.request.contextPath }/resources/assets/images/key.png"
								alt="키 이미지" id="keyImage"></td>
							<td><input type="password"
								style="border: 0px; text-align: center;" id="Mpassword" /></td>
						</tr>
					</table>
				</div>
				<input type="button" value="기안하기" id="appBtn" onclick="f_pwCheck()" />
			</div>
		</div>



		<!-- ------------------------[조직도 modal]------------------------ -->
<div class="modal-backdrop bckdrop hide" id="modalBack"></div>
<div class="modal-dialog modal-xl" id="modalVacation" data-bs-backdrop="static" aria-labelledby="scroll-long-inner-modal"
	role="dialog" style="display: none;">
	<div class="modal-content">
		<div class="modal-header d-flex align-items-center scroll" style="margin-top: 20px; margin-left:30px;">
			<h4>결재 정보</h4>
			<button type="button" class="btn-close1" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="row">
			<div class="col-4" id="modalBody" style="overflow-y: scroll; height: 300px; ">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
				    <li class="nav-item">
				        <a class="nav-link active" data-bs-toggle="tab" href="#home" role="tab">
				            <span>결재라인</span>
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab">
				            <span>즐겨찾기</span>
				        </a>
				    </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
				    <div class="tab-pane active" id="home" role="tabpanel">
				    <br>
				        <div id="vacationTree"></div>
				    </div>
				    <div class="tab-pane  p-3" id="profile" role="tabpanel" >
				        <h6>&nbsp;임원 라인</h6>
				        <p>&emsp;<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-down-right feather-sm"><polyline points="15 10 20 15 15 20"></polyline><path d="M4 4v7a4 4 0 0 0 4 4h12"></path></svg>송지나, 윤선희, 심효정</p>
				    </div>
				</div>
			
			
				
			</div>
			
			<div class="col-7">
				<table style="width:95%; margin-left: 10px;">
					<thead>
						<tr style="background-color: #f3f1f1; height: 40px;">
							<th style="border:1px solid; border-color: #d6d5d5; width:20%; text-align: center;">순번</th>
							<th style="border:1px solid; border-color: #d6d5d5; width:60%; text-align: center;">성명</th>
							<th style="border:1px solid; border-color: #d6d5d5; width:20%; text-align: center;">삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<input type="hidden" id="apline1" value="" />
						<input type="hidden" id="apline2" value="" />
						<input type="hidden" id="apline3" value="" />
						<input type="hidden" id="apl1" value="" />
						<input type="hidden" id="apl2" value="" />
						<input type="hidden" id="apl3" value="" />
						<tr>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">1</td>
							<td style="border:1px solid; width:60%; text-align: center; border-color: #d6d5d5;" id="container2"></td>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">
								<img src="${pageContext.request.contextPath }/resources/assets/images/close.png" alt="쓰레기통" id="trash1" style="width:23px; margin: 15px;">
							</td>
						</tr>
						<tr>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">2</td>
							<td style="border:1px solid; width:60%; text-align: center; border-color: #d6d5d5;" id="container3"></td>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">
								<img src="${pageContext.request.contextPath }/resources/assets/images/close.png" alt="쓰레기통" id="trash2" style="width:23px; margin: 15px;">
							</td>
						</tr>
						<tr>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">3</td>
							<td style="border:1px solid; width:60%; text-align: center; border-color: #d6d5d5;" id="container4"></td>
							<td style="border:1px solid; width:20%; text-align: center; border-color: #d6d5d5;">
								<img src="${pageContext.request.contextPath }/resources/assets/images/close.png" alt="쓰레기통" id="trash3" style="width:23px; margin: 15px;">
							</td>
						</tr>
					</tbody>
				</table>
				<div style="color:#adadad;">
					<br>
					&emsp;&emsp; ** 조직도에서 클릭한 후 드래그하여 결재선을 추가하세요!
				</div>
			</div>
		</div>
		<div class="empButton">
			<input type="button" id="empBtn" value="결재선 확인"/>
		</div>
		<div class="modal-footer">
		</div>
	</div>
</div>
<!-- ------------------------[조직도 modal end]------------------------ -->


	</body>
	<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->

	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<script>
	
	
	
	
	
	$("#academic").on('change',function(){
		const academic = $("#academic option:selected").val();
		console.log("학적: ", academic);
	});
	
	// 부서명 셀렉트박스
	$("#depCode").on('change',function(){
		const depCode = $("#depCode option:selected").val();
		console.log("부서명: ", depCode);
	});
	
	//임시저장 버튼 클릭이벤트
	$("#tempst").click(function() {
		if (window.confirm("작성을 종료하고 임시저장 하시겠습니까?")) {
			alert("임시저장되었습니다.");
	        console.log("나중에 다시 쓴댜");
			$("#appStatus").val("3");
			$("#recruit").attr("action", "recruit/tempst");
			$("#recruit").submit();
	        } else {
	          console.log("걍 이어서 쓰것댜");
	        }
	});
	
	//취소버튼 클릭이벤트
	$("#cancel").click(function() {
		if (window.confirm("작성을 취소하시겠습니까?")) {
			alert("작성이 취소되었습니다.");
	          console.log("안쓴댜");
	          location.replace("/approval/home");
			
			//$("#vacation").submit();
	        } else {
	          console.log("취소안한댜");
	        }
	});
	
//=================    <<모달창>   ================//
	
	//모달창 기안날짜 오늘날짜로 설정
	document.getElementById('now_date').valueAsDate = new Date();
	
	
	//모달창 보존연한 셀렉트 박스
// 	var period = "";
// 	$("#period").on('change',function(){
// 		period = $("#period option:selected").val();
// 		console.log("보존연한: ", period);
// 	});
	
	var dateValue = $("#now_date").val();
	period = $("#period option:selected").val();

	$('#mBtn').click(function() {
		console.log("dateValue", dateValue)
		$('#app_date').val(dateValue);
		$('#app_year').val(period);
	});
	
	$('input[type=checkbox][name=appUrgent]').change(function(){
		if($(this).is(':checked')){
			$('#appUrgent').val('1');
			var appUrgent = $('#appUrgent').val();
			console.log("appUrgent",appUrgent);
		}
	});
	
//=================    <<모달창>   ================//
	
	
	var recruitForm = $("#recruit");
	var btnName = $(".button1").val();
	$("#appBtn").click(function(){
		var Mpassword = $("#Mpassword").val();
		console.log("Mpassword: ", Mpassword);
		
		$.ajax({
		    type: "POST",
		    url: "/approval/vacation/pwcheck",
		    data: JSON.stringify({"Mpassword": Mpassword}),
		    contentType: "application/json;charset=UTF-8",
		    dataType: "text",
		    success: function(response) {
			        // 전송 성공 시 수행할 작업
				var text = "";
		        if(response == "success"){
			    	console.log("체크: ", response);
			    	alert("기안 제출이 완료되었습니다.");
			    	if(btnName == '결재요청'){
				    	$("#recruit").submit();
			    	}else{
			    		recruitForm.attr("action", "recruit/Modify");
			    		recruitForm.submit();
			    	}
		        	
		        }else{
			        // 전송 실패 시 수행할 작업
		        	alert("회원님의 정보와 일치하지 않습니다.<br>다시 입력해주세요");
			    }
		    }
		    
		   
		});
	});
	
	
//================  << 조직도 모달 >> ===============//
	
// 	let f_empTree = function(){
// 		alert("하이하이");
// 		$("#modalBack").attr("style", "display:block; z-index:400; opacity:0.3");
// 		$("#modalVacation").attr("style", "display:block; z-index:500; position:fixed; top:53%; left:10%; width:450px");
// 	}
	
	//  조직도 그리기
	let json = ${treeJson};
	console.log('json',json);//
	 $('#vacationTree').jstree({
		 'core': {
		     'data': json
		 },
	});	
	
	
	var aplineRankNo = "a,b,c";
	var aplineRankPos = "1,2,3";
	$("#vacationTree").on("select_node.jstree", function(evt, data){
		console.log("클릭...>!");
		const vacationTree = document.querySelector("#vacationTree");
		
		nameSplit = data.node.original.text.split(" ");
		empNo = data.node.original.empNo;
		
		console.log("data : " , data.node.original.text);
		console.log("data : " , data.node.original.empNo);
		var data = data.node.original.empNo; 
		var count = 0;
		const container2 = document.querySelector("#container2");

		container2.addEventListener("dragover", (e) => {
			e.preventDefault();
		});
		
		container2.addEventListener("drop", (e) => {
			e.preventDefault();
			console.log("드래그 요소가 '두' 번째 박스 영역에 드롭");

			console.log("컨테이너 2로 넘어온  : " + empNo);
			console.log("컨테이너 2로 넘어온  : " + nameSplit[1]);
			
			count++;	// 1: 첫번째 결재자 등록, 2: 두번째 결재자 등록, 3: 세번째 결재자 등록
			$("#container2").text(nameSplit[0]);
			aplineRankNo = aplineRankNo.replace("a", empNo);
			aplineRankPos = aplineRankPos.replace("1", nameSplit[1]);
			console.log("나영이가 확인한다 : " + aplineRankNo);
			console.log("나영이가 확인한다 : " + aplineRankPos);
			console.log();
			if(count == 3){
				$("#recruit").append("<input type='hidden' name='apline.empNo' id='empNo1' value='"+aplineRankNo+"' />");
				$("#recruit").append("<input type='hidden' name='apline.aplPos' id='aplPos1' value='"+aplineRankPos+"' />");
			}
			return;
		});
		
		const container3 = document.querySelector("#container3");

		container3.addEventListener("dragover", (e) => {
			e.preventDefault();
		});
		
		container3.addEventListener("drop", (e) => {
			e.preventDefault();
			
			console.log("컨테이너 3로 넘어온  : " + empNo);
			console.log("컨테이너 3로 넘어온  : " + nameSplit[1]);
			
			count++;	// 1: 첫번째 결재자 등록, 2: 두번째 결재자 등록, 3: 세번째 결재자 등록
			
			console.log("드래그 요소가 '세' 번째 박스 영역에 드롭");
			$("#container3").text(nameSplit[0]);
			aplineRankNo = aplineRankNo.replace("b", empNo);
			aplineRankPos = aplineRankPos.replace("2", nameSplit[1]);
			console.log("나영이가 확인한다 : " + aplineRankNo);
			console.log("나영이가 확인한다 : " + aplineRankPos);
			if(count == 3){
				$("#recruit").append("<input type='hidden' name='apline.empNo' id='empNo1' value='"+aplineRankNo+"' />");
				$("#recruit").append("<input type='hidden' name='apline.aplPos' id='aplPos1' value='"+aplineRankPos+"' />");
			}
			return;
		});
		
		const container4 = document.querySelector("#container4");

		container4.addEventListener("dragover", (e) => {
			e.preventDefault();
		});
		
		container4.addEventListener("drop", (e) => {
			e.preventDefault();
			
			console.log("컨테이너 4로 넘어온  : " + empNo);
			console.log("컨테이너 4로 넘어온  : " + nameSplit[1]);
			
			count++;	// 1: 첫번째 결재자 등록, 2: 두번째 결재자 등록, 3: 세번째 결재자 등록
			
			console.log("드래그 요소가 '넷' 번째 박스 영역에 드롭");
			$("#container4").text(nameSplit[0]);
			aplineRankNo = aplineRankNo.replace("c", empNo);
			aplineRankPos = aplineRankPos.replace("3", nameSplit[1]);
			console.log("나영이가 확인한다 : " + aplineRankNo);
			console.log("나영이가 확인한다 : " + aplineRankPos);
			if(count == 3){
				$("#recruit").append("<input type='hidden' name='apline.empNo' id='empNo1' value='"+aplineRankNo+"' />");
				$("#recruit").append("<input type='hidden' name='apline.aplPos' id='aplPos1' value='"+aplineRankPos+"' />");
			}
			return;
		});
	}
		
	);

	$("#emp").on("click", function(){
		$("#modalBack").attr("style", "display:block; z-index:400; opacity:0.3");
		$("#modalVacation").attr("style", "display:block; z-index:500; position:fixed; top:20%; left:20%; width:800px");
	});
	
	const modalBack = document.getElementById("modalBack");
	const modalTree = document.getElementById("modalTree");
	const treeDetail = document.getElementById("treeDetail");
	const modalVacation = document.getElementById("modalVacation");
	
	$(".btn-close1").on("click",function(){
		modalBack.style.display = "none";
		modalVacation.style.display = "none";
		modalTree.style.display = "none";
		treeDetail.style.display = "none";
// 		$("#modalBack").attr("style", "display:none;");
	});

	//즐겨찾기
	$("#profile").on("click", function(){
		$("#container2").text("윤선희");
		$("#container3").text("송지나");
		$("#container4").text("심효정");
		$("#apline1").val("윤선희");
		$("#apline2").val("송지나");
		$("#apline3").val("심효정");
		$("#apl1").val("20030001");
		$("#apl2").val("20030002");
		$("#apl3").val("20020001");
		var aplineRankNo = '20030001,20030002,20020001';
		var aplineRankPos = '윤선희,송지나,심효정';
		$("#recruit").append("<input type='hidden' name='apline.empNo' id='empNo1' value='"+aplineRankNo+"' />");
		$("#recruit").append("<input type='hidden' name='apline.aplPos' id='aplPos1' value='"+aplineRankPos+"' />");
	});
	
	
	// 조직도 모달에서 쓰레기통 클릭시 이벤트
	$("#trash1").on("click", function(){
		$("#container2").empty();
		console.log("1순위 삭제");
	});
	$("#trash2").on("click", function(){
		$("#container3").empty();
		console.log("2순위 삭제");
	});
	$("#trash3").on("click", function(){
		$("#container4").empty();
		console.log("3순위 삭제");
	});

	//'결재선 확인' 버튼 클릭시 이벤트
	$("#empBtn").on("click", function(){
		var apline1 = $("#apline1").val();
		var apline2 = $("#apline2").val();
		var apline3 = $("#apline3").val();
		
		var apl1 = $("#apl1").val();
		var apl2 = $("#apl2").val();
		var apl3 = $("#apl3").val();
		
		$("#appLine1").html(container2);
		$("#appLine2").html(container3);
		$("#appLine3").html(container4);
		
		var apl1 = $("#aplPos3").val();
		
		var emp1 = $("#empNo1").val();
		var emp2 = $("#empNo2").val();
		var emp3 = $("#empNo3").val();
		console.log("empNo1: ", emp1);
		console.log("empNo2: ", emp2);
		console.log("empNo3: ", emp3);
		console.log("aplPos3: ", apl1);
		
		modalVacation.style.display = "none";
		modalBack.style.display = "none";
		modalTree.style.display = "none";
		treeDetail.style.display = "none";
	});


function f_modalClose(){
	myModal.style.display = "none";
}
const appModal = document.getElementById("appModal");
function f_modalClose(){
	myModal.style.display = "none";
	appModal.style.display = "none";
}
function f_appModal(){
	appModal.style.display = "block";
}
</script>