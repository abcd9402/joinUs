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

<div class="modal fade" id="applyIn" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header"  style="background-color:#bad5e4;">
				<h5 class="modal-title" >지원자 정보</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="modalClose(applyIn)">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- <section style="position: absolute; right: 80px; /"> -->
					<div class="text-center mb-5">
						
							<div class="mb-3">
								<div class="form-group row">
									<div class="col-sm-5">
										<img src=""
											 id="applyImg" style="width: 250px; height: 250px; left: 10px; margin-left: 1px;  " />
									</div>
									<div class="col-sm-5 ml-5" style="float:right;">
										<h1 id="apId" class="h4 mt-3 font-weight-normal" style="float:left;"></h1>
										<h1 id="apGender" class="h4 mt-3 font-weight-normal" style="float:left;"></h1>
										<h1 id="apAd" class="h4 mt-3 font-weight-normal" style="float:left;"></h1>
										<h1 id="apMail" class="h4 mt-3 font-weight-normal" style="float:left; "></h1>
										
	
										
									</div>
								</div>
								
								<div class="form-group row"></div>
							
							</div>
						
					</div>
				<!-- </section> -->
			<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-block" onclick="modalClose(applyIn)">닫기</button>
			</div>
		</div>
	</div>
</div>
</div>


</body>
</html>