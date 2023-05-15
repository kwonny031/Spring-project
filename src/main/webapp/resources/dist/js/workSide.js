	// 과장 이상은 근태 관리 권한 부여
	let manageFlag = '${manageFlag}';
// 	console.log('flag ::',manageFlag);
	if(manageFlag == 'true'){
		manageFlag = true;
	}else{
		manageFlag = false;
	}
	console.log('flag2 ::',manageFlag);
	
	// cell div 띄워져 있는지 여부
	let cellFlag = false;

	let workList = [];
	let todayWorks = []; // [0] 출근 - today를 따로 만들지 말고 그 날의 출근정보를 찾아서
	// listIdx를 저장 해놓기. - 그냥 객체를 리스트에 저장?
	
	// 변수에 년도, 월 저장
	let year;
	let month;
	let date;
	let hour;
	let minute;
	
	// 현재 표시하고 있는 년도, 월
	let dispYear;
	let dispMonth;
			
	// 이번 주 누적, 이번 주 잔여, 이번 주 초과, 이번 달 누적
	let weekTime;
	let weekRest;
	let weekOver;
	let monthTime;
	
	// 출근 listIdx
	let startWorkIdx;			
	let endWorkIdx;	
	
	// 출퇴근 시간 표시
	let workTimeDisps = document.querySelectorAll('.workTimeDisp');	
	
	////
	// 과장이상 직급이면 사원 근태 목록 확인 가능. side에는 자기 정보 + acc에는 클릭한 사원정보
	document.addEventListener('DOMContentLoaded', () => { // 태그 해석만 함
		

		
	
		
		setInterval(showTime,500);  //0.5초마다 갱신		
		
		// 오늘에 해당하는 tr에 cell 띄우기
		// 먼저 1빼고 나머지 구해야 함.
		let todayIndex = (now.getDate() - 1) % 7;
///		let todayTr = document.querySelectorAll('.weekTableTag')[weekCount-1].children[1].children[todayIndex];
		
		
		////  empLi > empDiv
		let empLis = document.querySelectorAll('.empLi');
		let empDiv = document.querySelector('#empDiv');
// 		let empDiv2 = document.querySelector('#empDiv2'); // div2도 있으면 좋은데


		
		let empDivFlag = false;
		let imgSrc = empDiv.children[0].children[0].src; 
		
		// 권한 없으면 근태현황 버튼 비활성화
		if(!manageFlag){
			empDiv.children[2].children[0].setAttribute('disabled','disabled');
		}
		
		// 근태현황 버튼
		let empNamePos;
		
		document.querySelector('#empWork').addEventListener('click',(e)=>{
			console.log('btn empNo ::',e.target.dataset.empNo);
			
			// ajax 동기로 jsonWorkList 가져오기
			listAndDisp(e.target.dataset.empNo);
			
			console.log('empNamePos ::',empNamePos);
			let empLbl = document.querySelector('#empLbl'); 
			empLbl.innerHTML = '- '+empNamePos;
			empLbl.style.display = 'inline-block';
			
			
		});
		

		
		
		

		
		// e.target이 tr의 자식인 td라서 todayTr의 아무 자식 요소를 매개변수로 넘기면 됨.
///		console.log('tar',todayTr.children[0]);
///		addCell(todayTr.children[0]);
		
		// workDiv 클릭 시 수정 모달에 데이터 넣기
		let workDivs = document.querySelectorAll('.workDiv');
		console.log('cellchk',workDivs);
		
		for(let i=0; i<workDivs.length; i++){
			
			workDivs[i].addEventListener('click',(e)=>{
				console.log('div chk',e.target,e.target.dataset.listIdx);
				
				let data = workList[e.target.dataset.listIdx];

				let modMonth = data['workDate'].substring(5,6);
				let modDate = data['workDate'].substring(7,8);
				
				if(modMonth.length == 1) { modMonth = '0'+modMonth; }
				if(modDate.length == 1) { modDate = '0'+modDate; }
				
				let modResult = data['workDate'].substring(0,4)+'-'+modMonth+'-'+modDate;
				document.querySelector('#modDate').value = modResult;
				console.log('data',modResult);
				
				let time = data['workStart'];
				let modHour = time.split(':')[0];
				let modMinute = time.split(':')[1];
				
				for(let i=7; i<24; i++){
					let option = document.createElement("option");
					
					if(i < 10){
						if(i == modHour){
							option.setAttribute('selected','selected');
						}
						option.innerHTML = '0'+i;
					}else{
						if(i == modHour){
							option.setAttribute('selected','selected');
						}
						option.innerHTML = i;
					}
					
					document.querySelector('#modHour').appendChild(option);
				}

				for(let i=0; i<60; i++){
					let option = document.createElement("option");
					
					if(i < 10){
						if(i == modMinute){
							option.setAttribute('selected','selected');
						}
						option.innerHTML = '0'+i;
					}else{
						if(i == modMinute){
							option.setAttribute('selected','selected');
						}
						option.innerHTML = i;
					}
					
					document.querySelector('#modMinute').appendChild(option);
				}		
				
				let status = document.querySelector('#modStatus').children;
				
				for(let i=0; i<status.length; i++){
					if(status[i].innerHTML == data['workType']){
						status[i].selected = true;
					}
				}
				
				if(data['workMemo'] == null){
					data['workMemo'] = '';
				}
				document.querySelector('#modMemo').value = data['workMemo'];
			});
		}		
		

		
		// empDiv 닫기
		window.addEventListener('click',(e)=>{
// 			console.log('click e ::',empDivFlag,e.target);
// 			console.log('click ee ::',e.target.classList,e.target.classList.contains('empLi'));
			
// 			if(e.target != empDiv && empDivFlag){
// 				empDiv.style.display = 'none';
// 				empDivFlag = false;
// 			}
			// window 다른 곳 클릭했을 때 div 닫고싶은데
		});
		
	});
	// DOM end
	
	let now = new Date();
	let week = ['일', '월', '화', '수', '목', '금', '토'];
	
	let monthStr = '';
	if((now.getMonth()+1).toString().length == 1){ 
		monthStr = '0'+(now.getMonth()+1);
	}else{
		monthStr = now.getMonth()+1;
	}
	
	let dStr = '';
	if(now.getDate().toString().length == 1){ 
		dStr = '0'+now.getDate();
	}else{
		dStr = now.getDate();
	}

	year = now.getFullYear();
	month = monthStr;
	date = dStr;
	
	dispYear = year;
	dispMonth = month;
		
	let dateStr = year+'-'+month+'-'+date+'('+week[now.getDay()]+')';
	
	let dateDisp = document.querySelector('#dateDisp');
	dateDisp.innerHTML = dateStr;		
	
	function showTime(){
		now = new Date();
		
		let timeDisp = document.querySelector('#timeDisp');
		let timeStr = "";
        
		if(now.getHours().toString().length == 1){
			timeStr += '0'+now.getHours()+':';
			hour = '0'+now.getHours();
		}else{
			timeStr += now.getHours()+':';
			hour = now.getHours();
		}
		
		if(now.getMinutes().toString().length == 1){
			timeStr += '0'+now.getMinutes()+':';
			minute = '0'+now.getMinutes();
		}else{
			timeStr += now.getMinutes()+':';
			minute = now.getMinutes();
		}
		
		if(now.getSeconds().toString().length == 1){
			timeStr += '0'+now.getSeconds();
		}else{
			timeStr += now.getSeconds();
		}
		
		timeDisp.innerHTML = timeStr;
	}	
	
	function makeWorkList(p_workList){
		
		// jsonWorkList - parse - 오늘 근무 골라서 출력하기
// 		console.log('jwL',p_workList);
		workList = [];
		
		for(let i=0; i<p_workList.length; i++){
			workList.push(JSON.parse(p_workList[i]));
		}
		console.log('wL 출력',workList);
		
		// 다중 조건으로 정렬하기. ||(OR연산자)를 사용해서 앞의 값이 0이 나오는 경우
		// 두 번째 조건으로 다시 정렬하게 됨.
		// +) 문자열 정렬은 '-' 대신 localeCompare() 사용
		workList.sort((a,b)=>{
			return a['workDate'] - b['workDate'] || a['workType'].localeCompare(b['workType']);
		});
		console.log('wL 정렬',workList);
		
		//console.log('session chk ::',workList[0].empNo);
		console.log('session chk ::','${SessionInfo.empNo}',empNo);
		if(workList.length != 0 && workList[0].empNo == empNo){
			makeTodayList(year+month+date);
		}
		
	}		
	
	function makeTodayList(p_date){
		todayWorks = [];
		
		//console.log('chk',workList[4]['workDate'],year+month+date,workList[4]['workStart']);
		for(let i=0; i<workList.length; i++){
			// 날짜 일치 && 타입 체크 (같은 날에 업무, 업무종료가 두 개 이상 들어가지 않게 해야 함.)
			if(workList[i]['workDate'] == p_date){
				
				if(workList[i]['workType'] == '업무'){
					todayWorks.push(workList[i]);
					
					startWorkIdx = i;
					
					if(p_date == year+month+date){
						// 오늘 출근 표시.
						let time = workList[i]['workStart'];
						startDisp(time.split(':')[0], time.split(':')[1], 0);
					}
				}
				
				if(workList[i]['workType'] == '업무종료'){
					todayWorks.push(workList[i]);
					
					endWorkIdx = i;
					
					if(p_date == year+month+date){
						// 오늘 퇴근 표시.
						let time = workList[i]['workStart'];
						startDisp(time.split(':')[0], time.split(':')[1], 1);
					}
				}
			}
		}		
	}		
	
	function startDisp(p_hour, p_minute, p_num){
		
		if(p_num == 0){ // 출근
			workTimeDisps[0].innerHTML = '<strong>'+p_hour+':'+p_minute+'</strong>';
		}else{ // 퇴근
			workTimeDisps[1].innerHTML = '<strong>'+p_hour+':'+p_minute+'</strong>';
		}
	}	
	
	

	