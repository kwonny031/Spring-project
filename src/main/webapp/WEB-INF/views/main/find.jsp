<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<<style>
.hidden{
display: none;
}
.hidden2{
display: none;
}
</style>
	<div class="auth-box" style="width:900px; max-width: 900px; margin: 5% 0; border: groove;">
          <div>
            <div class="logo">
              <span class="db"><img onclick="location.href='/main/home'"; style = "width:190px; height:80px;"src="${pageContext.request.contextPath }/resources/images/logo3.png" alt="logo" /></span>
            </div>
			<div class="row" style="margin-top: 20px; margin-bottom: 10px;">
				<div class="col-6" style="text-align: center;">─  아이디찾기  ─</div>
				<div class="col-6" style="text-align: center;">─  비밀번호 찾기  ─</div>
			</div>
            <!-- Form -->
            <div class="row" style="min-height: 255px;">
              <div class="col-6" style="width: 48%;">
                <form class="form-horizontal mt-3" action="" method="post">
                  <div class="mb-3 row">
                    <div class="col-12">
                      <input class="form-control form-control-lg"  name="idEmail" id="idEmail" type="text" required="" style="border: revert;" placeholder="이메일을 입력해주세요."/>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <div class="col-12">
                      <input class="form-control form-control-lg" name="idempName" id="idempName" type="text" required="" style="border: revert;" placeholder="이름을 입력해주세요."/>
                    </div>
                  </div>
                  <div class="mb-3 text-center">
                    <div class="col-xs-12 pb-3">
                      <button class="btn d-block w-100 btn-lg btn-light-info text-info"type="button" id="idFindBtn">아이디 찾기</button>
                    </div>
                    <div class="input-group mb-3">
          				<p id="idText" class="hidden">회원님의 사번은 <font id="id"></font> 입니다.</p>
        			</div>
                  </div>
                </form>
              </div>
<!--               <div class="col-2"></div> -->
              <div class="col-6" style="width: 48%; margin-left: 30px;">
                <form class="form-horizontal mt-3" action="" method="post">
	                <div class="mb-3 row">
	                    <div class="col-6">
	                      <input class="form-control form-control-lg" name="pwempName" id="pwempName" type="text" required="" style="border: revert;" placeholder="이름"/>
	                    </div>
	                    <div class="col-6">
	                      <input class="form-control form-control-lg" name="pwempNo" id="pwempNo" type="text" required="" style="border: revert;" placeholder="사원번호"/>
	                    </div>
	                  </div>
	                  <div class="mb-3 row">
	                    <div class="col-12">
	                      <input class="form-control form-control-lg"  name="to" id="to" type="text" required="" style="border: revert;" placeholder="이메일을 입력해주세요."/>
	                    </div>
	                  </div>
	                  <div class="mb-3 text-center">
						<div class="col-xs-12 pb-3">
							<button type="button" id="submitBtn" class="btn d-block w-100 btn-lg btn-light-info text-info" style="height: 42px;">
								 이메일전송 <i class="icon fa fa-paper-plane"></i>
							</button>
						</div>
	                    <div class="input-group mb-3">
	          				<p id="pwText" class="hidden2">임시 비밀번호가 전송되었습니다.</p>
	        			</div>
	                  </div>
                  
                </form>
              </div>
            </div>
            <div class="mb-3 text-center" style="width: 350px; margin-left: 260px; margin-top: 30px;">
                    <div class="col-xs-12 pb-3"  >
                      <button onclick="location.href='/main/home'"; class="btn d-block w-100 btn-lg btn-light-info text-info"type="button">로그인</button>
                    </div>
                  </div>
          </div>
        </div>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
	integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<script type="text/javascript">
let checkFlag = false; // 이메일 인증 했는지 여부 

function tempPassword(length){
	 var charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    var password = "";
    for (var i = 0; i < length; i++) {
        password += charset.charAt(Math.floor(Math.random() * charset.length));
    }
    return password;
}


$(function(){
	var loginBtn = $("#loginBtn");
	var idFindBtn = $("#idFindBtn");
	var pwFindBtn = $("#pwFindBtn");
	var submitBtn = $('#submitBtn');
	var submitForm = $('#submitForm');
	var joinNum = $('#joinNum');
	var numCheck = $('#numCheck');
	
	var timer;
	var isRunning = false;
	
	// 인증번호 발송하고 타이머 함수 실행
	function sendAuthNum(){
	    	// 남은 시간
		var leftSec = 60*5,
		display = document.querySelector('#timer');
		// 이미 타이머가 작동중이면 중지
		if (isRunning){
		   clearInterval(timer);
		} else {
	    	isRunning = true;
	    }
	     startTimer(leftSec, display);
	}
	 
	function startTimer(count, display) {
	        var minutes, seconds;
	        timer = setInterval(function () {
	        minutes = parseInt(count / 60, 10);
	        seconds = parseInt(count % 60, 10);
	 
	        minutes = minutes < 10 ? "0" + minutes : minutes;
	        seconds = seconds < 10 ? "0" + seconds : seconds;
	 
	        display.textContent = minutes + ":" + seconds;
	 
	        // 타이머 끝
	        if (--count < 0) {
		     clearInterval(timer);
		     display.textContent = "";
		     isRunning = false;
	        }
	    }, 1000);
	}
	
	joinNum.on("click",function(){
		joinNum.val('');	
	})
	
	// 인증번호입력란의 value를 컨트롤러로 보내서 인증번호 발생시 만들어둔 세션값과 일치하면 SUCCESS를 받아오고 불일치시엔 FAILED를 받아옴
	numCheck.on("click",function(){
		
		console.log(joinNum.val());
		
		numObject = {
				joinNum : joinNum.val()
			}
			
			
			$.ajax({
				type : "post",
				url : "/conn/numberCheck" ,
				data : JSON.stringify(numObject),
				contentType : "application/json; charset=utf-8",
				dataType: "text",
				success : function(result){
					console.log("result :" + result);
					if(result === "SUCCESS"){  //인증성공시
						alert("인증완료")
						$('#status').text('인증완료');
						clearInterval(timer);	//인터벌함수 종료
						$('#timer').text('');
						numCheck.attr('hidden','true');
						
						checkFlag = true;
					}else{
						alert("인증실패")
					}
				}
			});
	})
	
	
	 
	
	
	
	// 제목과 내용 입력 받는사람 입력란 value를받아서 컨트롤러로 보내서 전송여부를 확인하고 전송에성공하면 SUCCESS 실패하면 FAILED받아옴
	submitBtn.on("click",function(){
		var subjectVal = $('#subject').val();
		var messageVal = $('#message').val();
		var toVal = $('#to').val();
		
		console.log(subjectVal);
		console.log(messageVal);
		
		var tempPW = tempPassword(6);
		
		mailObject = {
			subject : subjectVal,
			message : messageVal,
			to : toVal,
			tempPw:tempPW,
			joinNum:document.querySelector('#pwempNo').value
		}
		
		
		$.ajax({
			type : "post",
			url : "/conn/sendMail" ,
			data : JSON.stringify(mailObject),
			contentType : "application/json; charset=utf-8",
			dataType: "text",
			success : function(result){
				console.log("result :" + result);
				if(result === "SUCCESS"){
					$('#status').text('전송 완료          남은시간');
					
// 					sendAuthNum();
					document.querySelector('#pwText').style.display = 'block';
					
					
				}else{ 
					alert('올바르지않은 email 계정입니다.');
				} 
			}
		});
		
		
	});
	
	
	loginBtn.on("click", function(){
		location.href = "/main/login";
	});
	
	idFindBtn.on("click", function(){
		console.log('em',document.querySelector("#idEmail").value);
		
		if($("#idEmail").val() == ""){
			alert("이메일을 입력해주세요");
			return false;
		}
		if($("#idempName").val() == ""){
			alert("이름을 입력해주세요");
			return false;
		}
		
		$.ajax({
			type: "post",
			url: "/conn/idfind",
			data: {
				empEmail : $("#idEmail").val(),
				empName : $("#idempName").val(),
			},
			success: function(res){
				$("#id").html(res);
			}
		});
		idText.classList.remove('hidden');
	});
	
	pwFindBtn.on("click", function(){
		if(!checkFlag){
			alert('이메일 인증을 진행해주세요.');
			return;
		}
		
		if($("#pwempNo").val() == ""){
			alert("사원번호를 입력해주세요");
			return false;
		}
		if($("#to").val() == ""){
			alert("이메일을 입력해주세요");
			return false;
		}
		if($("#pwempName").val() == ""){
			alert("이름을 입력해주세요");
			return false;
		}
		
		$.ajax({
			type: "post",
			url: "/conn/pwfind",
			data: {
				empEmail : $("#to").val(),
				empName : $("#pwempName").val(),
				empNo : $("#pwempNo").val()
			},
			success: function(res){
				$("#password").html(res);
			}
		});
	pwText.classList.remove('hidden2');
	});
});
</script>