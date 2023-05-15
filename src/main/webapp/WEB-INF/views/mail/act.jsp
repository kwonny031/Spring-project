<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
				</a></li>
				<li class="list-group-item"><a href="/mail/send"
					class="list-group-item-action d-flex align-items-center"> <i
						data-feather="send" class="feather-sm fill-white me-2"></i> 보낸메일함
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
	<div class="right-part mail-list bg-white overflow-auto"
		style="width: calc(100% - 200px); margin-left: 200px;">
		<div class="p-3 b-b" style="display: inline-block; text-align: right;">
			<div class="d-flex align-items-center">
				<div class="head" style="float: left;">
					<div class="btn-group mb-2" style="padding-top: 3px;"></div>
				</div>

				<h4><i class="text-warning ri-checkbox-blank-circle-fill fs-5 align-middle"></i>회계 자료</h4>
			</div>

		</div>
		<hr>

		<!-- Action part -->

		<div class="container-fluid note-has-grid">

			<div class="tab-content">
				<div id="note-full-container" class="note-has-grid row">
					<c:forEach items="${actList }" var="mail" varStatus="i">
						<div class="col-md-4 single-note-item all-category">
							<div class="card card-body" style="border: 1px solid #ccc;">
								<span class="side-stick" style="background-color: #EE9D01;"></span>
								<h5 class="note-title text-truncate w-75 mb-0"
									data-noteHeading="Book a Ticket for Movie">
									${mail.mailTitle }</h5>
								<p class="note-date fs-2 text-muted">
									<fmt:formatDate value="${mail.mailDate }" pattern="yyyy/MM/dd"></fmt:formatDate>
								</p>
								<div class="note-content"
									style="border: 1px solid #ccc; width: 200px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									<p class="note-inner-content text-muted"
										data-noteContent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">
										${mail.mailContent }</p>
								</div>
								<div style="height: 10px;"></div>
								<div style="padding-left: 80%;">
									 <a href="/mail/detail?mailCode=${mail.mailCode }"><button type="button"
										class="btn waves-effect waves-light btn-outline-dark"
										style="width: 50px; height: 30px;">
										<i class="ri-mail-send-fill"></i>
									</button></a>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>
			</div>


		</div>
	</div>



	<script type="text/javascript">
		function searchMail() {
			// 검색어 입력 값 가져오기
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("input");
			filter = input.value.toUpperCase();
			table = document.getElementById("table");
			tr = table.getElementsByTagName("tr");

			// 각 <tr> 요소의 <td> 값과 검색어를 비교하여 일치하는 요소만 보이도록 함
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td");
				for (j = 0; j < td.length; j++) {
					txtValue = td[j].textContent || td[j].innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
						break;
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}

		// input 요소의 값이 변경될 때마다 검색 함수 실행
		document.getElementById("input").addEventListener("input", searchMail);
	</script>