<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
#alaDiv{
	top: -8px;
	left: 91px;
	position: relative;
	background-color: red;
	height: 12px;
	width: 12px;
	text-align: center;
	border-radius: 15px;
 	display: none; 
	z-index: 2;
	cursor: pointer;
}
#goodDiv{
	top: -8px;
	left: 91px;
	position: relative;
	background-color: red;
	height: 12px;
	width: 12px;
	text-align: center;
	border-radius: 15px;
 	display: none; 
	z-index: 2;
	cursor: pointer;
}

</style>



<!-- -------------------------------------------------------------- -->
<!-- Topbar header - style you can find in pages.scss -->
<!-- -------------------------------------------------------------- -->
<header class="topbar" >
	<nav class="navbar top-navbar navbar-expand-md navbar-dark">
		<div class="navbar-header">
			<!-- This is for the sidebar toggle which is visible on mobile only -->
			<a class="nav-toggler waves-effect waves-light d-block d-md-none"
				href="javascript:void(0)" > <i
				class="ri-close-line fs-6 ri-menu-2-line"></i>
			</a>
			<!-- -------------------------------------------------------------- -->
			<!-- Logo -->
			<!-- -------------------------------------------------------------- -->
			<a class="navbar-brand" href="/main/home" style="padding: 10px 10px 0 0px;"> <!-- Logo icon --> 
				<b class="logo-icon scroll-sidebar" style="width: 240px;"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
					<!-- Dark Logo icon --> 
					<img src="${pageContext.request.contextPath }/resources/images/logo3.png"
					alt="homepage" class="dark-logo" style="backgorund-color: #fff; width:200px" /> <!--           Light Logo icon -->
					<%--           <img width="220" src="${pageContext.request.contextPath }/resources/images/logo3.png" alt="homepage" class="light-logo" /> --%>
				</b> <!--End Logo icon -->
			</a>
			<!-- -------------------------------------------------------------- -->
			<!-- End Logo -->
			<!-- -------------------------------------------------------------- -->
			<!-- -------------------------------------------------------------- -->
			<!-- Toggle which is visible on mobile only -->
			<!-- -------------------------------------------------------------- -->
			<a class="topbartoggler d-block d-md-none waves-effect waves-light"
				href="javascript:void(0)" data-bs-toggle="collapse"
				data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation"><i class="ri-more-line fs-6"></i></a>
		</div>
		<!-- -------------------------------------------------------------- -->
		<!-- End Logo -->
		<!-- -------------------------------------------------------------- -->
		<div class="navbar-collapse collapse" id="navbarSupportedContent">
			<!-- -------------------------------------------------------------- -->
			<!-- toggle and nav items -->
			<!-- -------------------------------------------------------------- -->
			<ul class="navbar-nav me-auto">
				<li class="nav-item d-none d-md-block">
					<a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar">
						<i data-feather="menu" class="feather-sm"></i>
					</a>
				</li>
				<!-- -------------------------------------------------------------- -->
				<!-- mega menu -->
				<!-- -------------------------------------------------------------- -->
<!-- 				<li class="nav-item dropdown mega-dropdown"><a -->
<!-- 					class="nav-link dropdown-toggle waves-effect waves-dark" -->
<!-- 					role="button" href="#" data-bs-toggle="dropdown" -->
<!-- 					aria-haspopup="true" aria-expanded="false"> <span -->
<!-- 						class="d-none d-md-block">Mega <i -->
<!-- 							data-feather="chevron-down" class="feather-sm"></i></span> <span -->
<!-- 						class="d-block d-md-none"><i class="ri-keyboard-line"></i></span> -->
<!-- 				</a> -->
<!-- 					<div class="dropdown-menu dropdown-menu-animate-up"> -->
<!-- 						<div class="mega-dropdown-menu row"> -->
<!-- 							<div class="col-lg-3 col-xl-2 mb-4"> -->
<!-- 								<h4 class="mb-3">Carousel</h4> -->
<!-- 								CAROUSEL -->
<!-- 								<div id="carouselExampleControls" -->
<!-- 									class="carousel carousel-dark slide" data-bs-ride="carousel"> -->
<!-- 									<div class="carousel-inner"> -->
<!-- 										<div class="carousel-item active"> -->
<!-- 											<img class="d-block img-fluid" -->
<%-- 												src="${pageContext.request.contextPath }/resources/assets/images/big/img1.jpg" --%>
<!-- 												alt="First slide" /> -->
<!-- 										</div> -->
<!-- 										<div class="carousel-item"> -->
<!-- 											<img class="d-block img-fluid" -->
<%-- 												src="${pageContext.request.contextPath }/resources/assets/images/big/img2.jpg" --%>
<!-- 												alt="Second slide" /> -->
<!-- 										</div> -->
<!-- 										<div class="carousel-item"> -->
<!-- 											<img class="d-block img-fluid" -->
<%-- 												src="${pageContext.request.contextPath }/resources/assets/images/big/img3.jpg" --%>
<!-- 												alt="Third slide" /> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<a class="carousel-control-prev" -->
<!-- 										href="#carouselExampleControls" role="button" -->
<!-- 										data-bs-slide="prev"> <span -->
<!-- 										class="carousel-control-prev-icon" aria-hidden="true"></span> -->
<!-- 										<span class="visually-hidden">Previous</span> -->
<!-- 									</a> <a class="carousel-control-next" -->
<!-- 										href="#carouselExampleControls" role="button" -->
<!-- 										data-bs-slide="next"> <span -->
<!-- 										class="carousel-control-next-icon" aria-hidden="true"></span> -->
<!-- 										<span class="visually-hidden">Next</span> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 								End CAROUSEL -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-3 mb-4"> -->
<!-- 								<h4 class="mb-3">Accordian</h4> -->
<!-- 								Accordian -->
<!-- 								<div class="accordion accordion-flush" -->
<!-- 									id="accordionFlushExample"> -->
<!-- 									<div class="accordion-item"> -->
<!-- 										<h2 class="accordion-header" id="flush-headingOne"> -->
<!-- 											<button class="accordion-button collapsed" type="button" -->
<!-- 												data-bs-toggle="collapse" -->
<!-- 												data-bs-target="#flush-collapseOne" aria-expanded="false" -->
<!-- 												aria-controls="flush-collapseOne">Accordion Item #1</button> -->
<!-- 										</h2> -->
<!-- 										<div id="flush-collapseOne" -->
<!-- 											class="accordion-collapse collapse" -->
<!-- 											aria-labelledby="flush-headingOne" -->
<!-- 											data-bs-parent="#accordionFlushExample"> -->
<!-- 											<div class="accordion-body">Anim pariatur cliche -->
<!-- 												reprehenderit, enim eiusmod high life accusamus terry -->
<!-- 												richardson ad squid.</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="accordion-item"> -->
<!-- 										<h2 class="accordion-header" id="flush-headingTwo"> -->
<!-- 											<button class="accordion-button collapsed" type="button" -->
<!-- 												data-bs-toggle="collapse" -->
<!-- 												data-bs-target="#flush-collapseTwo" aria-expanded="false" -->
<!-- 												aria-controls="flush-collapseTwo">Accordion Item #2</button> -->
<!-- 										</h2> -->
<!-- 										<div id="flush-collapseTwo" -->
<!-- 											class="accordion-collapse collapse" -->
<!-- 											aria-labelledby="flush-headingTwo" -->
<!-- 											data-bs-parent="#accordionFlushExample"> -->
<!-- 											<div class="accordion-body">Anim pariatur cliche -->
<!-- 												reprehenderit, enim eiusmod high life accusamus terry -->
<!-- 												richardson ad squid.</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="accordion-item"> -->
<!-- 										<h2 class="accordion-header" id="flush-headingThree"> -->
<!-- 											<button class="accordion-button collapsed" type="button" -->
<!-- 												data-bs-toggle="collapse" -->
<!-- 												data-bs-target="#flush-collapseThree" aria-expanded="false" -->
<!-- 												aria-controls="flush-collapseThree">Accordion Item -->
<!-- 												#3</button> -->
<!-- 										</h2> -->
<!-- 										<div id="flush-collapseThree" -->
<!-- 											class="accordion-collapse collapse" -->
<!-- 											aria-labelledby="flush-headingThree" -->
<!-- 											data-bs-parent="#accordionFlushExample"> -->
<!-- 											<div class="accordion-body">Anim pariatur cliche -->
<!-- 												reprehenderit, enim eiusmod high life accusamus terry -->
<!-- 												richardson ad squid.</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-3 mb-4"> -->
<!-- 								<h4 class="mb-3">Contact Us</h4> -->
<!-- 								Contact -->
<!-- 								<form> -->
<!-- 									<div class="mb-3 form-floating"> -->
<!-- 										<input type="text" class="form-control" id="exampleInputname1" -->
<!-- 											placeholder="Enter Name" /> <label>Enter Name</label> -->
<!-- 									</div> -->
<!-- 									<div class="mb-3 form-floating"> -->
<!-- 										<input type="email" class="form-control" -->
<!-- 											placeholder="Enter email" /> <label>Enter Email -->
<!-- 											address</label> -->
<!-- 									</div> -->
<!-- 									<div class="mb-3 form-floating"> -->
<!-- 										<textarea class="form-control" id="exampleTextarea" rows="3" -->
<!-- 											placeholder="Message"></textarea> -->
<!-- 										<label>Enter Message</label> -->
<!-- 									</div> -->
<!-- 									<button type="submit" class="btn px-4 rounded-pill btn-info">Submit</button> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 							<div class="col-lg-3 col-xlg-4 mb-4"> -->
<!-- 								<h4 class="mb-3">List style</h4> -->
<!-- 								List style -->
<!-- 								<ul class="list-style-none"> -->
<!-- 									<li><a href="#"><i data-feather="check-circle" -->
<!-- 											class="feather-sm text-success me-2"></i> You can give link</a></li> -->
<!-- 									<li><a href="#"><i data-feather="check-circle" -->
<!-- 											class="feather-sm text-success me-2"></i> Give link</a></li> -->
<!-- 									<li><a href="#"><i data-feather="check-circle" -->
<!-- 											class="feather-sm text-success me-2"></i> Another Give link</a></li> -->
<!-- 									<li><a href="#"><i data-feather="check-circle" -->
<!-- 											class="feather-sm text-success me-2"></i> Forth link</a></li> -->
<!-- 									<li><a href="#"><i data-feather="check-circle" -->
<!-- 											class="feather-sm text-success me-2"></i> Another fifth link</a></li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div></li> -->
				<!-- -------------------------------------------------------------- -->
				<!-- End mega menu -->
				<!-- -------------------------------------------------------------- -->
				<!-- -------------------------------------------------------------- -->
				<!-- create new -->
				<!-- -------------------------------------------------------------- -->
<!-- 				<li class="nav-item dropdown"> -->
<!-- 					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  -->
<!-- 						<span class="d-none d-md-block"> -->
<!-- 							Create New  -->
<!-- 							<i data-feather="chevron-down" class="feather-sm"></i> -->
<!-- 						</span>  -->
<!-- 						<span class="d-block d-md-none"> -->
<!-- 							<i data-feather="plus" class="feather-sm"></i> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 					<div class="dropdown-menu dropdown-menu-animate-up" aria-labelledby="navbarDropdown"> -->
<!-- 						<a class="dropdown-item" href="#">Action</a>  -->
<!-- 						<a class="dropdown-item" href="#">Another action</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a class="dropdown-item" href="#">Something else here</a> -->
<!-- 					</div> -->
<!-- 				</li> -->
				<!-- -------------------------------------------------------------- -->
				<!-- Search -->
				<!-- ------------------------------------------------------------ -->
<!-- 				<li class="nav-item search-box"> -->
<!-- 					<a class="nav-link waves-effect waves-dark" href="javascript:(0)"> -->
<!-- 						<i data-feather="search" class="feather-sm"></i> -->
<!-- 					</a> -->
<!-- 					<form class="app-search position-absolute"> -->
<!-- 						<input type="text" class="form-control" placeholder="Search &amp; enter" />  -->
<!-- 							<a class="srh-btn"> -->
<!-- 								<i data-feather="x" class="feather-sm"></i> -->
<!-- 							</a> -->
<!-- 					</form> -->
<!-- 				</li> -->
			</ul>
			<!-- -------------------------------------------------------------- -->
			<!-- Right side toggle and nav items -->
			<!-- -------------------------------------------------------------- -->
			
			<!-- 좋아요 알람 div -->
			<div id="goodDiv"></div>				
			<!-- 알람 div -->
			<div id="alaDiv"></div>				
			
			<ul class="navbar-nav">
				<!-- -------------------------------------------------------------- -->
				<!-- create new -->
				<!-- -------------------------------------------------------------- -->
			<li class="nav-item dropdown" id="goodBtn">
					<a
						class="nav-link dropdown-toggle waves-effect waves-dark" href=""
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 
						<i class="fa-regular fa-heart" style="font-size: 1.25rem;"></i>
					</a>
					<div 
						class="dropdown-menu dropdown-menu-end mailbox dropdown-menu-animate-up" aria-labelledby="2">
						<span class="with-arrow">
						<span class="bg-danger"></span>
						</span>
						<ul class="list-style-none">
							<li>
							<div class="drop-title text-white bg-danger">
								<h4 class="mb-0 mt-1"></h4>
								<span class="fw-light">좋아요</span>
							</div>
							</li>
							<li>
								<div class="message-center notifications">
									
									<c:forEach items="${goodMesList }" var="good">
										<div class="goodMessage" style="background-color: #FFFAFA; border-bottom: 1px solid #adabab;">
											
											<a href="#" class="message-item" style="padding-right: 1px;"> 
												<span class="btn btn-light-success text-success btn-circle">
										              <c:choose>
										              	<c:when test="${empty good.afVO }">
											              <img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="users" class="rounded-circle" width="42" height="42"
											              	style="left: -7px; top: -7px; position: relative;"/>
										              	</c:when>
										              	<c:otherwise>
											              <img src="${pageContext.request.contextPath }/resources/images/${good.afVO.afSave}" alt="users" class="rounded-circle" width="42" height="42"
											              		style="left: -7px; top: -7px; position: relative;"/>
										              	</c:otherwise>
										              </c:choose>
												</span>
												<div class="mail-contnet">
													<p class="message-title">"${good.empVO.empName } ${good.empVO.empPos }"님이 좋아요를 눌렀습니다.</p>
<!-- 													<span class="mail-desc">407호 중간 점검</span>  -->
													<span class="time"><fmt:formatDate value="${good.goodDate }" pattern="yyyy/MM/dd"></fmt:formatDate></span>
												</div>
											</a>											
										</div>
									</c:forEach>
									
									</div>
								</li>
							<li id="openBtn" style="background-color: #FFFFFF;">
								<a class="nav-link text-center mb-1 text-dark" href="/good/list2">
									<i class="fas fa-hand-holding-heart"></i>
									<strong>더보기</strong> 
								</a>
							</li>
						</ul>
					</div>
				</li>
				<!-- -------------------------------------------------------------- -->
				<!-- Comment -->
				<!-- -------------------------------------------------------------- -->
				<li class="nav-item dropdown" id="alaBtn">
					<a
						class="nav-link dropdown-toggle waves-effect waves-dark" href=""
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 
						<i data-feather="bell" class="feather-sm"></i>
					</a>
					<div style=""
						class="dropdown-menu dropdown-menu-end mailbox dropdown-menu-animate-up">
						<span class="with-arrow"><span class="bg-primary"></span></span>
						<ul class="list-style-none">
							<li>
								<div class="drop-title bg-primary text-white">
									<h4 class="mb-0 mt-1">4 개의</h4>
									<span class="fw-light">새로운 알림</span>
								</div>
							</li>
							<li>
								<div class="message-center notifications">
									
									<a href="#" class="message-item" style="padding-right: 1px;"> 
										<span class="btn btn-light-success text-success btn-circle">
											<i data-feather="calendar" class="feather-sm fill-white"></i>
										</span>
										<div class="mail-contnet">
											<h5 class="message-title">일정 1시간 전</h5>
											<span class="mail-desc">407호 중간 점검</span> 
											<span class="time">03:00 PM</span>
										</div>
									</a>
									<a href="#" class="message-item" style="padding-right: 1px;"> 
										<span class="btn btn-light-danger text-danger btn-circle"> 
											<i data-feather="heart" class="feather-sm fill-white"></i>
										</span>
										<div class="mail-contnet">
											<h5 class="message-title">좋아요를 받았습니다</h5>
											<span class="mail-desc">안녕하세용</span> 
											<span class="time">11:00 AM</span>
										</div>
									</a>
									<a href="#" class="message-item" style="padding-right: 1px;"> 
										<span class="btn btn-light-info text-info btn-circle"> 
											<i data-feather="edit" class="feather-sm fill-white"></i>
										</span>
										<div class="mail-contnet">
											<h5 class="message-title">결재 승인</h5>
											<span class="mail-desc">휴가신청서</span> 
											<span class="time">10:08 AM</span>
										</div>
									</a>
									<a href="#" class="message-item" style="padding-right: 1px;"> 
										<span class="btn btn-light-primary text-primary btn-circle">
											<i data-feather="users" class="feather-sm fill-white"></i>
										</span>
										<div class="mail-contnet">
											<h5 class="message-title">새로운 댓글</h5>
											<span class="mail-desc">안녕하세용</span> 
											<span class="time">09:02 AM</span>
										</div>
									</a>
								</div>
							</li>
							<li id="openBtn">
								<a class="nav-link text-center mb-1 text-dark" href="#">
									<strong>펼치기</strong> 
									<i data-feather="chevron-down" class="feather-sm"></i>
								</a>
							</li>
						</ul>
					</div>
				</li>
				<!-- -------------------------------------------------------------- -->
				
				<!--  여기에 태그 닫는게 많이 없는데 건드리면 화면이 깨져서 일단 보류!! -->
				<li class="nav-item dropdown" id="timeBtn" data-no ="${SessionInfo.empNo }">
					<a class="nav-link dropdown-toggle " href="#"
						id="navbarDropdown2" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > 
						<i class="ri-timer-line" style="padding-bottom: 63px;font-size: 1.4rem;"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-end mailbox dropdown-menu-animate-up" aria-labelledby="2">
						<span class="with-arrow">
							<span class="bg-primary"></span>
						</span>
						<ul class="list-style-none" style="width: 330px;">
							<li>
								<div class="drop-title text-white bg-primary">
									<h4 class="mb-0 mt-1"></h4>
									<span class="fw-light">타임라인</span>
								</div>
							</li>
							<li>
<!-- 							<h6 class="mt-3 mb-3">Activity Timeline</h6> -->
								<div style="height:300px;" class="message-center notifications ps-container ps-theme-default ps-scrollbar-y-rail">
									<div class="" >
										<c:choose>
											<c:when test="${empty timlist }">
												<div>타임라인이 존재하지 않습니다.</div>
											</c:when>
											<c:otherwise>
												<c:forEach items="${timlist }" var="timeline">
													<a id="gettimeline" href="#" class="message-item" style="padding-right: 1px; height: 72px;"> 
														<c:set value="${timeline.timType }" var="str"/>
														<c:choose>
															<c:when test="${fn:substring(str,0,2) eq 'CO'}">
																<img src="${pageContext.request.contextPath }/resources/images/CO.JPG" alt="CO" class="rounded-circle" style="width: 40px; height: 40px;" />
															</c:when> 
															<c:when test="${fn:substring(str,0,2) eq 'FR'}">
																<img src="${pageContext.request.contextPath}/resources/images/FR.JPG" alt="FR" class="rounded-circle" style="width: 40px; height: 40px;"/>
															</c:when> 
															<c:when test="${fn:substring(str,0,2) eq 'RE'}">
																<img src="${pageContext.request.contextPath}/resources/images/RE.JPG" alt="RE" class="rounded-circle" style="width: 40px; height: 40px;" />
															</c:when> 
															<c:when test="${fn:substring(str,0,3) eq 'CON'}">
																<img src="${pageContext.request.contextPath}/resources/images/AD.JPG" alt="CON" class="rounded-circle" style="width: 40px; height: 40px;" />
															</c:when> 
															<c:when test="${fn:substring(str,0,2) eq 'AP'}">
																<img src="${pageContext.request.contextPath}/resources/images/AP.JPG" alt="AP" class="rounded-circle" style="width: 40px; height: 40px;" />
															</c:when> 
															<c:when test="${fn:substring(str,0,2) eq 'SC'}">
																<img src="${pageContext.request.contextPath}/resources/images/SC.JPG" alt="SC" class="rounded-circle" style="width: 40px; height: 40px;" />
															</c:when> 
															<c:when test="${fn:substring(str,0,2) eq 'NO'}">
																	<img src="${pageContext.request.contextPath}/resources/images/NO.JPG" alt="NO" class="rounded-circle" style="width: 40px; height: 40px;" /> 
															</c:when>
															<c:otherwise>
																	<img src="${pageContext.request.contextPath}/resources/images/4.jpg" alt="user" class="rounded-circle" style="width: 40px; height: 40px;" /> 
															</c:otherwise>
														</c:choose>												
														<div class="mail-contnet">
															<font style="font-size: 1.1em; color: black;" class="tcontent">
																${timeline.timContent }
															</font>
															<br>
															<span class="ttime" style="color: gray;">${timeline.timDate }</span>
														</div>
													</a>	
													
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div> 
								</div>
							</li>
						</ul>
					<a class="nav-link text-center mb-1 text-dark" href="/emp/mypage"> 
						<strong>더보기</strong> 
						<i data-feather="chevron-right" class="feather-sm"></i>
					</a>
					</div></li>

				<!-- -------------------------------------------------------------- -->
				<!-- End TimeLine -->
				<!-- -------------------------------------------------------------- -->

				<!-- chat -->
				<li class="nav-item dropdown" id="chatBtn">
					<a class="nav-link dropdown-toggle waves-effect waves-dark" href="#"
						data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
						<i data-feather="message-circle" class="feather-sm"></i>
					</a>
				</li>
				<!-- chat -->

				<!-- -------------------------------------------------------------- -->
				<!-- User profile and search -->
				<!-- -------------------------------------------------------------- -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
						href="" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
						
		              <!-- 임시 프로필사진 -->
		              <c:choose>
		              	<c:when test="${empty profile }">
							<img src="${pageContext.request.contextPath }/resources/images/profile.png"
								alt="user" class="rounded-circle" width="31" height="31"/>
		              	</c:when>
		              	<c:otherwise>
							<img src="${pageContext.request.contextPath }/resources/images/${profile.afSave}"
								alt="user" class="rounded-circle" width="31" height="31"/>
		              	</c:otherwise>
		              </c:choose>						
					</a>
					<div class="dropdown-menu dropdown-menu-end user-dd animated flipInY">
						<span class="with-arrow"><span class="bg-primary"></span></span>
						<div class="d-flex no-block align-items-center p-3 bg-primary text-white mb-2">
							<div class="">
				              <c:choose>
				              	<c:when test="${empty profile }">
									<img src="${pageContext.request.contextPath }/resources/images/profile.png"
										alt="user" class="rounded-circle" width="60" height="60"/>
				              	</c:when>
				              	<c:otherwise>
									<img src="${pageContext.request.contextPath }/resources/images/${profile.afSave}"
										alt="user" class="rounded-circle" width="60" height="60"/>
				              	</c:otherwise>
				              </c:choose>						
							</div>
							<div class="ms-2">
								<h4 class="mb-0">${SessionInfo.empName }</h4>
								<p class="mb-0">${SessionInfo.empEmail }</p>
							</div>
						</div>
						<a class="dropdown-item" href="/emp/mypage">
							<i data-feather="user" class="feather-sm text-info me-1 ms-1"></i>마이페이지
						</a> 
						<div class="dropdown-divider"></div>
<!-- 						<a class="dropdown-item" href="#"><i data-feather="credit-card" -->
<!-- 							class="feather-sm text-primary me-1 ms-1"></i> My Balance -->
<!-- 						</a>  -->
						<a class="dropdown-item" href="/message/home">
							<i data-feather="mail" class="feather-sm text-success me-1 ms-1"></i> 쪽지
						</a>
						<div class="dropdown-divider"></div>
<!-- 						<a class="dropdown-item" href="#"> -->
<!-- 							<i data-feather="settings" class="feather-sm text-warning me-1 ms-1"></i> Account Setting -->
<!-- 						</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
						<a class="dropdown-item" href="/conn/logout">
							<i data-feather="log-out" class="feather-sm text-danger me-1 ms-1"></i>로그아웃
						</a>
						<div class="dropdown-divider"></div>
<!-- 						<div class="pl-4 p-2"> -->
<!-- 							<a href="#" class="btn d-block w-100 btn-primary rounded-pill">View -->
<!-- 								Profile</a> -->
<!-- 						</div> -->
					</div>
				</li>
				<!-- -------------------------------------------------------------- -->
				<!-- User profile and search -->
				<!-- -------------------------------------------------------------- -->
			</ul>
		</div>
	</nav>

	<div id="chatDiv"
		style="width: 350px; height: 470px; position: absolute; right: 70px; top: 66px; background-color: #fff; position: absolute; display: none;">
		<div id="dragDiv" style="background-color: #7a9db7">
			<div>큰아이콘</div>
			<div>작은아이콘</div>
		</div>
		<div id="main">
			<div style="display: none;">채팅방목록</div>
			<div style="display: none;">사원목록</div>
			<div style="display: block;">채팅방</div>
		</div>
	</div>
</header>
<!-- -------------------------------------------------------------- -->
<!-- End Topbar header -->
<!-- -------------------------------------------------------------- -->

<script type="text/javascript">
	let isPress = false, // 마우스를 눌렀을 때
	prevPosX = 0, // 이전에 위치한 X값
	prevPosY = 0; // 이전에 위치한 Y값

	const $target = document.querySelector("#dragDiv");

	//드래그 구현에 필요한 이벤트
	$target.onmousedown = start;
	$target.onmouseup = end;

	//요소의 상위 요소 (임시로 window)
	window.onmousemove = move;

	// mousedown
	function start(e) {
		e.preventDefault(); // 다른 요소 드래그 안되게 막음.
		prevPosX = e.clientX;
		prevPosY = e.clientY;

		isPress = true;
	}

	// mousemove
	function move(e) {
		if (!isPress) {
			return;
		}

		// 이전 좌표와 현재 좌표 차이값
		const posX = prevPosX - e.clientX;
		const posY = prevPosY - e.clientY;

		// 현재 좌표가 이전 좌표로 바뀜
		prevPosX = e.clientX;
		prevPosY = e.clientY;

		// left, top으로 이동
		const $target2 = document.querySelector("#chatDiv");
		$target2.style.left = ($target2.offsetLeft - posX) + "px";
		$target2.style.top = ($target2.offsetTop - posY) + "px";
	}

	// mouseup
	function end() {
		isPress = false;
	}
	
	// 알람 버튼
// 	let alaDiv = document.querySelector('#alaDiv');
	let goodDiv = document.querySelector('#goodDiv');
	
// 	document.querySelector('#alaBtn').addEventListener('click',(e)=>{
// 		console.log('ala e.t ::',e.target);
// 		alaDiv.style.display = 'none';
// 	});

	document.addEventListener('DOMContentLoaded', ()=>{
// 		console.log('g l ::','${goodList}');
		console.log('g l ::','${goodList.get(0).aleVO}');
		let goodList = '${goodList}';
		console.log('g g l ::',goodList);
		console.log('g g l ::',goodList.length);
		console.log('g g l ::',goodList[0]);
		console.log('g g l ::',goodList[0].aleCheck);		
		
// 		if(goodList != ''){
// 			goodList = JSON.parse(goodList);
// 		}
// 		console.log('g g l ::',goodList);
	});

	document.querySelector('#goodDiv').addEventListener('click',(e)=>{
		console.log('good e.t ::',e.target);
		
		// alert check Y로 업데이트.
		aleUpdate('good');
		
		goodDiv.style.display = 'none';
	});
	
	// alert update
	function aleUpdate(p_content){
		
		let aleContent = '';
		if(p_content == 'good'){
			aleContent = '새로운 좋아요';
		}else if(p_content == 'tim'){
			aleContent = '?';
		}
		
		let jsonData = {
			  "empNo":${SessionInfo.empNo}	/* 사원번호 */
			, "aleContent":aleContent
		};
				
		let result;
		
        let xhr = new XMLHttpRequest();
        xhr.open('post','/alert/update');
        xhr.onreadystatechange = (e)=>{
            if(xhr.readyState == 4 && xhr.status == 200){
            	alert(e.target.response);
            	result = e.target.status;
            }
        }
		xhr.setRequestHeader("Content-Type", "application/json");    		
		xhr.send(JSON.stringify(p_data)); // post json 방식일 때		
		
		
	}
	
	
	
	$(function(){
		
		// 사이드바 닫기?? toggle
        $(".sidebartoggler").on("click", function () {
		  console.log('side ::',document.querySelector('.sidebartoggler'));
		
//           $("#main-wrapper").toggleClass("mini-sidebar");
//           if ($("#main-wrapper").hasClass("mini-sidebar")) {
//             $(".sidebartoggler").prop("checked", !0);
//             $("#main-wrapper").attr("data-sidebartype", "mini-sidebar");
//           } else {
//             $(".sidebartoggler").prop("checked", !1);
//             $("#main-wrapper").attr("data-sidebartype", "full");
//           }
        });		
		
		console.log('side ::',document.querySelector('.sidebartoggler'));
//         $("#main-wrapper").toggleClass("mini-sidebar");
		document.querySelector('.sidebartoggler').click();
		
		
		 var timeBtn = $("#timeBtn");
		 
		 timeBtn.on("click",function(){
			 console.log('no',this.dataset.no)
// 			 getTimList(this.dataset.no);
		 })
		
		 
		 
		 function getTimList(empNo){
			 $.ajax({
				 url : "/timeline/listTime/"+empNo,
				 type : "get",
				 success: function(res){
					 var html = "";
					 res.map(function(value,idx){
						 html += "<div class='' id='gettimeline'>";
						html += "	<div class='sl-left'>";
						if(value.timType.substring(0,2) == 'CO'){
							html += "	<img src='${pageContext.request.contextPath }/resources/images/CO.JPG' alt='CO' class='rounded-circle' />";							
						}else if(value.timType.substring(0,2) == 'FR'){
							html += "	<img src='${pageContext.request.contextPath }/resources/images/FR.JPG' alt='FR' class='rounded-circle' />";	
						}else if(value.timType.substring(0,2) == 'RE'){
							html += "	<img src='${pageContext.request.contextPath }/resources/images/RE.JPG' alt='RE' class='rounded-circle' />";	
						}else if(value.timType.substring(0,3) == 'CON'){
							html += "	<img src='${pageContext.request.contextPath }/resources/images/CON.JPG' alt='CON' class='rounded-circle' />";	
						}else if(value.timType.substring(0,2) == 'AP'){
							html += "	<img src='${pageContext.request.contextPath }/resources/images/AP.JPG' alt='FR' class='rounded-circle' />";	
						}else if(value.timType.substring(0,2) == 'SC'){
							html += "	<img src='${pageContext.request.contextPath }/resources/images/SC.JPG' alt='FR' class='rounded-circle' />";	
						}else if(value.timType.substring(0,2) == 'NO'){
							html += "	<img src='${pageContext.request.contextPath }/resources/images/NO.JPG' alt='FR' class='rounded-circle' />";	
						}else{
							html += "	<img src='${pageContext.request.contextPath}/resources/images/4.jpg' alt='user' class='rounded-circle' /> ";
						}
						html += "	</div>";
						html += "	<div class='sl-right'>";
						html += "		<div class='font-medium' value="+ value.timContent +">";
						html += "			<span class='sl-date' value=" + value.timDate + "></span>";
						html += "		</div>";
						html += "		<div class='desc'>"+ value.timContent + "</div>";
						html += "	</div>";
						html += "</div>";
					 })
					 $("#gettimeline").html(html);
				 }
			 })
		 }
	})
	
	$("#chatBtn").on('click', function() {
		if ($("#chatDiv").css('display') == 'none') {
			$("#chatDiv").css('display', 'block');
		} else {
			$("#chatDiv").css('display', 'none');
		}

	});
	
</script>


