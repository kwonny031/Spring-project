<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- =======================  << 사이드바 >> ==================================== -->

<!-- ?? 오류나서 일단 주석처리 -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->

<!-- <div class="page-wrapper"> -->
<!-- -------------------------------------------------------------- -->
<!-- Email App Part -->
<!-- -------------------------------------------------------------- -->
<div class="email-app">
	<!-- -------------------------------------------------------------- -->
	<!-- Left Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="left-part">
		<a
			class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none"
			href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="p-3">
				<!--                 <a -->
				<!--                   id="compose_mail" -->
				<!--                   class="waves-effect waves-light btn btn-danger d-block" -->
				<!--                   href="javascript: void(0)" -->
				<!--                   >새 결재 진행</a -->
				<!--                 > -->
			</div>
			<div class="divider"></div>
			<ul class="list-group">
				<li><small class="p-3 grey-text text-lighten-1 db">결재
						양식</small></li>
				<li class="list-group-item"><a
					href="/approval/order?apfName=order"
					class="active list-group-item-action d-flex align-items-center"><i
						data-feather="inbox" class="feather-sm fill-white me-2"></i> 발주서 <span
						class="
                        badge
                        bg-light-success
                        text-success
                        px-3
                        rounded-pill
                        font-medium
                        ms-auto
                      ">6</span></a>
				</li>
				<li class="list-group-item"><input type="hidden" name="kind"
					id="kind" /> <a href="/approval/bisOrd?apfName=business"
					class="list-group-item-action" id="send-text"> <i
						data-feather="star" class="feather-sm fill-white me-2"></i> 출장보고서
						<!--                   <a href="/approval/bisOrd" class="list-group-item-action"> -->
				</a></li>
				<li class="list-group-item"><a href="/approval/recruit"
					class="list-group-item-action d-flex align-items-center"> <i
						data-feather="send" class="feather-sm fill-white me-2"></i> 채용품의서
						<span
						class="
                        badge
                        bg-light-danger
                        text-danger
                        font-medium
                        px-3
                        rounded-pill
                        ms-auto
                      ">3</span></a>
				</li>
				<li class="list-group-item"><a href="/approval/vacation"
					class="list-group-item-action"> <i data-feather="mail"
						class="feather-sm fill-white me-2"></i> 휴가신청서
				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
				<li><small class="p-3 grey-text text-lighten-1 db">결재
						문서</small></li>
				<li class="list-group-item"><a href="/approval/aplineList"
					class="list-group-item-action"> <i data-feather="slash"
						class="feather-sm fill-white me-2"></i> 결재할 문서
				</a></li>

				<li class="list-group-item"><a href="/approval/appList"
					class="list-group-item-action"> <i data-feather="trash-2"
						class="feather-sm fill-white me-2"></i> 결재진행 문서
				</a></li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"> <i data-feather="trash-2"
						class="feather-sm fill-white me-2"></i> 임시보관함
				</a></li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"> <i data-feather="trash-2"
						class="feather-sm fill-white me-2"></i> 참조문서함
				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
				<li><small class="p-3 grey-text text-lighten-1 db">완료
						문서함</small></li>
				<li class="list-group-item"><a href="/approval/appendList"
					class="list-group-item-action"> <i data-feather="slash"
						class="feather-sm fill-white me-2"></i> 결재 완료 문서
				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
				<li><small class="p-3 grey-text text-lighten-1 db">부서
						문서함</small></li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"> <i data-feather="slash"
						class="feather-sm fill-white me-2"></i> 부서참조함
				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
				<li><small class="p-3 grey-text text-lighten-1 db">Labels</small>
				</li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"><i
						class="text-danger ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						Work </a></li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"><i
						class="text-cyan ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						Business </a></li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"><i
						class="text-warning ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						Family </a></li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"><i
						class="text-info ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						Friends </a></li>
			</ul>
		</div>
	</div>

	<!-- =======================  << 사이드바 END >> ==================================== -->


	<!-- -------------------------------------------------------------- -->
	<!-- Right Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="right-part mail-list bg-white overflow-auto">
		<div class="container-fluid">
			<!-- -------------------------------------------------------------- -->
			<!-- Start Page Content -->
			<!-- -------------------------------------------------------------- -->
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">결재 진행 문서</h4>
					<h6 class="card-subtitle lh-base">Home > 정자결재 > 결재 진행 문서</h6>
				</div>
				<div class="table-responsive">
					<table class="table customize-table mb-0 v-middle">
						<thead class="table-light">
							<tr>
								<th class="border-bottom border-top">&emsp;&emsp;기안일</th>
								<th class="border-bottom border-top">&emsp;제목</th>
								<th class="border-bottom border-top">&nbsp;&nbsp;결재상태</th>
								<th class="border-bottom border-top">&nbsp;긴급</th>
								<th class="border-bottom border-top">결재양식코드</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${appList }" var="appList"
								varStatus="i">
								<tr>
									<td>
										<div class="d-flex align-items-center">

											<span class="ms-3 fw-normal">${appList.appDate }</span>
										</div>
									</td>
									<td>${appList.appTitle }</td>
									<td>
										&nbsp;&nbsp;<span class="badge bg-light-warning text-warning fw-normal">진행중</span>
									</td>
									<td>
									<c:choose>
										<c:when test="${appList.appUrgent == 1}">
											<span
												class="badge bg-light-danger text-danger fw-normal">긴급</span>
										</c:when>
										<c:otherwise>
<!-- 											<span class="badge bg-light-success text-success fw-normal">긴급아님</span> -->
										</c:otherwise>
									</c:choose>
									</td>
									<td>
										&emsp;&emsp;${appList.apfCode }
										<!--                       <div class="dropdown dropstart"> -->
										<!--                         <a --> <!--                           href="#" -->
										<!--                           class="link" --> <!--                           id="dropdownMenuButton" -->
										<!--                           data-bs-toggle="dropdown" --> <!--                           aria-expanded="false" -->
										<!--                         > --> <!--                           <i data-feather="more-horizontal" class="feather-sm"></i> -->
										<!--                         </a> --> <!--                         <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
										<!--                           <li><a class="dropdown-item" href="#">Edit</a></li> -->
										<!--                           <li><a class="dropdown-item" href="#">Delete</a></li> -->
										<!--                         </ul> --> <!--                       </div> -->
									</td>
								</tr>
							</c:forEach>



						</tbody>
					</table>
				</div>
			</div>
			<!-- -------------------------------------------------------------- -->
			<!-- Right Part  Mail Compose -->
			<!-- -------------------------------------------------------------- -->
			<div class="right-part mail-compose bg-white overflow-auto"
				style="display: none">
				<div class="p-4 border-bottom">
					<div class="d-flex align-items-center">
						<div>
							<h4>Compose</h4>
							<span>create new message</span>
						</div>
						<div class="ms-auto">
							<button id="cancel_compose" class="btn btn-dark">Back</button>
						</div>
					</div>
				</div>
				<!-- Action part -->
				<!-- Button group part -->
				<div class="card-body">
					<form>
						<div class="mb-3">
							<input type="email" id="example-email" name="example-email"
								class="form-control" placeholder="To" />
						</div>
						<div class="mb-3">
							<input type="text" id="example-subject" name="example-subject"
								class="form-control" placeholder="Subject" />
						</div>
						<div id="summernote"></div>
						<h4>Attachment</h4>
						<div class="dropzone" id="dzid">
							<div class="fallback">
								<input name="file" type="file" multiple />
							</div>
						</div>
						<button type="submit" class="btn btn-success mt-3">
							<i class="ri-mail-line align-middle"></i> Send
						</button>
						<button type="submit" class="btn btn-dark mt-3">Discard</button>
					</form>
					<!-- Action part -->
				</div>
			</div>
			<!-- -------------------------------------------------------------- -->
			<!-- Right Part  Mail detail -->
			<!-- -------------------------------------------------------------- -->
			<div class="right-part mail-details bg-white overflow-auto"
				style="display: none">
				<div class="card-body bg-light">
					<button type="button" id="back_to_inbox"
						class="btn btn-outline-secondary fs-5 me-2">
						<i class="mdi mdi-arrow-left"></i>
					</button>
					<div class="btn-group me-2" role="group"
						aria-label="Button group with nested dropdown">
						<button type="button" class="btn btn-outline-secondary fs-5">
							<i class="bi-arrow-clockwise"></i>
						</button>
						<button type="button" class="btn btn-outline-secondary fs-5">
							<i class="ri-spam-2-fill"></i>
						</button>
						<button type="button" class="btn btn-outline-secondary fs-5">
							<i class="ri-delete-bin-7-fill"></i>
						</button>
					</div>
					<div class="btn-group me-2" role="group"
						aria-label="Button group with nested dropdown">
						<div class="btn-group" role="group">
							<button id="btnGroupDrop1" type="button"
								class="btn btn-outline-secondary dropdown-toggle"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="ri-folder-fill fs-5"></i>
							</button>
							<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
								<a class="dropdown-item" href="javascript:void(0)">Dropdown
									link</a> <a class="dropdown-item" href="javascript:void(0)">Dropdown
									link</a>
							</div>
						</div>
						<div class="btn-group" role="group">
							<button id="btnGroupDrop1" type="button"
								class="btn btn-outline-secondary dropdown-toggle"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="ri-price-tag-fill fs-5"></i>
							</button>
							<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
								<a class="dropdown-item" href="javascript:void(0)">Dropdown
									link</a> <a class="dropdown-item" href="javascript:void(0)">Dropdown
									link</a>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body border-bottom">
					<h4 class="mb-0">Your Message title goes here</h4>
				</div>
				<div class="card-body border-bottom">
					<div class="d-flex no-block align-items-center mb-5">
						<div class="me-2">
							<img src="../../assets/images/users/1.jpg" alt="user"
								class="rounded-circle" width="45" />
						</div>
						<div class="">
							<h5 class="mb-0 fs-4 font-medium">
								Hanna Gover <small> ( hgover@gmail.com )</small>
							</h5>
							<span>to Suniljoshi19@gmail.com</span>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-11">
							<h4 class="mb-3">Hey Hi,</h4>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
								natoque penatibus et magnis dis parturient montes, nascetur
								ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu,
								pretium quis, sem.Nulla consequat massa quis enim. Donec pede
								justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim
								justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam
								dictum felis eu pede mollis pretium. Integer tincidunt. Cras
								dapibus. Vivamus elementum semper nisi.</p>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
								natoque penatibus et magnis dis parturient montes, nascetur
								ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu,
								pretium quis, sem.Nulla consequat massa quis enim. Donec pede
								justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim
								justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam
								dictum felis eu pede mollis pretium. Integer tincidunt. Cras
								dapibus. Vivamus elementum semper nisi.</p>
						</div>
					</div>
				</div>
				<div class="card-body">
					<h4>
						<i data-feather="paperclip" class="feather-sm me-2 mb-2"></i>
						Attachments <span>(3)</span>
					</h4>
					<div class="row">
						<div class="col-md-2">
							<a href="javascript:void(0)"> <img
								class="img-thumbnail img-responsive" alt="attachment"
								src="../../assets/images/big/img1.jpg" />
							</a>
						</div>
						<div class="col-md-2">
							<a href="javascript:void(0)"> <img
								class="img-thumbnail img-responsive" alt="attachment"
								src="../../assets/images/big/img2.jpg" />
							</a>
						</div>
						<div class="col-md-2">
							<a href="javascript:void(0)"> <img
								class="img-thumbnail img-responsive" alt="attachment"
								src="../../assets/images/big/img3.jpg" />
							</a>
						</div>
					</div>
					<div class="border mt-3 p-3">
						<p class="pb-3">
							click here to <a href="javascript:void(0)">Reply</a> or <a
								href="javascript:void(0)">Forward</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<!-- -------------------------------------------------------------- -->
		<!-- End PAge Content -->
		<!-- -------------------------------------------------------------- -->