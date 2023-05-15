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
.tb2{
	border: 1px solid black;
	margin-top: 30px;
	width: 100%;
}
.tb2-td1{
	border: 1px solid black;
	background-color: #dddddd;
	height: 50px;
	text-align: center;
	font-weight: bold;
	font-size: 13pt;
}

/* ========첫 모달창=============== */

#myModal{
        position: fixed;
        height: 100%;
        width: 100%;
        left: 0;
        top: 0;
        background-color: rgba(101, 102, 103, 0.5);
        display: none;   /*초기값 안보이게*/
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
#content{
	margin-top: 30px;
	margin-bottom: 25px;
	padding: 30px;
	border: 0.8px solid rgb(161, 160, 160);
}
#modalTb1{
	font-weight: bold;
	width: 50%;
	height: 50px;
}
#mBtn{
	position: relative;
  	left: 35%;
	height: 35px;
	width: 100px;
	background-color: #348ed5;
	border: 1px solid #348ed5;
	color:rgb(255, 255, 255);
	font-style: initial;
	border-radius: 8px;
}

/* =============  결재하기 모달  ================ */
#appModal{
        position: fixed;
        height: 100%;
        width: 100%;
        left: 0;
        top: 0;
        background-color: rgba(101, 102, 103, 0.5);
        display: none;   /*초기값 안보이게*/
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
#appContent{
	margin-top: 30px;
	margin-bottom: 40px;
/* 	padding: 30px; */
}
#pass{
	border: 0.8px solid rgb(161, 160, 160);
	font-weight: bold;
	width: 70%;
	height: 50px;
	text-align:center;
	margin-left:auto; 
    margin-right:auto;
}
#appBtn{
	position: relative;
  	left: 35%;
	height: 35px;
	width: 100px;
	background-color: #348ed5;
	border: 1px solid #348ed5;
	color:rgb(255, 255, 255);
	font-style: initial;
	border-radius: 8px;
}
#close{
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: rgb(161, 160, 160);
}
#keyImage{
	max-width: 70%;
	max-height: 70%;
	filter:invert();
}
.keyTd{
	width: 25%;
	background-color: rgb(177, 176, 176);
	
}
#empBtn{
	position: relative;
  	left: 45%;
	height: 35px;
	width: 100px;
	background-color: #348ed5;
	border: 1px solid #348ed5;
	color:rgb(255, 255, 255);
	font-style: initial;
	border-radius: 8px;
	margin-top: 40px;
}
#modalBody{
	padding-top:10px;
	padding-left:10px;
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
	<div class="col-2" style="width: 22%;"></div>
	<div class="col-9" id="center">
		<header class="header">
			<h3>휴가신청서</h3>
		</header>
			<form action="vacation/insert" method="post" id="vacation" enctype="multipart/form-data">
			<input type="hidden" id="appCode" name="appCode" value="${vacationMo.get(0).vacation.appCode }"/>
		<div class="buttons">
		<c:set value="결재요청" var="name"/>
		<c:if test="${status eq 'u' }"><c:set value="수정하기" var="name"/></c:if>
			<input type="button" class="button1" value="${name }" onclick="f_appModal()"/>
			<input type="button" class="button2" value="임시저장" id="tempst"/>
			<input type="button" class="button3" value="취소" id="cancel" />
			<input type="button" class="button4" id="emp" value="결재정보"/>
		</div>
		
		<div id="appContent">
			<input type="hidden" id="empNo" name="app.empNo" value="${SessionInfo.empNo }"/>
			<input type="hidden" id="apfCode" name="app.apfCode" value="3"/>
			<input type="hidden" id="appStatus" name="app.appStatus" value="0"/>
			<input type="hidden" id="appUrgent" name="app.appUrgent" value=""/>
			<input type="hidden" id="appTitle" name="app.appTitle" value="휴가신청서"/>
			<input type="hidden" id="appYear" name="app.appYear" value="5"/>
			<div class="report">
				<h2 style="text-align: center; padding-bottom: 30px;" id="appTitle" name="app.appTitle" value="휴가신청서">휴가신청서</h2>
					<div class="row" id="firstRow">
						<div class="col-5">
							<table style="width: 100%;">
								<tr>
									<td class="td1">문서번호</td>
									<td class="td2">${vacationMo.get(0).vacation.appCode }</td>
								</tr>
<!-- 								<tr> -->
<!-- 									<td class="td1">부서</td> -->
<%-- 									<td class="td2">${SessionInfo.depCode }</td> --%>
<!-- 								</tr> -->
								<tr>
									<td class="td1">기안일</td>
									<td class="td2" ><input type="text" id="appDate" name="app.appDate" readonly="readonly" style="border: 0px;"></td>
								</tr>
								<tr>
									<td class="td1">기안자</td>
									<td class="td2" >${SessionInfo.empName }</td>
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
												<c:when test="${vacationMo.get(0).apline.aplName.length() != 0}">${vacationMo.get(0).apline.aplName }</c:when>
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
												<c:when test="${vacationMo.get(1).apline.aplName.length() != 0}">${vacationMo.get(1).apline.aplName }</c:when>
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
												<c:when test="${vacationMo.get(2).apline.aplName.length() != 0}">${vacationMo.get(2).apline.aplName }</c:when>
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
								<td class="td3">휴가 종류</td>
								<td class="td4">&emsp; <select name="vacation.vacType" class="reason" id="vacType">
										<option value="연차" selected="selected">연차</option>
										<option value="조퇴">조퇴</option>
										<option value="경조">경조</option>
										<option value="공가">공가</option>
										<option value="질병휴가">질병휴가</option>
								</select>
								</td>
							</tr>
							
							
							<tr>
								<td class="td3">기간 및 일시</td>
								<td class="td4">
									<input type="hidden"  name="vacation.vacStart" id="vacStart" value=""/>
									<input type="hidden" name="vacation.vacEnd" id="vacEnd" value=""/>
									&nbsp;시작일 &nbsp; 
									<select name="yy" id="s_year"></select>년 
									<select name="mm" id="s_month"></select>월
									<select name="dd" id="s_day"></select> 일 
									&nbsp;~&nbsp;
									종료일&nbsp; 
									<select name="yy" id="e_year"></select>년 
									<select name="mm" id="e_month"></select>월 
									<!-- <select name="dd" id="e_day" onchange="change()"></select> 일 -->
									<select name="dd" id="e_day"></select> 일 
									 
<!-- 									사용일수  -->
<!-- 									<input type="text" id="vacDay2" style="width: 100px;" /> -->
								</td>
							</tr>
							<tr>
								<td class="td3">반차 여부</td>
								<td class="td4">
									&emsp; 
									<input type='checkbox' name='startHalf' id="startHalf" value='startHalf' onclick="is_checked()" />
									&nbsp;
									시작일 ( &nbsp;&nbsp; 
									<input type="radio" name="radio1" class="radio1" id="startHalf2am" value="0.5" disable/>&nbsp;&nbsp;오전&nbsp;&nbsp;
									<input type="radio" name="radio1" class="radio2" id="startHalf2pm" value="0.5" />&nbsp;&nbsp;오후
									) &emsp; &emsp; &emsp;
									 
									<input type='checkbox' name='endHalf' id="endHalf" value='endHalf' />&nbsp;&nbsp;
									종료일 (&nbsp;&nbsp; 
									<input type="radio" name="radio2" class="radio3" id="endHalf2am" value="0.5" />&nbsp;&nbsp;오전&nbsp;&nbsp;
									<input type="radio" name="radio2" class="radio4" id="endHalf2pm" value="0.5" />&nbsp;&nbsp;오후
									)
								</td>
							</tr>
							<tr>
								<td class="td3">연차 일수</td>
								<td class="td4">&emsp; 잔여 연차: &nbsp; <input type="text" value="${SessionInfo.empPv }"
									style="width: 100px;" /> &emsp; 신청 일수: &nbsp; <input type="text"
									id="vacDay" name="vacation.vacDay" style="width: 100px;" />
								</td>
							</tr>
							<tr>
								<td class="td3">휴가 사유</td>
								<td class="td4"><textarea class="ta" id="vacContent" name="vacation.vacContent">${vacationMo.get(0).vacation.vacContent }</textarea></td>
							</tr>
							<tr>
								<td class="td3">긴급연락처</td>
								<td class="td4">&emsp;<input type="text" id="vacTel" name="vacation.vacTel" value="${vacationMo.get(0).vacation.vacTel }"></input>&emsp;( '-' 없이 번호만 입력하세요. )&emsp;</td>
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
			</form>
		</div>
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
						<td>휴가신청서</td>
					</tr>
					<tr>
						<td id="modalTb1">작성일</td>
						<td><input type="date" id="now_date" readonly/></td>
					</tr>
					<tr>
						<td id="modalTb1">보존연한(년)</td>
						<td>
							<input type="text" id="appDate" name="app.appYear" value="5" style="width:140px;" readonly />
							

						</td>
					</tr>
					<tr>
						<td colspan='2' style="text-align: center; height: 50px; "><input type="checkbox" name="appUrgent"  value="1">긴급여부</td>
					</tr>
				</table>

			</div>
		</div>
		<input type="button" value="기안작성" id="mBtn" onclick="f_modalClose()"/>
	</div>
</div>

<!-- '결재하기'누르면 나오는 모달창 -->
<div id="appModal">
	<div id="appModalCon">
		<div id="close" onclick="f_modalClose()">X</div><br>
		<h4>&nbsp&nbsp&nbsp기안하기</h4>
		<div id="appContent">
			<table id="pass">
				<tr>
					<td class="keyTd"><img src="${pageContext.request.contextPath }/resources/assets/images/key.png" alt="키 이미지" id="keyImage"></td>
					<td><input type="password" style="border:0px; text-align: center;" id="Mpassword"/></td>
				</tr>
			</table>
		</div>
		<input type="button" value="기안하기" id="appBtn" onclick="f_pwCheck()"/>
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



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script>
$(document).ready(function(){  
	//현재날짜 가져오기
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    
    
    //시작날짜 셀렉박스
    //년도 selectbox만들기               
    for(var i = year ; i <= year+10 ; i++) {
        $('#s_year').append('<option value="' + i + '">' + i + '</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#s_month').append('<option value="' + mm + '">' + mm + '</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#s_day').append('<option value="' + dd + '">' + dd+ '</option>');    
    }
    $("#s_year  > option[value="+year+"]").attr("selected", "true");        
    $("#s_month  > option[value="+mon+"]").attr("selected", "true");    
    $("#s_day  > option[value="+day+"]").attr("selected", "true");    
    
   
    
    
   	// 종료날짜 셀렉박스
  	//년도 selectbox만들기               
    for(var i = year ; i <= year+10 ; i++) {
        $('#e_year').append('<option value="' + i + '">' + i + '</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#e_month').append('<option value="' + mm + '">' + mm + '</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#e_day').append('<option value="' + dd + '">' + dd+ '</option>');    
    }
    
    $("#e_year  > option[value="+year+"]").attr("selected", "true");        
    $("#e_month  > option[value="+mon+"]").attr("selected", "true");    
    $("#e_day  > option[value="+day+"]").attr("selected", "true");       
    
	$("#e_day").on('change',function(){
		
    	const s_year = $("#s_year option:selected").val();
		const s_month = $("#s_month option:selected").val();
		const s_day = $("#s_day option:selected").val();
		
		const e_year = $("#e_year option:selected").val();
		const e_month = $("#e_month option:selected").val();
		const e_day = $("#e_day option:selected").val();
		
		console.log("시작날짜: ", s_year, s_month, s_day);
		console.log("종료날짜: ", e_year, e_month, e_day);
		
		
		var stDate = new Date(s_year, s_month-1, s_day);
		var endDate = new Date(e_year, e_month-1, e_day);
		
		console.log("시작날짜: ", stDate);
		console.log("종료날짜: ", endDate);
		
		//주말 제외한 일수 구하기
		var count = 0;

		while(true) {  

		    var temp_date = stDate;
		    if(temp_date.getTime() > endDate.getTime()) {
		        console.log("count : " + count);
		        break;
		    } else {
		        var tmp = temp_date.getDay();
		        if(tmp == 0 || tmp == 6) {
		            // 주말
		            console.log("주말");
		        } else {
		            // 평일
		            console.log("평일");
		            count++;         
		        }
		        temp_date.setDate(stDate.getDate() + 1); 
		    }
		}
		
		
		
// 		var btMs = endDate.getTime() - stDate.getTime() ;
// 		console.log("endDate.getTime(): ", endDate.getTime());
// 		console.log("stDate.getTime(): ", stDate.getTime());
// 		console.log("btMs: "+ btMs);
// 		var vacDay = btMs / (1000*60*60*24)+1 ;
		
		$("#vacDay").val(count).css('color','green');
		$("#vacDay2").val(count).css('color','green');
		console.log("사용일수: ", count);	

		//date를 string으로 바꾸기	
		var sss = (s_year+s_month+s_day);
		var eee = (e_year+e_month+e_day);
		console.log("sss: ", sss);	
		console.log("eee: ", eee);	
		var stDate = new Date(s_year, s_month-1, s_day);
		console.log("날짜 뭐로 나오니?: ", stDate);	
		strDate = stDate.toString();
		endDate = endDate.toString();
		console.log("날짜 뭐로 나오니?: ", strDate);	
		console.log("날짜 뭐로 나오니?: ", endDate);	
		$('#vacStart').val(sss);
		$('#vacEnd').val(eee);
		
	});
	
	$("#startHalf").on('click',function(){
		  
	    if($('#startHalf').is(':checked') == false){
			$("input:radio[name='radio1']").prop('checked', false);
			$("input[name='radio1']").attr('disabled', true);
		}else{
			$("input[name='radio1']").attr('disabled', false);
		}
		
	
	});

	$("#endHalf").on('click',function(){
		  
	    if($('#endHalf').is(':checked') == false){
			$("input:radio[name='radio2']").prop('checked', false);
			$("input[name='radio2']").attr('disabled', true);
		}else{
			$("input[name='radio2']").attr('disabled', false);
		}
		
	
	});
	
	// 연차종류
	$("#reason").on('change',function(){
		const reason = $("#reason option:selected").val();
		console.log("휴가이유: ", reason);
	});

	
	$('.radio1').click(function() {
		var strAmVar = $('input[id=startHalf2am]:checked').val();
			console.log("오전반차: ", strAmVar);
	});
	
	$('.radio2').click(function() {
		var strPmVar = $('input[id=startHalf2pm]:checked').val(); 	// value값 가져오기
// 		var radioBtn = document.getElementById("startHalf2pm");
		var strPmVarInt = Number(strPmVar);							// 숫자로 바꿔주기
		var vacDay = $("#vacDay").val();								// 사용연차(input) 가져오기
		var vacDay = Number(vacDay) - strPmVarInt;					// 사용연차 - 반차 게산
		
		$("#vacDay").val(vacDay);										// input에 값 넣기
		$("#vacDay2").val(vacDay);									// input에 값 넣기
	});
	
	$('.radio3').click(function() {
		var endAmVar = $('input[id=endHalf2am]:checked').val();
			var endAmVarInt = Number(endAmVar);
			var vacDay = $("#vacDay").val();
			var vacDay = Number(vacDay) - endAmVarInt;
			$("#vacDay").val(vacDay);
			$("#vacDay2").val(vacDay);
	});
	
	$('.radio4').click(function() {
		var endPmVar = $('input[id=endHalf2pm]:checked').val();
			console.log("end오후반차: ", endPmVar);
	});

	
	//임시저장 버튼 클릭이벤트
	$("#tempst").click(function() {
		if (window.confirm("작성을 종료하고 임시저장 하시겠습니까?")) {
			alert("임시저장되었습니다.");
	        console.log("나중에 다시 쓴댜");
			$("#appStatus").val("3");
			$("#vacation").attr("action", "vacation/tempst");
			$("#vacation").submit();
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
// 	var appYear = "";
// 	$("#period").on('change',function(){
// 		period = $("#period option:selected").val();
// 		console.log("보존연한: ", period);
// 	});
	
	var dateValue = $("#now_date").val();
	period = $("#period option:selected").val();

	$('#mBtn').click(function() {
		console.log("dateValue", dateValue)
		$('#appDate').val(dateValue);
// 		$('#appYear').val(period);
	});

	$('input[type=checkbox][name=appUrgent]').change(function(){
		if($(this).is(':checked')){
			$('#appUrgent').val('1');
			var appUrgent = $('#appUrgent').val();
			console.log("appUrgent",appUrgent);
		}
	});
	
	//=================    <<모달창>   ================//
	
	
	var vacationForm = $("#vacation");
	var btnName = $(".button1").val();
	console.log("btnName: ", btnName);
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
				    	$("#vacation").submit();
			    	}else{
			    		vacationForm.attr("action", "vacation/Modify");
			    		vacationForm.submit();
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
				$("#vacation").append("<input type='hidden' name='apline.empNo' id='empNo1' value='"+aplineRankNo+"' />");
				$("#vacation").append("<input type='hidden' name='apline.aplPos' id='aplPos1' value='"+aplineRankPos+"' />");
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
				$("#vacation").append("<input type='hidden' name='apline.empNo' id='empNo1' value='"+aplineRankNo+"' />");
				$("#vacation").append("<input type='hidden' name='apline.aplPos' id='aplPos1' value='"+aplineRankPos+"' />");
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
				$("#vacation").append("<input type='hidden' name='apline.empNo' id='empNo1' value='"+aplineRankNo+"' />");
				$("#vacation").append("<input type='hidden' name='apline.aplPos' id='aplPos1' value='"+aplineRankPos+"' />");
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
		$("#vacation").append("<input type='hidden' name='apline.empNo' id='empNo1' value='"+aplineRankNo+"' />");
		$("#vacation").append("<input type='hidden' name='apline.aplPos' id='aplPos1' value='"+aplineRankPos+"' />");
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