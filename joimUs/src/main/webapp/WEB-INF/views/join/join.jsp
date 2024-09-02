<!--  240825 회원가입 페이지  -->

<%-- <!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <!--0827 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
    <!--0826 다음 우편주소 api-->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link href="/resources/css/Join.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
    <title>Document</title>
</head>
<body>
    <div class="joinWrapper" >
        <h2>회원가입</h2>
        <form method="post" action="login.html" id="joinForm">
            <input type="text" name="id" placeholder="ID"/>
            <input type="password" name="pass" placeholder="비밀번호" onkeyup="passCheck(pass.value, passConfirm.value)"/>
            <input type="password" name="passConfirm" placeholder="비밀번호 확인" onkeyup="passCheck(pass.value, passConfirm.value)"/>
            <div id="passCheck" hidden>
                * 비밀번호가 일치하지 않습니다.
            </div>
            <input type="text" name="name" placeholder="성함" />
            남자<input type="radio" name="gender" value="M" checked>
			여자<input type="radio" name="gender" value="W" >
            <input type="text" name="emailFront"  id="emailFront" placeholder="이메일" onchange="combineEmail()" />@
            <input type="text" name="emailBack" id="emailBack" />
            <input type="hidden1" name="email"id="email" />
            <select name="selectValue" onchange="selectEmail(selectValue.value)">
                <option value="" selected >선택</option>
                <option value="naver.com">네이버</option>
                <option value="daum.net">다음</option>
                <option value="nate.com">네이트</option>
            </select>
            <input type="text" name="addressNum" id="addressNum" placeholder="우편 주소" />
            <button type="button" onclick="addressFind()">주소 찾기</button>
            <input type="text" name="addressOrigin" id="addressOrigin" placeholder="기본 주소" />
            <input type="text" name="addressAdd" id="addressAdd" placeholder="상세 주소" />
            <label id="imgArea">
                이미지
                <input type="file" name="img" id="img" accept='image/*' onchange="previewImg(event)" hidden/>
            </label>
            <div id="previewImg"><img id="profileImage" src="/resources/image/user/base.jpg"></div>
            <input type="submit" value="회원가입"><button>취소</button>
            
        </form>

    </div>


    
<!--     <script type="text/javascript" src="../../js/Join.js"></script> -->
	<script src="/resources/js/Join.js"></script>
</body>
</html>
 --%>





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

<!-- <link href="/resources/css/Join.css" rel="stylesheet"> -->


<main>
	<section class="container">
		<div class="text-center mb-5" >
			<form class="form-join border shadow" action="/user/success" method="post" >
				<!-- <img class="mb-4" src="/resources/images/logo.png" height="72"> -->
				<h1 class="h3 mb-3 font-weight-normal" style="COLOR:#4174D9;">회원가입</h1>
				<div class="form-group row" style="position:relative;">
					<label for="staticEmail" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-4">
						<input class="form-control" type="text" id="id" name="user_id" value="" placeholder="ID입력">
					</div>

					<button type="button" class="btn btn-outline-primary" id="idChk" onclick="return idchk()">중복확인</button>
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
						<input class="form-control" type="password"  name="pass"  id="pass" value="" placeholder="pw입력" onkeyup="passCheck(pass.value, passConfirm.value)">
						<div class="text-left text-danger pt-1" id="chkPW"></div>
					</div>
					
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label" style="font-size:14px;" >비밀번호확인</label>
					<div class="col-sm-6">
						<input class="form-control" type="password"  id="passConfirm" name="passConfirm" value="" placeholder="pw확인" onkeyup="passCheck(pass.value, passConfirm.value)">
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
						<input class="form-control" type="text" id="name" name="user_name" value="" placeholder="이름">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">성별</label>
					<div class="col-sm-3">
						<select class="form-control" id="gender" name="user_gender">
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
					<input type="hidden" id="email" name="user_email"><!-- hidden -->
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-3">
						<input class="form-control" type="text" id="sample6_postcode" name="addressNumber" value="" placeholder="우편번호입력" readonly="readonly">
					</div>
					<button type="button" class="btn btn-outline-primary" onclick="addressFind()">우편번호 찾기</button>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"> </label>
					<div class="col-sm-5">
						<input class="form-control" type="text" id="sample6_address" name="address" value="" placeholder="주소" readonly="readonly">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"> </label>
					<div class="col-sm-5">
						<input class="form-control" type="text" id="sample6_detailAddress" name="addressDetail" value="" placeholder="상세주소" onkeyup="adr()">
					</div>

					<div class="col-sm-4">
						<input class="form-control" type="text" id="sample6_extraAddress" name="" value="" placeholder="참고 항목" readonly="readonly"> 
					</div>
					<input type="hidden" class="" id="Address" name="user_address" readonly="readonly"><!-- hidden -->
				</div>
				
				
				<div class="row" id="playground-wrap" style="display:none;">
				
					<div class="col-sm-2"></div>
					<div class="col-sm-5">
						<div id="getmap"></div>
					</div>
					
				</div>
				
				<div class="text-center mt-3">
					<button class="btn btn-lg btn-primary" type="submit" onclick="return checks()">회원가입</button>
					<button class="btn btn-lg btn-primary" type="reset">취소</button>
				</div>				
			</form>
		</div>
	</section>
</main>>