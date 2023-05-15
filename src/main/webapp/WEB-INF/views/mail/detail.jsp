<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
</style>

<div class="email-app">
	<!-- -------------------------------------------------------------- -->
	<!-- Left Part -->
	<!-- -------------------------------------------------------------- -->
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
					class="list-group-item-action d-flex align-items-center"><i
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
				</li>
				<li class="list-group-item"><a href="/mail/trash"
					class="list-group-item-action"> <i data-feather="trash-2"
						class="feather-sm fill-white me-2"></i> 휴지통
				</a></li>
				<li class="list-group-item">
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
	<!-- -------------------------------------------------------------- -->
	<!-- Right Part  Mail detail -->
	<!-- -------------------------------------------------------------- -->
	<div class="right-part mail-details bg-white overflow-auto"
		style="width: calc(100% - 200px); margin-left: 200px;">
		<div class="card-body bg-light" style="height: 80px;">
			<div class="ms-auto">
				<div class="btn-group me-2" role="group"
					aria-label="Button group with nested dropdown">

					<button type="button"
						class="btn waves-effect waves-light btn-outline-secondary"
						onclick="location.href = '/mail/write' ">답장</button>
					<button type="button"
						class="btn waves-effect waves-light btn-outline-secondary">
						보관</button>
					<button type="button" class="btn btn-outline-danger"
						id="deleteButton">
						<i class="ri-delete-bin-line fs-5 align-middle"></i>
					</button>


				</div>
				<div class="btn-group me-2" role="group"
					aria-label="Button group with nested dropdown"></div>
			</div>
		</div>

		<div class="card-body border-bottom">
			<h4 class="mb-0">
				<i class="ri-share-forward-line"></i> ${mailVO.mailTitle }
			</h4>
		</div>
		<div class="card-body border-bottom">
			보낸사람 : 송강 <span>(songg05123@gmail.com)</span>
			<p>${mailVO.mailContent }</p>
		</div>
		<div class="card-body">
			<h4>
					  <i data-feather="paperclip" class="feather-sm me-2 mb-2"></i>
					  첨부파일 <span></span>
					</h4>
					<div class="row" style="margin-bottom: 20px;">
						<!-- mailVOList.attFileVOList : List<AttFileVO> -->
						<c:forEach var="attFileVO" items="${mailVOList.get(0).attFileVOList}" varStatus="stat" >
<!-- 							<div class="col-md-2"> -->
<!-- 								<a id="fileDown" href="javascript:void(0)" style="color: black;"> -->
									
<%-- 									<font style="font-size: 1.1em;">${attFileVO.afName }</font> --%>
<!-- 								</a> -->
<!-- 							</div> -->
							<c:set value="${attFileVO.afExt }" var="ext"/>
							<c:choose>
								<c:when test="${empty attFileVO }">
									등록된 첨부파일이 없습니다.
								</c:when>							
								<c:when test="${ext eq 'JPG' }">
									<div class="col-md-2">
										<a id="fileDown" href="javascript:void(0)"
											style="color: black;"> <img
											src="${pageContext.request.contextPath }/resources/images/${attFileVO.afSave}"
											style="width: 100px; height: 100px;"> 
											<br><font style="font-size: 1.1em;">${attFileVO.afName }</font>
										</a>										
									</div>
								</c:when>
								<c:when test="${ext eq 'PNG' }">
									<div class="col-md-2">
										<a id="fileDown" href="javascript:void(0)"
											style="color: black;"> <img
											src="${pageContext.request.contextPath }/resources/images/${attFileVO.afSave}"
											style="width: 100px; height: 100px;"> 
											<br><font style="font-size: 1.1em;">${attFileVO.afName }</font>
										</a>										
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-md-2">
										<a href="javascript:void(0)">
											<i class="fas fa-file-alt" style="color: gray; font-size: 4em;
												margin-bottom: 15px; margin-left: 45px;"></i>
											<br>
											<font style="font-size: 1.1em;">${attFileVO.afName }</font>											
										</a>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
					</div>
		</div>
	</div>
	
<script type="text/javascript">

document.querySelector('#fileDown').addEventListener('click',(e)=>{
	location.href = '/mail/download?afTcode=${mailVOList.get(0).attFileVOList.get(0).afTcode}';
});
</script>