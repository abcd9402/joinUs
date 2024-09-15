<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/Board.js"></script>
</head>
<body>
<!-- 매칭 삭제modal-->
<div class="modal fade" id="modalDel" tabindex="-1" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" >매칭 삭제</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#modalDel').modal('hide');">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="boardDelPop" name="boardDelPop" >
					<input type="hidden1" id="boardNum" class="num" name="boardNum" />
					<div class="text-center">
						<div class="form-check form-check-inline">
							삭제 하시겠습니까?
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="boardDel(boardNum.value)">삭제</button>
				<button onclick="$('#modalDel').modal('hide');" class="btn btn-primary">취소</button>
			</div>
		</div>
	</div>
</div>


</body>
</html>