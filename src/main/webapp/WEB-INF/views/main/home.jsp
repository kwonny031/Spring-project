<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
   .popper{ 
     position: absolute; 
     z-index: 9999 !important; 
     background: #FFC107; 
     color: black; 
     width: 150px; 
     border-radius: 3px; 
     box-shadow: 0 0 2px rgba(0,0,0,0.5); 
     padding: 10px; 
     text-align: center; 
   } 
   .tooltip-inner{
    font-weight: bold;
    font-size: 15px;
   	max-width: 500px;
    padding: 0.25rem 0.5rem;
    color: black;
    text-align: center;
    background-color: white;
    border: 1px solid #eee;
    box-shadow:2px 3px 5px 0px;
    border-radius: 4px;
   }
   #uploadFile{
   	background-color: #3699ff;
    border: #3699ff;
    
   }
   .fc-toolbar{
   	padding : 0 !important;
   }
</style>

  <!-- -------------------------------------------------------------- -->
  <!-- Container fluid  -->
  <!-- -------------------------------------------------------------- -->
     <div class="row" style="height:433px; position: relative; top: -11px; left: 8px;">
        <div class="col-lg-2" style="margin: 20px 0px 0px 7px; height: 430px;">
        	<div class="card" style="height: 430px;">
<%-- 	          <div class="card-body" style="background: url(${pageContext.request.contextPath }/resources/assets/images/background/active-bg.png) no-repeat top center;"> --%>
	          <div class="card-body" style="padding-top: 0px;">
	            <div class="pt-3 text-center" style="margin-top: 30px;">
<!-- 	              <i class="ri-file-text-fill display-4 text-orange d-block"></i> -->
		              <c:choose>
		              	<c:when test="${empty profile }">
							<img src="${pageContext.request.contextPath }/resources/images/profile.png" 
								width="100px" style="margin-bottom:20px; cursor: pointer;" id="profileImg">
		              	</c:when>
		              	<c:otherwise>
							<img src="${pageContext.request.contextPath }/resources/images/${profile.afSave}" 
								width="100px" style="margin-bottom:20px; cursor: pointer;" id="profileImg">
		              	</c:otherwise>
		              </c:choose>						
						
	              <div style="margin:20px 0;">
		              <span class="d-block font-medium" style="font-size: medium;">${SessionInfo.empName } ${SessionInfo.empPos }</span>
		              <span style="font-size:medium;">${depVO.depName }</span>
	              </div>	
	              <div style="margin:6px 0; font-size: 1.1em; padding-left: 0px;">
	                <a href="/approval/home" style="color: black;">
					  <font id="appNum2" style="text-align: left;font-size: smaller; display: inline-block;">결재 대기</font>　　　
					  <font id="appNum">${appLineList.size() }</font>
	                </a>
	                <a href="/sch/home" style="color: black;">
					  <font id="schNum2" style="text-align: left;font-size: smaller; display: inline-block;">오늘의 일정</font>　　
					  <font id="schNum">${appLineList.size() }</font>
	                </a>
	              </div> 
	              <!-- Progress -->
<!-- 	              <div class="progress" style="height: 4px"> -->
<!-- 	                <div class="progress-bar bg-info" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div> -->
<!-- 	                <div class="progress-bar bg-orange" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div> -->
<!-- 	                <div class="progress-bar bg-warning" role="progressbar" style="width: 65%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div> -->
<!-- 	              </div> -->
	              <!-- Progress -->
	              <!-- row -->
	              <a href="/emp/mypage" class="waves-effect waves-light mt-3 btn btn-lg btn-info accent-4 mb-3" 
	              	style="width: 100px;font-size: small;">마이페이지</a>
	            </div>
        	</div>
          </div>
        </div>
        <div class="card col-lg-5" style="margin:20px 0 10px 0px; width: 500px; height: 430px; font-size: smaller; padding:0">
          <div class="card-body" style="width: 500px; padding: 19px 0 0 5px;">
            <div class="d-md-flex align-items-center">
              <div style="margin-left:20px">
                <h4 class="card-title"><i class="mdi mdi-checkbox-marked-outline" style="margin-right:5px;"></i>공지사항</h4>
              </div>
              <div class="ms-auto d-flex no-block align-items-center">
              	<a href="/notice/home" style="color:#989898; margin-right: 19px;">더보기</a>
              </div>
            </div>
            <div class="table-responsive" style="font-size:smaller; width:488px; overflow: hidden;">
              <table class="table no-wrap v-middle" style="font-size: 1.2em;">
                <thead class="text-center bs-secondary">
                  <!-- start row -->
                  <tr style="border-bottom: 2px solid #CCE1FF; background-color: #CCE1FF;">
<!--                     <th class="border-0"></th> -->
                    <th class="border-0" style="width: 85px;">제목</th>
                    <th class="border-0">작성자</th>
                    <th class="border-0">작성일</th>
                    <th class="border-0">조회수</th>
<!--                     <th class="border-0">좋아요</th>  -->
                  </tr>
                  <!-- end row -->
                </thead>
                <tbody>
                
                <c:forEach items="${notList }" var="notice" varStatus="i">
                  <tr>
<!--                     <td> -->
<!--                       <i class="ri-checkbox-blank-circle-fill text-success fs-4" data-bs-toggle="tooltip" data-bs-placement="top" title="Acticve"></i> -->
<!--                     </td> -->
                    <td class="blue-grey-text text-darken-4">
                    	<a href="/notice/detail?notCode=${notice.notCode }" style="color: black;">
	                    	${notice.notTitle }
                    	</a>
                    </td>
                    <td>${notEmpList.get(i.index).empName } ${notEmpList.get(i.index).empPos }</td>
                    <td>
                    	<fmt:formatDate value="${notice.notDate }" type="date" pattern="yyyy-MM-dd"></fmt:formatDate>
                    </td>
                    <td style="text-align:center">${notice.notHit }</td>
<%--                     <td style="text-align:center">${notGoodList.get(i.index) }</td> --%>
                  </tr>
                </c:forEach>  
                  
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="col-lg-3" style="margin-top: 20px; width: 335px; height:500px;">
        	<div class="card" style="height: 430px; width: 480px;">
	          <div class="card-body" style="height: 420px; width:480px; padding: 20px 6px 3px 5px; ">
              	<div id="calendar" style="font-size: 8px; height: 420px;"></div>
	          </div>
	        </div>
        </div>
     </div>  
<!--   <div class="container-fluid"> -->
    <div class="row" style="position: relative; left: 8px;">
    	<div class="col-lg-2" style="margin:10px 0px 0px 7px; width: 206px; height:300px; padding:5px">
	        <div class="card" style="height:300px; width: 187px; position: relative; left: 5px;">
              <div style="margin:16px 20px 0 20px">
                <h4 class="card-title"><i class="far fa-folder" style="margin-right:5px;"></i>클라우드</h4>
              </div>
<!-- 	          		<a id="uploadFile" class="waves-effect waves-light mt-3 btn btn-lg btn-info accent-4" href="#" >파일 업로드</a> -->
	          		<div style="margin:10px; margin-top: 3px;">
<!-- 						<h5>클라우드 용량</h5> -->
						<div class="progress" style="height: 15px; margin-bottom:10px;">
							<div class="progress-bar bg-success" style="width: 0%;" role="progressbar"> 0%</div>
						</div>
						<span style="text-align:right;font-size:x-small" id="progress"></span>
						<br>
						<!-- ============================= Accordion============================ -->
						<div class="accordion accordion-flush" id="accordionFlushExample" style="font-size:x-small">
							<div class="accordion-item">
								<h2 class="accordion-header" id="flush-headingOne">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
										data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne"
										style="background-color:white;font-weight: bold;font-size:small">부서자료실</button>
								</h2>
								<!-- 아코디언이 처음에 펼쳐져 있도록 하려면 class에 show를 넣어주기!! -->
								<div id="flush-collapseOne" class="accordion-collapse collapse show" 
									aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
									<div class="accordion-body" style="background-color:white;">
										<!-- 여기도 foreach로 부서 자료실 목록 가져오기 -->
										<p>2022년 프로젝트 자료실</p>
										<p>2023년 프로젝트 자료실</p>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="flush-headingTwo">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
										data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo"
										style="background-color:white;font-weight: bold;font-size:small">개인 자료실</button>
								</h2>
								<div id="flush-collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
									<div class="accordion-body" style="background-color:white;">
									<!-- 여기도 foreach 사용해서 개인 자료실 목록 가져오기 -->
										<p>내 문서</p>
										<p>내 그림</p>
									</div>
								</div>
							</div>
						</div>	
						<!-- ============================= Accordion============================ -->	
					</div>
	          	</div> <!-- card end -->
	          </div>
      	
		<div class="card col-lg-5" style="margin:15px 0 10px 0px; width: 500px; height: 300px; font-size: smaller; padding:0"">
			<div class="card-body" style="height:300px; width:500px; padding: 15px;">
				<div class="d-md-flex align-items-center">
	              <div style="margin-left:15px">
	                <h4 class="card-title"><i class="ri-edit-2-line" style="margin-right:5px;"></i>결재 대기 문서</h4>
	              </div>
				<div class="ms-auto d-flex no-block align-items-center">
              			<a href="/approval/aplineList" style="color:#989898; margin-right: 19px;">더보기</a>
              		</div>
           		</div>
                <div class="table-responsive" style="margin-top:-2px; font-size: smaller; ">
              	<table class="table no-wrap v-middle" style="width: 100%; font-size: 1.4em;">
              		<thead>
              			<tr style="background-color: #CCE1FF;">
              				<th  style="border-bottom-color: #CCE1FF;">&emsp;&emsp;기안일</th>
                          	<th style="text-align:center;border-bottom-color: #CCE1FF;">제목</th>
                          	<th style="text-align:center;border-bottom-color: #CCE1FF;">작성자</th>
                          	<th style="text-align:center;border-bottom-color: #CCE1FF;">긴급</th>
              			</tr>
              		</thead>
              			<tbody>
							<c:forEach items="${appLineList }" var="appLineList" varStatus="i">
								<tr>
									<td>
										<div class="d-flex align-items-center">

											<span class="ms-3 fw-normal">${appLineList.appDate }</span>
										</div>
									</td>
									<c:choose>
                            			<c:when test="${appLineList.appTitle == '휴가신청서'}">
		                            		<td style="text-align:center;"><a href="/approval/vacDetail?appCode=${appLineList.appCode }&apfCode=${appLineList.apfCode}&empNo=${appLineList.empNo}">${appLineList.appTitle }</a></td>
                            	
                            			</c:when>
                            			<c:when test="${appLineList.appTitle == '채용품의서'}">
		                            		<td style="text-align:center;"><a href="/approval/recruitDetail?appCode=${appLineList.appCode }&apfCode=${appLineList.apfCode}&empNo=${appLineList.empNo}">${appLineList.appTitle }</a></td>
                            	
                            			</c:when>
                            		</c:choose>
									<td style="text-align:center;">${appLineList.empVO.empName } ${appLineList.empVO.empPos }</td>
									<td style="text-align:center;">
									<c:choose>
										<c:when test="${appLineList.appUrgent == 1}">
											<span
												class="badge bg-light-danger text-danger fw-normal">긴급</span>
										</c:when>
										<c:otherwise>
<!-- 											<span class="badge bg-light-success text-success fw-normal">긴급아님</span> -->
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
              	</table>
              </div>
			</div>
		</div>
  
    	<div class="col-lg-3" style="width: 335px; height:300px;margin:15px 0 10px 0">
	        <div class="card" style="padding: 20px; height: 300px;width:480px">
	          <div class="card-body" style="padding: 0;">
	              <div style="margin-left:10px">
	                <h4 class="card-title"><i class="ri-macbook-line" style="margin-right:5px;"></i>근태관리</h4>
	              </div>
				  <div id="workDiv" style="margin:20px; width:350px">
          			<div>
				  <!-- 경훈오빠한테 화면 물어보기!! -->
<!--           				<h4 id="dateDisp"></h4> -->
<!-- 						<h2 id="timeDisp"></h2> -->
<!-- 						<div> -->
<!-- 							<div> -->
<!-- 								<div style="display: inline-block;"> -->
<!-- 									<strong>출근 시간</strong> -->
<!-- 								</div> -->
<!-- 								<div style="display: inline-block; text-align: right; width: 150px;" class="workTimeDisp"> -->
<!-- 									<strong>미등록</strong> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<div style="display: inline-block;"> -->
<!-- 									<strong>퇴근 시간</strong> -->
<!-- 								</div> -->
<!-- 								<div style="display: inline-block; text-align: right; width: 150px;" class="workTimeDisp"> -->
<!-- 									<strong>미등록</strong> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div style="margin-top:20px;"> -->
<!-- 							<button id="startBtn" type="button" style="width: 106px; margin-right: 10px;" -->
<!-- 								class="btn waves-effect waves-light btn-primary">출근하기</button> -->
<!-- 							<button id="endBtn" type="button" style="width: 106px;" -->
<!-- 								class="btn waves-effect waves-light btn-primary">퇴근하기</button> -->
<!-- 								<br> -->
<!-- 							<a href="javascript:void(0)" class="waves-effect waves-light mt-3 btn btn-lg btn-info accent-4"  -->
<!-- 	              				style="width: 15px;font-size: small;">근퇴관리 페이지</a> -->
<!-- 						</div> -->
				  <!-- 경훈오빠한테 화면 물어보기!! -->
						<%@ include file="/WEB-INF/views/work/workSide.jsp"%>
          			</div>
					<div style="border-left: 1px solid #e9ecef; position: relative; left: 270px;">
						
					</div>
          		</div>
	          </div>
	        </div>
      	</div>
      </div>
    
    <!-- -------------------------------------------------------------- -->
    <!-- Ravenue - page-view-bounce rate -->
    <!-- -------------------------------------------------------------- -->
<!--     <div class="row"> -->
<!--       column -->
<!--       <div class="col-lg-4 d-flex align-items-stretch"> -->
<!--         --------------------- start Revenue Statistics ---------------- -->
<!--         <div class="card bg-info text-white card-hover w-100"> -->
<!--           <div class="card-body"> -->
<!--             <h4 class="card-title">Revenue Statistics</h4> -->
<!--             <div class="d-flex align-items-center mt-4"> -->
<!--               <div class="" id="ravenue"></div> -->
<!--               <div class="ms-auto"> -->
<!--                 <h3 class="font-medium white-text mb-0">$351</h3> -->
<!--                 <span class="white-text op-5">Jan 10 - Jan 20</span> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         --------------------- end Revenue Statistics ---------------- -->
<!--       </div> -->
<!--       column -->
<!--       <div class="col-lg-4 d-flex align-items-stretch"> -->
<!--         --------------------- start Page Views ---------------- -->
<!--         <div class="card bg-cyan text-white card-hover w-100"> -->
<!--           <div class="card-body"> -->
<!--             <h4 class="card-title">Page Views</h4> -->
<!--             <h3 class="white-text mb-0"><i class="ri-arrow-up-line"></i> 6548</h3> -->
<!--           </div> -->
<!--           <div class="mt-3" id="views"></div> -->
<!--         </div> -->
<!--         --------------------- end Page Views ---------------- -->
<!--       </div> -->
<!--       column -->
<!--       <div class="col-lg-4 d-flex align-items-stretch"> -->
<!--         --------------------- start Bounce Rate ---------------- -->
<!--         <div class="card card-hover w-100"> -->
<!--           <div class="card-body"> -->
<!--             <h4 class="card-title">Bounce Rate</h4> -->
<!--             <div class="d-flex no-block align-items-center mt-4"> -->
<!--               <div class=""> -->
<!--                 <h3 class="font-medium mb-0">56.33%</h3> -->
<!--                 <span class="">Total Bounce</span> -->
<!--               </div> -->
<!--               <div class="ms-auto"> -->
<!--                 <div> -->
<!--                   <div id="bouncerate"></div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         --------------------- end Bounce Rate ---------------- -->
<!--       </div> -->
<!--     </div> -->
    
    
    <!-- =====================[Table 테이블 만들때 사용할 div 형식 예시 - 지우지 말기]=============================-->
<!--     <div class="row"> -->
<!--       <div class="col-lg-12"> -->
<!--       	여기에 추가할 영역 만들어서 넣기! -->
<!--       </div> -->
<!--     </div> -->
    <!-- =====================[Table 테이블 만들때 사용할 div 형식 예시 - 지우지 말기]=============================-->


<!-- template에 있는 todo -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/extra-libs/taskboard/js/lobilist.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/extra-libs/taskboard/js/lobibox.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/extra-libs/taskboard/js/task-init.js"></script> --%>

<script type="text/javascript">

// var modal = document.getElementById('modalTree');

//////////////////////////////////////////////////
const btn = document.getElementById('btn');         //버튼
let addValue = document.getElementById('addValue'); //할일 입력
let result = document.getElementById('result');    //추가된 할일

//할일 추가시
function addTodo(){
    if(addValue.value==false){     /*''도 가능 */
        alert('내용을 입력하세요!');
    }else{
    let list = document.createElement("li");
    let del = document.createElement('button');
    list.innerHTML = addValue.value;
    result.appendChild(list); //추가된 할일에 할일 리스트 추가하기
    list.appendChild(del);    //할일 리스트 추가시 삭제버튼도 추가    
    del.innerText = "x";      //삭제버튼에 들어갈 'x'자 문자
    del.style.fontSize = "20px";
    del.style.border = "none";
    del.style.float = "right";
    del.style.right = "17px";
    del.style.marginTop = "10px";
    del.style.cursor = "pointer";
    del.addEventListener("click", deleteList); //삭제버튼 클릭시 리스트지우기 이벤트 실행
    del.style.position='relative';
    }
    addValue.value = "";                            //할일 입력창 초기화
    addValue.focus();                               //강제 커서 깜빡임
    list.addEventListener("click", function(){      //할일 완료 후 클릭시 밑줄로 표시
        list.style.textDecoration = "line-through";
        list.style.color = "gray";                  //클릭시 색변환
    })
}

//할일 목록 삭제시
function deleteList(e){ //삭제 버튼(x) 클릭시 
    let removeOne = e.target.parentElement;  //선택한 목록 한개만 지우기(부모 객체를 지운다)
    removeOne.remove();
}

// function addTodo(){

// }

function allClearList(e){
    if(confirm("정말 삭제하시겠습니까?")==true){   //취소메시지가 true(ok)일때
        if(result.innerText==''){                      //목록칸이 비어있다면
            alert("삭제할 목록이 없습니다");              //삭제할 목록이 없다는 경고창뜨기
        }else{                                         //삭제할 목록이 있다면
            result.innerText='';                       //전체 삭제
        }
    }else{                                      //취소메시지가 false(no)일때
        return false;                           //삭제 취소
    }
}
</script>
<!-- ===================[fullcalendar 6.1.4 CDN]===================== -->
<!--  fullcalendar 6.1.4버전 CDN -->
<!-- <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script> -->
<script src="${pageContext.request.contextPath }/resources/fullcalendar/core/index.global.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/fullcalendar/daygrid/index.global.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/fullcalendar/interaction/index.global.min.js"></script>
<!-- fullcalendar 6.1.4버전 언어 설정 -->
<script src="${pageContext.request.contextPath }/resources/fullcalendar/ko.global.min.js"></script>

<!-- 툴팁 사용  V4-->
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<!-- ===================[fullcalendar 6.4.1 CDN]===================== -->

<style>
.fc-title{
    font-size: 12px;
}
.fc-view-harness{
	font-size: 10px;
}
</style>

<script type="text/javascript">
let schNum = 0;

document.querySelector('#schNum').parentElement.addEventListener('mouseover',(e)=>{
	console.log('e ::',e);
	console.log('e ::',e.target);
	if(e.target.tagName == 'A'){
		e.target.style.color = 'blue';
	}else{
		e.target.parentElement.style.color = 'blue';
	}
});

document.querySelector('#schNum').parentElement.addEventListener('mouseout',(e)=>{
	if(e.target.tagName == 'A'){
		e.target.style.color = 'black';
	}else{
		e.target.parentElement.style.color = 'black';
	}
});

document.querySelector('#appNum').parentElement.addEventListener('mouseover',(e)=>{
	if(e.target.tagName == 'A'){
		e.target.style.color = 'blue';
	}else{
		e.target.parentElement.style.color = 'blue';
	}
});

document.querySelector('#appNum').parentElement.addEventListener('mouseout',(e)=>{
	if(e.target.tagName == 'A'){
		e.target.style.color = 'black';
	}else{
		e.target.parentElement.style.color = 'black';
	}
});

$(function(){
	var empNo = '${SessionInfo.empNo }';
	var depCode = '${SessionInfo.depCode }';
	var param = {
			"empNo" : empNo,
			"depCode" : depCode
	}
	console.log("확인 : ", param);
	var req = $.ajax({
		url:"/sch/home",
		type:"post",
		data : JSON.stringify(param),
		contentType: "application/json;charset=utf-8",
		dataType:"json"
	});
		
	req.fail(function(jqXHR, textStatus){
		alert("캘린더 오류발생 : " + jqXHR + textStatus);
	});
		
	req.done(function(data){
		console.log("data : ", data[0].start);  
		console.log('now ::',new Date().toISOString().substring(0,10));
		console.log("data : ", data[0].start.substring(0,10));  
		let now = new Date().toISOString().substring(0,10);
		for(let i=0; i<data.length; i++){
			if(now == data[i].start.substring(0,10)){
				schNum++;
			}
		}
		document.querySelector('#schNum').innerHTML = schNum;
		
		var calendarEl = $('#calendar')[0];
		var calendar = new FullCalendar.Calendar(calendarEl, {
	    	height : '400px', 				// calendar 높이 설정
	        width: '450px',
// 	        expandRows : true, 				// 화면에 맞게 높이 재설정

	        // 해더에 표시할 툴바
	        headerToolbar : {
	           left : 'prev',
	           center : 'title',
	           right : 'next'
	        },
	        initialView : 'dayGridMonth', 	// 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
// 	        navLinks : true, 				// 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
// 	        editable : true, 				// 수정 가능 여부
	        nowIndicator : true, 			// 현재 시간 마크
	        dayMaxEvents : true, 			// 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	        locale : 'ko',
	           eventDidMount: function(info) {
// 	  			 console.log("description : ", info.event.extendedProps.start);  
// 	  			 console.log("data : ", data);  
	  			 console.log("description : ", info.event);  
	  			 var tooltip = new Tooltip(info.el, {	// v4
	  				 
	         	        title: info.event.title,
	         	        description: info.event.extendedProps.description,
	         	        placement: 'top',
	         	        trigger: 'hover',
	         	        container: 'body'
	         	      });
	         	    },
	        events : data
	     });	// var calendar end
	     calendar.render();	// 캘린더 랜더링
	});
		
	// 프로필 클릭
	document.querySelector('#profileImg').addEventListener('click',()=>{
		location.href = '/emp/mypage';
	});
	
	//////////////////////////////////////  클라우드  //////////////////////////////////////
	let totalUse = ( ${empCloud[0].cloUse} + ${depCloud[0].cloUse} );	// 사용용량 (개인 자료실 사용량 + 부서 자료실 사용량)
	let total = ${empCloud[0].cloMax} + ${depCloud[0].cloMax}
	let totalPer = (totalUse / total) * 100;
	console.log("사용 용량 : ", (totalUse.toString()).slice(0,4), " // 사용 용량(퍼센트) : " , (totalPer.toString()).slice(0,4));
	
	$("#progress").html("사용량 <strong style='color:#0bb7af;'>"+ (totalUse.toString()).slice(0,4) +" GB</strong> / "+ total +".0 GB");
	$(".progress-bar").css("width", (totalPer.toString()).slice(0,4)+"%");
	$(".progress-bar").html((totalPer.toString()).slice(0,4) + "%");
	
});
</script>

<!-- workSide -->
<script src="${pageContext.request.contextPath }/resources/dist/js/workSide.js"></script>


<script>
	let empNo = ${SessionInfo.empNo};

	document.addEventListener('DOMContentLoaded', () => { // 태그 해석만 함
		
		let jsonWorkList = ${jsonWorkList};
		makeWorkList(jsonWorkList);
		
		// empImgList
		let empImgList = '${empImgListJson}';
// 		console.log('img ::',empImgList);
		empImgList = JSON.parse(empImgList);
// 		console.log('img2 ::',empImgList);
		
		
		////  empLi > empDiv
		let empLis = document.querySelectorAll('.empLi');
		let empDiv = document.querySelector('#empDiv');
// 		let empDiv2 = document.querySelector('#empDiv2'); // div2도 있으면 좋은데	

		let empDivFlag = false;
		let imgSrc = empDiv.children[0].children[0].src; 
		
		for(let i=0; i<empLis.length; i++){
			empLis[i].addEventListener('click',(e)=>{
				console.log('li ::', e.target); // target이 a이거나 i
				console.log('li ::', e.target.href);
				
				let targetLi = e.target.parentElement;
				if(!e.target.href){
					targetLi = e.target.parentElement.parentElement;
				}
				
				// target의 index
				let parent = targetLi.parentElement;
				let nodes = [...parent.children];
				let index = nodes.indexOf(targetLi) - 2;	
				console.log('idx ::',index); // *51
// 				console.log('top ::',empDiv.style.top);	
// 				console.log('substr ::',empDiv.style.top.substring(0,empDiv.style.top.length-2));
				console.log('child ::',targetLi.children);
				let empInfo = targetLi.children[0].cloneNode(true);
				let top = Number(empDiv.style.top.substring(0,empDiv.style.top.length-2));

				empInfo.className = '';
				empInfo.style.color = 'black';
				empInfo.style.cursor = 'default';
				console.log('empInfo ::',empInfo);
				console.log('empInfo ::',empInfo.className);
// 				console.log('click img ::',empImgList[i].afSave);

				empDiv.children[2].children[0].setAttribute('data-emp-no',targetLi.dataset.empNo);

				// 이름 직급 넣기
				console.log('text ?? ::',empInfo.innerText.trim().split(' | ')[0]); 
				empNamePos = empInfo.innerText.trim().split(' | ')[0];
				
				if(!empDivFlag){
					empDiv.style.top = top+(index*51)+'px';
					empDiv.style.display = 'block';
					empDivFlag = true;
					
					empDiv.children[1].appendChild(empInfo);
					if(empImgList[i] != null){
						empDiv.children[0].children[0].src = '${pageContext.request.contextPath }'+
						'/resources/images/'+empImgList[i].afSave;
					}
					
				}else{
					empDiv.style.top = top-(index*51)+'px';
					empDiv.style.display = 'none';
					empDivFlag = false;
					
					empDiv.children[1].innerHTML = '';
					empDiv.children[0].children[0].src = imgSrc;
					
				}
			});
		}
		
		console.log('workDiv ::', document.querySelector('#workDiv').children[0].children[0].children[1].children[0] );
		
		let workDiv = document.querySelector('#workDiv').children[0].children[0].children[1].children[0];
		
		workDiv.style.cssText  = 'padding-top: 100px !important';
		workDiv.style.cssText  = 'padding-left: 0px !important';
		workDiv.style.position = 'relative';
		workDiv.style.top = '-5px';
		
		
		workDiv.children[0].style.display = 'none';
		workDiv.children[1].style.display = 'none';
		
		workDiv.children[2].style.textAlign = 'unset';
		workDiv.children[2].style.paddingLeft = '12px';
		workDiv.children[3].style.textAlign = 'unset';
		workDiv.children[3].style.paddingLeft = '3px';
		
		workDiv.children[8].style.display = 'none';
// 		workDiv.children[9].style.display = 'none';
		
		console.log('time chk ::',workDiv.children[5].children[0]);
		workDiv.children[5].children[0].children[1].style.width = '88px';
		workDiv.children[5].children[1].children[1].style.width = '88px';
		
		console.log('ch 7 ::',workDiv.children[7]);
		workDiv.children[7].style.textAlign = 'unset';
		workDiv.children[7].children[0].style.width = '152px';
		workDiv.children[7].children[0].innerHTML = '근태관리';
		workDiv.children[7].children[1].style.display = 'none';
		
		workDiv.children[7].children[0].addEventListener('click', ()=>{
			location.href = '/work/home';
		});
		
		workDiv.parentElement.style.width = '535px';
		
		console.log('div ::',workDiv.parentElement.children[1]);
		workDiv.parentElement.children[1].style.display = 'none';
		
		let ul = workDiv.parentElement.children[2].cloneNode(true);
		workDiv.parentElement.children[2].style.display = 'none';
		
		console.log('ul ::',ul);
// 		ul.children[0].style.visibility = 'hidden';
		ul.children[0].style.display = 'none';
		ul.style.display = 'block';
		
		ul.style.position = 'relative';
		ul.style.left = '0px';
		ul.style.top = '-3px';
		ul.style.overflow = 'scroll';
		ul.style.height = '238px';
		ul.style.width = '219px';
		ul.style.left = '10px';
		
		ul.classList.add('scroll-sidebar');
		
		let lis = ul.children;
		
		for(let i=0; i<lis.length; i++){
			lis[i].style.border = '0px';
		}
		
		console.log('ul pa -- ::',document.querySelector('#workDiv').children[1]);
		document.querySelector('#workDiv').children[0].children[0].style.height = '235px';
		document.querySelector('#workDiv').children[0].children[0].style.border = '0px';
		document.querySelector('#workDiv').children[0].children[0].style.backgroundColor = 'white';
		
		document.querySelector('#workDiv').children[1].classList.add('scroll-sidebar');
		document.querySelector('#workDiv').children[1].style.width = '271px';
		document.querySelector('#workDiv').children[1].style.left = '209px';
		document.querySelector('#workDiv').children[1].appendChild(ul);
	});
</script>











