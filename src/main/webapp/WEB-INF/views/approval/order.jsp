<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#center {
	background-color: white;
}

.header {
	padding: 30px;
}

.buttons {
	padding: 20px;
}

.button1 {
	background-color: white;
	width: 80px;
	height: 35px;
}

.button2 {
	background-color: white;
	width: 80px;
	height: 35px;
}

.button3 {
	background-color: white;
	width: 60px;
	height: 35px;
}

.button4 {
	background-color: white;
	width: 80px;
	height: 35px;
}

.report {
	border: 1px;
	margin: 10px;
}

.td1 {
	border: 1px solid black;
	width: 40%;
	background-color: #ebe8e8;
	font-weight: bold;
	font-size: 12pt;
}

.td2 {
	border: 1px solid black;
	width: 60%
}

.td3 {
	border: 1px solid black;
	background-color: #ebe8e8;
	width: 20%;
	font-weight: bold;
}

.td4 {
	border: 1px solid black;
	width: 80%;
}

.td5 {
	border: 1px solid black;
	height: 30px;
}

.signTb {
	width: 100%;
	height: 100%;
	border: 1px solid black;
	text-align: center;
}

#firstRow {
	padding-bottom: 30px;
}
.btnGroup{
	padding-top: 20px;
}
#add_row{
	background-color: white;
	height: 35px;
}
#delete_row{
	background-color: white;
	height: 35px;
}
.report{
	border: 5px double #bdbcbc;
	padding: 30px;
}
.tb2{
	border: 1px solid black;
	margin-top: 30px;
	width: 100%;
}
.tb2-td1{
	border: 1px solid black;
	background-color: #ebe8e8;
	height: 50px;
	text-align: center;
	font-weight: bold;
	font-size: 13pt;
}
</style>













<div class="row" style="padding-top: 50px;">
	<div class="col-2"></div>
	<div class="col-8" id="center">
		<header class="header">
			<h3>발주서</h3>
		</header>
		<div class="buttons">
			<button class="button1">결재요청</button>
			<button class="button2">임시저장</button>
			<button class="button3">취소</button>
			<button class="button4">결재정보</button>
		</div>
		<div class="report">
			<h2 style="text-align: center; padding-bottom: 30px;" id="title" >발주서</h2>
			<form action="" method="post">
				<div class="row" id="firstRow">
					<div class="col-3">
						<table style="width: 100%;">
							<tr>
								<td class="td1">문서번호</td>
								<td class="td2"></td>
							</tr>
							<tr>
								<td class="td1">부서</td>
								<td class="td2" id="sessionDep"></td>
							</tr>
							<tr>
								<td class="td1">기안일</td>
								<td class="td2"><input type="text" id="app_date" readonly="readonly" style="border: 0px;"></td>
							</tr>
							<tr>
								<td class="td1">기안자</td>
								<td class="td2" id="sessionName"></td>
							</tr>
							<tr>
								<td class="td1">보존기간</td>
								<td class="td2"><input type="text" id="app_year" readonly="readonly" style="border: 0px;"></td>
							</tr>
						</table>
					</div>
					<div class="col-5"></div>
					<div class="col-4">
						<div class="row">
							<div class="col-4">
								<table class="signTb">
									<tr>
										<td rowspan='4' class="td3">결재선</td>
										<td class="td4" id="appLine1">대표이사</td>
									</tr>
									<tr>
										<td rowspan='2' class="td4" height="70px">서명</td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td height="20px"></td>
									</tr>
								</table>
							</div>
							<div class="col-4">
								<table class="signTb">
									<tr>
										<td rowspan='4' class="td3">결재선</td>
										<td class="td4" id="appLine2">대표이사</td>
									</tr>
									<tr>
										<td rowspan='2' class="td4" height="70px">서명</td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td height="20px"></td>
									</tr>
								</table>
							</div>
							<div class="col-4">
								<table class="signTb">
									<tr>
										<td rowspan='4' class="td3">결재선</td>
										<td class="td4" id="appLine3">대표이사</td>
									</tr>
									<tr>
										<td rowspan='2' class="td4" height="70px">서명</td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td height="20px"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<table border=1 width="100%">
					<thead>
						<tr class="td1" name="trStaff">
							<th>no</th>
							<th>품목명</th>
							<th>규격</th>
							<th>단가</th>
							<th>수량</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody id="my-tbody">
						<tr class="td5" name="trStaff">
							<td>1</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
						<tr class="td5" name="trStaff">
							<td>2</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
						<tr class="td5" name="trStaff">
							<td>3</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
						<tr class="td5" name="trStaff">
							<td>4</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
						<tr class="td5" name="trStaff">
							<td>5</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
						<tr class="td5" name="trStaff">
							<td>6</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
						<tr class="td5" name="trStaff">
							<td>7</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
						<tr class="td5" name="trStaff">
							<td>8</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
						<tr class="td5" name="trStaff">
							<td>9</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
						<tr class="td5" name="trStaff">
							<td id="noNum">10</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>

					</tbody>
				</table>
				<table class="tb2">
						<tr>
							<td class="tb2-td1">파일첨부</td>
							<td class="tb2-td2">&emsp;&emsp;<input type="file" /></td>
						</tr>
					</table>
			</form>
				<div class="btnGroup">
					<button id="add_row">행 추가하기</button>
					<button id="delete_row">행 삭제하기</button>
				</div>
		</div>
	</div>
	<div class="col-2"></div>
</div>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
	$('#add_row').click(function() {
		var my_tbody = document.getElementById('my-tbody');
		let first_tr   = my_tbody.firstElementChild;
	    let tr_clone   = first_tr.cloneNode(true);//*1)복제된 node 반환

	    my_tbody.append(tr_clone);
	    clean_first_tr(my_tbody.firstElementChild);
	});

	
	$('#delete_row').click(function() {
		var my_tbody = document.getElementById('my-tbody');
		if (my_tbody.rows.length < 1)
			return;
		// my_tbody.deleteRow(0); // 상단부터 삭제
		my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제
	});
</script>