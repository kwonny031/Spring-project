<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="email-app">
	<div class="left-part" style="width: 200px; background-color: #D2E0F5;">
		<a
			class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none"
			href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="p-3">
				<a id="compose_mail"
					class="waves-effect waves-light btn btn-danger d-block"
					href="/mail/write" style="background-color: #2962FF;">메일쓰기</a>
			</div>
			<div class="divider"></div>
			<ul class="list-group">
				<li><small class="p-3 grey-text text-lighten-1 db">메일함</small>
				</li>
				<li class="list-group-item"><a href="/mail/recieveList"
					class="active list-group-item-action d-flex align-items-center"><i
						data-feather="inbox" class="feather-sm fill-white me-2"></i> 받은메일함
						</a>
				</li>
				<li class="list-group-item"><a href="/mail/send"
					class="list-group-item-action d-flex align-items-center"> <i
						data-feather="send" class="feather-sm fill-white me-2"></i> 보낸메일함
						<span
						class="
                        badge
                        bg-light-danger
                        text-danger
                        font-medium
                        px-3
                        rounded-pill
                        ms-auto
                      "></span>
				</a></li>
				<li class="list-group-item"><a href="/mail/store"
					class="list-group-item-action"> <i data-feather="star"
						class="feather-sm fill-white me-2"></i> 중요메일함
				</a></li>
				<li class="list-group-item"><a href="/mail/outbox"
					class="list-group-item-action"> <i data-feather="mail"
						class="feather-sm fill-white me-2"></i> 임시보관함
				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
				<li class="list-group-item"><a href="/mail/trash"
					class="list-group-item-action"> <i data-feather="trash-2"
						class="feather-sm fill-white me-2"></i> 휴지통
				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
				<li><small class="p-3 grey-text text-lighten-1 db">태그</small></li>
			
				<li class="list-group-item"><a href="/mail/mng"
					class="list-group-item-action"><i
						class="text-cyan ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						경영자료 </a></li>
				<li class="list-group-item"><a href="/mail/act"
					class="list-group-item-action"><i
						class="text-warning ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						회계자료 </a></li>
				<li class="list-group-item"><a href="/mail/ref"
					class="list-group-item-action"><i
						class="text-info ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						참고자료 </a></li>
			</ul>
		</div>
	</div>
	<!-- Right Part -->
	<div class="right-part mail-list bg-white overflow-auto" style="width: calc(100% - 200px); margin-left: 200px;">
		<div class="p-3 b-b" style="display: inline-block; text-align: right;">
			<div class="d-flex align-items-center">
				<div class="head" style="float: left;">
					<div class="btn-group mb-2" style="padding-top: 3px;"></div>
				</div>
				<div class="ms-auto">
					<h4>임시보관함</h4>
				</div>
			</div>
		</div>
		<!-- Action part -->
		<!-- Button group part -->
		<div class="bg-light p-3 d-md-flex align-items-center">
			<div class="btn-group mt-1 mb-1">
				<input placeholder="Search Message" id="input" type="text"
					class="form-control" />
			</div>
			<div class="ms-auto">
				<div class="btn-group me-2" role="group"
					aria-label="Button group with nested dropdown">

					<button type="button" class="btn btn-outline-danger" id="delBtn">
						<i class="ri-delete-bin-line fs-5 align-middle"></i> 삭제
					</button>
				</div>
				<div class="btn-group me-2" role="group"
					aria-label="Button group with nested dropdown"></div>
			</div>
		</div>
		<!-- Action part -->
		<!-- Mail list-->
		<div class="table-responsive">
			<table class="table table-striped table-bordered display text-nowrap" id="custom_tool_ele">
				<thead>
					<tr style="background-color: #adabab;">

						<th style="text-align: center; color: #000000;" scope="col">받는사람</th>
						<th style="text-align: center; color: #000000;" scope="col">제목</th>
						<th style="text-align: center; color: #000000;" scope="col">내용</th>
						<th style="text-align: center; color: #000000;" scope="col">날짜</th>
						<th style="text-align: center; color: #000000;" scope="col"></th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${outboxList }" var="mail" varStatus="i">
						<tr>
							<td style="text-align: center;" data-code="${mail.mailCode }"
								class="font-medium link">${empList.get(i.index).empName}</td>
							<td
								style="text-align: center; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
								<a href="/mail/outboxdetail?mailCode=${mail.mailCode }"
								class="font-medium link">${mail.mailTitle }</a>
							</td>
							<td
								style="text-align: center; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${mail.mailContent }</td>
							<td style="text-align: center;"><fmt:formatDate
									value="${mail.mailDate }" pattern="yyyy/MM/dd"></fmt:formatDate></td>
							<td style="text-align: center;"><a class="deleteBtn"
								href="javascript:void(0)" title="Remove"> <i
									class="fas fa-trash"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		<div class="p-3 mt-4" id="pagination">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">Previous</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">1</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">2</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">3</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<script type="text/javascript">
const searchInput = document.getElementById('input');

//테이블 행(row) 요소들 가져오기
const rows = document.querySelectorAll('#custom_tool_ele tbody tr');

//검색어 입력란의 값이 변경될 때마다 실행되는 이벤트 핸들러 함수
searchInput.addEventListener('input', function(event) {
// 검색어
const searchKeyword = event.target.value.trim().toLowerCase();

// 각 행(row)마다 검색어를 포함하고 있는지 확인하고,
// 포함하고 있지 않으면 화면에서 숨깁니다.
rows.forEach(row => {
 const text = row.textContent.toLowerCase();
 if (text.includes(searchKeyword)) {
   row.style.display = '';
 } else {
   row.style.display = 'none';
 }
});
});
</script>