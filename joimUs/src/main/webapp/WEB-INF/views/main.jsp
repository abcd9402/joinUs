<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../views/includes/header.jsp"%>



<div
	style="background: url(/resources/image/images/Joinus.png) no-repeat right/cover">
	<div class="container">
		<div class="row align-items-center vh-50 py-8">
			<div
				class="col-xl-5 col-lg-6 mr-auto py-2 text-light order-2 text-center text-lg-left">
				<h1 class="mb-0 display-4 font-weight-bold">다함께 JoinUS!</h1>
				<p class="lead mb-3 font-weight-bold"></p>
				<a class="btn btn-outline-light btn-lg mr-2" href="/user/login">시작하기</a>



			</div>
	<% if(session.getAttribute("user") != null){%>
			<section style="position: absolute; right: 80px; /">
				<div class="text-center mb-5">
					<form class="form-signin " id="formId"
						action="/login/ok" method="post">
						<div class="mb-3">
							<div class="form-group row">
								<div class="col-sm-7">
									<img src="${user.userImage}"
										style="width: 150px; height: 150px; left: 50px; margin-left: 1px;" />
								</div>
								<div class="col-sm-5 pl-4" style="float: right;">

									<h1 class="h4 mt-3 font-weight-normal color-light text-light">${user.userId}님
									</h1>

									<button class="btn btn-sm btn-primary btn-block mt-3"
										id="sendMailBtn" type="button" onclick="logout()">매치목록</button>
									<button class="btn btn-sm btn-primary btn-block mt-3"
										id="sendMailBtn" type="button" onclick="logout()">정보수정</button>
								</div>
							</div>
							<div class="form-group row">
								<button class="btn btn-ls btn-primary btn-block"
									id="sendMailBtn" type="button" onclick="logout()">로그아웃</button>
							</div>
						</div>
					</form>
				</div>
			</section>
		<%} %>
		</div>

	</div>

</div>

<main>
	<section class="container">
		<h1 class="text-center font-weight-bold">다함께 JoinUs</h1>
		<hr style="width:100px;" class="mt-4">
		<div class="row pt-3">
			<div class="col-12 my-auto">
				<div class="row text-center">
					
				</div>
			</div>
		</div>
	</section>



<!-- 배너  -->
	<div class="container mt-3 mb-1 ml-0 mr-0 " style="padding-left:450px;">
		<div id="carouselExampleIndicators" class="carousel slide " data-ride="carousel" data-interval="3000">
			<ol class="carousel-indicators">
				<c:forEach items="${bannerImg }" var="b" varStatus="status">
				<li data-target="#carouselExampleIndicators" data-slide-to="${status.index}" class="${status.index == 0 ? 'active' : ''}"></li>
				</c:forEach>
			</ol>
			<div class="carousel-inner ">
				<c:forEach items="${bannerImg }" var="b" varStatus="status">
				<div class="carousel-item ${status.index == 0 ? 'active' : ''} ">
					<a href="${b.bannerURL }" target="_blank" onclick="veiwConunt(${b.bannerNum})"><img src="${b.bannerImagine }" class="d-block w-100 h-1"></a>
				</div>
				</c:forEach>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
</Section>

<%@include file="../views/includes/footer.jsp"%>