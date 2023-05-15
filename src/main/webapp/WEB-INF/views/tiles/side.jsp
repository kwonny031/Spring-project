<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- -------------------------------------------------------------- -->
<!-- Left Sidebar - style you can find in sidebar.scss  -->
<!-- -------------------------------------------------------------- -->
<aside class="left-sidebar">
  <!-- Sidebar scroll-->
  <div class="scroll-sidebar">
    <!-- Sidebar navigation-->
    <nav class="sidebar-nav"s>
      <ul id="sidebarnav">
        <!-- User Profile-->
        <li>
          <!-- User Profile-->
          <div class="user-profile d-flex no-block dropdown mt-3" style="margin-top: 2rem!important;">
            <div class="userDiv user-pic" style="cursor: pointer;">
              <!-- 임시 프로필사진 -->
              <c:choose>
              	<c:when test="${empty profile }">
	              <img src="${pageContext.request.contextPath }/resources/images/profile.png" alt="users" class="rounded-circle" width="40" height="40"/>
              	</c:when>
              	<c:otherwise>
	              <img src="${pageContext.request.contextPath }/resources/images/${profile.afSave}" alt="users" class="rounded-circle" width="40" height="40"/>
              	</c:otherwise>
              </c:choose>
            </div>
            <div class="userDiv user-content hide-menu ms-2">
              <a href="#" class="" id="Userdd" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <h5 class="mb-0 user-name font-medium">
                  ${SessionInfo.empName }
<!--                   <i data-feather="chevron-down" class="feather-sm"></i> --><!-- 여기에 드롭다운을 안쓸거같아서 일단 주석처리 해둘게요 -->
                </h5>
                <span class="op-5 user-email">${SessionInfo.empEmail }</span>
              </a>
            </div>
          </div>
          <!-- End User Profile-->
        </li>
        
        <!-- 사이드 메뉴 -->
        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/main/home" aria-expanded="false">
            <i data-feather="home" class="feather-icon"></i>
            <span class="hide-menu">홈</span>
         </a>
        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/work/home" aria-expanded="false">
            <i data-feather="lock" class="feather-icon"></i>
            <span class="hide-menu">근태관리</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/board/home" aria-expanded="false">
            <i data-feather="grid" class="feather-icon"></i>
            <span class="hide-menu">업무</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/mail/recieveList" aria-expanded="false">
            <i data-feather="mail" class="feather-icon"></i>
            <span class="hide-menu">메일 </span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/approval/home" aria-expanded="false">
            <i data-feather="edit" class="feather-icon"></i>
            <span class="hide-menu">전자결재</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/contact/list" aria-expanded="false">
            <i data-feather="user" class="feather-icon"></i>
            <span class="hide-menu">주소록</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/cloud/home?empNo=${SessionInfo.empNo }" aria-expanded="false">
            <i data-feather="folder" class="feather-icon"></i>
            <span class="hide-menu">클라우드</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/sch/home" aria-expanded="false">
            <i data-feather="calendar" class="feather-icon"></i>
            <span class="hide-menu">일정</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/sch/resRoom" aria-expanded="false">
            <i data-feather="clock" class="feather-icon"></i>
            <span class="hide-menu">예약</span>
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link has-arrow waves-effect waves-dark" href="#" aria-expanded="false">
            <i data-feather="list" class="feather-icon"></i>
            <span class="hide-menu">게시판</span>
          </a>
          <ul aria-expanded="false" class="collapse first-level">
            <li class="sidebar-item">
              <a href="/notice/home" class="sidebar-link">
                <i class="mdi mdi-checkbox-marked-outline"></i>
                <span class="hide-menu">공지사항</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a href="/free/home" class="sidebar-link">
                <i class="mdi mdi-format-list-bulleted-type"></i>
                <span class="hide-menu">자유게시판</span>
              </a>
            </li>
          </ul>
        </li>
        <c:if test="${SessionInfo.empNo eq '20060001' }">
	        <li class="sidebar-item">
	          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admin/home" aria-expanded="false">
	            <i data-feather="settings" class="feather-icon"></i>
	            <span class="hide-menu">관리자 페이지</span>
	          </a>
	        </li>
        </c:if>        
<!--         <li style="height: 150px;"></li> -->
        <li class="sidebar-item">
        	<div class="sidebar-link waves-effect waves-dark sidebar-link" id="empTree" aria-expanded="false" 
        		style="border: 1px solid #eee; border-radius:5px; width:140px; text-align:center; margin:3px 0 0 65px; padding:5px;">
        		<i class="bi-diagram-3" style="font-size: 20px;"></i>
        		<span class="hide-menu" style="margin-left: 32px; font-size: large;">조직도</span>
        	</div>
        </li>
        <div style="height:30px"></div>

        <!-- 이것들두 만약을 대비해 주석주석!! -->
<!--         <li class="sidebar-item"> -->
<!--           <a class="sidebar-link waves-effect waves-dark sidebar-link" href="" aria-expanded="false"> -->
<!--             <i data-feather="check-circle" class="feather-icon"></i> -->
<!--             <span class="hide-menu">Todo</span> -->
<!--           </a> -->
<!--         </li> -->
        <!-- 업무가 있는데 Works는 필요 없을거 같은데 일단 주석 해둘께요 -->
<!--         <li class="sidebar-item"> -->
<!--           <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/approval/home" aria-expanded="false"> -->
<!--             <i data-feather="monitor" class="feather-icon"></i> -->
<!--             <span class="hide-menu">Works</span> -->
<!--           </a> -->
<!--         </li> -->

<!--         <li class="sidebar-item"> -->
<!--           <a class="sidebar-link waves-effect waves-dark sidebar-link" href="" aria-expanded="false"> -->
<!--             <i data-feather="message-circle" class="feather-icon"></i> -->
<!--             <span class="hide-menu">Chat Apps</span> -->
<!--           </a> -->
<!--         </li> -->
<!--         <li class="sidebar-item"> -->
<!--           <a class="sidebar-link waves-effect waves-dark sidebar-link" href="" aria-expanded="false"> -->
<!--             <i data-feather="book" class="feather-icon"></i> -->
<!--             <span class="hide-menu">Notes</span> -->
<!--           </a> -->
<!--         </li> -->
<!--         <li class="sidebar-item"> -->
<!--           <a class="sidebar-link waves-effect waves-dark sidebar-link" href="" aria-expanded="false"> -->
<!--             <i data-feather="file-text" class="feather-icon"></i> -->
<!--             <span class="hide-menu">Invoice</span> -->
<!--           </a> -->
<!--         </li> -->
      </ul>
    </nav>
    <!-- End Sidebar navigation -->
  </div>
  <!-- End Sidebar scroll-->
</aside>
<!-- -------------------------------------------------------------- -->
<!-- End Left Sidebar - style you can find in sidebar.scss  -->
<!-- -------------------------------------------------------------- -->

<!-- ------------------------[조직도 modal]------------------------ -->
<div class="modal-backdrop bckdrop hide" id="modalBack"></div>
<div class="modal-dialog modal-xl" id="modalTree" data-bs-backdrop="static" aria-labelledby="scroll-long-inner-modal"
	role="dialog" style="display: none;">
	<div class="modal-content" style="height: 403px;">
		<div class="modal-header d-flex align-items-center scroll">
			<h3>조직도</h3>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body" id="modalBody" style="overflow-y: auto; height: 300px;">
			<div id="tree"></div>
		</div>
		<div class="modal-footer">
		</div>
	</div>
</div>
<!-- ------------------------[조직도 modal end]------------------------ -->

<!-- ------------------------[조직도 detail]------------------------ -->
<div class="modal-dialog modal-xl" id="treeDetail" data-bs-backdrop="static" aria-labelledby="scroll-long-inner-modal"
	role="dialog" style="display: none;">
	<div class="modal-content">
		<div class="modal-header d-flex align-items-center scroll" style="margin-top:10px">
			<button type="button" class="btn-close1" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body" id="modalBody">
			<div style="text-align: center;">
				<img src="${pageContext.request.contextPath }/resources/images/profile.png" 
					style="width: 200px; height: 200px;" id="empImg"> <br><br>
			</div>
			<div style="margin-left:30px">
				이　름　　<span id="empName" ></span>  <br/>
				직　책　　<span id="empPose" ></span>  <br/>
				연락처　　<span id="empTel" ></span> <br/>
				이메일　　<span id="empEmail" ></span> <br/>
			</div>
		</div>
		<div class="modal-footer">
		</div>
	</div>
</div>
<!-- ------------------------[조직도 detail end]------------------------ -->

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header d-flex align-items-center">
        <h4 class="modal-title" id="myLargeModalLabel">
          Static backdrop Modal
        </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h4>Overflowing text to show scroll behavior</h4>
        <p>
          Praesent commodo cursus magna, vel scelerisque nisl consectetur et.
          Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.
        </p>
        <p>
          Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus
          magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec
          ullamcorper nulla non metus auctor fringilla.
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light-danger text-danger font-medium waves-effect text-start" data-bs-dismiss="modal">
          Close
        </button>
      </div>
    </div>
  </div>
</div>

<!-- 조직도 modal -->  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script type="text/javascript">
// jstree 구조
// 	$('#tree').jstree({ 
// 	  'core' : {
// 		'data' : [
// 			{ "id" : "ajson1", "parent" : "#", "text" : "임원진" },
// 			{ "id" : "ajson2", "parent" : "#", "text" : "기술지원본부" },
// 			{ "id" : "ajson3", "parent" : "#", "text" : "영업부" },
// 			{ "id" : "ajson4", "parent" : "#", "text" : "관리본부" },
// 			{ "id" : "ajson11", "parent" : "ajson1", "text" : "심효정 대표이사" },
// 			{ "id" : "ajson12", "parent" : "ajson1", "text" : "송지나 이사" },
// 			{ "id" : "ajson13", "parent" : "ajson1", "text" : "윤선희 이사" },
// 			{ "id" : "ajson21", "parent" : "ajson2", "text" : "네트워크기술부" },
// 			{ "id" : "ajson22", "parent" : "ajson2", "text" : "보안기술부" },
// 			{ "id" : "ajson31", "parent" : "ajson3", "text" : "공공사업부" },
// 			{ "id" : "ajson211", "parent" : "ajson21", "text" : "박경훈 사원" },
// 			{ "id" : "ajson213", "parent" : "ajson21", "text" : "박경훈 사원" },
// 			{ "id" : "ajson214", "parent" : "ajson21", "text" : "박경훈 사원" },
// 			{ "id" : "ajson32", "parent" : "ajson3", "text" : "금융사업부" },
// 			{ "id" : "ajson33", "parent" : "ajson3", "text" : "기업사업부" },
// 			{ "id" : "ajson41", "parent" : "ajson4", "text" : "경영지원부" },
// 			{ "id" : "ajson41", "parent" : "ajson4", "text" : "재무회계부" },
// 		]  
// 	  }
// 	});
	
$(function(){
	
	let miniFlag = false;
	setInterval(mini, 200);
	
	function mini(){
		if(!miniFlag){
			let wrapper = document.querySelector('#main-wrapper');
			wrapper.setAttribute('data-sidebartype', 'mini-sidebar');
			wrapper.classList.add('mini-sidebar'); 
			console.log('wrapper ::',wrapper);
			miniFlag = true;				
		}
	}
	
	//  조직도 그리기
	let json = ${treeJson};
	console.log('json',json);//
	 $('#tree').jstree({
		 'core': {
		     'data': json
		 },
	});	
	
	$("#tree").on("select_node.jstree", function(evt, data){
// 		console.log("data : " , data.node.original.empNo);
		var data = data.node.original.empNo 
			$.ajax({
				url: "/emp/selectMember",
				type: "post",
				data: data,
				contentType: "application/json",
				dataType: "json",
				success: function(res){
					console.log("[회원정보 조회]res >>> " , res);
// 					alert("flag : " + flag)
					$("#treeDetail").attr("style", "display:block; z-index:500; position:fixed; top:-2%; left:31%; width:275px; margin-left:20px");
					$("#empName").text(res.empName);
					$("#empPose").text(res.empPos);
					$("#empTel").text(res.empTel);
					$("#empEmail").text(res.empEmail);
					$(".btn-close1").on("click", function(){
						$("#treeDetail").attr("style", "display:none;");
					});
					
					// 이미지 변경
					let srcTxt = '${pageContext.request.contextPath }/resources/images/';
					
					if(res.afVO != null){
						srcTxt += res.afVO.afSave;
					}else{
						srcTxt += 'profile.png';
					}					
					$("#empImg").attr('src', srcTxt);
				}
			});
		}
	);

	$("#empTree").on("click", function(){
		// 팝업창 열어보기
		//openPopup();

		$("#modalBack").attr("style", "display:block; z-index:400; opacity:0.3");
		$("#modalTree").attr("style", "display:block; z-index:500; position:fixed; top:-2%; left:5%; width:350px");
	});
	
	$(".btn-close").on("click",function(){
		$("#modalBack").attr("style", "display:none;");
		$("#modalTree").attr("style", "display:none;");
		$("#treeDetail").attr("style", "display:none;");
	});
	
	
	// 마이페이지 이동
	let userDivs = document.querySelectorAll('.userDiv');
	for(let i=0; i<userDivs.length; i++){
		userDivs[i].addEventListener('click',()=>{
			location.href = '/emp/mypage';
		});
	}
	
	// 홈 버튼
// 	document.querySelector('.homeBtn').addEventListener('click',()=>{
// 		location.href = 'redirect:/main/home';
// 	});
	
});


// function openPopup(){
// // 	window.open("url", "new", "scrollbar=yes, resizable=no width=200 height=200, left=0, top=0");
// 	window.open("/main/organization", "new", "scrollbar=yes, resizable=no width=500 height=500, left=0, top=10");
// }





</script>





