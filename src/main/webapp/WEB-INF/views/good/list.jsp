<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
  <div class="page-breadcrumb">
          <div class="row">
            <div class="col-5 align-self-center">
              <h3 class="page-title">나의 좋아요</h3>
              
            </div>
            <div class="col-7 align-self-center">
              <div class="d-flex no-block justify-content-end align-items-center">
                <div class="me-2">
                
                </div>
                
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
                ><span class="d-none d-md-block font-weight-medium">나의 좋아요</span><span
						class="
                        badge
                        bg-light-danger
                        text-danger
                        font-medium
                        px-3
                        rounded-pill
                        ms-auto
                      ">${myLikes.size() }</span></a
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
                id="note-social"
              >
                <i data-feather="heart" class="feather-sm fill-white me-0 me-md-1"></i
                ><span class="d-none d-md-block font-weight-medium">상대방의 좋아요</span></a
              >
            </li>
           
            <li class="nav-item ms-auto">
            </li>
          </ul>
	<div class="tab-content">
		<div id="note-full-container" class="note-has-grid row">
			<c:forEach items="${myLikes }" var="good" varStatus="i">
				<div class="col-md-4 single-note-item all-category" id="goodBox" data-type="${good.goodType }">
					<div class="card card-body">
						<span class="side-stick"
							style="background-color: rgba(41, 98, 255, .5);"></span>
							
						<p class="note-date fs-2 text-muted">
						<i class="bi-heart-fill" id="ht" style="color: #F64E60;"></i>
							<fmt:formatDate value="${good.goodDate }" pattern="yyyy/MM/dd"></fmt:formatDate>
						</p>
						
						
						<div class="note-content">
						<span style="color: #A1AAB2;">회원님이 좋아요를 누른 게시글은<br>
						 "
							<c:if test="${good.goodType.toUpperCase().contains('NOTICE')}"><span style="color: #353535;">공지게시판</span></c:if>
							<c:if test="${good.goodType.toUpperCase().contains('FREE')}"><span style="color: #353535;">자유게시판</span></c:if>" 입니다.</span>
							
							
						</div>
						<hr/>
						
						<a class="
                        btn
                        waves-effect waves-light
                        btn-light-secondary
                        text-secondary
                      " 
                      style="width: 138px; margin-left: 20%;"
                      <c:if test = "${fn:contains(good.goodType, 'NOTICE')}">
						href = "/notice/detail?notCode=${good.goodType }"
					  </c:if>
					  <c:if test = "${fn:contains(good.goodType, 'FREE')}">
						href = "/free/detail?freeCode=${good.goodType }"
					  </c:if>
                      >게시글 바로가기</a>
                      
					
					</div>
				</div>
				
			</c:forEach>
		</div>

		<div class="p-3 mt-4">
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
$(function(){
	$(".ht").on("click", "#goodBox", function(){
		location.href= "/free/detail?freeCode=" + $(this).data("type");
	});
}); 



</script>