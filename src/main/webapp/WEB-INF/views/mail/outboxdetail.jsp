<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.cke_top {
	border-bottom: 1px solid #d1d1d1;
	background: #f8f8f8;
	padding: 6px 8px 2px;
	white-space: normal;
}

.cke_bottom {
	padding: 6px 8px 2px;
	position: relative;
	border-top: 1px solid #d1d1d1;
	background: #f8f8f8;
}

.btn-default {
	background-color: #EAEAEA;
}
</style>

<div class="email-app">
	<div class="left-part" style="width: 200px;" style="width: calc(100% - 200px); margin-left: 200px;">
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
					class="active list-group-item-action d-flex align-items-center"><i
						data-feather="inbox" class="feather-sm fill-white me-2"></i> 받은메일함
						<span
						class="
                        badge
                        bg-light-success
                        text-success
                        px-3
                        rounded-pill
                        font-medium
                        ms-auto
                      ">6</span></a>
				</li>
				<li class="list-group-item"><a href="/mail/send"
					class="list-group-item-action d-flex align-items-center"> <i
						data-feather="send" class="feather-sm fill-white me-2"></i> 보낸메일함
						<span
						class="
                        badge
                        bg-light-danger
                        text-danger
                        font-medium
                        px-3
                        rounded-pill
                        ms-auto
                      ">3</span>
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
					<hr />
				</li>
			
				<li class="list-group-item"><a href="/mail/trash"
					class="list-group-item-action"> <i data-feather="trash-2"
						class="feather-sm fill-white me-2"></i> 휴지통
				</a></li>
				<li class="list-group-item">
					<hr />
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
	<form:form action="/mail/write" method="post" id="mailForm"
		modelAtribute="mailVO">

		<div class="right-part mail-list bg-white overflow-auto">
			<div class="p-4 border-bottom">
				<div class="d-flex align-items-center">
					<div>
						<!-- params매핑
						/mail/write?outboxBtns
						 -->
						<button type="submit" id="outboxBtn" name="outboxBtn"
							class="btn waves-effect waves-light btn-outline-dark">
							임시저장</button>
						<button type="submit" id="btnRegister"
							class="btn waves-effect waves-light btn-outline-dark"
							onclick="location.href='mail/process'">
							<i data-feather="send" class="feather-sm fill-white"></i> 보내기
						</button>
						<button type="button"
							class="btn waves-effect waves-light btn-outline-dark"
							onclick="location.reload()">다시쓰기</button>
					</div>
				</div>
			</div>

			<div class="card-body">

				<div class="parent" style="display: flex;">
					<div class="mb-3" style="width: 50%;">
						<input type="text" class="form-control"
							placeholder="받는사람" value="${empVO.empName }"/>
					</div>

					<div class="con" style="width: 50%;">
						<button type="button" id="myBtn"
							class="btn waves-effect waves-light btn-outline-primary"
							data-bs-toggle="modal" data-bs-target="#primary-header-modal"
							style="height: 35px;">
							<i class="far fa-address-book" style="font-size: 20px;"></i> 주소록
						</button>
					</div>
				</div>


				<input type="text" class="form-control" placeholder="제목"
					style="width:" name="mailTitle" value=" ${mailVO.mailTitle }"/><br>
				<div class="mb-3">
					<input type="file" class="form-control" id="files" />
				</div>
				<label><input type="checkbox" name="color" value="중요자료"><span
					class="
                            badge
                            bg-light-danger
                            text-danger
                            font-medium
                            rounded-pill
                            px-3
                            me-2
                          ">중요</span></label>
				<label><input type="checkbox" name="color" value="경영자료"><span
					class="
                            badge
                            bg-light-success
                            text-success
                            font-medium
                            rounded-pill
                            px-3
                            me-2
                          ">경영</span></label>
				<label><input type="checkbox" name="color" value="회계자료"><span
					class="
                            badge
                            bg-light-warning
                            text-warning
                            font-medium
                            px-3
                            rounded-pill
                            me-2
                          ">회계</span></label>
				<label><input type="checkbox" name="color" value="참고자료">
					<span
					class="badge bg-light-info text-info font-medium rounded-pill px-3 me-2">참고</span></label>

				<div class="col-12">
					<div class="card">
						<div class="border-bottom title-part-padding"></div>
						<div class="card-body">
							<textarea cols="80" id="testedit1" name="mailContent" rows="10"
								title="메일 내용을 입력해 주세요." data-sample="2" >${mailVO.mailContent }
                  </textarea>
						</div>
					</div>
				</div>
				<div id="summernote"></div>

				<div class="button-group text-end">

					<button type="submit"
						class="btn waves-effect waves-light btn-outline-secondary">취소</button>
				</div>
	</form:form>
</div>


<!-- 모달 -->
<div id="primary-header-modal" class="modal fade" tabindex="-1"
	aria-labelledby="primary-header-modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-colored-header bg-primary text-white">
				<h4 class="modal-title" id="primary-header-modalLabel">주소록</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- modal - body -->
			<div class="modal-body">
				<div class="bootstrap-duallistbox-container row moveonselect">
					<div class="box1 col-md-6">
						<label for="bootstrap-duallistbox-nonselected-list_"
							style="display: none;"></label> <span class="info-container">
						</span> <input class="filter form-control" type="text"
							placeholder="Search"> <br>
						<div class="btn-group buttons" style="width: 225px;">
							<button type="button" class="btn moveall btn-default"
								title="Move all" style="height: 28px;">
								<i class="fas fa-angle-right" style="color: #6C757D;"></i> <i
									class="fas fa-angle-right" style="color: #6C757D;"></i>
							</button>
							<button type="button" class="btn move btn-default"
								title="Move selected" style="height: 28px;">
								<i class="fas fa-angle-right" style="color: #6C757D;"></i>
							</button>
						</div>
						<select multiple="multiple"
							id="bootstrap-duallistbox-nonselected-list_" class="form-control"
							name="_helper1" style="height: 101.333px;">
							<c:forEach items="${contactList }" var="contact" varStatus="i">
								<option value="1" data-empno="${contact.empNo }">"${contact.conName }"(${contact.conEmail}
									)</option>
							</c:forEach>
						</select>
					</div>
					<div class="box2 col-md-6">
						<label for="bootstrap-duallistbox-selected-list_"
							style="display: none;"></label> <span class="info-container">
						</span> <input class="filter form-control" type="text"
							placeholder="Search"> <br>
						<div class="btn-group buttons" style="width: 225px;">
							<button type="button" class="btn remove btn-default"
								title="Remove selected" style="height: 28px;">
								<i class="fas fa-angle-left" style="color: #6C757D;"></i>
							</button>
							<button type="button" class="btn removeall btn-default"
								title="Remove all" style="height: 28px;">
								<i class="fas fa-angle-left" style="color: #6C757D;"></i> <i
									class="fas fa-angle-left" style="color: #6C757D;"></i>
							</button>
						</div>
						<select multiple="multiple"
							id="bootstrap-duallistbox-selected-list_" class="form-control"
							name="_helper2" style="height: 101.333px;">
						</select>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="btnAddress"
					class="btn btn-light-primary text-primary font-medium">확인</button>
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">
					Close</button>
			</div>
		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath }/resources/assets/libs/ckeditor/ckeditor.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/ckeditor/samples/js/sample.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-duallistbox/dist/jquery.bootstrap-duallistbox.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/dist/js/pages/forms/dual-listbox/dual-listbox.js"></script>
<script>
      //default
      initSample();

      //inline editor
      // We need to turn off the automatic editor creation first.
      CKEDITOR.disableAutoInline = true;

      CKEDITOR.inline('editor2', {
        extraPlugins: 'sourcedialog',
        removePlugins: 'sourcearea',
      });

      var editor1 = CKEDITOR.replace('editor1', {
        extraAllowedContent: 'div',
        height: 460,
      });
      editor1.on('instanceReady', function () {
        // Output self-closing tags the HTML4 way, like <br>.
        this.dataProcessor.writer.selfClosingEnd = '>';

        // Use line breaks for block elements, tables, and lists.
        var dtd = CKEDITOR.dtd;
        for (var e in CKEDITOR.tools.extend(
          {},
          dtd.$nonBodyContent,
          dtd.$block,
          dtd.$listItem,
          dtd.$tableContent,
        )) {
          this.dataProcessor.writer.setRules(e, {
            indent: true,
            breakBeforeOpen: true,
            breakAfterOpen: true,
            breakBeforeClose: true,
            breakAfterClose: true,
          });
        }
        // Start in source mode.
        this.setMode('source');
      });
    </script>
<script data-sample="2">
      CKEDITOR.replace('testedit1', {
        height: 400,
      });
</script>


<script type="text/javascript">
//주소록 옮기기
var nonSelectedList = $('#bootstrap-duallistbox-nonselected-list_');
var selectedList = $('#bootstrap-duallistbox-selected-list_');

$('#bootstrap-duallistbox-nonselected-list_ option').mousedown(function(e) {
    e.preventDefault();
    
    $(this).prop('selected', true);
    var selectedOptions = nonSelectedList.find('option:selected');
    selectedList.append(selectedOptions);
    selectedOptions.prop('selected', false);
});

$('#bootstrap-duallistbox-selected-list_ option').mousedown(function(e) {
    e.preventDefault();
    
    $(this).prop('selected', true);
    var selectedOptions = selectedList.find('option:selected');
    nonSelectedList.append(selectedOptions);
    selectedOptions.prop('selected', false);
});


//버튼 클릭 이벤트 핸들러 등록
var moveButton = document.querySelector(".move");
var removeButton = document.querySelector(".remove");

moveButton.addEventListener("click", function() {
  moveItems("#bootstrap-duallistbox-nonselected-list_", "#bootstrap-duallistbox-selected-list_");
});

removeButton.addEventListener("click", function() {
  moveItems("#bootstrap-duallistbox-selected-list_", "#bootstrap-duallistbox-nonselected-list_");
});

// 항목 이동 함수
function moveItems(fromSelector, toSelector) {
  var fromSelect = document.querySelector(fromSelector);
  var toSelect = document.querySelector(toSelector);

  for (var i = 0; i < fromSelect.options.length; i++) {
    var option = fromSelect.options[i];
    if (option.selected) {
      var newOption = document.createElement("option");
      newOption.value = option.value;
      newOption.setAttribute("data-empno", option.getAttribute("data-empno"));
      newOption.text = option.text;
      toSelect.add(newOption);
      fromSelect.remove(i);
      i--;
    }
  }
}

</script>
<script type="text/javascript">
const filterInput = document.querySelector('.filter'); // 입력 필드 선택
const selectBox = document.querySelector('#bootstrap-duallistbox-nonselected-list_'); // 셀렉트 박스 선택
const options = selectBox.options; // 셀렉트 박스 내부의 옵션들 선택

// 입력 필드에서 텍스트가 입력될 때마다 실행되는 함수
filterInput.addEventListener('input', function(event) {
  const filterText = event.target.value.toLowerCase(); // 검색어를 소문자로 변경
  for (let i = 0; i < options.length; i++) {
    const optionText = options[i].textContent.toLowerCase(); // 옵션 텍스트를 소문자로 변경
    if (optionText.includes(filterText)) { // 검색어를 포함하는 옵션은 보여주고, 그렇지 않은 옵션은 감춤
      options[i].style.display = '';
    } else {
      options[i].style.display = 'none';
    }
  }
});


//버튼 클릭 이벤트 핸들러 함수
function handleClick() {
  const select = document.getElementById("bootstrap-duallistbox-selected-list_");
  const options = select.selectedOptions;
  const recipients = Array.from(options).map((option) => option.value).join(", ");
  document.getElementById("example-email").value = recipients;
}

// 버튼 요소
const button = document.querySelector(".btn");

// 버튼에 클릭 이벤트 핸들러 함수 등록
button.addEventListener("click", handleClick);


const confirmButton = document.querySelector('.btn');
const emailInput = document.querySelector('#example-email');
const selectBox = document.querySelector('#bootstrap-duallistbox-selected-list_');

confirmButton.addEventListener('click', () => {
  const selectedOptions = [...selectBox.selectedOptions];
  const emailList = selectedOptions.map(option => option.textContent.match(/\((.*?)\)/)[1]);
  emailInput.value = emailList.join(', ');
});



</script>
<script type="text/javascript">
$(function(){
	$("#btnAddress").on("click",function(){
		
		let str = "";
		
		//_helper2 : <select
		$.each($("select[name='_helper2']").children(),function(index,data){
			console.log($(this).data("empno"));
			
			//사원번호들 input을 생성하여 form태그안에 append
			let tags = "<input type='text' name='empNo' value='" + $(this).data("empno") + "' />";
			$("#mailForm").append(tags);
			
			console.log($(this).text());
			let temp = $(this).text();
			//정규식 : 시작과 끝은 역슬러시
			//g : global
			//i : ignore(대소문자구문안함)
			//역슬러시s : 스페이스바
			temp = temp.replace(/\s/gi, "");
			str += temp + ", ";
		});
		
		console.log("str : " + str);
		
		$("input[name='empName']").val(str);
		//모달 종료
		$("#primary-header-modal").modal('hide');
	});
});
</script>
