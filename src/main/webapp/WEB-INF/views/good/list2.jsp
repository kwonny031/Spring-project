<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


    
  <div class="page-breadcrumb">
          <div class="row">
            <div class="col-5 align-self-center">
              <h3 class="page-title" style="color: #000000;">상대방의 좋아요</h3>
              <div class="d-flex align-items-center">
                
              </div>
            </div>
          </div>
        </div>
<div class="container-fluid note-has-grid">
	 <ul class="nav nav-pills p-3 bg-white mb-3 align-items-center">
            
            <li class="nav-item">
              <a
                href="/good/list"
                class="
                  nav-link
                  rounded-pill
                  note-link
                  d-flex
                  align-items-center
                  justify-content-center
                  px-3 px-md-3
                  me-0 me-md-2
                "
                id="note-business"
              >
                <i data-feather="heart" class="feather-sm fill-white me-0 me-md-1"></i
                ><span class="d-none d-md-block font-weight-medium">나의 좋아요</span></a
              >
            </li>
            <li class="nav-item">
              <a
                href="/good/list2"
                class="
                  nav-link
                  rounded-pill
                  note-link
                  d-flex
                  align-items-center
                  justify-content-center
                  px-3 px-md-3
                  me-0 me-md-2
                "
                id="note-social">
                <i data-feather="heart" class="feather-sm fill-white me-0 me-md-1"></i>
                <span class="d-none d-md-block font-weight-medium">상대방의 좋아요</span>
                <span style="margin-left: 10px !important;" class="
                        badge
                        bg-light-danger
                        text-danger
                        font-medium
                        px-3
                        rounded-pill
                        ms-auto">
                   ${goodList.size() }
                 </span>
               </a>
            </li>
          </ul>
	<div class="tab-content">
		<div id="note-full-container" class="note-has-grid row">
			<c:forEach items="${goodList }" var="good" varStatus="i">
				<div class="col-md-4 single-note-item all-category" id="goodBox" data-type="${good.goodType }">
					<div class="card card-body">
						<span class="side-stick"
							style="background-color: rgba(41, 98, 255, .5);"></span>

<!-- 						<div> -->
<!-- 							<span class="btn btn-light-danger text-danger btn-circle">  -->
<!-- 								<i data-feather="heart" class="feather-sm fill-white"></i> -->
<!-- 							</span>							 -->
<!-- 						</div> -->
						<div>
							<h5 class="note-title text-truncate w-75 mb-0"
								data-noteHeading="Book a Ticket for Movie">
								"${good.empVO.empName} ${good.empVO.empPos}"님의 좋아요.
							</h5>
							<p class="note-date fs-2 text-muted">
								<fmt:formatDate value="${good.goodDate }" pattern="yyyy/MM/dd"></fmt:formatDate>
							</p>
						</div>
						<div class="note-content" style="display: inherit;">
							<div style="margin-right: 15px;">
				              <c:choose>
				              	<c:when test="${empty good.afVO }">
					              <img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="users" class="rounded-circle" width="40" height="40"/>
				              	</c:when>
				              	<c:otherwise>
					              <img src="${pageContext.request.contextPath }/resources/images/${good.afVO.afSave}" alt="users" class="rounded-circle" width="40" height="40"/>
				              	</c:otherwise>
				              </c:choose>
							</div>
							<div>
								<p class="note-inner-content text-muted"
									data-noteContent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">
									<span style="color: #000000;">"${good.empVO.empName} ${good.empVO.empPos}"</span>님이 회원님의 게시물에 <i
										class="ri-heart-3-line" style="color: #F64E60;"></i>를 눌렀습니다.
								</p>
							</div>
						</div>
						<hr/>
						<a class="
                        btn
                        waves-effect waves-light
                        btn-light-secondary
                        text-secondary
                      " 
                      style="width: 145px; margin-left: 27%;  background-color: #D2E0F5;"
                      <c:if test = "${fn:contains(good.goodType, 'NOTICE')}">
						href = "/notice/detail?notCode=${good.goodType }"
					  </c:if>
					  <c:if test = "${fn:contains(good.goodType, 'FREE')}">
						href = "/free/detail?freeCode=${good.goodType }"
					  </c:if>
                      ><span style="color: #000000;">게시글 바로가기</span></a>
						<div class="d-flex align-items-center">

							<div class="ms-auto">
					
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- Modal Add notes -->
			<div class="modal fade" id="addnotesmodal" tabindex="-1"
				role="dialog" aria-labelledby="addnotesmodalTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content border-0">
						<div class="modal-header bg-info text-white">
							<h5 class="modal-title text-white">Add Notes</h5>
							<button type="button" class="btn-close btn-close-white"
								data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="notes-box">
								<div class="notes-content">
									<form action="javascript:void(0);" id="addnotesmodalTitle">
										<div class="row">
											<div class="col-md-12 mb-3">
												<div class="note-title">
													<label>Note Title</label> <input type="text"
														id="note-has-title" class="form-control" minlength="25"
														placeholder="Title" />
												</div>
											</div>

											<div class="col-md-12">
												<div class="note-description">
													<label>Note Description</label>
													<textarea id="note-has-description" class="form-control"
														minlength="60" placeholder="Description" rows="3"></textarea>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-danger" data-bs-dismiss="modal">Discard</button>
							<button id="btn-n-add" class="btn btn-info" disabled>Add</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="p-3 mt-4" style="display: none;">
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
/* $(function(){
	$("#note-full-container").on("click", "#goodBox", function(){
		location.href= "/free/detail?freeCode=" + $(this).data("type");
	});
}); */
</script>