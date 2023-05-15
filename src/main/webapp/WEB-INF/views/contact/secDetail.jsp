<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
.contact {
	color: black;
}

.contact:hover {var (--bs-link-hover-color);
	
}
</style>
<div class="container-fluid">
	<!-- -------------------------------------------------------------- -->
	<!-- Start Page Content -->
	<!-- -------------------------------------------------------------- -->
	<div class="row">
		<!-- Column -->
		<div class="col-lg-8 col-xl-9 col-md-9">
			<div class="card">
				<div class="card-body">
					<div class="d-flex no-block align-items-center mb-4">
						<h4 class="card-title">부서 > 보안기술부</h4>
						<div class="ms-auto">
							<div class="btn-group">
								<button type="button"
									class="
                            btn waves-effect waves-light btn-dark
                          "
									data-bs-toggle="modal" data-bs-target="#createmodel">
									<i class="bi-person-bounding-box"></i>주소록 추가
								</button>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<div id="file_export_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">


							<table id="file_export"
								class="table table-bordered nowrap display dataTable no-footer"
								role="grid" aria-describedby="file_export_info"
								style="border: 2px solid #adabab;">
								<thead>
									<tr role="row"
										style="background-color: #D2E0F5; text-align: center;">
										<th class="sorting" tabindex="0" aria-controls="file_export"
											rowspan="1" colspan="1"
											aria-label="Name: activate to sort column ascending"
											style="width: 0px;">이름</th>
										<th class="sorting" tabindex="0" aria-controls="file_export"
											rowspan="1" colspan="1"
											aria-label="Email: activate to sort column ascending"
											style="width: 0px;">부서</th>
										<th class="sorting" tabindex="0" aria-controls="file_export"
											rowspan="1" colspan="1"
											aria-label="Phone: activate to sort column ascending"
											style="width: 0px;">직급</th>
										<th class="sorting_asc" tabindex="0"
											aria-controls="file_export" rowspan="1" colspan="1"
											aria-label="Role: activate to sort column descending"
											style="width: 0px;" aria-sort="ascending">이메일</th>
										<th class="sorting" tabindex="0" aria-controls="file_export"
											rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 0px;">핸드폰 번호</th>
										<th class="sorting" tabindex="0" aria-controls="file_export"
											rowspan="1" colspan="1"
											aria-label="Age: activate to sort column ascending"
											style="width: 0px;"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${contactList }" var="contact" varStatus="i">
										<tr role="row" class="odd">
											<td><span class="fw-normal">${contact.conName }</span></td>
											<td class="">${contact.conDep }</td>
											<td class="">${contact.conPos }</td>
											<td class="sorting_1"><span
												class="badge bg-light-success text-success font-weight-medium">${contact.conEmail }</span>
											</td>
											<td>${contact.conTel }</td>
											<td>
												<button type="button"
													class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn"
													data-bs-toggle="tooltip" data-original-title="Delete">
													<i class="ri-close-line fs-5"></i>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Column -->
		<div class="col-lg-4 col-xl-3 col-md-3">
			<div class="card">

				<div class="card-body"  style="overflow-y: auto; height: 680px;">

					<div class="list-group mt-4" style="border: 2px solid #adabab;">
						<a href="/contact/list" class="list-group-item active"><i
							data-feather="list" class="feather-sm fill-white me-2"></i>공용주소록</a>
						<a href="/contact/list" class="list-group-item contact"><i
							data-feather="users" class="feather-sm fill-white me-2"></i> 전체사원
							주소록</a>
					</div>
					<h4 class="card-title mt-4">부서</h4>
					<div class="list-group" style="border: 2px solid #adabab;">
						<a href="/contact/tehDetail" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="server" class="feather-sm fill-white me-2"></i>
							기술지원본부 </a> <a href="/contact/salesDetail" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="file" class="feather-sm fill-white me-2"></i> 영업부 </a>
						<a href="/contact/mnDetail" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="save" class="feather-sm fill-white me-2"></i> 관리본부

						</a> <a href="/contact/networkDetail" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="hard-drive" class="feather-sm fill-white me-2"></i>
							네트워크기술부 </a> <a href="javascript:void(0)" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="alert-triangle" class="feather-sm fill-white me-2"></i>
							보안기술부 <span
							class="
                          badge bg-success ms-auto
                        ">${contactList.size() }</span>

						</a> <a href="javascript:void(0)" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="users" class="feather-sm fill-white me-2"></i>
							공공사업부 </a> <a href="javascript:void(0)" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="database" class="feather-sm fill-white me-2"></i>
							금융사업부 </a> <a href="javascript:void(0)" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="layers" class="feather-sm fill-white me-2"></i> 임원

						</a> <a href="javascript:void(0)" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="chrome" class="feather-sm fill-white me-2"></i>
							경영지원부 </a> <a href="javascript:void(0)" style="border-color: #adabab;"
							class="list-group-item d-flex align-items-center contact"><i
							data-feather="user" class="feather-sm fill-white me-2"></i> 재무회계부

						</a>

					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- Create Modal -->
<form:form action="/contact/list" method="post"
	modelAttribute="contactVO">
	<div class="modal fade" id="createmodel" tabindex="-1" role="dialog"
		aria-labelledby="createModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="background-color: #D2E0F5;">
				<form>
					<div class="modal-header d-flex align-items-center"
						style="background-color: #D2E0F5;">
						<h4 class="modal-title" id="createModalLabel">
							<i class="ri-mark-pen-line align-middle me-2"></i> 주소록 추가
						</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="input-group mb-3">
							<button type="button" class="btn btn-info">
								<i data-feather="user" class="feather-sm fil-white"></i>
							</button>
							<input type="text" class="form-control" name="conName"
								placeholder="이름" aria-label="name"
								style="border-color: #6C757D; outline: none; box-shadow: none;"
								onfocus="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onblur="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								onclick="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onmouseup="this.style.borderColor='#6C757D'; this.style.boxShadow='none';">

						</div>
						<div class="input-group mb-3">
							<button type="button" class="btn btn-info">
								<i data-feather="user" class="feather-sm fil-white"></i>
							</button>
							<input type="text" class="form-control" name="conDep"
								placeholder="부서"
								style="border-color: #6C757D; outline: none; box-shadow: none;"
								onfocus="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onblur="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								onclick="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onmouseup="this.style.borderColor='#6C757D'; this.style.boxShadow='none';">
						</div>
						<div class="input-group mb-3">
							<button type="button" class="btn btn-info">
								<i data-feather="user" class="feather-sm fil-white"></i>
							</button>
							<input type="text" class="form-control" name="conPos"
								placeholder="직급"
								style="border-color: #6C757D; outline: none; box-shadow: none;"
								onfocus="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onblur="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								onclick="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onmouseup="this.style.borderColor='#6C757D'; this.style.boxShadow='none';">
						</div>
						<div class="input-group mb-3">
							<button type="button" class="btn btn-info">
								<i data-feather="mail" class="feather-sm fil-white"></i>
							</button>
							<input type="text" class="form-control" name="conEmail"
								placeholder="이메일"
								style="border-color: #6C757D; outline: none; box-shadow: none;"
								onfocus="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onblur="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								onclick="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onmouseup="this.style.borderColor='#6C757D'; this.style.boxShadow='none';">
						</div>
						<div class="input-group mb-3">
							<button type="button" class="btn btn-info">
								<i data-feather="home" class="feather-sm fil-white"></i>
							</button>
							<input type="text" class="form-control" name="conCompany"
								value="쿠로오피스"
								style="border-color: rgb(108, 117, 125); outline: none; box-shadow: none;"
								onfocus="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onblur="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								onclick="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onmouseup="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								readonly>

						</div>
						<div class="input-group mb-3">
							<button type="button" class="btn btn-info">
								<i data-feather="map-pin" class="feather-sm fil-white"></i>
							</button>
							<input type="text" class="form-control" name="conAddr"
								value="서울시 강남구 역삼동 배울1로 15"
								style="border-color: #6C757D; outline: none; box-shadow: none;"
								onfocus="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onblur="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								onclick="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onmouseup="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								readonly>
						</div>
						<div class="input-group mb-3">
							<button type="button" class="btn btn-info">
								<i data-feather="book" class="feather-sm fil-white"></i>
							</button>
							<input type="text" class="form-control" name="conMemo"
								placeholder="메모"
								style="border-color: #6C757D; outline: none; box-shadow: none;"
								onfocus="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onblur="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								onclick="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onmouseup="this.style.borderColor='#6C757D'; this.style.boxShadow='none';">
						</div>
						<div class="input-group mb-3">
							<button type="button" class="btn btn-info">
								<i data-feather="phone" class="feather-sm fil-white"></i>
							</button>
							<input type="text" class="form-control" name="conTel"
								placeholder="핸드폰번호"
								style="border-color: #6C757D; outline: none; box-shadow: none;"
								onfocus="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onblur="this.style.borderColor='#6C757D'; this.style.boxShadow='none';"
								onclick="this.style.borderColor='#3699FF'; this.style.boxShadow='0 0 0 0.2rem rgba(54, 153, 255, 0.25)';"
								onmouseup="this.style.borderColor='#6C757D'; this.style.boxShadow='none';">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit"
							class="btn waves-effect waves-light btn-dark">저장</button>
						<button type="button"
							class="btn waves-effect waves-light btn-outline-dark"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</form:form>
<!-- End Container fluid  -->
<script
	src="${pageContext.request.contextPath}/resources/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/dist/js/pages/datatable/datatable-advanced.init.js"></script>
</body>
<script type="text/javascript">
	const searchInput = document
			.querySelector('input[aria-controls="file_export"]');
	const rows = document.querySelectorAll("#file_export tbody tr");

	searchInput.addEventListener("keyup", function(event) {
		const query = event.target.value.trim().toLowerCase();
		for (let i = 1; i < rows.length; i++) {
			const cols = rows[i].querySelectorAll("td");
			let match = false;
			for (let j = 1; j < cols.length; j++) {
				if (cols[j].textContent.toLowerCase().indexOf(query) !== -1) {
					match = true;
					break;
				}
			}
			rows[i].style.display = match ? "" : "none";
		}
	});
</script>
