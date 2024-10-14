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

<div class="modal fade" id="registModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">등록하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="modalClose(registModal)">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form name="boardReg" id="boardReg">
					<input type="hidden" name="userId" value="${user.userId}">
					<input type="hidden" name="boardStatus" value="create">
				<%--<input type="hidden" name="board_Sport_Playground" value="${user.user_sport_detailaddress}">
					<input type="hidden" name="board_Sport_Address_X" value="${user.user_sport_address_x}">
					<input type="hidden" name="board_Sport_Address_Y" value="${user.user_sport_address_y}">
					<input type="hidden" name="board_Sport_Address_IMG" value="${user.user_sport_address_img}"> --%>
					<input type="hidden" name="addressX" id="addressX" value="">
					<input type="hidden" name="addressY" id="addressY" value="">
					<div class="form-group mb-1" id="placeArea" style="display:none">
						<label class="col-form-label">장소</label>
						<div class="font-weight-bold">
						<div class="w-50 pl-1" style="display:none" id="moviePlace">
								<select name="movieSelect"  class="form-control" id="movieSelect" onchange="confirmPlace(movieSelect.value)">
									<option value="">장소 선택</option>
									<option value="건대">건대 롯데시네마</option>
									<option value="왕십리">왕십리 CGV</option>
									<option value="용산">용산 CGV</option>
									<option value="강변">강변 CGV</option>
								</select>
							</div>
							
							<div class="w-50 pl-1" style="display:none" id="musicalPlace">
								<select name="musicalSelect" class="form-control"  id="musicalSelect" onchange="confirmPlace(musicalSelect.value)">
									<option value="">장소 선택</option>
									<option value="해오름">해오름 극장</option>
									<option value="광림아트센터">광림아트 센터</option>
									<option value="두산아트센터">두산아트센터</option>
									<option value="블루스퀘어">블루스퀘어</option>
								</select>
							</div>
							
							<div class="w-50 pl-1" style="display:none" id="concertPlace">
								<select name="concertSelect" class="form-control"  id="concertSelect" onchange="confirmPlace(concertSelect.value)">
									<option value="">장소 선택</option>
									<option value="LG아트센터">LG아트센터</option>
									<option value="우리금융아트홀">우리금융아트홀</option>
									<option value="워커힐">쉐라톤그랜드워커힐</option>
								</select>
							</div>
						
						</div>
					</div>
					<div class="border mb-0" id="mapreg" style="width:100%;height:200px; display:none">
						<img src="" id="imageArea" style="width:100%;height:200px;" />
					</div>
					<div class="d-flex">
						<div class="form-group mb-0 w-50 pr-1">
							<label for="boardCategory" class="col-form-label">유형</label>
							<select name="boardCategory" id="boardCategory" class="form-control" onchange="showPlace(boardCategory.value)">
								<option value="">유형선택</option>
								<option value="movie">영화</option>
								<option value="musical">뮤지컬</option>
								<option value="concert">콘서트</option>
							</select>
						</div>
						
					</div>
					<div class="form-group mb-0">
						<label for="board_ReservationDate" class="col-form-label">시간</label>
						<div class="d-flex">
							<div class="w-50 pr-1"><input type="date" class="form-control" name="reservationDate" id="reservationDate"></div>
							<div class="w-50 pl-1">
								<select name="reservationTime" class="form-control">
									<option value="">시간 선택</option>
									<option value="8">8시</option>
									<option value="9">9시</option>
									<option value="10">10시</option>
									<option value="11">11시</option>
									<option value="12">12시</option>
									<option value="13">13시</option>
									<option value="14">14시</option>
									<option value="15">15시</option>
									<option value="16">16시</option>
									<option value="17">17시</option>
									<option value="18">18시</option>
									<option value="19">19시</option>
									<option value="20">20시</option>
									<option value="21">21시</option>
								</select>
							</div>
						</div>
					</div>

					<div class="form-group mb-0">
						<label for="board_Title" class="col-form-label">제목</label>
						<input type="text" class="form-control" name="boardTitle" id="boardTitle">
					</div>
					<div class="form-group mb-0">
						<label for="board_Content" class="col-form-label">내용</label>
						<textarea class="form-control" name="boardContent" id="boardContent"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btn-block" onclick="regMatch()" style="background-color: #660099;">등록하기</button>
			</div>
		</div>
	</div>
</div>


</body>
</html>