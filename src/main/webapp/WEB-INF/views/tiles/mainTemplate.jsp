<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, xtreme admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, material design, material dashboard bootstrap 5 dashboard template"
    />
    <meta
      name="description"
      content="Xtreme is powerful and clean admin dashboard template, inpired from Google's Material Design"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>KURO Office</title>
    
    <link rel="canonical" href="https://www.wrappixel.com/templates/xtremeadmin/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/images/kk3.ico" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/apexcharts/dist/apexcharts.css" />
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath }/resources/dist/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="https://kit.fontawesome.com/35de181fac.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>



  </head>

  <body>
    <!-- -------------------------------------------------------------- -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- -------------------------------------------------------------- -->
    <div class="preloader">
      <svg
        class="tea lds-ripple"
        width="37"
        height="48"
        viewbox="0 0 37 48"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M27.0819 17H3.02508C1.91076 17 1.01376 17.9059 1.0485 19.0197C1.15761 22.5177 1.49703 29.7374 2.5 34C4.07125 40.6778 7.18553 44.8868 8.44856 46.3845C8.79051 46.79 9.29799 47 9.82843 47H20.0218C20.639 47 21.2193 46.7159 21.5659 46.2052C22.6765 44.5687 25.2312 40.4282 27.5 34C28.9757 29.8188 29.084 22.4043 29.0441 18.9156C29.0319 17.8436 28.1539 17 27.0819 17Z"
          stroke="#2962FF"
          stroke-width="2"
        ></path>
        <path
          d="M29 23.5C29 23.5 34.5 20.5 35.5 25.4999C36.0986 28.4926 34.2033 31.5383 32 32.8713C29.4555 34.4108 28 34 28 34"
          stroke="#2962FF"
          stroke-width="2"
        ></path>
        <path
          id="teabag"
          fill="#2962FF"
          fill-rule="evenodd"
          clip-rule="evenodd"
          d="M16 25V17H14V25H12C10.3431 25 9 26.3431 9 28V34C9 35.6569 10.3431 37 12 37H18C19.6569 37 21 35.6569 21 34V28C21 26.3431 19.6569 25 18 25H16ZM11 28C11 27.4477 11.4477 27 12 27H18C18.5523 27 19 27.4477 19 28V34C19 34.5523 18.5523 35 18 35H12C11.4477 35 11 34.5523 11 34V28Z"
        ></path>
        <path
          id="steamL"
          d="M17 1C17 1 17 4.5 14 6.5C11 8.5 11 12 11 12"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke="#2962FF"
        ></path>
        <path
          id="steamR"
          d="M21 6C21 6 21 8.22727 19 9.5C17 10.7727 17 13 17 13"
          stroke="#2962FF"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
      </svg>
    </div>
    <!-- -------------------------------------------------------------- -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- -------------------------------------------------------------- -->
    <div id="main-wrapper">
	
		<!-- header - style you can find in pages.scss -->
		<tiles:insertAttribute name="header"/>
		<!-- header -->
	
		<!-- side - style you can find in sidebar.scss -->
		<tiles:insertAttribute name="side"/>
		<!-- side -->
	
		<!-- -------------------------------------------------------------- -->
		<!-- Page wrapper  -->
		<!-- -------------------------------------------------------------- -->
		<div class="page-wrapper">		
		
			<!-- body -->
			<tiles:insertAttribute name="body"/>
			<!-- body -->
			
		</div>
		<!-- -------------------------------------------------------------- -->
		<!-- End Page wrapper  -->
		<!-- -------------------------------------------------------------- -->			

  
		<!-- -------------------------------------------------------------- -->
		<!-- footer -->
		<!-- -------------------------------------------------------------- -->
		<footer class="footer text-center">
		  All Rights Reserved by Xtreme admin. Designed and Developed by
		  <a href="https://www.wrappixel.com">WrapPixel</a>.
		</footer>
		<!-- -------------------------------------------------------------- -->
		<!-- End footer -->
		<!-- -------------------------------------------------------------- -->

    </div>
    <!-- -------------------------------------------------------------- -->
    <!-- End Wrapper -->
    <!-- -------------------------------------------------------------- -->
    <!-- -------------------------------------------------------------- -->
    <!-- customizer Panel -->
    <!-- -------------------------------------------------------------- -->
<!--     <aside class="customizer"> -->
<!--       <a href="javascript:(0)" class="service-panel-toggle" -->
<!--         ><i data-feather="settings" class="feather-sm fa fa-spin"></i -->
<!--       ></a> -->
<!--       <div class="customizer-body"> -->
<!--         <ul class="nav customizer-tab" role="tablist"> -->
<!--           <li class="nav-item"> -->
<!--             <a -->
<!--               class="nav-link active" -->
<!--               id="pills-home-tab" -->
<!--               data-bs-toggle="pill" -->
<!--               href="#pills-home" -->
<!--               role="tab" -->
<!--               aria-controls="pills-home" -->
<!--               aria-selected="true" -->
<!--               ><i class="ri-tools-fill fs-6"></i -->
<!--             ></a> -->
<!--           </li> -->
<!--           <li class="nav-item"> -->
<!--             <a -->
<!--               class="nav-link" -->
<!--               id="pills-profile-tab" -->
<!--               data-bs-toggle="pill" -->
<!--               href="#chat" -->
<!--               role="tab" -->
<!--               aria-controls="chat" -->
<!--               aria-selected="false" -->
<!--               ><i class="ri-message-3-line fs-6"></i -->
<!--             ></a> -->
<!--           </li> -->
<!--           <li class="nav-item"> -->
<!--             <a -->
<!--               class="nav-link" -->
<!--               id="pills-contact-tab" -->
<!--               data-bs-toggle="pill" -->
<!--               href="#pills-contact" -->
<!--               role="tab" -->
<!--               aria-controls="pills-contact" -->
<!--               aria-selected="false" -->
<!--               ><i class="ri-timer-line fs-6"></i -->
<!--             ></a> -->
<!--           </li> -->
<!--         </ul> -->
<!--         <div class="tab-content" id="pills-tabContent"> -->
<!--           Tab 1 -->
<!--           <div -->
<!--             class="tab-pane fade show active" -->
<!--             id="pills-home" -->
<!--             role="tabpanel" -->
<!--             aria-labelledby="pills-home-tab" -->
<!--           > -->
<!--             <div class="p-3 border-bottom"> -->
<!--               Sidebar -->
<!--               <h5 class="font-medium mb-2 mt-2">Layout Settings</h5> -->
<!--               <div class="form-check mt-2"> -->
<!--                 <input type="checkbox" class="form-check-input" name="theme-view" id="theme-view" /> -->
<!--                 <label class="form-check-label" for="theme-view">Dark Theme</label> -->
<!--               </div> -->
<!--               <div class="form-check mt-2"> -->
<!--                 <input -->
<!--                   type="checkbox" -->
<!--                   class="form-check-input sidebartoggler" -->
<!--                   name="collapssidebar" -->
<!--                   id="collapssidebar" -->
<!--                 /> -->
<!--                 <label class="form-check-label" for="collapssidebar">Collapse Sidebar</label> -->
<!--               </div> -->
<!--               <div class="form-check mt-2"> -->
<!--                 <input -->
<!--                   type="checkbox" -->
<!--                   class="form-check-input" -->
<!--                   name="sidebar-position" -->
<!--                   id="sidebar-position" -->
<!--                 /> -->
<!--                 <label class="form-check-label" for="sidebar-position">Fixed Sidebar</label> -->
<!--               </div> -->
<!--               <div class="form-check mt-2"> -->
<!--                 <input -->
<!--                   type="checkbox" -->
<!--                   class="form-check-input" -->
<!--                   name="header-position" -->
<!--                   id="header-position" -->
<!--                 /> -->
<!--                 <label class="form-check-label" for="header-position">Fixed Header</label> -->
<!--               </div> -->
<!--               <div class="form-check mt-2"> -->
<!--                 <input -->
<!--                   type="checkbox" -->
<!--                   class="form-check-input" -->
<!--                   name="boxed-layout" -->
<!--                   id="boxed-layout" -->
<!--                 /> -->
<!--                 <label class="form-check-label" for="boxed-layout">Boxed Layout</label> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="p-3 border-bottom"> -->
<!--               Logo BG -->
<!--               <h5 class="font-medium mb-2 mt-2">Logo Backgrounds</h5> -->
<!--               <ul class="theme-color"> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-logobg="skin1"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-logobg="skin2"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-logobg="skin3"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-logobg="skin4"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-logobg="skin5"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-logobg="skin6"></a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--               Logo BG -->
<!--             </div> -->
<!--             <div class="p-3 border-bottom"> -->
<!--               Navbar BG -->
<!--               <h5 class="font-medium mb-2 mt-2">Navbar Backgrounds</h5> -->
<!--               <ul class="theme-color"> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-navbarbg="skin1"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-navbarbg="skin2"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-navbarbg="skin3"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-navbarbg="skin4"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-navbarbg="skin5"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-navbarbg="skin6"></a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--               Navbar BG -->
<!--             </div> -->
<!--             <div class="p-3 border-bottom"> -->
<!--               Logo BG -->
<!--               <h5 class="font-medium mb-2 mt-2">Sidebar Backgrounds</h5> -->
<!--               <ul class="theme-color"> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-sidebarbg="skin1"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-sidebarbg="skin2"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-sidebarbg="skin3"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-sidebarbg="skin4"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-sidebarbg="skin5"></a> -->
<!--                 </li> -->
<!--                 <li class="theme-item"> -->
<!--                   <a href="#" class="theme-link" data-sidebarbg="skin6"></a> -->
<!--                 </li> -->
<!--               </ul> -->
<!--               Logo BG -->
<!--             </div> -->
<!--           </div> -->
<!--           End Tab 1 -->
<!--           Tab 2 -->
<!--           <div class="tab-pane fade" id="chat" role="tabpanel" aria-labelledby="pills-profile-tab"> -->
<!--             <ul class="mailbox list-style-none mt-3"> -->
<!--               <li> -->
<!--                 <div class="message-center chat-scroll"> -->
<!--                   <a href="#" class="message-item" id="chat_user_1" data-user-id="1"> -->
<!--                     <span class="user-img"> -->
<!--                       <img -->
<%--                         src="${pageContext.request.contextPath }/resources/assets/images/users/1.jpg" --%>
<!--                         alt="user" -->
<!--                         class="rounded-circle" -->
<!--                       /> -->
<!--                       <span class="profile-status online pull-right"></span> -->
<!--                     </span> -->
<!--                     <div class="mail-contnet"> -->
<!--                       <h5 class="message-title">Pavan kumar</h5> -->
<!--                       <span class="mail-desc">Just see the my admin!</span> -->
<!--                       <span class="time">9:30 AM</span> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                   Message -->
<!--                   <a href="#" class="message-item" id="chat_user_2" data-user-id="2"> -->
<!--                     <span class="user-img"> -->
<!--                       <img -->
<%--                         src="${pageContext.request.contextPath }/resources/assets/images/users/2.jpg" --%>
<!--                         alt="user" -->
<!--                         class="rounded-circle" -->
<!--                       /> -->
<!--                       <span class="profile-status busy pull-right"></span> -->
<!--                     </span> -->
<!--                     <div class="mail-contnet"> -->
<!--                       <h5 class="message-title">Sonu Nigam</h5> -->
<!--                       <span class="mail-desc">I've sung a song! See you at</span> -->
<!--                       <span class="time">9:10 AM</span> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                   Message -->
<!--                   <a href="#" class="message-item" id="chat_user_3" data-user-id="3"> -->
<!--                     <span class="user-img"> -->
<!--                       <img -->
<%--                         src="${pageContext.request.contextPath }/resources/assets/images/users/3.jpg" --%>
<!--                         alt="user" -->
<!--                         class="rounded-circle" -->
<!--                       /> -->
<!--                       <span class="profile-status away pull-right"></span> -->
<!--                     </span> -->
<!--                     <div class="mail-contnet"> -->
<!--                       <h5 class="message-title">Arijit Sinh</h5> -->
<!--                       <span class="mail-desc">I am a singer!</span> -->
<!--                       <span class="time">9:08 AM</span> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                   Message -->
<!--                   <a href="#" class="message-item" id="chat_user_4" data-user-id="4"> -->
<!--                     <span class="user-img"> -->
<!--                       <img -->
<%--                         src="${pageContext.request.contextPath }/resources/assets/images/users/4.jpg" --%>
<!--                         alt="user" -->
<!--                         class="rounded-circle" -->
<!--                       /> -->
<!--                       <span class="profile-status offline pull-right"></span> -->
<!--                     </span> -->
<!--                     <div class="mail-contnet"> -->
<!--                       <h5 class="message-title">Nirav Joshi</h5> -->
<!--                       <span class="mail-desc">Just see the my admin!</span> -->
<!--                       <span class="time">9:02 AM</span> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                   Message -->
<!--                   Message -->
<!--                   <a href="#" class="message-item" id="chat_user_5" data-user-id="5"> -->
<!--                     <span class="user-img"> -->
<!--                       <img -->
<%--                         src="${pageContext.request.contextPath }/resources/assets/images/users/5.jpg" --%>
<!--                         alt="user" -->
<!--                         class="rounded-circle" -->
<!--                       /> -->
<!--                       <span class="profile-status offline pull-right"></span> -->
<!--                     </span> -->
<!--                     <div class="mail-contnet"> -->
<!--                       <h5 class="message-title">Sunil Joshi</h5> -->
<!--                       <span class="mail-desc">Just see the my admin!</span> -->
<!--                       <span class="time">9:02 AM</span> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                   Message -->
<!--                   Message -->
<!--                   <a href="#" class="message-item" id="chat_user_6" data-user-id="6"> -->
<!--                     <span class="user-img"> -->
<!--                       <img -->
<%--                         src="${pageContext.request.contextPath }/resources/assets/images/users/6.jpg" --%>
<!--                         alt="user" -->
<!--                         class="rounded-circle" -->
<!--                       /> -->
<!--                       <span class="profile-status offline pull-right"></span> -->
<!--                     </span> -->
<!--                     <div class="mail-contnet"> -->
<!--                       <h5 class="message-title">Akshay Kumar</h5> -->
<!--                       <span class="mail-desc">Just see the my admin!</span> -->
<!--                       <span class="time">9:02 AM</span> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                   Message -->
<!--                   Message -->
<!--                   <a href="#" class="message-item" id="chat_user_7" data-user-id="7"> -->
<!--                     <span class="user-img"> -->
<!--                       <img -->
<%--                         src="${pageContext.request.contextPath }/resources/assets/images/users/7.jpg" --%>
<!--                         alt="user" -->
<!--                         class="rounded-circle" -->
<!--                       /> -->
<!--                       <span class="profile-status offline pull-right"></span> -->
<!--                     </span> -->
<!--                     <div class="mail-contnet"> -->
<!--                       <h5 class="message-title">Pavan kumar</h5> -->
<!--                       <span class="mail-desc">Just see the my admin!</span> -->
<!--                       <span class="time">9:02 AM</span> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                   Message -->
<!--                   Message -->
<!--                   <a href="#" class="message-item" id="chat_user_8" data-user-id="8"> -->
<!--                     <span class="user-img"> -->
<!--                       <img -->
<%--                         src="${pageContext.request.contextPath }/resources/assets/images/users/8.jpg" --%>
<!--                         alt="user" -->
<!--                         class="rounded-circle" -->
<!--                       /> -->
<!--                       <span class="profile-status offline pull-right"></span> -->
<!--                     </span> -->
<!--                     <div class="mail-contnet"> -->
<!--                       <h5 class="message-title">Varun Dhavan</h5> -->
<!--                       <span class="mail-desc">Just see the my admin!</span> -->
<!--                       <span class="time">9:02 AM</span> -->
<!--                     </div> -->
<!--                   </a> -->
<!--                   Message -->
<!--                 </div> -->
<!--               </li> -->
<!--             </ul> -->
<!--           </div> -->
<!--           End Tab 2 -->
<!--           Tab 3 -->
<!--           <div -->
<!--             class="tab-pane fade p-3" -->
<!--             id="pills-contact" -->
<!--             role="tabpanel" -->
<!--             aria-labelledby="pills-contact-tab" -->
<!--           > -->
<!--             <h6 class="mt-3 mb-3">Activity Timeline</h6> -->
<!--             <div class="steamline"> -->
<!--               <div class="sl-item"> -->
<!--                 <div class="sl-left bg-light-success text-success"> -->
<!--                   <i data-feather="user" class="feather-sm fill-white"></i> -->
<!--                 </div> -->
<!--                 <div class="sl-right"> -->
<!--                   <div class="font-medium">Meeting today <span class="sl-date"> 5pm</span></div> -->
<!--                   <div class="desc">you can write anything</div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="sl-item"> -->
<!--                 <div class="sl-left bg-light-info text-info"> -->
<!--                   <i data-feather="camera" class="feather-sm fill-white"></i> -->
<!--                 </div> -->
<!--                 <div class="sl-right"> -->
<!--                   <div class="font-medium">Send documents to Clark</div> -->
<!--                   <div class="desc">Lorem Ipsum is simply</div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="sl-item"> -->
<!--                 <div class="sl-left"> -->
<%--                   <img class="rounded-circle" alt="user" src="${pageContext.request.contextPath }/resources/assets/images/users/2.jpg" /> --%>
<!--                 </div> -->
<!--                 <div class="sl-right"> -->
<!--                   <div class="font-medium"> -->
<!--                     Go to the Doctor <span class="sl-date">5 minutes ago</span> -->
<!--                   </div> -->
<!--                   <div class="desc">Contrary to popular belief</div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="sl-item"> -->
<!--                 <div class="sl-left"> -->
<%--                   <img class="rounded-circle" alt="user" src="${pageContext.request.contextPath }/resources/assets/images/users/1.jpg" /> --%>
<!--                 </div> -->
<!--                 <div class="sl-right"> -->
<!--                   <div> -->
<!--                     <a href="#">Stephen</a> -->
<!--                     <span class="sl-date">5 minutes ago</span> -->
<!--                   </div> -->
<!--                   <div class="desc">Approve meeting with tiger</div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="sl-item"> -->
<!--                 <div class="sl-left bg-light-primary text-primary"> -->
<!--                   <i data-feather="user" class="feather-sm fill-white"></i> -->
<!--                 </div> -->
<!--                 <div class="sl-right"> -->
<!--                   <div class="font-medium">Meeting today <span class="sl-date"> 5pm</span></div> -->
<!--                   <div class="desc">you can write anything</div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="sl-item"> -->
<!--                 <div class="sl-left bg-light-info text-info"> -->
<!--                   <i data-feather="send" class="feather-sm fill-white"></i> -->
<!--                 </div> -->
<!--                 <div class="sl-right"> -->
<!--                   <div class="font-medium">Send documents to Clark</div> -->
<!--                   <div class="desc">Lorem Ipsum is simply</div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="sl-item"> -->
<!--                 <div class="sl-left"> -->
<%--                   <img class="rounded-circle" alt="user" src="${pageContext.request.contextPath }/resources/assets/images/users/4.jpg" /> --%>
<!--                 </div> -->
<!--                 <div class="sl-right"> -->
<!--                   <div class="font-medium"> -->
<!--                     Go to the Doctor <span class="sl-date">5 minutes ago</span> -->
<!--                   </div> -->
<!--                   <div class="desc">Contrary to popular belief</div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="sl-item"> -->
<!--                 <div class="sl-left"> -->
<%--                   <img class="rounded-circle" alt="user" src="${pageContext.request.contextPath }/resources/assets/images/users/6.jpg" /> --%>
<!--                 </div> -->
<!--                 <div class="sl-right"> -->
<!--                   <div> -->
<!--                     <a href="#">Stephen</a> -->
<!--                     <span class="sl-date">5 minutes ago</span> -->
<!--                   </div> -->
<!--                   <div class="desc">Approve meeting with tiger</div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           End Tab 3 -->
<!--         </div> -->
<!--       </div> -->
<!--     </aside> -->
    <div class="chat-windows"></div>
    <!-- -------------------------------------------------------------- -->
    <!-- Required Js files -->
    <!-- -------------------------------------------------------------- -->
<%--     <script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/dist/jquery.min.js"></script> --%>

    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Theme Required Js -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.init.js"></script>
    <script src="${pageContext.request.contextPath }/resources/dist/js/app-style-switcher.js"></script>
    <!-- perfect scrollbar JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/feather.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/dist/js/custom.min.js"></script>
    <!-- --------------------------------------------------------------- -->
    <!-- This page JavaScript -->
    <!-- --------------------------------------------------------------- -->
<%--     <script src="${pageContext.request.contextPath }/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath }/resources/dist/js/pages/dashboards/dashboard1.js"></script> --%>
    <!-- ===================[ sweetAlert ]================================-->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<!-- ===================[ sweetAlert ]================================-->
    
    
  </body>
  
<script type="text/javascript">

	
</script>
  
  
</html>

