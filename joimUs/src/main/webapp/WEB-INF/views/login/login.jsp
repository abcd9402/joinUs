<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>


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


<%@include file="../includes/header.jsp"%>


    <section class="container" style="padding-bottom:80px; ">
   
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
			<button class="btn btn-lg btn-primary btn-block" style="background-color: #660099;" type="button"
				onclick="login()">로그인</button>
			<input type="submit" id="submitBtn" hidden />
			<p class="mt-3">
				아이디가 없으세요? <a class="font-weight-bold" style="color: #660099;" href="/join">회원가입</a>
			</p>
			<p class="mt-1 mb-3">
				아이디를 잊으셨나요? <a class="font-weight-bold" style="color: #660099;" href="/login/missingId">아이디
					찾기</a>
			</p>
			<p class="mt-1 mb-3">
				비밀번호를 잊으셨나요? <a class="font-weight-bold"  style="color: #660099;" href="/login/missingPass">비밀번호
					찾기</a>
			</p>
		</form>
	</div>
	
    </section>

</main>

<%@include file="../includes/footer.jsp"%>
