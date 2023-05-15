<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- -------------------------------------------------------------- -->
<!-- Left Part -->
<!-- -------------------------------------------------------------- -->
<div class="left-part" style="background-color: white;">
	<a class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none" href="javascript:void(0)"></a>
	<div class="scrollable" style="height: 100%">
		<div class="p-3">
			<h4>업무 게시판</h4>
		</div>
		<div class="divider"></div>
		<ul class="list-group">
			<li>
				<small class="p-3 grey-text text-lighten-1 db">게시판 목록</small>
			</li>
			
			<c:forEach items="${boaList }" var="board" varStatus="i">
				<li class="boaLi list-group-item">
					<a style="background-color: white;" href="javascript:void(0)" class="boaLink active list-group-item-action d-flex align-items-center">
						<input type="hidden" value="${board.boaCode}">
						<i data-feather="clipboard" class="feather-sm fill-white me-2" style="background-color: white;"></i>
						<font class="boaName">${board.boaName }</font>
						
						<span class="badge bg-light-success text-success px-3 rounded-pill font-medium ms-auto">
							${postNumList.get(i.index) }
						</span>
	                </a>
				</li>
			</c:forEach>

		</ul>
	</div>
</div>

	
	
	






