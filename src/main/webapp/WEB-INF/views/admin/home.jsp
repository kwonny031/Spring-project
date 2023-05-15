<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
#zero_table_length, #zero_table_info{
	display:none;
}
#zero_table_filter{
	text-align: right;
}
</style>
<div class="email-app">
	<div class="left-part">
		<a
			class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none"
			href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="divider"></div>
			<ul class="list-group">
				<li class="list-group-item">
					<a href="/admin/home" class="active list-group-item-action d-flex align-items-center">
						<i data-feather="clipboard" class="feather-sm fill-white me-2"></i> 사원정보관리
					</a>
				</li>
				<li class="list-group-item">
					<a href="/admin/register" class="list-group-item-action d-flex align-items-center">
						<i data-feather="edit" class="feather-sm fill-white me-2"></i>
						신규사원등록 
					</a>
				</li>
				<li class="list-group-item">
					<a href="/admin/registerCar" class="list-group-item-action"> 
						<i data-feather="package" class="feather-sm fill-white me-2"></i> 자산등록
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- Right Part -->
		<div class="right-part mail-list bg-white" style="overflow: hidden!important;">
		<div class="p-3 b-b" style="display: inline-block; text-align: right;">
			<div class="d-flex align-items-center">
				<div class="head" style="float: left;">
					<div class="btn-group mb-2" style="padding-top: 3px;"></div>
				</div>
				<div class="ms-auto">
					<h4>사원 관리</h4>
				</div>
			</div>
		</div>
		<!-- Action part -->
		<!-- Button group part -->
		 <div class="card" style="margin-left: 15px; width:900px">
          <div class="card-body" style="padding:0">
          <div class="table-responsive" style="">
            <table id="zero_table" class="table table-striped table-bordered text-nowrap">
              <thead>
                <!-- start row -->
                <tr>
                  <th>사번</th>
                  <th>이름</th>
                  <th>직급</th>
                  <th>입사일</th>
                  <th>이메일</th>
                </tr>
                <!-- end row -->
              </thead>
              <tbody>
              	<!-- |#|제목 [댓글수]|작성자|작성일|조회수|좋아요| -->
              	<c:set value="${fn:length(empList) }" var="listSize"></c:set>
              	<c:forEach items="${empList }" var="emp" varStatus="i">
	                <!-- start row -->
	                <tr>
	                  <td>
	                    <a href="/admin/detail?empNo=${emp.empNo }"  class="font-medium link">${emp.empNo }</a> 
	                  </td>
	                  <td>
	                  	<!-- 클릭하면 div 나타나게. -->
	                    ${empList.get(i.index).empName } 
	                  </td>
	                  <td>${emp.empPos } </td>
	                  <td>
	                  <fmt:parseDate value='${emp.empDate }' var='startDay' pattern='yyyy-MM-dd HH:mm:ss'/>
	                  		<fmt:formatDate value="${startDay }" pattern="yyyy-MM-dd"></fmt:formatDate>
	                  </td>
	                  <td>${emp.empEmail }</td>
	                </tr>
	                <!-- end row -->              	
              	</c:forEach>
              </tbody>
            </table>
      	</div>
      	</div>
      	</div>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net-bs4/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/dist/js/pages/datatable/datatable-basic.init.js"></script>
<script type="text/javascript">

</script>