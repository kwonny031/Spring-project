<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
#zero_table_length, #zero_table_info {
	display: none;
}

#zero_table_filter {
	text-align: right;
}

#search {
	margin-left: 10px;
	width: 200px;
	display: inline-block;
}
</style>
<!-- -------------------------------------------------------------- -->
<!-- -------------------------------------------------------------- -->
<div class="container-fluid" style="background-color: #FFFFFF;">
	<div>
		<img
			src="${pageContext.request.contextPath }/resources/images/freeHeader.png"
			style="width: 1147px; padding-left: 5px;" />
	</div>
	<div class="row">
		<div class="col-12">
			<!-- ---------------------
                    start Tickets
                ---------------- -->
			<div class="card"
				style="width: 98.5%; margin: -12px 0 0 5px; border: 1px solid #adabab;">
				<div class="card-body" style="padding: 5px;">

					<div style="margin: 15px 0 0 5px;">
						총 <span style="color: #C02B55;">${freeList.size() }건</span>의 게시물이
						있습니다.
					</div>
					<!--           <div class="row mt-4"> -->
					<!--           </div> -->
					<div class="card"
						style="width: 98.5%; margin-left: 15px; margin-bottom: 0;">
						<div class="card-body">
							<div class="table-responsive" style="overflow: hidden;">
								<table id="zero_table"
									class="table table-striped table-bordered text-nowrap"
									style="border: 1px solid #adabab;">
									<thead>
										<!-- start row -->
										<tr>
											<th>번호</th>
											<th>Title</th>
											<th>작성자</th>
											<th>Date</th>
											<th>조회수</th>
											<th>좋아요</th>
										</tr>
										<!-- end row -->
									</thead>
									<tbody>
										<!-- |#|제목 [댓글수]|작성자|작성일|조회수|좋아요| -->
										<c:set value="${fn:length(freeList) }" var="listSize"></c:set>
										<c:forEach items="${freeList }" var="free" varStatus="i">
											<!-- start row -->
											<tr>
												<td>${listSize -  i.index }</td>
												<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 230px;">
													<c:set value="${free.freeTitle }" var="title"></c:set>
													<c:set value="${fn:length(free.freeTitle) }" var="titleLength"></c:set>
													<c:if test="${titleLength > 24 }">
														<c:set value="${fn:substring(free.freeTitle,0,21) }.." var="title"></c:set>
													</c:if>
													
													<c:choose>
														<c:when test="${commCountList.get(i.index) eq 0 }">
															<a href="/free/detail?freeCode=${free.freeCode }"
																class="font-medium link">${title }</a>
														</c:when>
														<c:otherwise>
															<a href="/free/detail?freeCode=${free.freeCode }"
																class="font-medium link">${title } [${commCountList.get(i.index) }]</a>
														</c:otherwise>
													</c:choose>
												</td>
												<td style="width: 100px;">
													<!-- 클릭하면 div 나타나게. --> <a href="#" class="fw-bold link">${empList.get(i.index).empName }
														${posList.get(i.index).ccName }</a>
												</td>
												<td><fmt:formatDate value="${free.freeDate }"
														pattern="yyyy/MM/dd"></fmt:formatDate></td>
												<td style="width: 50px;">${free.freeHit }</td>
												<td style="width: 50px;">${goodCountList.get(i.index) }</td>
											</tr>
											<!-- end row -->
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-1" style="padding-right: 0px;">
									<button type="button" style="width: 100px" id="btnRegister"
										class="btn waves-effect waves-light btn-info ">
										<i class="fa-solid fa-pen-to-square"></i> 글쓰기
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ---------------------
                    end Tickets
                ---------------- -->
	</div>
</div>
</div>
<script>
	$(function() {

		$('#btnRegister').on('click', function() {
			location.href = '/free/register';
		});

		$("#zero_table_filter")[0].childNodes[0].innerText = "search : ";
		$("#zero_table_filter")[0].childNodes[0].innerHTML = "search : <input type=\"search\" id=\"search\" class=\"form-control mb-2 form-control-sm\" placeholder=\"\" aria-controls=\"zero_table\">";
// 		console.log("확인 : ", $("#zero_table_filter")[0].childNodes[0].innerText("검색"));

	})
</script>
<script
	src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net-bs4/js/dataTables.responsive.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/dist/js/pages/datatable/datatable-basic.init.js"></script>

<!-- 
	예외처리 
	
	throw - 일을 던져서 사용자 측에 정보 전달
	try catch - 예외를 자신이 직접 해결
	어떤 방식으로 처리할 지 상황에 따라 결정해야 함.
	
	web.xml 예외 처리 설정.	
	
	
	공통코드 테이블 만들어서 통합 관리. 
	
	로그 - slf4j
	
	썸네일 처리 - 출력은 resize로 경량화 해야 함. 다운로드는 원본.
	
	팝업 - 별개로 일을 처리할 때 > 윈도우 팝업. 다른 일을 멈출 경우 모달
	
	VO 수정 - attfile, emp, free, sch
 -->








