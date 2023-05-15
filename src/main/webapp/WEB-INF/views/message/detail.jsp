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
							<label class="col-sm-3 col-form-label">보낸사람</label>
							<input type="text" id="myInput" class="form-control"
                                                name="empName" value="${empVO.empName }"
                                                style="ime-mode: disabled; width: 85%; margin-right: 5px;"
                                                placeholder="이름"
                                                value="<c:if test="${not empty empName }">${empVO.empName }</c:if>"
                                                readonly>
						</div>
					</div>
					<div class="card-body">
						<div class="basic-form">
							<div class="mb-3">
								 <textarea class="form-txtarea form-control" rows="8"
                           style="background-color: #FFFFFF; color: black;"
                           id="mesContent" placeholder="${messageVO.mesContent }"
                           name="mesContent" readonly></textarea>
							</div>
						</div>
						<div style="display: flex; justify-content: space-between;">
							<input type="submit" class="btn btn-primary" id="btnRegister" value="답장">
							<button type="button" class="btn btn-outline-primary" onclick="window.close()">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</form:form>
	</div>
</body>
