<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body style="margin: 0px; background: #f8f8f8">
	<div width="100%"
		style="background: #f8f8f8; padding: 0px 0px; font-family: arial; line-height: 28px; height: 100%; width: 100%; color: #514d6a;">
		<div
			style="max-width: 700px; padding: 50px 0; margin: 0px auto; font-size: 14px">
			<div style="padding: 40px; background: #fff">
				<table border="0" cellpadding="0" cellspacing="0"
					style="width: 100%">
					<tbody>
						<!-- start row -->
						<tr>
							<button type="button"
								class="btn btn-light-success btn-circle btn-lg"
								style="margin-left: 45%;">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" 
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-send feather-sm">
									<line x1="22" y1="2" x2="11" y2="13"></line>
									<polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>
							</button>
							<td style="text-align: center;"><b>메일을 성공적으로 보냈습니다.</b> <br>
								<br> <br>
								<p>발송량에 따라 이메일이 도착하는 시점에 차이가 있을 수 있습니다.</p>
								<p>바로 도착하지 않아도 기다려주세요.</p>
								<button type="button"
									class="btn waves-effect waves-light btn-outline-secondary" onclick="location.href='/mail/recieveList'">
									메일목록</button>
								<button type="button"
									class="btn waves-effect waves-light btn-outline-secondary" onclick="location.href='/mail/write'">
									메일 쓰기</button></td>
						</tr>
					</tbody>

				</table>
			</div>
		</div>
	</div>
</body>