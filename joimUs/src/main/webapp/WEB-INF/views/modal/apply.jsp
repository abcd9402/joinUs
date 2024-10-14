<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/Board.js"></script>
</head>
<body>
<div class="modal fade" id="applyMo" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="detail-title"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="modalClose(applyMo)" >
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				
				<div class="border mb-3" id="map-detail" style="width:100%;height:200px;">
					<img  id="detailimage" src="" style="cursor:pointer; width:100%;height:200px;" >
				</div>
				<div><span class="badge badge-pill badge-primary mr-2"  style="width:80px; background-color: #660099;">개설자</span><span id="detail-id"></span></div>
				<div><span class="badge badge-pill badge-primary mr-2"  style="width:80px; background-color: #660099;">날 짜</span><span  id="detail-date"></span></div>
				<div><span class="badge badge-pill badge-primary mr-2"  style="width:80px; background-color: #660099;">시 간</span><span id="detail-time"></span></div>
				<div class="d-flex">
					<div class="mr-2"><span class="badge badge-pill badge-primary"  style="width:80px; background-color: #660099;">내 용</span></div>
					<div id="detail-content"></div>
				</div>

				<form id="myform" name="myform">
			        <input type="hidden" id="boardNum" name="boardNum" value="">
			        <input type="hidden" name="applyId" id="applyId" value="${user.userId}">
			        <input type="hidden" name="boardTitle" id="boardTitle" value="">
			        <input type="hidden" name="userId" id="userId" value="">
			        
				
					<div class="form-group mb-0">
						<label for="NOTICE_MSG_Content" class="col-form-label">신청내용</label>
						<input type="text" class="form-control" id="applyContent" name="applyContent">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btn-block" style="background-color: #660099;" onclick="sendMatch()">신청하기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>