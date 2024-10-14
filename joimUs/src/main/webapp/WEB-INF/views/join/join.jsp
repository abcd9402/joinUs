<!--  240825 회원가입 페이지  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<!--0827 제이쿼리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!--0826 다음 우편주소 api-->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 부트스트랩 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/theme.css" />
<link rel="stylesheet" href="/resources/css/template2.css" />

<!-- 함수 파일 -->
<script src="/resources/js/Join.js"></script>


<%@include file="../includes/header.jsp"%>

<!-- <link href="/resources/css/Join.css" rel="stylesheet"> -->


<main>
	<section class="container">
		<div class="text-center mb-5" >
			<form class="form-join border shadow" action="/join/confirm" method="post" >
				<!-- <img class="mb-4" src="/resources/images/logo.png" height="72"> -->
				<h1 class="h3 mb-3 font-weight-normal" >회원가입</h1>
				<div class="form-group row" style="position:relative;">
					<label for="staticEmail" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-4">
						<input class="form-control" type="text" id="userId" name="userId" value="" placeholder="ID입력">
					</div>

					<button type="button" class="btn btn-outline-secondary"  id="idChk" onclick="idCheck(userId.value)">중복확인</button>
					<input type="hidden" id = "idpass" value=""><!-- hidden -->
					<input type="hidden" name="user_profile_img" id="user_profile_img" value="">
					<div class="d-flex justify-content-center align-items-center border bg-light" id="previewImg" style="z-index:999;cursor:pointer;position:absolute;top:0;right:50px;width:150px;height:150px; "  >
						<label>이미지 업로드
							<input type="file"  name="img" id="img" accept='image/*'  class="btn btn-outline-primary" hidden />
						</label>	
					</div>		
					<input type="hidden" name="userImage" id="userImage" value="">
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label" style="font-size:14px;">비밀번호입력</label>
					<div class="col-sm-6">
						<input class="form-control" type="password"  name="password"  id="password" value="" placeholder="pw입력" onkeyup="passCheck(password.value, passConfirm.value)">
						<div class="text-left text-danger pt-1" id="chkPW"></div>
					</div>
					
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label" style="font-size:14px;" >비밀번호확인</label>
					<div class="col-sm-6">
						<input class="form-control" type="password"  id="passConfirm" name="passConfirm" value="" placeholder="pw확인" onkeyup="passCheck(password.value, passConfirm.value)">
						<div class="text-left text-danger pt-1" id="alertPW"></div>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label" style="font-size:14px;" ></label>
					<div class="col-sm-6">
						<div   class="text-left text-danger pt-1"  id="passCh" >
						</div>
					</div>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-4">
						<input class="form-control" type="text" id="name" name="name" value="" placeholder="이름">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">성별</label>
					<div class="col-sm-3">
						<select class="form-control" id="gender" name="gender">
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="emailFront" onkeyup="combineEmail()">
					</div>
					<div class="col-sm-0">@</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="emailBack" onkeyup="combineEmail()">
					</div>
					<div class="col-sm-3">
						<select class="form-control" name="selectValue" id="selectValue" onchange="selectEmail(selectValue.value)"  >
							<option value="">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="daum.net">다음</option>
							<option value="gmail.com">구글</option>
						</select>
					</div>
					<input type="hidden" id="mail" name="mail"><!-- hidden -->
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="addressNumber" name="addressNumber" value="" placeholder="우편번호입력" readonly="readonly">
					</div>
					<button type="button" class="btn btn-outline-secondary" onclick="addressFind()">우편번호 찾기</button>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"> </label>
					<div class="col-sm-5">
						<input class="form-control" type="text" id="address" name="address" value="" placeholder="주소" readonly="readonly">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"> </label>
					<div class="col-sm-5">
						<input class="form-control" type="text" id="addressDetail1" name="addressDetail1" value="" placeholder="상세주소" readonly="readonly">
					</div>

					<div class="col-sm-4">
						<input class="form-control" type="text" id="addressDetail2" name="addressDetail2" value="" placeholder="참고 항목" onkeyup="adr()"> 
					</div>
					<input type="hidden" class="" id="addressDetail" name="addressDetail" readonly="readonly"><!-- hidden -->
				</div>
				
				
				<div class="text-center mt-3">
				<input type="submit" id="confirm" hidden/>
					<button class="btn btn-lg btn-primary"  style="background-color: #660099;" type="button" onclick="joinConfirm()">회원가입</button>
					<button class="btn btn-lg btn-primary"  style="background-color: #660099;" type="reset" onclick="location.href='/'">취소</button>
				</div>				
			</form>
		</div>
	</section>
</main>



<%@include file="../includes/footer.jsp"%>