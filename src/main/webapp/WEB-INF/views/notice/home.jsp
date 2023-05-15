<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
#zero_table_length, #zero_table_info {
	display: none;
}

.form-control mb-2 form-control-sm {
	width: 150px;
	display: inline-block;
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
<!-- Bread crumb and right sidebar toggle -->
<!-- -------------------------------------------------------------- -->
<div class="container-fluid" style="background-color: #FFFFFF;">
	<div class="row">
		<img
			src="${pageContext.request.contextPath }/resources/images/noticeHeader.png"
			style="width: 1200px; height: 243px; padding-left: 25px;" />
	</div>
	<div class="row">
		<div class="col-12">
			<!-- ---------------------
                    start Tickets
                ---------------- -->
			<div class="card" style="width: 98.5%; margin-left: 15px;">
				<div class="card-body" style="border: 1px solid #adabab;">
					<div>
						총 <span style="color: #C02B55;">${noticeList.size() }건</span>의
						게시물이 있습니다.
					</div>
					<br>

					<div class="card"
						style="width: 98.5%; margin-left: 15px; margin-top: -11px;">
						<div class="card-body" style="padding: 5px;">
							<div class="table-responsive" style="overflow: hidden;">
								<table id="zero_table"
									class="table table-striped table-bordered text-nowrap"
									style="border: 1px solid #adabab;">
									<thead>
										<!-- start row -->
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>조회수</th>
											<th>좋아요</th>
										</tr>
										<!-- end row -->
									</thead>
									<tbody>
										<!-- |#|제목 [댓글수]|작성자|작성일|조회수|좋아요| -->
										<c:set value="${fn:length(noticeList) }" var="listSize"></c:set>
										<c:forEach items="${noticeList }" var="notice" varStatus="i">
											<!-- start row -->
											<tr>
												<td>${listSize -  i.index }</td>
												<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 240px;"><a href="/notice/detail?notCode=${notice.notCode }"
													class="font-medium link">${notice.notTitle }</a></td>
												<td>
													<!-- 클릭하면 div 나타나게. --> <a href="#" class="fw-bold link">${empList.get(i.index).empName }
														${posList.get(i.index).ccName }</a>
												</td>
												<td><fmt:formatDate value="${notice.notDate }"
														type="date" pattern="yyyy/MM/dd"></fmt:formatDate></td>
												<td><fmt:parseDate value='${notice.notStart }'
														var='startDay' pattern='yyyy-MM-dd HH:mm:ss' /> <fmt:formatDate
														value="${startDay }" pattern="yyyy/MM/dd"></fmt:formatDate>
												</td>
												<td><fmt:parseDate value='${notice.notEnd }'
														var='endDay' pattern='yyyy-MM-dd HH:mm:ss' /> <fmt:formatDate
														value="${endDay }" pattern="yyyy/MM/dd"></fmt:formatDate>
												</td>
												<td>${notice.notHit }</td>
												<td>${goodCountList.get(i.index) }</td>
											</tr>
											<!-- end row -->
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="row">
								<c:if test="${SessionInfo.empNo eq '20060001' }">
									<div class="col-sm-12 col-md-1"
										style="padding-right: 0px; display: inline-block; margin: 0 5px; float: right;">
										<button type="button" style="width: 100px" id="btnRegister"
											class="btn waves-effect waves-light btn-info"
											style="float: right;">
											<i class="fa-solid fa-pen-to-square"></i> 글쓰기
										</button>
									</div>
								</c:if>
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
			location.href = '/notice/register';
		});

		$("#zero_table_filter")[0].childNodes[0].innerText = "search : ";
		$("#zero_table_filter")[0].childNodes[0].innerHTML = "search : <input type=\"search\" id=\"search\" class=\"form-control mb-2 form-control-sm\" placeholder=\"\" aria-controls=\"zero_table\">";
		console.log("확인 : ", $("#zero_table_filter")[0].childNodes[0]
				.innerText("검색"));
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








