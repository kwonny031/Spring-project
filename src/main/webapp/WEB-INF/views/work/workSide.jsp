<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="left-part" style="width: 200px; background-color: #D2E0F5;">
	<a
		class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none"
		href="javascript:void(0)"></a>
	<div class="scrollable" style="height: 100%">
		<div class="p-3">
			<h3 style="text-align: center;">근태관리</h3>
			<br>
			<h4 id="dateDisp" style="text-align: center;"></h4>
			<h1 id="timeDisp" style="text-align: center;"></h1>
			<br>
			<div>
				<div>
					<div style="display: inline-block;">
						<strong>출근 시간</strong>
					</div>
					<div
						style="display: inline-block; text-align: right; width: 101px;"
						class="workTimeDisp">
						<strong>미등록</strong>
					</div>
				</div>
				<div>
					<div style="display: inline-block;">
						<strong>퇴근 시간</strong>
					</div>
					<div
						style="display: inline-block; text-align: right; width: 101px;"
						class="workTimeDisp">
						<strong>미등록</strong>
					</div>
				</div>
			</div>
			<br>

			<div class="btnGroup" style="text-align: center;">
			<button id="startBtn" type="button" style="width: 75px; margin-right: 10px; display: inline-block;"
				class="btn waves-effect waves-light btn-primary">출근</button>
			<button id="endBtn" type="button" style="width: 75px; display: inline-block;"
				class="btn waves-effect waves-light btn-primary">퇴근</button>
			</div>

			<!-- 근무상태 변경 dropdown -->
			<div class="btn-group dropDiv">
				<button class="statusBtn btn btn-info dropdown-toggle"
					type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
					aria-expanded="false" style="width: 163px; margin-left: 2px;">업무상태 변경</button>
				<ul class="dropdown-menu workDrop" style="width: 100px;"
					aria-labelledby="dropdownMenuButton">
					<!-- 공통코드로 처리 -->
					<li class="workDrop"><a class="dropdown-item" href="#">업무</a></li>
					<li class="workDrop"><a class="dropdown-item" href="#">업무종료</a></li>
					<li class="workDrop"><a class="dropdown-item" href="#">출장</a></li>
					<li class="workDrop"><a class="dropdown-item" href="#">연차</a></li>
					<li class="workDrop"><a class="dropdown-item" href="#">반차</a></li>
					<li class="workDrop"><a class="dropdown-item" href="#">교육</a></li>
					<li class="workDrop"><a class="dropdown-item" href="#">외근</a></li>
				</ul>
			</div>

		</div>
		<div class="divider"></div>
		<ul class="list-group">
			<li class="list-group-item">
				<hr style="color: #212529" />
			</li>
			
			
			<li style="margin-bottom: 14px;"><small style="color: black; font-size: 1.5em;" class="p-3 grey-text text-lighten-1 db">
				<strong>${depVO.depName }</strong></small></li>
				
			<c:forEach items="${depEmpList }" var="emp" varStatus="i">
				<li class="empLi list-group-item" data-emp-no="${emp.empNo }">
					<a href="javascript:void(0)" class="list-group-item-action">
						<c:choose>
							<c:when test="${statusList.get(i.index) eq 'START' }">
<!-- 								<i style="color: #78DBA6 !important; top: -1px; position: relative;"  -->
								<i style="top: -1px; position: relative;" 
									class="text-success ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
								<font>${emp.empName } ${emp.empPos } | 업무 중</font> 
							</c:when>
							<c:when test="${statusList.get(i.index) eq 'END' }">
								<i style="top: -1px; position: relative;" 
									class="text-danger ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
								<font>${emp.empName } ${emp.empPos } | 퇴근</font> 
							</c:when>
							<c:otherwise>
								<i style="top: -1px; position: relative;" 
									class="text-warning ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
								<font>${emp.empName } ${emp.empPos } | 출근 전</font> 
							</c:otherwise>
						</c:choose>
					</a>
				</li>
			</c:forEach>
		</ul>
		
		<div id="empDiv" style="text-align:center; display: none; width: 180px; height: 200px; background-color: white; position: relative;
			top: -611px; left: 10px; box-shadow: 4px 3px 5px #bebebe; z-index: 2;">
			<div>
				<img src="${pageContext.request.contextPath }/resources/images/profile.png" style="height: 90px; 
					width: 90px; margin-top: 10px; margin-bottom: 10px;" class="rounded-circle">
			</div>
			<div>
				
			</div>
			<div>
				<button id="empWork" type="button" style="width: 106px; margin-top: 10px;"
					class="btn waves-effect waves-light btn-primary">근태 현황</button>
			</div>
			
		</div>
		<div id="empDiv2" style="display: none; width: 30px; height: 30px; background-color: white; box-shadow: 4px 3px 5px #bebebe;
			transform: rotate(45deg); position: relative; top: 183px; left: 86px;"></div>
		
	</div>
</div>