<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#zero_table_length, #zero_table_info{
	display:none;
}
</style>
<div class="container-fluid note-has-grid" style="min-height: 940px;">
	<ul class="nav nav-pills p-3 bg-white mb-3 align-items-center">
		
		<li class="nav-item ms-auto"><a href="javascript:void(0)"
			class="btn btn-primary rounded-pill d-flex align-items-center px-3"
			id="add-notes"> <i data-feather="file"
				class="feather-sm fill-white me-0 me-md-1"></i><span
				class="d-none d-md-block font-weight-medium fs-3">게시판 추가</span></a></li>

	</ul>
	<div class="tab-content">
		<div id="note-full-container" class="note-has-grid row">
		
			<c:forEach items="${boaList }" var="board" varStatus="i">
				<div class="col-md-4 single-note-item all-category note-social">
					<div class="card card-body" style="height: 290px;">
						<input type="hidden" value="${board.boaCode }">
						<span class="side-stick"></span>
						<h5 style=" cursor: pointer;" class="boaBtn note-title text-truncate w-75 mb-0" data-noteHeading="Go for lunch">
							${board.boaName } <i class="point ri-checkbox-blank-circle-fill ms-1 fs-1"></i>
						</h5>
						<p class="boaBtn note-date fs-2 text-muted" style=" cursor: pointer;">
							${depList.get(i.index).depName }
						</p>
						<img src="${pageContext.request.contextPath }/resources/images/${afList.get(i.index).afSave}"
							style="width: 70px; position: absolute; left: 76%; top: 20px; cursor: pointer;"
							class="boaBtn">
						<div class="note-content" style="height: 65px; padding-left: 53px; position: relative; left: -20px;">
							<c:set var="loop_flag" value="true" />
							<c:set var="loop_num" value="0" />
							<c:forEach items="${boaAfList.get(i.index) }" var="af" varStatus="j">
							    <c:if test="${loop_flag }">
									<c:set var="loop_num" value="${loop_num+1 }" />
							        <c:if test="${j.index eq 4 }">
							            <c:set var="loop_flag" value="false" />
							        </c:if>
						            <c:choose>
						            	<c:when test="${af.afSave == null || af.afSave == ''}">
											<img src="${pageContext.request.contextPath }/resources/images/kog.png" alt="users" class="profiles rounded-circle" width="48"
												style="left: ${17+(35*j.index)}px; position: absolute; height: 48px;
												cursor: pointer;" data-bs-toggle="tooltip" data-bs-placement="top" title="${depEmpList.get(i.index).get(j.index).empName } ${depEmpList.get(i.index).get(j.index).empPos }">
						            	</c:when>
						            	<c:otherwise>
											<img src="${pageContext.request.contextPath }/resources/images/${af.afSave}" alt="users" class="profiles rounded-circle" width="48"
												style="left: ${17+(35*j.index)}px; position: absolute; height: 48px;
												cursor: pointer;" data-bs-toggle="tooltip" data-bs-placement="top" title="${depEmpList.get(i.index).get(j.index).empName } ${depEmpList.get(i.index).get(j.index).empPos }"> 
						            	</c:otherwise>
						            </c:choose>
							    </c:if>
							</c:forEach>
							<img src="${pageContext.request.contextPath }/resources/images/icon.png" alt="users" class="rounded-circle" width="48"
								style="left: ${17+(35*loop_num) }px; position: absolute;  cursor: pointer;">
						</div>
						<div class="d-flex align-items-center" style="position: relative;
							margin-top: 10px; margin-bottom: 10px; ">
							<table>
								<tbody>
									<tr>
										<td style="width: 160px;">
											<i class="point ri-checkbox-blank-circle-fill ms-1 fs-1"
												style="top: -3px; position: relative; margin-right: 4px;"></i>										
											<h5 style="display: inline-block;">등록된 게시물</h5>
										</td>
										<td>
											<c:choose>
												<c:when test="${postNumList.get(i.index) eq 0 }">
													<h5 id="postNum">미등록</h5>											
												</c:when>
												<c:otherwise>
													<h5 id="postNum">${postNumList.get(i.index) }개</h5>											
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td>
											<i class="point ri-checkbox-blank-circle-fill ms-1 fs-1"
												style="top: -3px; position: relative; margin-right: 4px;"></i>
											<h5 style="display: inline-block;">최근 게시일</h5>
										</td>
										<td>
											<c:choose>
												<c:when test="${recDateList.get(i.index) eq null }">
													<h5 id="recDate">미등록</h5>											
												</c:when>
												<c:otherwise>
													<h5 id="recDate">${recDateList.get(i.index) }</h5>											
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="d-flex align-items-center" style="top: 10px; position: relative;">
							<a href="javascript:void(0)" class="link me-1"><i
								class="ri-star-line fs-5 favourite-note"></i></a> <a
								href="javascript:void(0)" class="link text-danger ms-2"><i
								class="ri-delete-bin-line fs-5 remove-note"></i></a>
							<div class="ms-auto">
								<div class="category-selector btn-group">
									<a
										class="nav-link dropdown-toggle category-dropdown label-group p-0"
										data-bs-toggle="dropdown" href="#" role="button"
										aria-haspopup="true" aria-expanded="true">
										<div class="category">
											<div class="category-business"></div>
											<div class="category-social"></div>
											<div class="category-important"></div>
											<span class="more-options text-dark"><i
												data-feather="more-vertical" class="feather-sm"></i></span>
										</div>
									</a>
									<div class="dropdown-menu dropdown-menu-right category-menu">
										<a class="note-business badge-group-item badge-business dropdown-item position-relative
											category-business text-success d-flex align-items-center"
											href="javascript:void(0);"><i
											class="ri-checkbox-blank-circle-line me-1"></i>Business</a> <a
											class="note-social badge-group-item badge-social dropdown-item position-relative
												category-social text-info d-flex align-items-center" href="javascript:void(0);"><i
											class="ri-checkbox-blank-circle-line me-1"></i> Social</a> <a
											class="note-important badge-group-item badge-important dropdown-item position-relative
												category-important text-danger d-flex align-items-center"
											href="javascript:void(0);"><i
											class="ri-checkbox-blank-circle-line me-1"></i> Important</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>			
			</c:forEach>		
		
		</div>
	</div>

	<!-- Modal Add notes -->
	<div class="modal fade" id="addnotesmodal" tabindex="-1" role="dialog"
		aria-labelledby="addnotesmodalTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content border-0">
				<div class="modal-header bg-info text-white">
					<h5 class="modal-title text-white">게시판 추가</h5>
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

<!-- content -->
<script type="text/javascript">
$(function() {
	function removeNote() {
		$(".remove-note").off("click").on("click", function(event) {
			event.stopPropagation();
			$(this).parents(".single-note-item").remove();
		});
	}

	function favouriteNote() {
		$(".favourite-note").off("click").on("click",function(event) {
			event.stopPropagation();
			$(this).parents(".single-note-item").toggleClass(
					"note-favourite");
		});
	}

	function addLabelGroups() {
		$(".category-selector .badge-group-item").off("click").on("click",function(event) {
			event.preventDefault();
			/* Act on the event */
			var getclass = this.className;
			var getSplitclass = getclass.split(" ")[0];
			if ($(this).hasClass("badge-business")) {
				$(this).parents(".single-note-item").removeClass(
						"note-social");
				$(this).parents(".single-note-item").removeClass(
						"note-important");
				$(this).parents(".single-note-item").toggleClass(
						getSplitclass);
			} else if ($(this).hasClass("badge-social")) {
				$(this).parents(".single-note-item").removeClass(
						"note-business");
				$(this).parents(".single-note-item").removeClass(
						"note-important");
				$(this).parents(".single-note-item").toggleClass(
						getSplitclass);
			} else if ($(this).hasClass("badge-important")) {
				$(this).parents(".single-note-item").removeClass(
						"note-social");
				$(this).parents(".single-note-item").removeClass(
						"note-business");
				$(this).parents(".single-note-item").toggleClass(
						getSplitclass);
			}
		});
	}

	var $btns = $(".note-link").click(function() {
		if (this.id == "all-category") {
			var $el = $("." + this.id).fadeIn();
			$("#note-full-container > div").not($el).hide();
		}
		if (this.id == "important") {
			var $el = $("." + this.id).fadeIn();
			$("#note-full-container > div").not($el).hide();
		} else {
			var $el = $("." + this.id).fadeIn();
			$("#note-full-container > div").not($el).hide();
		}
		$btns.removeClass("active");
		$(this).addClass("active");
	});

	$("#add-notes").on("click", function(event) {
		$("#addnotesmodal").modal("show");
		$("#btn-n-save").hide();
		$("#btn-n-add").show();
	});

	// Button add
	$("#btn-n-add").on("click",function(event) {
		event.preventDefault();
		/* Act on the event */
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, "0");
		var mm = String(today.getMonth()); //January is 0!
		var yyyy = today.getFullYear();
		var monthNames = [ "Jan", "Feb", "Mar", "Apr",
				"May", "Jun", "Jul", "Aug", "Sep", "Oct",
				"Nov", "Dec", ];
		today = dd + " " + monthNames[mm] + " " + yyyy;

		var $_noteTitle = document
				.getElementById("note-has-title").value;
		var $_noteDescription = document
				.getElementById("note-has-description").value;

		$html = '<div class="col-md-4 single-note-item all-category"><div class="card card-body">'
				+ '<span class="side-stick"></span>'
				+ '<h5 class="note-title text-truncate w-75 mb-0" data-noteHeading="' +
  								$_noteTitle +'">'+ $_noteTitle
				+ '<i class="point fas fa-circle ms-1 fs-1"></i></h5>'
				+ '<p class="note-date fs-2 text-muted">'
				+ today
				+ "</p>"
				+ '<div class="note-content">'
				+ '<p class="note-inner-content text-muted" data-noteContent="' +
 								 $_noteDescription +'">'+ $_noteDescription
				+ "</p>"
				+ "</div>"
				+ '<div class="d-flex align-items-center">'
				+ '<a href="javascript:void(0)" class="link me-1"><i class="far fa-star favourite-note"></i></a>'
				+ '<a href="javascript:void(0)" class="link text-danger ms-2"><i class="far fa-trash-alt remove-note"></i></a>'
				+ '<div class="ms-auto">'
				+ '<div class="category-selector btn-group">'
				+ '<a class="nav-link dropdown-toggle category-dropdown label-group p-0" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="true">'
				+ '<div class="category">'
				+ '<div class="category-business"></div>'
				+ '<div class="category-social"></div>'
				+ '<div class="category-important"></div>'
				+ '<span class="more-options text-dark"><i class="icon-options-vertical"></i></span>'
				+ "</div>"
				+ "</a>"
				+ '<div class="dropdown-menu dropdown-menu-right category-menu">'
				+ '<a class="note-business badge-group-item badge-business dropdown-item position-relative category-business text-success" href="javascript:void(0);"><i class="mdi mdi-checkbox-blank-circle-outline me-1"></i>Business</a>'
				+ '<a class="note-social badge-group-item badge-social dropdown-item position-relative category-social text-info" href="javascript:void(0);"><i class="mdi mdi-checkbox-blank-circle-outline me-1"></i> Social</a>'
				+ '<a class="note-important badge-group-item badge-important dropdown-item position-relative category-important text-danger" href="javascript:void(0);"><i class="mdi mdi-checkbox-blank-circle-outline me-1"></i> Important</a>'
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "</div></div> ";

		$("#note-full-container").prepend($html);
		$("#addnotesmodal").modal("hide");

		removeNote();
		favouriteNote();
		addLabelGroups();
	});

	$("#addnotesmodal").on("hidden.bs.modal", function(event) {
		event.preventDefault();
		document.getElementById("note-has-title").value = "";
		document.getElementById("note-has-description").value = "";
	});

	removeNote();
	favouriteNote();
	addLabelGroups();

	$("#btn-n-add").attr("disabled", "disabled");
	
	
	// board/list로 이동
	let boaBtns = document.querySelectorAll('.boaBtn');
	
	for(let i=0; i<boaBtns.length; i++){
		boaBtns[i].addEventListener('click',(e)=>{
			let boaCode = e.target.parentElement.children[0].value;
// 			console.log('e',e.target,boaCode);

			location.href = '/board/list?boaCode='+boaCode;
		});
	}	
	
	// profiles 마우스오버
	let profiles = document.querySelectorAll('.profiles');
	for(let i=0; i<profiles.length; i++){
		profiles[i].addEventListener('mouseover', (e)=>{
			e.target.style.zIndex = 1;
		});
		
		profiles[i].addEventListener('mouseout', (e)=>{
			e.target.style.zIndex = 0;
		});		
	}
	
	
	
	
	
	
	
	
	
	
});



























	$("#note-has-title").keyup(function() {
		var empty = false;
		$("#note-has-title").each(function() {
			if ($(this).val() == "") {
				empty = true;
			}
		});
	
		if (empty) {
			$("#btn-n-add").attr("disabled", "disabled");
		} else {
			$("#btn-n-add").removeAttr("disabled");
		}
	});
</script>




