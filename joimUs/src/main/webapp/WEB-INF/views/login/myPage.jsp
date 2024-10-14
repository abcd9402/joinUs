<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<main>
	<section class="container">
		<div class="row mb-4">
			<div class="col-9">
				<h2 class="mb-3"><i class="bi bi-list-stars"></i> 회원정보</h2>
				<hr>
				<form id="updateform" action="/user/updatesuccess" method="post">
				<div class="form-group row">
					<label class="col-md-2 col-form-label form-control-label text-muted">아이디</label>
					<div class="col-md-5">
						<input class="form-control" type="text" value="${user.userId}" name="user_id" id="id" readonly="readonly">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-md-2 col-form-label form-control-label text-muted">비밀번호</label>
					<div class="col-md-5">
						<input class="form-control" type="password" value=""name="user_pw" id="pw">
					</div>
				</div>
			
				<div class="form-group row">
					<label class="col-md-2 col-form-label form-control-label text-muted">이름</label>
					<div class="col-md-5">
						<input class="form-control" type="text" value="${user.name}" name="user_name" readonly="readonly">
					</div>
				</div>
			
				<div class="form-group row">
					<label class="col-md-2 col-form-label form-control-label text-muted">이메일</label>
					<div class="col-md-5">
						<input class="form-control" type="text" value="${user.mail}" name="user_email">
					</div>
				</div>
			
				<div class="form-group row">
					<label class="col-md-2 col-form-label form-control-label text-muted">성별</label>
					<div class="col-md-5">
						<input class="form-control" type="text" value="${user.gender}" name="user_phonenum"readonly="readonly">
					</div>
				</div>
			
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">주소</label>
					<div class="col-md-5">
						<input type="text" class="form-control" id="Address" name="user_address" readonly="readonly" value="${user.addressNumber}"><!-- hidden -->
					</div>
				</div>
				
				<div class="form-group row">

					
					
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"> </label>
					<div class="col-sm-5">
						<input class="form-control" type="text" id="sample7_detailAddress" name="" value="${user.address}" placeholder="상세주소" onkeyup="adr()"readonly="readonly">
					</div>

					<div class="col-sm-4">
						<input class="form-control" type="text" id="sample7_extraAddress" name="" value="${user.addressDetail}" placeholder="참고 항목" readonly="readonly"> 
					</div>
					
				</div>


				 
				<!-- <div class="form-group row">
				<label class="col-md-2 col-form-label form-control-label text-muted">필요 시 더 추가하세용 ~</label>
					<div class="col-md-5">
						<input class="form-control" type="text" value="필요 시 더 추가하세용" name="phone">
					</div>
				</div> -->
				<div class="form-group row">
				</div>
					<div class="text-center">
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='/'">회원정보수정</button>
						<button type="reset" class="btn btn-outline-secondary">취소</button>
					</div>
				
				
				</form>
			</div>
		</div>
	</section>
</main>

<script type="text/javascript" src="/resources/js/user.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec5badb6965bce310ca0bfdda8280394&libraries=services"></script>

<%@include file="../includes/footer.jsp"%>