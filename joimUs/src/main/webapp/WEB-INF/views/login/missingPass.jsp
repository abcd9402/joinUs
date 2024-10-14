<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <!--0827 제이쿼리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!--emailJS 이메일 인증번호 전송 스크립트-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>


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

<main>
<section class="container" style="padding-bottom:150px; ">

	<div class="text-center mb-5">
		<form class="form-signin border shadow ">
			<h1 class="h3 mb-3 font-weight-normal">비밀번호 찾기</h1>

			<div class="mb-3">
				<label for="inputid" class="sr-only">아이디</label> <input type="text" autocomplete="off"
					id="userId" class="form-control" placeholder="아이디" name="userId"
					required autofocus>
			</div>

			<div class="mb-3">
				<label for="inputname" class="sr-only">이름</label> <input type="text" autocomplete="off"
					id="userName" class="form-control" placeholder="이름"
					name="userName" required>
			</div>
			<div class="form-group row">
				<div class="col-sm-9">
					<label for="inputemail" class="sr-only">이메일</label> <input autocomplete="off"
						type="email" id="mail" class="form-control"
						placeholder="이메일" name="mail" required>
				</div>
				<div class="col-sm-3 pl-1" style="float: right;">
					<button class="btn btn-ls btn-primary btn-block" id="sendMailBtn" type="button" style="background-color: #660099;"
						onclick="sendMail()">전송</button>
				</div>
			</div>
			<div class="mb-3" hidden id="certificationArea">
				<label for="inputname" class="sr-only">인증번호</label> <input type="text" autocomplete="off" 
					id="certificationNumber" class="form-control" placeholder="인증번호"
					name="certificationNumber" required>
			</div>
			<input type="text" id="certiNum" hidden />
			<input type="text" id="pass" hidden />
			<div class="mb-3">
				<button class="btn btn-ls btn-primary btn-block" type="button" style="background-color: #660099;"
				onclick="findpw()">비밀번호 찾기</button>
			</div>

		</form>
	</div>
</section>

</main>



<%@include file="../includes/footer.jsp"%>