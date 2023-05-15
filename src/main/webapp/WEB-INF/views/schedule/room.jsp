<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ===================[fullcalendar 6.1.4 CDN]===================== -->
<!--  fullcalendar 6.1.4버전 CDN -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
<!-- fullcalendar 6.1.4버전 언어 설정 -->
<script src="${pageContext.request.contextPath }/resources/fullcalendar/ko.global.min.js"></script>

<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/moment-timezone@6.1.5/index.global.min.js"></script>
<!-- ===================[fullcalendar 6.4.1 CDN]===================== -->
<script type="text/javascript">
$(function(){	
	


});	
</script>
<style>
li{
	list-style:none;
}
tr{
   height: 60px;
}
th{
   width: 300px;
}

.modalTr .modalTd{
/*    border: 1px solid #eee; */
   padding: 5px;
}

#schContent{
   border: 1px solid #eee;
   border-radius: 5px;
   width: 300px;
   height: 50px;
}
a{
	color : black;
}
</style>

<div class="email-app">
	<div class="left-part" style="width: 200px;">
	 <a class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none" href="javascript:void(0)"></a>
	 <div class="scrollable" style="height: 100%">
	   <div class="p-3">
	   		<h3 style="text-align: center;">예약</h3>
	   </div>
		<div style="margin:10px;">	
			<div>
			    <h5><strong><a href="/sch/resRoom">회의실 예약</a></strong></h5>
				<!-- =====회의실 예약 accordion=====  -->
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" 
								aria-expanded="false" aria-controls="flush-collapseOne">1층 회의실</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<p>101호 회의실 (정원 15명)</p>
								<p>102호 회의실 (정원 20명)</p>
								<p>103호 회의실 (정원 30명)</p>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingTwo">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false"
								aria-controls="flush-collapseTwo">2층 회의실</button>
						</h2>
						<div id="flush-collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<p>301호 회의실 (정원 10명)</p>
								<p>302호 회의실 (정원 15명)</p>
								<p>303호 회의실 (정원 20명)</p>
								<p>303호 회의실 (정원 50명)</p>
							</div>
						</div>
					</div>
				</div>	
				<!-- =====회의실 예약 accordion=====  -->
			</div>
			<br>
			<div>
				<h5><strong><a href="/sch/room">임시페이지</a></strong></h5>
				<h5><strong><a href="/sch/resCar">차량 예약</a></strong></h5>
			</div>
		</div>	
	        
	  </div>
	</div>
    <div class="right-part mail-list bg-white" style= "width: calc(100% - 200px); margin-left: 200px; overflow-y: auto; overflow-x: hidden;">
	    <div class="p-3 b-b">
	       <div class="d-flex align-items-center">
		        <div>
		            <h4>예약</h4>
		            <span>Home > 회의실 예약</span>
		        </div>
	       </div>
	    </div>
		<!-- 만약에 예약된 상태면 class이름에 를 추가 -->
<!-- 		<div class="page-breadcrumb"> -->
<!-- 		   <h4 class="page title">회의실 예약 </h4> -->
<!-- 		</div> -->
		<div class="container-fluid" style="text-align:center;">
			<div style="background-color:#eef5f975; border-radius:5px; height:85px; margin:20px;">
				<div style="padding:20px; text-align:left; font-size:large; font-weight: bold;">
					<p>
						본사 1층에 위치한 회의실입니다.<br>
						회의실의 예약 후 이용바랍니다
					</p>
				</div>
			</div>
		
		   <div>
		      <div class="input-group" style="height:50px; margin:20px;">
		         <input type="date" value="" id="pickadate" class="pickadate" style="height: 50px; width: 96%; text-align: center; font-size: xx-large; margin: auto;"/>
		      </div>
		   </div>
		   <div class="row" style="background-color: white; margin:10px; ">
		      <div class="col-md-5" style="margin: 25px 10px; width: 100%;">
		         <table class="table table-sm table-bordered reserv-table" id="timeTbl">
		            <thead>
		               <tr style="height:5px;">
		                  <th></th>
		                  <th colspan="28">본사 1층 회의실</th>
		               </tr>
		               <tr style="height: 50px;">
		                  <th>회의실  \ 시간</th>
		                  <td colspan="2" id="09" style="background-color: #d2e0f5;">09</td>
		                  <td colspan="2" id="10" style="background-color: #d2e0f5;">10</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">11</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">12</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">13</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">14</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">15</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">16</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">17</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">18</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">19</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">20</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">21</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">22</td>
		               </tr>
		            </thead>
		            <tbody>
		               <tr>
		                  <th>101호 회의실 (15인)</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
		               </tr>
		               <tr>
		                  <th>102호 회의실 (20인)</th>
		                  <td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
		               </tr>
		               <tr>
		                  <th>103호 회의실 (30인)</th>
		                  <td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
		               </tr>
		            </tbody>
		         </table>
		      </div>
		   </div>
		   <div class="row" style="background-color: white; margin:10px; ">
		      <div class="col-md-5" style="margin: 25px 10px; width: 100%;">
		         <table class="table table-sm table-bordered reserv-table" id="timeTbl">
		            <thead>
		               <tr style="height:5px;">
		                  <th></th>
		                  <th colspan="28">본사 3층 회의실</th>
		               </tr>
		               <tr style="height: 50px;">
		                  <th>회의실  \ 시간</th>
		                  <td colspan="2" id="09" style="background-color: #d2e0f5;">09</td>
		                  <td colspan="2" id="10" style="background-color: #d2e0f5;">10</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">11</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">12</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">13</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">14</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">15</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">16</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">17</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">18</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">19</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">20</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">21</td>
		                  <td colspan="2" id="11" style="background-color: #d2e0f5;">22</td>
		               </tr>
		            </thead>
		            <tbody>
		               <tr>
		                  <th>301호 회의실 (10인)</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
		               </tr>
		               <tr>
		                  <th>302호 회의실 (15인)</th>
		                  <td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
		               </tr>
		               <tr>
		                  <th>303호 회의실 (20인)</th>
		                  <td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
		               </tr>
		               <tr>
		                  <th>304호 회의실 (50인)</th>
		                  <td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
		               </tr>
		            </tbody>
		         </table>
		      </div>
		   </div>
		</div>
	</div>
</div>
<!-- =====================[ 회의실 예약 모달 ]=================================-->
<div class="bckdrop" style="display:none;"></div>
<div class="modal" id="resModal" data-bs-backdrop="static"  role="dialog" style="display: none;">
   <div class="modal-content">
      <div class="modal-header">
         <h4>회의실 예약</h4>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeBtn()"></button>
      </div> 
      <div class="modal-body" id="modalBody" style="height: 250px; width: 420px;">
         <table class="resModalTable" style="padding:5px; border-collapse: collapse;">
            <thead>[회의실 예약 정보]</thead>
            <tbody style="margin:3px;">
               <tr class="modalTr">
                  <td class="modalTd">예약 호실</td>
                  <td class="modalTd">
                     <div id ="rmName"style="float:left; width: 70%;">회의실 이름</div>
                     <input type="hidden" id="locaCode" value="">
                  </td>
               </tr>
               <tr class="modalTr">
                  <td class="modalTd">예약 시간</td>
                  <td class="modalTd">
                     <div id="rmTime" style="float:left; width: 40%; ">예약시간</div>
                     <select name="resTime" style="float:right;" id="timeSelect">
<!--                         <option selected>이용 시간 선택</option> -->
                        <option value="1">1시간</option>
                        <option value="2">2시간</option>
                        <option value="3">3시간</option>
                     </select>
                  </td>
               </tr>
               <tr class="modalTr">
                  <td class="modalTd">이용 목적</td>
                  <td class="modalTd">
                     <input type="text" id="schContent" name="schContent" value="">
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-warning" id="addBtn" onclick="addBtn(this)">추가</button>
         <button type="button" class="btn btn-warning" id="addBtn" style="display:none" onclick="modBtn(this)">수정</button>
         <button type="button" class="btn btn-delete" id="delBtn" style="display: none" onclick="">삭제</button>
         <button type="button" class="btn btn-secondary" data-dismiss="modal" id="CloseBtn" onclick="closeBtn()">취소</button>
      </div>   
   </div>
</div>
<!-- =====================[ 회의실 예약 모달 ]=================================-->