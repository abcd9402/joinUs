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
						<input class="form-control" type="password" value="${user.user_pw}"name="user_pw" id="pw">
					</div>
				</div>
			
				<div class="form-group row">
					<label class="col-md-2 col-form-label form-control-label text-muted">이름</label>
					<div class="col-md-5">
						<input class="form-control" type="text" value="${user.user_name}" name="user_name" readonly="readonly">
					</div>
				</div>
			
				<div class="form-group row">
					<label class="col-md-2 col-form-label form-control-label text-muted">이메일</label>
					<div class="col-md-5">
						<input class="form-control" type="text" value="${user.user_email}" name="user_email">
					</div>
				</div>
			
				<div class="form-group row">
					<label class="col-md-2 col-form-label form-control-label text-muted">전화번호</label>
					<div class="col-md-5">
						<input class="form-control" type="text" value="${user.user_phonenum}" name="user_phonenum">
					</div>
				</div>
			
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">주소</label>
					<div class="col-md-5">
						<input type="text" class="form-control" id="Address" name="user_address" readonly="readonly" value="${user.user_address}"><!-- hidden -->
					</div>
				</div>
				
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">운동장 주소</label>
					<input class="form-control" type="hidden" id="sample7_postcode" name="add"placeholder="우편번호입력" readonly="readonly">
					<div class="col-sm-5">
						<input class="form-control" type="text" id="sample7_address" name="add" value="${user.user_sport_address}" placeholder="주소" readonly="readonly">
					</div>
					<button type="button" class="btn btn-outline-primary" onclick="sample7_execDaumPostcode()">우편번호 찾기</button>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"> </label>
					<div class="col-sm-5">
						<input class="form-control" type="text" id="sample7_detailAddress" name="addDetail" value="${user.user_sport_detailaddress}" placeholder="상세주소" onkeyup="adr()">
					</div>

					<div class="col-sm-4">
						<input class="form-control" type="text" id="sample7_extraAddress" name="" value="${user.user_sport_extraaddress}" placeholder="참고 항목" readonly="readonly"> 
					</div>
					<input type="hidden" class="" id="Sport_Address" name="user_sport_address" readonly="readonly" value="${user.user_sport_address}"><!-- hidden -->
				</div>

				<div id="getmap"></div>
				<input type="hidden" id="longitude" name="user_sport_address_x" value="${user.user_sport_address_x}">
				<input type="hidden" id="Latitude" name="user_sport_address_y" value="${user.user_sport_address_y}">
				<!-- 
				<div class="form-group row">
				<label class="col-md-2 col-form-label form-control-label text-muted">필요 시 더 추가하세용 ~</label>
					<div class="col-md-5">
						<input class="form-control" type="text" value="필요 시 더 추가하세용" name="phone">
					</div>
				</div>
				-->
				
				
				</form>
			</div>
		</div>
	</section>
</main>

<script type="text/javascript" src="/resources/js/user.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec5badb6965bce310ca0bfdda8280394&libraries=services"></script>

<%@include file="../includes/footer.jsp"%>