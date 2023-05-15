<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- =======================  << 사이드바 >> ==================================== -->

<!-- <div class="page-wrapper"> -->
        <!-- -------------------------------------------------------------- -->
        <!-- Email App Part -->
        <!-- -------------------------------------------------------------- -->
        <div class="email-app">
          <!-- -------------------------------------------------------------- -->
          <!-- Left Part -->
          <!-- -------------------------------------------------------------- -->
          <div class="left-part" style="width: 200px; background-color: #D2E0F5;">
            <a
              class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none"
              href="javascript:void(0)"
            ></a>
            <div class="scrollable" style="height: 100%">
              <div class="p-3">
	              <h3>전자결재</h3>

              </div>
              <div class="divider"></div>
              <ul class="list-group">
                <li>
                  <small class="p-3 grey-text text-lighten-1 db">결재 양식</small>
                </li>
                <li class="list-group-item">
                  <a
                    href="/approval/bisOrd?apfName=order"
                    class="active list-group-item-action d-flex align-items-center" id="order"
                    ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;발주서
                    </a>
                </li>
                <li class="list-group-item">
                	
                <a href="/approval/bisOrd?apfName=business" class="list-group-item-action" id="business" >
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;
				                출장보고서
                    </a>
                </li>
                <li class="list-group-item">
                  <a href="/approval/recruit" class="list-group-item-action d-flex align-items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;
                    	채용품의서
                    </a
                  >
                </li>
                <li class="list-group-item">
                  <a href="/approval/vacation" class="list-group-item-action">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text feather-sm"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    	&emsp;
                    	휴가신청서
                    	
                  </a>
                </li>
                <li class="list-group-item">
                  <hr />
                </li>
                <li>
                  <small class="p-3 grey-text text-lighten-1 db">결재 문서</small>
                </li>
                <li class="list-group-item">
                  <a href="/approval/aplineList" class="list-group-item-action d-flex align-items-center" id="order">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit feather-sm"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                    	&emsp;결재할 문서
                    	
                  </a>
                </li>
                
                <li class="list-group-item">
                  <a href="/approval/appList" class="list-group-item-action d-flex align-items-center" id="order">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock feather-sm"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    	&emsp;결재진행 문서
                    	
                  </a>
                </li>
                <li class="list-group-item">
                  <a href="/approval/tempstList" class="list-group-item-action">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-package feather-sm"><path d="M12.89 1.45l8 4A2 2 0 0 1 22 7.24v9.53a2 2 0 0 1-1.11 1.79l-8 4a2 2 0 0 1-1.79 0l-8-4a2 2 0 0 1-1.1-1.8V7.24a2 2 0 0 1 1.11-1.79l8-4a2 2 0 0 1 1.78 0z"></path><polyline points="2.32 6.16 12 11 21.68 6.16"></polyline><line x1="12" y1="22.76" x2="12" y2="11"></line><line x1="7" y1="3.5" x2="17" y2="8.5"></line></svg>
                    	&emsp;임시보관함
                  </a>
                </li>
                <li class="list-group-item">
                  <hr />
                </li>
                <li>
                  <small class="p-3 grey-text text-lighten-1 db">완료 문서함</small>
                </li>
                <li class="list-group-item">
                  <a href="/approval/appendList" class=" list-group-item-action d-flex align-items-center" id="order">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle feather-sm"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                    	&emsp;결재 완료 문서
                    	
                  </a>
                </li>
                <li class="list-group-item">
                  <hr />
                </li>
              </ul>
            </div>
          </div>

	<!-- =======================  << 사이드바 END >> ==================================== -->


	<!-- -------------------------------------------------------------- -->
	<!-- Right Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="page-wrapper" style="background-color: white; width: calc(100% - 200px); margin-left: 200px; min-height: 765px;">
        <!-- -------------------------------------------------------------- -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- -------------------------------------------------------------- -->
<!--         <div class="page-breadcrumb"> -->
<!--           <div class="row"> -->
<!--             <div class="col-5 align-self-center"> -->
<!--               <h4 class="page-title">결재할 문서</h4> -->
<!--               <div class="d-flex align-items-center"> -->
<!--                 <nav aria-label="breadcrumb"> -->
<!--                   <ol class="breadcrumb"> -->
<!--                     <li class="breadcrumb-item"><a href="#">Home</a></li> -->
<!--                     <li class="breadcrumb-item active" aria-current="page">전자결재</li> -->
<!--                     <li class="breadcrumb-item active" aria-current="page">결재할 문서</li> -->
<!--                   </ol> -->
<!--                 </nav> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-7 align-self-center"> -->
<!--               <div class="d-flex no-block justify-content-end align-items-center"> -->
<!--                 <div class="me-2"> -->
<!--                   <div class="lastmonth"></div> -->
<!--                 </div> -->
<!--                 <div class=""> -->
<!--                   <small>LAST MONTH</small> -->
<!--                   <h4 class="text-info mb-0 font-medium">$58,256</h4> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
        <!-- -------------------------------------------------------------- -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- -------------------------------------------------------------- -->
        <!-- -------------------------------------------------------------- -->
        <!-- Container fluid  -->
        <!-- -------------------------------------------------------------- -->
<!--         <div class="container-fluid"> -->
          <!-- -------------------------------------------------------------- -->
          <!-- Start Page Content -->
          <!-- -------------------------------------------------------------- -->
          <!-- basic table -->
          <div class="row">
            <div class="col-12">
              <!-- ---------------------
                            start Zero Configuration
                        ---------------- -->
              <div class="card" style="top:-46px;">
                <div class="border-bottom title-part-padding">
                  <h4 class="card-title mb-0">결재 완료 문서</h4>
                  <div class="d-flex align-items-center">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">전자결재</li>
                    <li class="breadcrumb-item active" aria-current="page">결재 완료 문서</li>
                  </ol>
                </nav>
              </div>
                </div>
                <div class="card-body">
<!--                   <h6 class="card-subtitle mb-3"> -->
<!--                     DataTables has most features enabled by default, so all you need to do to use it -->
<%--                     with your own tables is to call the construction function:<code> --%>
<%--                       $().DataTable();</code --%>
<%--                     >. You can refer full documentation from here --%>
<!--                     <a href="https://datatables.net/">Datatables</a> -->
<!--                   </h6> -->
<!--                   <div class="table-responsive"> -->
                    <table id="zero_config" class="table table-striped table-bordered text-nowrap" style="border-color: #adabab;">
                      <thead>
                        <!-- start row -->
                        <tr>
                          <th style="background-color: #dddddd;">기안일</th>
                          <th style="background-color: #dddddd;">제목</th>
                          <th style="background-color: #dddddd;">결재상태</th>
                          <th style="background-color: #dddddd;">긴급</th>
                          <th style="background-color: #dddddd;">결재양식코드</th>
                        </tr>
                        <!-- end row -->
                      </thead>
                      <tbody>
							<c:forEach items="${appEndList }" var="appEndList"
								varStatus="i">
								<tr>
									<td>
										<div class="d-flex align-items-center">

											<span class="ms-3 fw-normal">${appEndList.app.appDate }</span>
										</div>
									</td>
									<c:choose>
	                           			<c:when test="${appEndList.app.appTitle == '휴가신청서'}">
		                            		<td><a href="/approval/vacIngDetail?appCode=${appEndList.app.appCode }&apfCode=${appEndList.app.apfCode}&empNo=${appEndList.app.empNo}">${appEndList.app.appTitle }</a></td>
	                           			</c:when>
	                           			<c:when test="${appEndList.app.appTitle == '채용품의서'}">
		                            		<td><a href="/approval/recIngDetail?appCode=${appEndList.app.appCode }&apfCode=${appEndList.app.apfCode}&empNo=${appEndList.app.empNo}">${appEndList.app.appTitle }</a></td>
	                           			</c:when>
                            		</c:choose>
									<td>
										&nbsp;&nbsp;<span class="badge bg-light-info text-info fw-normal">결재완료</span>
									</td>
									<td>
									<c:choose>
										<c:when test="${appEndList.app.appUrgent == 1}">
											<span
												class="badge bg-light-danger text-danger fw-normal">긴급</span>
										</c:when>
										<c:otherwise>
<!-- 											<span class="badge bg-light-success text-success fw-normal">긴급아님</span> -->
										</c:otherwise>
									</c:choose>
									</td>
									<td>
										&emsp;&emsp;${appEndList.app.apfCode }
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
                      <tfoot>
                        <!-- start row -->
                        <tr>
                          <th>기안일</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>긴급</th>
                          <th>결재양식코드</th>
                        </tr>
                        <!-- end row -->
                      </tfoot>
                    </table>
<!--                   </div> -->
                </div>
              </div>
              <!-- ---------------------
                            end Zero Configuration
                        ---------------- -->
            </div>
          </div>
          <!-- order table -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- multi-column ordering -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- complex headers -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- DOM Positioning -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- alternative pagination -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- scroll-vertical -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- scroll-vetical-dynamic height -->
          <div class="row">
            <div class="col-12">
             
            </div>
          </div>
          <!-- scroll horizontal -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- scroll horizontal & vertical -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- Language - Comma decimal place  -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- language options -->
          <div class="row">
            <div class="col-12">
              
            </div>
          </div>
          <!-- table responsive -->
          
          <!-- -------------------------------------------------------------- -->
          <!-- End PAge Content -->
          <!-- -------------------------------------------------------------- -->
        </div>
        <!-- -------------------------------------------------------------- -->
        <!-- End Container fluid  -->
        <!-- -------------------------------------------------------------- -->
        
		<!-- footer -->
        <!-- -------------------------------------------------------------- -->
<!--         <footer class="footer text-center"> -->
<!--           All Rights Reserved by Xtreme admin. Designed and Developed by -->
<!--           <a href="https://www.wrappixel.com">WrapPixel</a>. -->
<!--         </footer> -->
        <!-- -------------------------------------------------------------- -->
        <!-- End footer -->
        <!-- -------------------------------------------------------------- -->
		<!-- -------------------------------------------------------------- -->
		<!-- End PAge Content -->
		<!-- -------------------------------------------------------------- -->
		<!-- -------------------------------------------------------------- -->

    <!--This page plugins -->
    <script src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net-bs4/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/dist/js/pages/datatable/datatable-basic.init.js"></script>
		