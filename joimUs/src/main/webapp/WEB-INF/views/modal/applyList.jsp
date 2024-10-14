<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/Board.js"></script>
</head>
<body>
<div class="modal fade" id="applyListModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">신청리스트</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="modalClose(applyListModal)">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table class="table table-hover table-bordered" id="table">
					<thead>
						<tr class="table-primary text-center">
							<th style="width: 60px; background-color: #660099;">번호</th>
							<th style="width: 80px; background-color: #660099;">신청자</th>
							<th style="background-color: #660099;">내용</th>
							<th style="width: 130px; background-color: #660099;">처리하기</th>
						</tr>
					</thead>
						<tbody>
						<tr class="odd gradeX text-center">
						
						</tr>
						
						</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-primary btn-block" onclick="regMatch()">등록하기</button> -->
			</div>
		</div>
	</div>
</div>

</body>
</html>