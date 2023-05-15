<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
          <!-- -------------------------------------------------------------- -->
          <!-- Right Part -->
          <!-- -------------------------------------------------------------- -->
          <div class="right-part mail-list bg-white overflow-auto" style="width: calc(100% - 200px); margin-left: 200px;">
            <div class="p-3 b-b">
              <div class="d-flex align-items-center">
                <div>
                  <h4>전자결재 홈</h4>
                  <span>Home > 전자결재</span>
                </div>
<!--                 <div class="ms-auto"> -->
<!--                   <input placeholder="Search Mail" id="" type="text" class="form-control" /> -->
<!--                 </div> -->
              </div>
            </div>
            <!-- Action part -->
            <!-- Button group part -->
<!--             <div class="bg-light p-3 d-md-flex align-items-center"> -->
<!--               <div class="btn-group mt-1 mb-1"> -->
<!--                 <div class="form-check"> -->
<!--                   <input type="checkbox" class="form-check-input sl-all" id="cstall" /> -->
<!--                   <label class="form-check-label" for="cstall">Check All</label> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="ms-auto"> -->
<!--                 <div -->
<!--                   class="btn-group me-2" -->
<!--                   role="group" -->
<!--                   aria-label="Button group with nested dropdown" -->
<!--                 > -->
<!--                   <button type="button" class="btn btn-outline-secondary fs-5"> -->
<!--                     <i class="bi-arrow-clockwise"></i> -->
<!--                   </button> -->
<!--                   <button type="button" class="btn btn-outline-secondary fs-5"> -->
<!--                     <i class="ri-spam-2-fill"></i> -->
<!--                   </button> -->
<!--                   <button type="button" class="btn btn-outline-secondary fs-5"> -->
<!--                     <i class="ri-delete-bin-7-fill"></i> -->
<!--                   </button> -->
<!--                 </div> -->
<!--                 <div -->
<!--                   class="btn-group me-2" -->
<!--                   role="group" -->
<!--                   aria-label="Button group with nested dropdown" -->
<!--                 > -->
<!--                   <div class="btn-group" role="group"> -->
<!--                     <button -->
<!--                       id="btnGroupDrop1" -->
<!--                       type="button" -->
<!--                       class="btn btn-outline-secondary dropdown-toggle" -->
<!--                       data-bs-toggle="dropdown" -->
<!--                       aria-haspopup="true" -->
<!--                       aria-expanded="false" -->
<!--                     > -->
<!--                       <i class="ri-folder-fill fs-5"></i> -->
<!--                     </button> -->
<!--                     <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> -->
<!--                       <a class="dropdown-item" href="javascript:void(0)">Dropdown link</a> -->
<!--                       <a class="dropdown-item" href="javascript:void(0)">Dropdown link</a> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="btn-group" role="group"> -->
<!--                     <button -->
<!--                       id="btnGroupDrop1" -->
<!--                       type="button" -->
<!--                       class="btn btn-outline-secondary dropdown-toggle" -->
<!--                       data-bs-toggle="dropdown" -->
<!--                       aria-haspopup="true" -->
<!--                       aria-expanded="false" -->
<!--                     > -->
<!--                       <i class="ri-price-tag-fill fs-5"></i> -->
<!--                     </button> -->
<!--                     <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> -->
<!--                       <a class="dropdown-item" href="javascript:void(0)">Dropdown link</a> -->
<!--                       <a class="dropdown-item" href="javascript:void(0)">Dropdown link</a> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
            <!-- Action part -->
            <!-- Mail list-->
            <div class="table-responsive">
              <div style="font-size: 16px; margin-top: 30px; margin-bottom: 20px; font-weight: 800;">&emsp;&emsp;결재할 문서</div>
                <table class="table"  style="border-color: #adabab;">
                  <thead>
                    <tr style="">
                      <th style="width: 15%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); background-color: #dddddd;">기안일</th>
                      <th style="width: 15%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); text-align: center; background-color: #dddddd;">작성자</th>
                      <th style="width: 40%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); text-align: center; background-color: #dddddd;">제목</th>
                      <th style="width: 17%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); background-color: #dddddd;">긴급</th>
                      <th style="width: 12%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); text-align: center; background-color: #dddddd;">결재상태</th>
                    </tr>
                  </thead>
                  <tbody>
<%--                     <c:set var="appList" value="{AppVO.appList }" /> --%>
                    <c:choose>
                      <c:when test="${empty appLineList }">
                        <tr>
                          <td colspan="6">결재할 문서가 없습니다.</td>
                        </tr>
                      </c:when>
                      <c:otherwise>
                        <c:forEach items="${appLineList }" var="appLineList" varStatus="i" end="1">
                          <tr>
                            <td>${appLineList.appDate }</td>
                            <td style=" text-align: center;">${appLineList.empVO.empName }  ${appLineList.empVO.empPos }</td>
                            	<c:choose>
                            	<c:when test="${appLineList.appTitle == '휴가신청서'}">
		                            <td style=" text-align: center;"><a href="/approval/vacDetail?appCode=${appLineList.appCode }&apfCode=${appLineList.apfCode}&empNo=${appLineList.empNo}">${appLineList.appTitle }</a></td>
                            	
                            	</c:when>
                            	<c:when test="${appLineList.appTitle == '채용품의서'}">
		                            <td style=" text-align: center;"><a href="/approval/recruitDetail?appCode=${appLineList.appCode }&apfCode=${appLineList.apfCode}&empNo=${appLineList.empNo}">${appLineList.appTitle }</a></td>
                            	
                            	</c:when>
                            	</c:choose>
                            <td>
									<c:choose>
										<c:when test="${appLineList.appUrgent == 1}">
											<span
												class="badge bg-light-danger text-danger fw-normal">긴급</span>
										</c:when>
										<c:otherwise>
<!-- 											<span class="badge bg-light-success text-success fw-normal">긴급아님</span> -->
										</c:otherwise>
									</c:choose>
									</td>
                            <td style=" text-align: center; color: rgb(255, 108, 50);">
                            	<span class="badge bg-light-warning text-warning fw-normal">진행중</span>
                            </td>
                          </tr>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </div>
            
            
            <!-- Action part -->
            <!-- Mail list-->
            <div class="table-responsive">
              <div style="font-size: 16px; margin-top: 30px; margin-bottom: 20px; font-weight: 800;">&emsp;&emsp;기안 진행 문서</div>
                <table class="table"  style="border-color: #adabab;">
                  <thead>
                    <tr style="">
                      <th style="width: 15%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); background-color: #dddddd;">기안일</th>
                      <th style="width: 15%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); text-align: center; background-color: #dddddd;">작성자</th>
                      <th style="width: 40%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); text-align: center; background-color: #dddddd;">제목</th>
                      <th style="width: 17%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); background-color: #dddddd;">긴급</th>
                      <th style="width: 12%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); text-align: center; background-color: #dddddd;">결재상태</th>
                    </tr>
                  </thead>
                  <tbody>
<%--                     <c:set var="appList" value="{AppVO.appList }" /> --%>
                    <c:choose>
                      <c:when test="${empty appList }">
                        <tr>
                          <td colspan="6">기안 진행중인 문서가 없습니다.</td>
                        </tr>
                      </c:when>
                      <c:otherwise>
                        <c:forEach items="${appList }" var="appList" varStatus="i" end="1">
                          <tr>
                            <td>${appList.app.appDate }</td>
                            <td style=" text-align: center;">${SessionInfo.empName } ${SessionInfo.empPos }</td>
                            	<c:choose>
                            			<c:when test="${appList.app.appTitle == '휴가신청서'}">
		                            		<td style="text-align: center;"><a href="/approval/vacIngDetail?appCode=${appList.app.appCode }&apfCode=${appList.app.apfCode}&empNo=${appList.app.empNo}">${appList.app.appTitle }</a></td>
                            	
                            			</c:when>
                            			<c:when test="${appList.app.appTitle == '채용품의서'}">
		                            		<td style="text-align: center;"><a href="/approval/recIngDetail?appCode=${appList.app.appCode }&apfCode=${appList.app.apfCode}&empNo=${appList.app.empNo}">${appList.app.appTitle }</a></td>
                            	
                            			</c:when>
                            		</c:choose>
                            
                            
                            <td  style=" /*text-align: center;*/" >
									<c:choose>
										<c:when test="${appList.app.appUrgent == 1}">
											<span
												class="badge bg-light-danger text-danger fw-normal">긴급</span>
										</c:when>
										<c:otherwise>
<!-- 											<span class="badge bg-light-success text-success fw-normal">긴급아님</span> -->
										</c:otherwise>
									</c:choose>
									</td>
                            <td style=" text-align: center; color: rgb(255, 108, 50);">
                            <c:choose>
										<c:when test="${appList.apline.aplResult eq '2'}">
											&nbsp;&nbsp;<span class="badge bg-light-success text-success fw-normal">반려</span>
										</c:when>
										<c:otherwise >
											&nbsp;&nbsp;<span class="badge bg-light-warning text-warning fw-normal">진행중</span>
										</c:otherwise>
									</c:choose>
                            </td>
                          </tr>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </div>


            <!-- Action part -->
            <!-- Mail list-->
            <div class="table-responsive">
              <div style="font-size: 16px; margin-top: 30px; margin-bottom: 20px; font-weight: 800;">&emsp;&emsp;완료 문서</div>
                <table class="table"  style="border-color: #adabab;">
                  <thead>
                    <tr style="">
                      <th style="width: 15%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); background-color: #dddddd;">기안일</th>
                      <th style="width: 15%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); text-align: center; background-color: #dddddd;">작성자</th>
                      <th style="width: 40%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); text-align: center; background-color: #dddddd;">제목</th>
                      <th style="width: 17%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); background-color: #dddddd;">긴급</th>
                      <th style="width: 12%; border-top: 1px; border-bottom: 1px; border-style: solid; border-color: rgb(185, 186, 187); text-align: center; background-color: #dddddd;">결재상태</th>
                    </tr>
                  </thead>
                  <tbody>
<%--                     <c:set var="appList" value="{AppVO.appList }" /> --%>
                    <c:choose>
                      <c:when test="${empty appEndList }">
                        <tr>
                          <td colspan="6">기안 진행중인 문서가 없습니다.</td>
                        </tr>
                      </c:when>
                      <c:otherwise>
                        <c:forEach items="${appEndList }" var="appEndList" varStatus="i" end="1">
                          <tr>
                            <td>${appEndList.app.appDate }</td>
                            <td style=" text-align: center;">${SessionInfo.empName } ${SessionInfo.empPos }</td>
                            
                            <c:choose>
                           			<c:when test="${appEndList.app.appTitle == '휴가신청서'}">
	                            		<td style="text-align: center;"><a href="/approval/vacIngDetail?appCode=${appEndList.app.appCode }&apfCode=${appEndList.app.apfCode}&empNo=${appEndList.app.empNo}">${appEndList.app.appTitle }</a></td>
                           			</c:when>
                           			<c:when test="${appEndList.app.appTitle == '채용품의서'}">
	                            		<td style="text-align: center;"><a href="/approval/recIngDetail?appCode=${appEndList.app.appCode }&apfCode=${appEndList.app.apfCode}&empNo=${appEndList.app.empNo}">${appEndList.app.appTitle }</a></td>
                           			</c:when>
                            </c:choose>
                            
                            
                            
<%--                             <td style=" text-align: center;"><a href="/approval/detail?appCode=${appEndList.appCode }">${appEndList.appTitle }</a></td> --%>
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
                            <td style=" text-align: center; color: rgb(3, 199, 3);">
                            	<span class="badge bg-light-info text-info fw-normal">결재완료</span>
                            </td>
                          </tr>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </div>
              






<!--             <div class="p-3 mt-4"> -->
<!--               <nav aria-label="Page navigation example"> -->
<!--                 <ul class="pagination justify-content-center"> -->
<!--                   <li class="page-item"> -->
<!--                     <a class="page-link" href="javascript:void(0)">Previous</a> -->
<!--                   </li> -->
<!--                   <li class="page-item"> -->
<!--                     <a class="page-link" href="javascript:void(0)">1</a> -->
<!--                   </li> -->
<!--                   <li class="page-item"> -->
<!--                     <a class="page-link" href="javascript:void(0)">2</a> -->
<!--                   </li> -->
<!--                   <li class="page-item"> -->
<!--                     <a class="page-link" href="javascript:void(0)">3</a> -->
<!--                   </li> -->
<!--                   <li class="page-item"> -->
<!--                     <a class="page-link" href="javascript:void(0)">Next</a> -->
<!--                   </li> -->
<!--                 </ul> -->
<!--               </nav> -->
<!--             </div> -->
          </div>
          <!-- -------------------------------------------------------------- -->
          <!-- Right Part  Mail Compose -->
          <!-- -------------------------------------------------------------- -->
          <div class="right-part mail-compose bg-white overflow-auto" style="display: none">
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
                  <input
                    type="email"
                    id="example-email"
                    name="example-email"
                    class="form-control"
                    placeholder="To"
                  />
                </div>
                <div class="mb-3">
                  <input
                    type="text"
                    id="example-subject"
                    name="example-subject"
                    class="form-control"
                    placeholder="Subject"
                  />
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
          <div class="right-part mail-details bg-white overflow-auto" style="display: none">
            <div class="card-body bg-light">
              <button type="button" id="back_to_inbox" class="btn btn-outline-secondary fs-5 me-2">
                <i class="mdi mdi-arrow-left"></i>
              </button>
              <div
                class="btn-group me-2"
                role="group"
                aria-label="Button group with nested dropdown"
              >
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
              <div
                class="btn-group me-2"
                role="group"
                aria-label="Button group with nested dropdown"
              >
                <div class="btn-group" role="group">
                  <button
                    id="btnGroupDrop1"
                    type="button"
                    class="btn btn-outline-secondary dropdown-toggle"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    <i class="ri-folder-fill fs-5"></i>
                  </button>
                  <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a class="dropdown-item" href="javascript:void(0)">Dropdown link</a>
                    <a class="dropdown-item" href="javascript:void(0)">Dropdown link</a>
                  </div>
                </div>
                <div class="btn-group" role="group">
                  <button
                    id="btnGroupDrop1"
                    type="button"
                    class="btn btn-outline-secondary dropdown-toggle"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    <i class="ri-price-tag-fill fs-5"></i>
                  </button>
                  <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a class="dropdown-item" href="javascript:void(0)">Dropdown link</a>
                    <a class="dropdown-item" href="javascript:void(0)">Dropdown link</a>
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
                  <img
                    src="../../assets/images/users/1.jpg"
                    alt="user"
                    class="rounded-circle"
                    width="45"
                  />
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
                  <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
                    eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
                    montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque
                    eu, pretium quis, sem.Nulla consequat massa quis enim. Donec pede justo,
                    fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,
                    imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.
                    Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.
                  </p>
                  <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
                    eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
                    montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque
                    eu, pretium quis, sem.Nulla consequat massa quis enim. Donec pede justo,
                    fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,
                    imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.
                    Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.
                  </p>
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
                  <a href="javascript:void(0)">
                    <img
                      class="img-thumbnail img-responsive"
                      alt="attachment"
                      src="../../assets/images/big/img1.jpg"
                    />
                  </a>
                </div>
                <div class="col-md-2">
                  <a href="javascript:void(0)">
                    <img
                      class="img-thumbnail img-responsive"
                      alt="attachment"
                      src="../../assets/images/big/img2.jpg"
                    />
                  </a>
                </div>
                <div class="col-md-2">
                  <a href="javascript:void(0)">
                    <img
                      class="img-thumbnail img-responsive"
                      alt="attachment"
                      src="../../assets/images/big/img3.jpg"
                    />
                  </a>
                </div>
              </div>
              <div class="border mt-3 p-3">
                <p class="pb-3">
                  click here to <a href="javascript:void(0)">Reply</a> or
                  <a href="javascript:void(0)">Forward</a>
                </p>
              </div>
            </div>
          </div>
        </div>
<script>
$(document).ready(function() {
// 	  $('#business').on('click', function(e) {
// //	    e.preventDefault(); // 기본 동작인 링크 이동을 방지

	    
//  	    var business = $(this).text(); // 클릭한 링크에 있는 텍스트 값을 가져옴

//  	    // Ajax 요청을 통해 컨트롤러로 텍스트 값을 전송
//  	    $.ajax({
//  	      url: '/approval/bisOrd',
//  	      //method: 'POST', // 전송 방식
//  	      data: JSON.stringify({ "apfName": business }), // 전송할 데이터
//  	      contentType: "application/json;charset=UTF-8",
//  	      dataType: "text",
//  	      success: function(response) {
//  	        // 성공 시 처리할 내용
//  	        alert("아작스 성공");
//  	      },
//  	      error: function(xhr) {
//  	        // 실패 시 처리할 내용
//  	        alert("아작스 실패ㅠㅠ");
//  	      }
//  	    });
// 	  });
	});
</script>
