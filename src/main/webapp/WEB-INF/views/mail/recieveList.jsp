<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="email-app">
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
					class="list-group-item-action d-flex align-items-center"> <i
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
<br>
				<li class="list-group-item"><a href="/mail/trash"
					class="list-group-item-action"> <i data-feather="trash-2"
						class="feather-sm fill-white me-2"></i> 휴지통
				</a></li>
				<br>

				<li><small class="p-3 grey-text text-lighten-1 db">자료실</small></li>
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
	<!-- Right Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="right-part mail-list bg-white overflow-auto"
		style="width: calc(100% - 200px); margin-left: 200px;">
		<div class="p-3 b-b">
			<div class="d-flex align-items-center">
				<div>
					<h4>받은 메일함</h4>
					
				</div>
				<div class="ms-auto"></div>
			</div>
		</div>
		<!-- Action part -->
		<!-- Button group part -->
		<div class="bg-light p-3 d-md-flex align-items-center">
			<div class="btn-group mt-1 mb-1">
				<div class="form-check">
					<input placeholder="Search Mail" id="input" type="text"
						class="form-control" style="border-color: #6C757D;" />
				</div>
			</div>
			<div class="ms-auto">
				<div class="btn-group me-2" role="group"
					aria-label="Button group with nested dropdown">
					<button type="button" class="btn btn-outline-secondary fs-5"
						id="refreshBtn">
						<i class="bi-arrow-clockwise"></i>
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
							<a class="dropdown-item mailTag" data-mail-tag="TAG01"
								onclick="alert(this.innerText + '에 보관되었습니다.')"> <i
								class="text-cyan ri-checkbox-blank-circle-fill fs-5 align-middle"></i>경영자료
							</a> <a class="dropdown-item mailTag" data-mail-tag="TAG02"
								onclick="alert('회계자료에 보관되었습니다.')"> <i
								class="text-warning ri-checkbox-blank-circle-fill fs-5 align-middle"></i>회계자료
							</a>
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
							<a class="dropdown-item mailTag" data-mail-tag="TAG03"
								onclick="alert('참고자료에 보관되었습니다.')"> <i
								class="text-info ri-checkbox-blank-circle-fill fs-5 align-middle"></i>참고자료
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<small class="p-3 grey-text text-lighten-1 db">자료실로 보관가능합니다.</small>
		<div class="table-responsive">
			<table class="table table-striped table-bordered display text-nowrap"
				id="custom_tool_ele"
				style="border-top: 2px solid #adabab; border-right: 2px solid #adabab; border-bottom: 2px solid #adabab;">
				<thead>
					<tr style="background-color: #DDDDDD;">
						<th class="bs-checkbox"
							style="text-align: center; vertical-align: middle; width: 36px;"
							rowspan="2" data-field="state"><div class="th-inner">
								<input type="checkbox" id="selectAll">
							</div></th>
						<th style="text-align: center;" scope="col">보낸 사람</th>
						<th style="text-align: center;" scope="col">제목</th>
						<th style="text-align: center;" scope="col">날짜</th>
						<th style="text-align: center;" scope="col"></th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${receiveList }" var="mail" varStatus="i">
						<tr>
							<td style="text-align: center;" scope="row"><input
								type="checkbox" name="Chk_list" class="deleteCheckbox" /></td>
							<td style="text-align: center;" class="font-medium link"><c:choose>
									<c:when test="${mailCode.mrType eq 'Y' }">
										<i class="ri-star-fill" data-code="${mail.mailCode }"
											style="color: #FFBB00; width: 40%;"></i>
									</c:when>
									<c:otherwise>
										<i class="ri-star-line" data-code="${mail.mailCode }"
											style="color: #FFBB00; width: 40%;"
											onclick="addToImportant(this)"></i>
									</c:otherwise>
								</c:choose> <span>${mail.empName }</span></td>
							<td
								style="text-align: center; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
								<c:choose>
									<c:when test="${mailCode.mailImp eq 'Y' }">
										<i class="fas fa-exclamation-circle"
											data-code="${mail.mailImp }" style="color: #F64E60;"></i>
									</c:when>
								</c:choose> <a href="/mail/detail?mailCode=${mail.mailCode }"
								class="font-medium link">${mail.mailTitle }</a>
							</td>

							<td style="text-align: center;"><fmt:formatDate
									value="${mail.mailDate }" pattern="yyyy/MM/dd"></fmt:formatDate></td>
							<td style="text-align: center;"><a class="deleteBtn"
								data-no='${mail.mailCode }'> <i class="far fa-trash-alt"></i>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>
<script
	src="${pageContext.request.contextPath }/resources/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
<!-- start - This is for export functionality only -->
<script
	src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/dist/js/pages/datatable/datatable-advanced.init.js"></script>
<script type="text/javascript">
$(function(){
   
   var starLine = document.querySelector('.ri-star-line');
   var starFill = document.querySelector('.ri-star-fill');

   $("#tbody").on("click", ".ri-star-line", function(){
      $(this).removeClass('ri-star-line');
      $(this).addClass('ri-star-fill');
      // 보관 Y로
      
      var data = {
         mailCode : $(this).data("code"),
         mrType : "Y"
      };
      
      console.log('data',data);
      ajaxGoodUpdate(data);
   });
   
   $("#tbody").on("click", ".ri-star-fill", function(){
      $(this).removeClass('ri-star-fill');
      $(this).addClass('ri-star-line');
      // 보관 N으로
      
      var data = {
         "mailCode" : $(this).data("code"),   
         mrType : "N"
      };
      
      console.log('data',data);
      ajaxGoodUpdate(data);
   });
   
   //태그 처리
   $(".mailTag").on("click",function(){
	   //data-mail-tag="TAG01"
	  let mailTag = $(this).data("mailTag");	//TAG01
	  console.log("mailTag : " + mailTag);
	  
      let hjArr = [];

	  $("input[name='Chk_list']:checked").each((index,elem)=>{
         //console.log(index, elem);
         let hjTR = elem.parentElement.parentElement;
         let hjSet = {};
         if(mailTag == 'TAG01') hjSet.comCode = 'M'; 
         if(mailTag == 'TAG02') hjSet.comCode = 'A'; 
         if(mailTag == 'TAG03') hjSet.comCode = 'R'; 

         /* 디버깅용
         console.log("0",hjTR);
         console.log("1",hjTR.children[1]);
         console.log("2",hjTR.children[2]);
         console.log("3",hjTR.children[3]);
         */
         
         hjSet.mailCode = hjTR.children[1].children[0].dataset.code;
         hjSet.mailTitle = hjTR.children[2].children[0].innerHTML;
         hjSet.mailContent = hjTR.children[3].innerHTML;
         hjArr.push(hjSet);
         
     })
     console.log("결과 체크:", hjArr);

     $.ajax({
      url : "/mail/updateTag",
      type : "post",
      contentType : "application/json;charset=utf-8",
      data : JSON.stringify(hjArr),
      dataType : "text",
      success: function(res){
         console.log(res)

      }
     });
   });
   
   
   function ajaxGoodUpdate(data){
      $.ajax({
         url : "/mail/update",
         type: "post",
         contentType:"application/json;charset=utf-8",
         data: JSON.stringify(data),
         success: function(res){
         }
      });
   }
});


</script>
<script type="text/javascript">
$(function(){
	$(".deleteBtn").on("click",function(){
		console.log("this check:",this); // 일단 this를 먼저 확인
		console.log('no',this.dataset.no);
		
		var data = {
				mailCode : this.dataset.no
		};
		
		$.ajax({
			url : '/mail/delete',
			type : "post",
			data : JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			dataType : "text",
			success : function(data) {
				if(data ==="success"){
				   location.href = "/mail/recieveList";
				}
			}
		})
	})

	});
	
const searchInput = document.getElementById('input');

//테이블 행(row) 요소들 가져오기
const rows = document.querySelectorAll('#custom_tool_ele tbody tr');

//검색어 입력란의 값이 변경될 때마다 실행되는 이벤트 핸들러 함수
searchInput.addEventListener('input', function(event) {
// 검색어
const searchKeyword = event.target.value.trim().toLowerCase();

// 각 행(row)마다 검색어를 포함하고 있는지 확인하고,
// 포함하고 있지 않으면 화면에서 숨깁니다.
rows.forEach(row => {
 const text = row.textContent.toLowerCase();
 if (text.includes(searchKeyword)) {
   row.style.display = '';
 } else {
   row.style.display = 'none';
 }
});
});	
</script>
<script>
  document.getElementById("refreshBtn").addEventListener("click", function() {
    location.reload();
  });
  
  function addToImportant(icon) {
	  var mailCode = icon.getAttribute('data-code');
	  // 중요 메일함에 추가하는 로직
	  alert('중요메일함에 보관되었습니다.');
	}
  
  
  
</script>