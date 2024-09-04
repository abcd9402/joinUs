<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <main>
    <div class="loginWrapper">
        <h2>Login</h2>
        <form  method="post" action="login.html" id="loginForm" >
            <input type="text" name="id" placeholder="ID">
            <input type="password" name="password" placeholder="비밀번호">
            <input type="submit" value="로그인">
        </form>
        <div class="missing">
        <button onclick="location.href='missingId.html'">회원가입</button>
            <button onclick="location.href='missingId.html'">ID 찾기</button>
            <button onclick="location.href='missingPassword.html'">비밀번호 찾기</button>
        </div>
    </div>
</main> -->


 <!--0827 제이쿼리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>



<!-- 부트스트랩 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/theme.css" />
<link rel="stylesheet" href="/resources/css/template2.css" />


<!-- 함수 파일 -->
<script src="/resources/js/login.js"></script>



    <section class="container">
    <% if(session.getAttribute("user") == null){%>
	<div class="text-center mb-5">
		<form class="form-signin border shadow " id="formId"
			action="/login/ok" method="post">
			<h1 class="h3 mb-3 font-weight-normal">Login</h1>
			<div class="mb-3">
				<label for="inputEmail" class="sr-only">ID</label> <input
					type="text" name="userId" id="userId" class="form-control"
					placeholder="아이디" required autofocus>
			</div>

			<div class="mb-3">
				<label for="inputPassword" class="sr-only">Password</label> <input
					type="password" name="password" id="password" class="form-control"
					placeholder="비밀번호" required>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				onclick="login()">로그인</button>
			<input type="submit" id="submitBtn" hidden />
			<p class="mt-3">
				아이디가 없으세요? <a class="font-weight-bold" href="/join">회원가입</a>
			</p>
			<p class="mt-1 mb-3">
				아이디를 잊으셨나요? <a class="font-weight-bold" href="/login/missingId">아이디
					찾기</a>
			</p>
			<p class="mt-1 mb-3">
				비밀번호를 잊으셨나요? <a class="font-weight-bold" href="/login/missingPass">비밀번호
					찾기</a>
			</p>
		</form>
	</div>
	<%
		} else {
	%>
	<div class="text-center mb-5">
		<form class="form-signin border shadow " id="formId"
			action="/login/ok" method="post">
			
			
<!-- 			<div class="mb-3">
				<label for="inputEmail" class="sr-only">ID</label> <input
					type="text" name="userId" id="userId" class="form-control"
					placeholder="아이디" required autofocus>
			</div>

			<div class="mb-3">
				<label for="inputPassword" class="sr-only">Password</label> <input
					type="password" name="password" id="password" class="form-control"
					placeholder="비밀번호" required>
			</div> -->
			<%-- <div class="mb-3">
				<img src="${user.userImage}" style="width:150px;height:150px;left:50px; margin-left:1px;" /> 
			</div>
			
			<div class="form-group row">
				<div class="col-sm-7">
					<label for="inputemail" class="sr-only">${user.userId}님</label> 
					<h1 class="h3 mb-1 font-weight-normal">${user.userId}님</h1>		
				</div>
				<div class="col-sm-5 pl-1" style="float: right;">
					<button class="btn btn-ls btn-primary btn-block" id="sendMailBtn" type="button"
						onclick="sendMail()">로그아웃</button>
				</div>
			</div> --%>
			<div class="form-group row">
				<div class="col-sm-7">
					<img src="${user.userImage}" style="width:150px;height:150px;left:50px; margin-left:1px;" /> 
				</div>
					<h1 class="h4 mt-4 mb-1 font-weight-normal">${user.userId}님<br><br>환영합니다 </h1>
					<button class="btn btn-ls btn-primary btn-block mt-3" id="sendMailBtn" type="button"
						onclick="logout()">로그아웃</button>		
				
			</div>
			

		</form>
	</div>
	<% } %>
      	
    </section>

</main>
