<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
.modal-content {
	overflow-y: initial !important
}

.modal-body {
	height: 350px;
	overflow-y: auto;
}

textarea:focus {
	border-color: #2962FF;
}

select {
	box-sizing: border-box;
	width: 100px;
	padding: 4px;
	font-size: 14px;
	border-radius: 6px;
}

option {
	padding: 4px;
	font-size: 14px;
	color: #fff;
	background: #272822;
}
</style>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String empName = request.getParameter("empName");
	String recvEmpNo = request.getParameter("recvEmpNo");
// 	out.print("파라미터 확인  : " + empName + recvEmpNo);
	
%>

	<!-- header끝 -->
	<div class="content">
		<form:form action="/message/write" method="post" id="msgForm"
			modelAttribute="msgVO">

			<div class="col-xl-6 col-lg-6">
				<div class="card">
					<div class="card-header" style="background-color: #D2E0F5;">
						<div class="mb-3 row" style="background-color: #D2E0F5;">
							<label class="col-sm-3 col-form-label">받는사람</label>
							<div style="display: flex; align-items: center;">
								<% if(recvEmpNo != null && recvEmpNo != ""){ %>
									<input type="hidden" id="hiddenRecvEmpNo" name="empNo" value=<%=recvEmpNo %>>
								<% }%>
								<input type="text" id="myInput" class="form-control" name="empName"
									style="ime-mode: disabled; width: 85%; margin-right: 5px;" placeholder="이름"
									value="<% if(empName != null){ out.print(empName); } %> <c:if test="${not empty msgReceiver }">
									<% if(empName != null){ out.print(empName); } %>
									${msgReceiver }
									</c:if>">
								<button type="button" class="btn btn-outline-dark"
									style="height: 33px;" data-bs-toggle="modal"
									data-bs-target="#myModal">
									<i class="far fa-address-book"></i>주소록
								</button>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="basic-form">
							<div class="mb-3">
								<textarea class="form-txtarea form-control" rows="8" id="mesContent" placeholder="내용을 입력해주세요" 
									name="mesContent" style="border: 1px solid #6C757D;"></textarea>

							</div>
						</div>
						<div style="display: flex; justify-content: space-between;">
							<input type="submit" class="btn btn-primary" id="btnRegister" value="전송">
							<button type="button" class="btn btn-outline-primary" onclick="window.close()">취소</button>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</form:form>
	</div>
</body>

<!-- 주소록 Modal -->
<div class="modal" id="myModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4>주소록</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="card-body" style="background-color:">
					<div class="btn-group mb-2">
						<select id="search-column">
							<option value="0" style="padding-top: 90px;">이름</option>
							<option value="1">부서</option>
							<option value="2">직급</option>
						</select>
					</div>
					<label><input type="text"
						class="form-control mb-2 form-control-sm" id="search-input"
						placeholder="search" name="keyword" value="${keyword }"
						aria-controls="file_export"></label>
					<div class="table-responsive">
						<table id="board_table"
							class="table table-bordered nowrap display">
							<thead style="background-color: #404040; color: #FFFFFF;">
								<tr>
									<th>사원 이름</th>
									<th>부서</th>
									<th>직급</th>
									<th>사원번호</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<c:forEach items="${contactList }" var="contact" varStatus="i">
									<tr>
										<td id="conName" style="cursor: pointer;"
											data-empno="${contact.empNo }">${contact.conName }</td>
										<td>${contact.conDep }</td>
										<td>${contact.conPos }</td>
										<td>${contact.empNo }</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>

			</div>

		</div>
	</div>
</div>
<!--  주소록 모달 끝 -->




<script
	src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/dist/js/pages/forms/sweetalert2/sweet-alert.init.js"></script>

<script type="text/javascript">
var searchInput = document.querySelector('#search-input');
var searchColumn = document.querySelector('#search-column');
var table = document.querySelector('#board_table');
var tbody = table.querySelector('tbody');
var rows = tbody.querySelectorAll('tr');

searchInput.addEventListener('input', filterTable);
searchColumn.addEventListener('change', filterTable);

function filterTable() {
  var searchTerm = searchInput.value.toLowerCase();
  var columnIndex = Number(searchColumn.value);
  console.log('num',searchColumn.value);
  
  for (var row of rows) {
    var cell = row.querySelector(`td:nth-child(\${columnIndex + 1})`);
    var cellText = cell.textContent.toLowerCase();
    if (cellText.includes(searchTerm)) {
      row.style.display = '';
    } else {
      row.style.display = 'none';
    }
  }
}

$(function(){
   var names = "";   // 한명 이상을 선택할 떄마다 이름이 갱신될 변수
   // 파라미터가 있는 경우
   $("#myInput").val()
   
   $("#tbody").on("click", "#conName", function(){
      var name = $(this).text();
      let empno = this.dataset.empno;
      names += name + ",";
      
      console.log("empNo : ", empno);
      
      var html = "<input type='hidden' value='" + empno + "' name='empNo'/>";
      
      $("#msgForm").append(html);
      $("#myInput").val(names);
      $("#myModal").modal('hide');
   });
   
   let msg = '${msg}';
   console.log('msg',msg);
   if(msg != null && msg == 'ok'){
      // 스윗alert
      Swal.fire(
        '',
        '쪽지를 성공적으로 보냈습니다!',
        'success'
      ).then((result)=>{
    	  window.self.close();
      });   
   }
});



</script>