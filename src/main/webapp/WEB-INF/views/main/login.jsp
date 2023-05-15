<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		$("#tempBtn").on('click', function(){
			
			// 임시 id, pw 입력
			$("#empNo").val('20220005');
			$("#empPw").val('11111111');
			
			$("#loginForm").submit();
		});
		
	});
</script>
    
<%-- <div class="auth-wrapper d-flex no-block justify-content-center align-items-center" 
style="background: url(${pageContext.request.contextPath }/resources/assets/images/big/auth-bg.jpg) no-repeat center center">
style="background: url(${pageContext.request.contextPath }/resources/images/loginBg1.png) no-repeat center center; background-size: 100%;"> --%>
  <div class="auth-box" style="border: groove;">
<!--   <div class="auth-box" style="border: groove;"> -->
    <div id="loginform">
      <div class="logo">
        <span class="db"><img id="tempBtn" width="130" src="${pageContext.request.contextPath }/resources/images/logo.png" alt="logo" /></span>
<!--         <h5 class="font-medium mb-3">Sign In to Admin</h5> -->
      </div>
      <!-- Form -->
      <div class="row">
        <div class="col-12">
          <form class="form-horizontal mt-3" id="loginForm" action="/conn/login" method="post">
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1" style="background-color:#d1d2d5;">
                <i data-feather="user" class="feather-sm"></i>
              </span>
              <input name="empNo" id="empNo" type="text" class="form-control form-control-lg" placeholder="사원번호" aria-label="Username" aria-describedby="basic-addon1"/>
            </div>
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon2" style="background-color:#d1d2d5;">
                <i data-feather="lock" class="feather-sm"></i>
              </span>
              <input name="empPw" id="empPw" type="password" class="form-control form-control-lg" placeholder="비밀번호" aria-label="Password" aria-describedby="basic-addon1"/>
            </div>
            <div class="mb-3 row">
              <div class="col-md-12">
                <div class="form-check d-flex align-items-center">
                  <input type="checkbox" class="form-check-input" id="customCheck1"style="background-color:#d1d2d5;"/>
                  <label class="form-check-label ms-2 mt-1" for="customCheck1">로그인 정보 저장</label>
                  <a href="javascript:void(0)" id="to-recover" class="text-dark ms-auto d-flex align-items-center">
                    <i data-feather="lock" class="feather-sm me-1"></i> 사원번호 찾기 / 비밀번호 찾기
                  </a>
                </div>
              </div>
            </div>
            <br>
            <div class="mb-3 text-center">
              <div class="col-xs-8 pb-3">
                <button class="btn d-block w-100 btn-lg btn-info font-medium" type="submit">
                  	로그인
                </button>
              </div>    
                      
<!--               <div class="col-xs-4 pb-3"> -->
<!--                 <button class="btn d-block w-100 btn-lg btn-warning font-medium" id="tempBtn"> -->
<!--                   (자동 로그인) -->
<!--                 </button> -->
<!--               </div> -->
              
            </div>
            <!-- ===================================[social Login]=================================== -->
<!--             <div class="row"> -->
<!--               <div class="col-xs-12 col-sm-12 col-md-12 mt-2 text-center"> -->
<!--                 <div class="social"> -->
<!--                   <a href="javascript:void(0)" class="btn btn-facebook" data-bs-toggle="tooltip" title="" data-original-title="Login with Facebook"> -->
<!--                     <i aria-hidden="true" class="ri-facebook-box-fill fs-4"></i> -->
<!--                   </a> -->
<!--                   <a href="javascript:void(0)" class="btn btn-googleplus" data-bs-toggle="tooltip" title="" data-original-title="Login with Google"> -->
<!--                     <i aria-hidden="true" class="ri-google-fill fs-4"></i> -->
<!--                   </a> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
            <!-- ===================================[social Login]=================================== -->
<!--             <div class="mb-3 mb-0 mt-2"> -->
<!--               <div class="col-sm-12 text-center"> -->
<!--                 Don't have an account? -->
<!--                 <a href="authentication-register1.html" class="text-info ms-1"> -->
<!--                   <b>Sign Up</b> -->
<!--                 </a> -->
<!--               </div> -->
<!--             </div> -->
          </form>
        </div>
      </div>
    </div>
    <div id="recoverform">
      <div class="logo">
        <span class="db"><img src="${pageContext.request.contextPath }/resources/images/logo3.png" alt="logo" style="width: 200px;"/></span>
        <h5 class="font-medium mb-3">Find Id</h5>
<!--         <button id="findBtn" type="button" onclick="location.href='/conn/find'" class="btn waves-effect waves-light btn-light-primary text-primary">ID/PW 찾기</button> -->
		<a href="/conn/find">
        	<button id="findBtn" type="button" class="btn waves-effect waves-light btn-light-primary text-primary">ID/PW 찾기</button>
        </a>
      </div>
    </div>
  </div>
<!-- </div> -->