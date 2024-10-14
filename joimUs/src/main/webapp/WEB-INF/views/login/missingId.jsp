<!-- 240821 아이디 찾기 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

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


<main>
    <section class="container" style="padding-bottom:200px; ">

      <div class="text-center mb-5">
        <form class="form-signin border shadow" action="/user/findId" method="post">
          <h1 class="h3 mb-3 font-weight-normal">아이디 찾기</h1>

          <div class="mb-3">
            <label for="inputname" class="sr-only">이름</label>
            <input type="text" id="userName" class="form-control" placeholder="이름" name="userName" required autofocus>
          </div>
          
          <div class="mb-3">
            <label for="inputemail" class="sr-only">이메일</label>
            <input type="email" id="mail" class="form-control" placeholder="이메일" name="mail" required>
          </div>          
			
          <button class="btn btn-lg btn-primary btn-block" type="button" style="background-color: #660099;" onclick="findId(userName.value, mail.value)" >ID 찾기</button>
       </form>
      </div>
    </section>

  </main>

  
<%@include file="../includes/footer.jsp"%>