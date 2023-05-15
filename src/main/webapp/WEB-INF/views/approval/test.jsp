<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="report">
			<h2 style="text-align: center; padding-bottom: 30px;" id="title">출장 보고서</h2>
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
					<tbody id="my-tbody">
						<tr>
							<td class="td1" height="40px">출장 시작일</td>
							<td class="td2" colspan='2'>
								&emsp;
								<select name="yy" id="s_year"></select>
								&nbsp;
								<select name="mm" id="s_month"></select>
								&nbsp;
								<select name="dd" id="s_day"></select>
							</td>
							<td class="td1">출장 종료일</td>
							<td class="td2" colspan='2'>
								&emsp;
								<select name="yy" id="e_year"></select>
								&nbsp;
								<select name="mm" id="e_month"></select>
								&nbsp;
								<select name="dd" id="e_day"></select> 
							</td>
						</tr>
						<tr>
							<td class="td1" height="40px">장소</td>
							<td colspan='4' class="td2"><input type="text" id="place" class="input"/></td>
						</tr>
						<tr>
							<td class="td1" height="40px">주소</td>
							<td colspan='4' class="td2"><input type="text" id="place" class="input"/></td>
						</tr>
						<tr>
							<td class="td1" height="40px">목적</td>
							<td colspan='4' class="td2"><input type="text" id="place" class="input"/></td>
						</tr>
						<tr>
							<td class="td1" rowspan='2' height="80px">지출</td>
							<td class="td5" height="40px">교통비</td>
							<td class="td6"><input type="text" id="travel_ex" onkeyup="inputNumberFormat(this);" >&nbsp;원</td>
							<td class="td5">식비</td>
							<td class="td6"><input type="text" id="food_ex" onkeyup="inputNumberFormat(this);" >&nbsp;원</td>
						</tr>
						<tr>
							<td class="td5" height="40px">숙박비</td>
							<td class="td6"><input type="text" id="room_ex" onkeyup="inputNumberFormat(this);" >&nbsp;원</td>
							<td class="td5">기타 지출</td>
							<td class="td6"><input type="text" id="etc_ex" onkeyup="inputNumberFormat(this);" >&nbsp;원</td>
						</tr>
						<tr>
							<td class="td1">내용</td>
							<td colspan='4' class="ta"><textarea class="ta_in"></textarea></td>
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
<!-- 				<div class="btnGroup"> -->
<!-- 					<button id="add_row">행 추가하기</button> -->
<!-- 					<button id="delete_row">행 삭제하기</button> -->
<!-- 				</div> -->
		</div>