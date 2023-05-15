<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.insertLbl {
	font-size: 1.4em;
}
.cke_top {
    border-bottom: 1px solid #d1d1d1;
    background: #f8f8f8;
    padding: 6px 8px 2px;
    white-space: normal;
}
.cke_bottom {
    padding: 6px 8px 2px;
    position: relative;
    border-top: 1px solid #d1d1d1;
    background: #f8f8f8;
}
</style>

<!-- -------------------------------------------------------------- -->
<!-- Email App Part -->
<!-- -------------------------------------------------------------- -->
<div class="email-app">
	<!-- -------------------------------------------------------------- -->
	<!-- Left Part -->
	<!-- -------------------------------------------------------------- -->
	<%@ include file="/WEB-INF/views/board/boardSide.jsp"%>

	<!-- -------------------------------------------------------------- -->
	<!-- Right Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="right-part mail-list bg-white overflow-auto"
		style="background-color: #dddddd !important; margin-left: 261px; width: 85.5%; height: 765px;">
		<div class="p-3 b-b">
			<div class="d-flex align-items-center">
				<div>
					<h4>${boa.boaName }</h4>
				</div>
				<div class="ms-auto">
				</div>
			</div>
		</div>

		<!-- -------------------------------------------------------------- -->
		<!-- Active user - project- visitors -->
		<!-- -------------------------------------------------------------- -->
		<div class="row" style="width: 92%; margin-left: 6px;">
			<!-- column -->
			<div class="col-sm-12 col-lg-4 d-flex align-items-stretch">
				<!-- ---------------------
                            start Active Users
                        ---------------- -->
				<div class="card card-hover w-100">
					<div class="card-body">
						<h4 class="card-title">총 매출</h4>
						<div id="device-visit" class="mt-4 d-flex justify-content-center"></div>

						<div id="chart1" class="d-flex"></div>

					</div>
				</div>
				<!-- ---------------------
                            end Active Users
                        ---------------- -->
			</div>

			<!-- column -->
			<div class="col-sm-12 col-lg-4 d-flex align-items-stretch">
				<!-- ---------------------
                            start Active Users
                        ---------------- -->
				<div class="card card-hover w-100">
					<div class="card-body">
						<h4 class="card-title">담당자별 매출</h4>
						<div id="device-visit" class="mt-4 d-flex justify-content-center"></div>

						<div id="chart2" class="d-flex"></div>

					</div>
				</div>
				<!-- ---------------------
                            end Active Users
                        ---------------- -->
			</div>

			<!-- column -->
			<div class="col-sm-12 col-lg-4 d-flex align-items-stretch">
				<!-- ---------------------
                            start Active Users
                        ---------------- -->
				<div class="card card-hover w-100">
					<div class="card-body">
						<h4 class="card-title">거래처별 매출</h4>
						<div id="device-visit" class="mt-4 d-flex justify-content-center"></div>

						<div id="chart3" class="d-flex"
							style="position: relative; top: -11px;"></div>

					</div>
				</div>
				<!-- ---------------------
                            end Active Users
                        ---------------- -->
			</div>


		</div>



		<div class="row" style="width: 1017px;">
			<div id="parentDiv" class="col-12">

				<div class="row" style="display: none;">
					<div class="col-lg-12" style="width: 98.6%; margin-left: 15px;">
						<!-- ---------------------
	                            start Person Info
	                        ---------------- -->
						<div class="card">
							<div class="card-header bg-info"
								style="background-color: #3699ff !important;">
								<h4 class="mb-0 text-white">게시물 등록</h4>
							</div>
							<!-- POST_CODE, BOA_CODE, EMP_NO, POST_TITLE, POST_DATE, POST_HIT, POST_ESS, POST_CONTENT -->
							<form id="postForm" action="/board/insertPost" method="post">
								<input type="hidden" id="empNo" name="empNo"
									value="${SessionInfo.empNo }"> <input type="hidden"
									id="boaCode" name="boaCode" value="${boa.boaCode }"> <input
									type="hidden" id="postEss" name="postEss">
								<div>
									<div class="card-body">
										<h3 class="card-title">
											필수 입력 항목 <font color="red">*</font>
										</h3>
										<div class="row pt-3">

											<div class="col-md-9">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">제목</label> <input
														name="postTitle" type="text" id="postTitle"
														class="form-control form-control-danger" /> <small
														style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>



										</div>

										<!--/row-->
										<div class="row">
											<!--/span-->

											<div class="col-md-3">
												<div class="mb-3">
													<label class="insertLbl control-label">거래일</label> <input
														id="essDate" type="date" class="form-control" />
												</div>
											</div>

											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label class="insertLbl control-label">매출액</label> <input
														type="text" id="essSales"
														class="form-control form-control-danger" /> <small
														style="display: none;" class="form-control-feedback">
														This field has error. </small>
												</div>
											</div>

											<div class="col-md-3">
												<div class="mb-3">
													<label class="insertLbl control-label">거래처</label> <select
														id="essAccount" class="form-control form-select"
														data-placeholder="Choose a Category" tabindex="1"
														style="background-color: white;">
														<option>거래처 선택</option>
													</select>
												</div>
											</div>
											<!--/span-->
										</div>
									</div>
									<hr />
									<div class="card-body">
										<!--/row-->
										<label class="insertLbl control-label">상세 내용</label>
										<textarea id="postContent" name="postContent"
											class="form-control" rows="14" style="width: 982px;"></textarea>

										<!--/row-->
										<div class="col-md-4" style="margin-top: 20px;">
											<div class="mb-3">
												<label class="insertLbl control-label">파일 첨부</label> <input
													class="form-control" type="file" id="formFileMultiple"
													multiple="">
											</div>
										</div>
									</div>
									<div class="form-actions">
										<div class="card-body" style="top: -20px; position: relative;">
											<button id="postInsert"
												class="btn btn-success rounded-pill px-4">
												<div class="d-flex align-items-center">
													<i data-feather="save" class="feather-sm me-1 fill-icon"></i>
													등록
												</div>
											</button>
											<button type="button"
												class="insertBtn btn btn-danger rounded-pill px-4 ms-2 text-white">
												<div class="d-flex align-items-center">
													<i data-feather="x-circle"
														class="feather-sm me-1 fill-icon"></i> 취소
												</div>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
						<!-- ---------------------
	                            end Person Info
	                        ---------------- -->
					</div>
				</div>

				<!-- //// detail div -->
				<div class="row" style="display: none;">
					<div class="col-lg-12" style="width: 98.6%; margin-left: 15px;">
						<!-- ---------------------
	                            start Person Info
	                        ---------------- -->
						<div class="card">
							<div class="card-header bg-info"
								style="background-color: #3699ff !important;">
								<h4 class="mb-0 text-white">게시물 조회</h4>
							</div>
							<!-- POST_CODE, BOA_CODE, EMP_NO, POST_TITLE, POST_DATE, POST_HIT, POST_ESS, POST_CONTENT -->
							<form id="postForm" action="/board/insertPost" method="post">
								<input type="hidden" id="empNo" name="empNo"
									value="${SessionInfo.empNo }"> <input type="hidden"
									id="boaCode" name="boaCode" value="${boa.boaCode }"> <input
									type="hidden" id="postEss" name="postEss">
								<div>
									<div class="card-body">
										<div class="row pt-3">

											<div class="col-md-9">
												<div class="mb-3 has-danger">
													<label style="left: 11px; position: relative;" class="insertLbl control-label">제목</label> <input
														name="dtlTitle" type="text" id="dtlTitle"
														class="form-control form-control-danger"
														style="font-size: 1.4em; border: 0px; background-color: white;" disabled />
												</div>
											</div>



										</div>

										<!--/row-->
										<div class="row">
											<!--/span-->

											<div class="col-md-3">
												<div class="mb-3">
													<label style="left: 11px; position: relative;" class="insertLbl control-label">거래일</label> 
													<input
														name="dtlDate" type="text" id="dtlDate"
														class="form-control form-control-danger"
														style="font-size: 1.2em; border: 0px; background-color: white;" disabled />
												</div>
											</div>

											<div class="col-md-3">
												<div class="mb-3 has-danger">
													<label style="left: 11px; position: relative;" class="insertLbl control-label">매출액</label> <input
														type="text" id="dtlSales"
														class="form-control form-control-danger" 
														style="font-size: 1.2em; border: 0px; background-color: white;" disabled/> 
												</div>
											</div>

											<div class="col-md-3">
												<div class="mb-3">
													<label style="left: 11px; position: relative;" class="insertLbl control-label">거래처</label> <input
														name="dtlAccount" type="text" id="dtlAccount"
														class="form-control form-control-danger"
														style="font-size: 1.2em; border: 0px; background-color: white;" disabled />
												</div>
											</div>
											<!--/span-->
										</div>
									</div>
									<hr />
									<div class="card-body">
										<!--/row-->
										<label style="left: 11px; position: relative;" class="insertLbl control-label">상세 내용</label>
										<div id="dtlContent" style="padding-left: 11px; padding-top: 11px; font-size: 1.2em; width: 984px; height: 250px;"></div>

										<!--/row-->
										<div class="col-md-4" style="margin-top: 20px;">
											<div class="mb-3">
												<label style="left: 11px; position: relative;" class="insertLbl control-label">첨부 파일</label>
												<div id="dtlAf"></div>
											</div>
										</div>
									</div>
									<div class="form-actions">
										<div class="card-body" style="top: -20px; position: relative;">
											<button id="dtlClose" type="button"
												class="btn btn-danger rounded-pill px-4 ms-2 text-white">
												<div class="d-flex align-items-center">
													<i data-feather="x-circle"
														class="feather-sm me-1 fill-icon"></i> 닫기
												</div>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
						<!-- ---------------------
	                            end Person Info
	                        ---------------- -->
					</div>
				</div>
				<!-- //// detail div -->




				<!-- ---------------------
                            start Zero Configuration
                        ---------------- -->
				<div class="card" style="width: 92.3%; margin-left: 15px;">

					<div class="card-body">
						<div class="table-responsive">
							<table id="zero_table"
								class="table table-striped table-bordered text-nowrap">
								<thead>
									<!-- start row -->
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>담당자</th>
										<th>거래일</th>
										<th>매출액</th>
										<th>거래처</th>
									</tr>
									<!-- end row -->
								</thead>
								<tbody>
									<c:set value="${fn:length(postList) }" var="listSize"></c:set>
									<c:forEach items="${postList }" var="post" varStatus="i">
										<tr>
											<td>${listSize -  i.index }</td>
											<td><a class="postLink" href="#" data-post-code="${post.postCode }"
												style="color: #3e5569; text-decoration: none;">${post.postTitle }</a></td>
											<td>
												<font style="cursor: pointer;">${post.postEmp.empName } ${post.postEmp.empPos }</font>
											</td>
											<td>${essList.get(i.index).date }</td>
											<td><fmt:formatNumber
													value="${essList.get(i.index).sales }" pattern="0,000" />원</td>
											<td>${essList.get(i.index).account }</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- ---------------------
                            end Zero Configuration
                        ---------------- -->
			</div>
		</div>

		<div id="hideBtn" style="display: none;">
			<div class="col-sm-12 col-md-2" style="text-align: right;">
				<button style="width: 126px; margin-left: 10px;" class="insertBtn btn btn-info mb-2">게시물 등록</button>
			</div>
		</div>




	</div>	
	




</div>

<!-- chart -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/flot/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/jquery.flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<!-- dataTable -->
<script src="${pageContext.request.contextPath}/resources/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/extra-libs/datatables.net-bs4/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/pages/datatable/datatable-basic.init.js"></script>

<script type="text/javascript">

	// IT 지원요청
	// 1. 
	// 2.
	// 3.
	
	// 거래처 관리
	// 1. 
	// 2.
	// 3.
	
	// 매출 관리
	// 1. 7~12월 전체 매출. 막대 그래프 
	// 2. 7~12월 담당자 별 매출. 꺾은선 그래프
	// 3. 거래처별 매출

	var options1 = {
	  series: [{
	  name: '총 매출',
	  data: [44, 55, 57, 56, 61, 58]
	}],
	  chart: {
	  type: 'bar',
	  height: 350
	},
	plotOptions: {
	  bar: {
	    horizontal: false,
	    columnWidth: '55%',
	    endingShape: 'rounded'
	  },
	},
	dataLabels: {
	  enabled: false
	},
	stroke: {
	  show: true,
	  width: 2,
	  colors: ['transparent']
	},
	xaxis: {
	  categories: ['7월','8월','9월','10월','11월','12월'],
	},
	yaxis: {
	  title: {
	    text: '만 원'
	  }
	},
	fill: {
	  opacity: 1
	},
	tooltip: {
	  y: {
	    formatter: function (val) {
	      return val.toLocaleString() + " 만원"
	    }
	  }
	}
	};

	var options2 = {
		series : [ {
			name : "한유진 대리",
			data : [ 28, 29, 33, 36, 32, 32 ]
		}, {
			name : "한유진 대리",
			data : [ 12, 11, 14, 18, 17, 13 ]
		}, {
			name : "한유진 대리",
			data : [ 12, 11, 14, 18, 17, 13 ]
		}, {
			name : "한유진 대리",
			data : [ 12, 11, 14, 18, 17, 13 ]
		} 
		],
		chart : {
			height : 350,
			type : 'line',
			dropShadow : {
				enabled : true,
				color : '#000',
				top : 18,
				left : 7,
				blur : 10,
				opacity : 0.2
			},
			toolbar : {
				show : false
			}
		},
		colors : [ '#77B6EA', '#545454', '#F04F4F', '#61E692' ],
		dataLabels : {
			enabled : false,
		},
		stroke : {
			curve : 'smooth'
		},
		grid : {
			borderColor : '#e7e7e7',
			row : {
				colors : [ '#f3f3f3', 'transparent' ], // takes an array which will be repeated on columns
				opacity : 0.5
			},
		},
		markers : {
			size : 1
		},
		tooltip: {
		  y: {
		    formatter: function (val) {
		      return val.toLocaleString() + " 만원"
		    }
		  }
		},       		
		xaxis : {
			categories : [ '7월','8월','9월','10월','11월','12월' ]
		},
		yaxis : {
			title : {
				text : '만원 '
			},
			min : 0,
			max : 4200
		},
		// 지웠더니 하단에 제대로 나오네
// 		legend : {
// 			position : 'top',
// 			horizontalAlign : 'right',
// 			floating : true,
// 			offsetY : -25,
// 			offsetX : -5
// 		}
	};
	
	var options3 = {
		series : [ 44, 55, 13, 43, 22, 33 ],
		chart : {
			width : 260,
			type : 'pie',
		},
		labels : [ 'A','B','C','D','E','F' ],
		colors : [ '#FF5E5E', '#FF5EFB', '#5E69FF', '#5ECAFF', '#DAD07B', '#6DC060' ],
		tooltip: {
		  y: {
		    formatter: function (val) {
		      return val.toLocaleString() + " 만원"
		    }
		  }
		},       		
		responsive : [ {
			breakpoint : 480,
			options : {
				chart : {
					width : 200
				},
				legend : {
					position : 'bottom'
				}
			}
		} ]
	};

	////
	let postList = ${postJson};
	let essList = ${essJson};
	console.log('post',postList);
	console.log('ess',essList);
	
	let months = [
		{name:"07",sales:0},
		{name:"08",sales:0},
		{name:"09",sales:0},
		{name:"10",sales:0},
		{name:"11",sales:0},
		{name:"12",sales:0}
	];
	
	let emps = [
		{no:"",name:"",sales:0,pos:"",months:[
			{name:"07",sales:0},{name:"08",sales:0},{name:"09",sales:0},{name:"10",sales:0},{name:"11",sales:0},{name:"12",sales:0}
		]},
		{no:"",name:"",sales:0,pos:"",months:[
			{name:"07",sales:0},{name:"08",sales:0},{name:"09",sales:0},{name:"10",sales:0},{name:"11",sales:0},{name:"12",sales:0}
		]},
		{no:"",name:"",sales:0,pos:"",months:[
			{name:"07",sales:0},{name:"08",sales:0},{name:"09",sales:0},{name:"10",sales:0},{name:"11",sales:0},{name:"12",sales:0}
		]},
		{no:"",name:"",sales:0,pos:"",months:[
			{name:"07",sales:0},{name:"08",sales:0},{name:"09",sales:0},{name:"10",sales:0},{name:"11",sales:0},{name:"12",sales:0}
		]}
	];

	// 상반기 하반기 구분
	if(essList[0]['date'].substring(0,4) == '2023'){
		months = [
			{name:"01",sales:0},
			{name:"02",sales:0},
			{name:"03",sales:0},
			{name:"04",sales:0},
			{name:"05",sales:0},
			{name:"06",sales:0}
		];
		
		emps = [
			{no:"",name:"",sales:0,pos:"",months:[
				{name:"01",sales:0},{name:"02",sales:0},{name:"03",sales:0},{name:"04",sales:0},{name:"05",sales:0},{name:"06",sales:0}
			]},
			{no:"",name:"",sales:0,pos:"",months:[
				{name:"01",sales:0},{name:"02",sales:0},{name:"03",sales:0},{name:"04",sales:0},{name:"05",sales:0},{name:"06",sales:0}
			]},
			{no:"",name:"",sales:0,pos:"",months:[
				{name:"01",sales:0},{name:"02",sales:0},{name:"03",sales:0},{name:"04",sales:0},{name:"05",sales:0},{name:"06",sales:0}
			]},
			{no:"",name:"",sales:0,pos:"",months:[
				{name:"01",sales:0},{name:"02",sales:0},{name:"03",sales:0},{name:"04",sales:0},{name:"05",sales:0},{name:"06",sales:0}
			]}
		];
		
		options1.xaxis.categories = ['1월','2월','3월','4월','5월','6월'];
		options2.xaxis.categories = ['1월','2월','3월','4월','5월','6월'];
	}
	
	let accounts = [
		{name:"삼성엔지니어링",sales:0},
		{name:"아이리치그린",sales:0},
		{name:"퍼시스홀딩스",sales:0},
		{name:"소프트젠",sales:0},
		{name:"에이티앤에스그룹",sales:0},
		{name:"메타넷글로벌",sales:0},
		{name:"씨에이치컨설팅",sales:0},
	];
	
	// emps에 정보 넣기
	let empCount = 0;
	
	for(let i=0; i<postList.length; i++){
		let addFlag = true;
		
		for(let j=0; j<emps.length; j++){
			if(postList[i]['empNo'] == emps[j]['no']){
				addFlag = false;
				break;
			}
		}
		
		if(addFlag){
			for(let j=0; j<emps.length; j++){
				if(emps[j]['no'] == ''){
					emps[j]['no'] = postList[i]['empNo'];
					emps[j]['name'] = postList[i]['postEmp']['empName'];
					emps[j]['pos'] = postList[i]['postEmp']['empPos'];
					empCount++;
					break;
				}
			}
		}
		
// 		console.log('for chk',i);
		if(empCount == 4){
			break;
		}
	}
	
// 	console.log('chk',essList[0]['sales']);
// 	console.log('chk',Number(essList[0]['sales']));
	for(let i=0; i<postList.length; i++){
// 		console.log('mon',essList[i]['date'].substring(5,7), months[0]['name']);
		for(let j=0; j<months.length; j++){
			if(essList[i]['date'].substring(5,7) == months[j]['name']){
				months[j]['sales'] += Number(essList[i]['sales']);
				
				for(let k=0; k<emps.length; k++){
					if(postList[i]['empNo'] == emps[k]['no']){
// 						console.log('mon2 chk',emps[k]['months'][0]['name'] , essList[i]['date'].substring(5,7));
						for(let l=0; l<emps[k]['months'].length; l++){
							if(emps[k]['months'][l]['name'] == essList[i]['date'].substring(5,7)){
								emps[k]['months'][l]['sales'] += Number(essList[i]['sales']);
							}
						}
					}
				}
			}
		}
		
		for(let j=0; j<accounts.length; j++){
			if(essList[i]['account'] == accounts[j]['name']){
				accounts[j]['sales'] += Number(essList[i]['sales']);
			}
		}
	}

	accounts.sort((a,b)=>{
		return b.sales - a.sales;
	})
	
	console.log('acc',accounts);
	console.log('emps',emps);
// 	console.log('m7',months[0]['sales']);
	console.log('op3',options3);
	console.log('op2',options2.series[0].data[0]);
	console.log('op2',options2.series[0].data.length);
	console.log('op2',options2);
	console.log('data',emps[3]['months'][5]['sales']/10000);
	
	// 데이터 넣기 수정
	for(let i=0; i<options1.series[0].data.length; i++){
		options1.series[0].data[i] = Math.round(months[i]['sales']/10000);
	}
	
	console.log('le',options2.series.length,options2.series[0].data.length);
	for(let i=0; i<options2.series.length; i++){
		options2.series[i]['name'] = emps[i]['name'] +' '+ emps[i]['pos'];
		
		for(let j=0; j<options2.series[i].data.length; j++){
			options2.series[i].data[j] = Math.round(emps[i]['months'][j]['sales']/10000);
		}
	}
	
	for(let i=0; i<options3.series.length; i++){
		if(i == options3.series.length - 1){
			let etcSales = 0;
			for(let j=4; j<accounts.length; j++){
				console.log('etc');
				etcSales += Math.round(accounts[j]['sales']/10000);
			}
			
			options3.series[i] = etcSales;
			options3.labels[i] = '기타';
			
		}else{
			options3.series[i] = Math.round(accounts[i]['sales']/10000);
			options3.labels[i] = accounts[i]['name'];
		}
		
	}
	
	console.log('op2d',options2.series);
	
	var chart1 = new ApexCharts(document.querySelector("#chart1"), options1);
	chart1.render();
	
	var chart2 = new ApexCharts(document.querySelector("#chart2"), options2);
	chart2.render();	
	
	var chart3 = new ApexCharts(document.querySelector("#chart3"), options3);
	chart3.render();
	
	let year; let month; let date;
	
	document.addEventListener('DOMContentLoaded', () => {
		
		////
		// 사이드바
		let boaNames = document.querySelectorAll('.boaName');
		var length = 11;
		
		for(let i=0; i<boaNames.length; i++){
			let boaName = boaNames[i].innerHTML;
			
			if(boaName.length > 11){
				boaName = boaName.substring(0,length)+'..';	
			}
			
			boaNames[i].innerHTML = boaName;
		}
		
		// boaLi 마우스오버
		let boaLis = document.querySelectorAll('.boaLi');
		console.log('boaLis ::',boaLis);
		
		for(let i=0; i<boaLis.length; i++){
			boaLis[i].addEventListener('mouseover',(e)=>{
// 				console.log('e ::',e);
// 				console.log('e ::',e.target);
				if(e.target.tagName == 'FONT' ||e.target.tagName == 'SVG' ||e.target.tagName == 'SPAN'){ 
					e.target.parentElement.style.backgroundColor = '#F9F9F9';
					e.target.parentElement.children[0].style.backgroundColor = '#F9F9F9';
					return; 
				}
				e.target.style.backgroundColor = '#F9F9F9';
				e.target.children[0].style.backgroundColor = '#F9F9F9';
			});
			boaLis[i].addEventListener('mouseout',(e)=>{
				if(e.target.tagName == 'FONT' ||e.target.tagName == 'SVG' ||e.target.tagName == 'SPAN'){ 
					e.target.parentElement.style.backgroundColor = 'white';
					e.target.parentElement.children[0].style.backgroundColor = 'white';
					return; 
				}
				e.target.style.backgroundColor = 'white';
				e.target.children[0].style.backgroundColor = 'white';
			});
		}
		
		// boaLink 클릭시 게시판으로 이동
		let boaLinks = document.querySelectorAll('.boaLink');
		for(let i=0; i<boaLinks.length; i++){
			boaLinks[i].addEventListener('click',(e)=>{
				console.log('et ::',e.target);
				let val = '';
				if(e.target.tagName == 'FONT' ||e.target.tagName == 'SVG' ||e.target.tagName == 'SPAN'){ 
					val = e.target.parentElement.children[0].value;					
				}else{
					val = e.target.children[0].value;
				}
				
				console.log('val ::',val);
				location.href = '/board/list?boaCode='+val;
			});
		}
		
		
		
		// 날짜 기준으로 정렬 하기 - 가져와서 사용하는 스크립트 파일의 option을 변경해야 함.
// 		$("#zero_table").dataTable({
// 			"order": [[3, 'desc']]
// 		});		
		
// 		console.log('chart',document.querySelector('#SvgjsSvg1009'));
		let div3 = document.querySelector('#SvgjsSvg1009');
		div3.style.width = 270+'px';
		div3.style.height = 405+'px';
		
		let div3Div = div3.children[0];
		div3Div.style.width = 370+'px';
		div3Div.style.height = 405+'px';
		
		let div3Option = div3Div.children[0];
		div3Option.style.left = 55+'px'; 
		div3Option.style.top = 243+'px'; 
		div3Option.style.width = 145+'px'; 
		div3Option.style.height = 402+'px'; 
		
// 		console.log('op1',options1);

		// 좌우 스크롤 나오지 않게 게시글 div 너비 수정
		document.querySelector('#zero_table_wrapper').style.width = 97.2+'%';
		
		// chart2 상단 div 안보이게
// 		let legends = document.querySelectorAll('.apexcharts-legend-series');
		
// 		for(let i=0; i<3; i++){
// 			legends[i].style.display = 'none';
// 		}
// 		console.log('le',legends);

		// chart3 legend
		let legends = document.querySelectorAll('.position-rigth');
		console.log('le',legends);
		
		// table search float right
		document.querySelector('#zero_table_filter').style.float = 'right';
		
		// table 하단에 등록 버튼 넣기
		console.log('div',document.querySelector('#zero_table').parentElement.parentElement.parentElement.children[2]);
		let pageDiv = document.querySelector('#zero_table').parentElement.parentElement.parentElement.children[2].children[1];
		pageDiv.classList.remove('col-md-7');
		pageDiv.classList.add('col-md-5');
		
		let hideBtn = document.querySelector('#hideBtn').children[0].cloneNode(true);
		pageDiv.parentElement.appendChild(hideBtn);
		
		// post 등록 - 이동하지 않고 차트 보이는 상태에서 등록하기.
		let listFlag = true;
		
		let inserts = document.querySelectorAll('.insertBtn');
		console.log('inserts',inserts);
		for(let i=0; i<inserts.length; i++){
			inserts[i].addEventListener('click',(e)=>{
				
				console.log('ins e t',e.target);
				let parentDiv = document.querySelector('#parentDiv');
				
				if(listFlag){
					parentDiv.children[0].style.display = 'block';
					
					// 스크롤 이동
					$(".right-part").animate({ scrollTop: 0 }, "slow");
					
					listFlag = false;
					
				}else{
					if(confirm("변경사항은 저장되지 않습니다.")){
						parentDiv.children[0].style.display = 'none';
						
						listFlag = true;
					}
				}
			});
		}		
		
		// CKEditor
		CKEDITOR.config.width = 982;
		CKEDITOR.config.height = 260;
		CKEDITOR.replace('postContent',{
			footnotesPrefix: 'a',
// 			filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload.do'
		});		
		
		// date max 오늘 까지.
		let now = new Date();
		
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
		
		document.querySelector('#essDate').setAttribute('max', year+'-'+month+'-'+date);
		
		// 거래처 select 추가
		for(let i=0; i<accounts.length; i++){
			let option = document.createElement("option");
			
			option.value = accounts[i]['name'];
			option.innerHTML = accounts[i]['name'];
			document.querySelector('#essAccount').appendChild(option);
		}
		
		// 매출액 콤마 표시
		let nanFlag = false;
		document.querySelector('#essSales').addEventListener('keyup',(e)=>{
			console.log('sa chk',Number(e.target.value),e.target.value);
			let checkVal = e.target.value.replaceAll(',','');
			if(checkVal.substring(checkVal.length-1, checkVal.length)=='원'){
				checkVal = checkVal.substring(0, checkVal.length-1);
			}
			if(isNaN(checkVal)){
				e.target.focus();
				alert('숫자만 입력해주세요.');
				e.target.value = '';
				nanFlag = true;
			}
		});
		document.querySelector('#essSales').addEventListener('paste',(e)=>{
			if(isNaN(e.target.value)){
				e.target.focus();
				alert('숫자만 입력해주세요.');
				e.target.value = '';
				nanFlag = true;
			}
		});
		document.querySelector('#essSales').addEventListener('change',(e)=>{
			if(nanFlag){
				nanFlag = false;
				
			}else{
				console.log('sa chk2',e.target.value);
				let checkVal = e.target.value.replaceAll(',','');
				if(checkVal.substring(checkVal.length-1, checkVal.length)=='원'){
					checkVal = checkVal.substring(0, checkVal.length-1);
				}			
				e.target.value = Number(checkVal).toLocaleString() + '원';
			}
		});
		
		// 게시물 등록
		document.querySelector('#postInsert').addEventListener('click',()=>{
			event.preventDefault();
			
			// 필수 항목 값 확인
			let postTitle = document.querySelector('#postTitle');
			let essDate = document.querySelector('#essDate');
			let essSales = document.querySelector('#essSales');
			let essAccount = document.querySelector('#essAccount');
			
			if(postTitle.value == "" || postTitle.value == null){
			    alert("제목을 입력해주세요.");
			    postTitle.focus();
			    return false;   
			 }
			 
			console.log('date',essDate.value);
			if(essDate.value == "" || essDate.value == null){
				alert("거래일을 입력해주세요.");
				essDate.focus();
				return false;   
			}			

			if(essSales.value == "" || essSales.value == null){
				alert("매출액을 입력해주세요.");
				essSales.focus();
				return false;   
			}			

			if(essAccount.value == "" || essAccount.value == null){
				alert("거래처를 선택해주세요.");
				essAccount.focus();
				return false;   
			}			
			
			// hidden ess 값 넣기
			dateVal = essDate.value.toString().replaceAll('-','/'); // replace한 값을 date에 넣을 수 없음. 다른 변수에 담기.
			essSales.value = essSales.value.replaceAll(',','').replaceAll('원','');
			
			document.querySelector('#postEss').value = dateVal+'-'+essSales.value+'-'+essAccount.value;
			console.log('ess',dateVal+'-'+essSales.value+'-'+essAccount.value);
			
			document.querySelector('#postForm').submit();
// 			document.forms[0].submit();
// 			let postContent = CKEDITOR.instances.postContent.getData();
		});
		
		// 제목 마우스오버, 클릭(dtl 화면 띄우기)
		let postLinks = document.querySelectorAll('.postLink');
		let dtlFlag = false;
		let parentDiv = document.querySelector('#parentDiv');
		
		for(let i=0; i<postLinks.length; i++){
			postLinks[i].addEventListener('mouseover', (e)=>{
				e.target.style.color = '#0789EC';
				e.target.style.textDecoration = 'underline';
			});
			
			postLinks[i].addEventListener('mouseout', (e)=>{
				e.target.style.color = '#3e5569';
				e.target.style.textDecoration = 'none';
			});		
			
			// 목록 있는 상태에서 조회, 등록화면 추가하는 걸로 변경 - side의 버튼을 제거
			postLinks[i].addEventListener('click', (e)=>{
				console.log('e t',e.target.dataset.postCode);
				let postCode = e.target.dataset.postCode;
				
				let dtlPost;
				for(let j=0; j<postList.length; j++){
					if(postList[i]['postCode'] == postCode){
						dtlPost = postList[i];
					}
				}
				
				if(!dtlFlag){
					parentDiv.children[1].style.display = 'block';
					
					document.querySelector('#dtlTitle').value = dtlPost.postTitle;
				  	document.querySelector('#dtlDate').value = dtlPost.postEss.split('-')[0];
					document.querySelector('#dtlSales').value = Number(dtlPost.postEss.split('-')[1]).toLocaleString()+'원';
					document.querySelector('#dtlAccount').value = dtlPost.postEss.split('-')[2];
					document.querySelector('#dtlContent').innerHTML = dtlPost.postContent;
					
					dtlFlag = true;
					
				}else{
					parentDiv.children[1].style.display = 'none';
					
					document.querySelector('#dtlTitle').value = '';
					document.querySelector('#dtlDate').value = '';
					document.querySelector('#dtlSales').value = '';
					document.querySelector('#dtlAccount').value = '';
					document.querySelector('#dtlContent').innerHTML = '';
					
					dtlFlag = false;
				}
				
			});
		}
		
		// dtl 화면 닫기
		document.querySelector('#dtlClose').addEventListener('click',()=>{
			parentDiv.children[1].style.display = 'none';
			
			dtlFlag = false;
		});
		
		
	});
</script>






