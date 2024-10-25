<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/theme.css" />
<link rel="stylesheet" href="/resources/css/template2.css" />
<link rel="shortcut icon" href="#">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<!-- 함수 파일 -->
<script src="/resources/js/login.js"></script>
<script src="/resources/js/chat.js"></script>
<title>Joins</title>


 <!--0827 제이쿼리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
$(document).ready(function(){
	initHeader('${user.userId}');
});
</script>

<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark" style="background-color: #660099;">
	<div class="container">
		<a class="navbar-brand mr-1 mb-1 mt-0" href="/"><img src="/resources/image/images/logo.png" height="36"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse justify-content-center" id="collapsingNavbar">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link font-weight-bold" href="/board/list">매치목록</a></li>
				<c:if test="${user.userId eq null}" >
				<div class="ml-3"><a href="/login" class="btn btn-light">로그인</a></div>
				</c:if>
				<c:if test="${user.userId ne null}">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img class="rounded-circle ml-3 mr-1" width="30" src="${user.userImage}" style="margin-top:-9px">
						<span class="font-weight-bold">${user.userId }님</span>
					</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDd">
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item px-2" onclick="logout()"><i class="bi bi-box-arrow-right"></i> 로그아웃</a>
					</div>
				</li>
				<li>
					<a class="nav-link text-white" href="#" id="navbarText" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="bi bi-chat-dots" onclick="chatList('${user.userId}')" id="chatIcon"></i>
					</a>
				</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>