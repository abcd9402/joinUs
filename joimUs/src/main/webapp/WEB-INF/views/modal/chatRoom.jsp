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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<link rel="stylesheet" href="/resources/css/chatRoom.css" />

<script src="/resources/js/chat.js"></script>
</head>
<body>
<!-- 매칭 삭제modal-->
<!-- <div class="modal fade" id="chatBoard" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" >유저아이디</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#chatBoard').modal('hide');">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="chat_wrap">
			        <div class="inner">
			            
			           	<div class="item">
			                <div class="box">
			                    <p class="msg">안녕하세요</p>
			                    <span class="time">오전 10:05</span>
			                </div>
			            </div>
			
			            <div class="item mymsg">
			                <div class="box">
			                    <p class="msg">안녕하세요</p>
			                    <span class="time">오전 10:05</span>
			                </div>
			            </div> 
			           
			        </div>
			
			        <input type="text" class="mymsg" id="mymsg" placeholder="메시지 입력" onkeyup="buttonActive()" ><input id="sendButton" type="button" value="전송" disabled/>
			        <input type="text" class="yourmsg" placeholder="내용 입력">
			    </div>
				<div class="chat_wrap">
				    <div class="inner">
				        <div class="item">
				            <div class="box">
				                <img src="/resources/image/user/20240912055934151.png" alt="User Avatar" class="img-circle" style="margin-right:15px;" height="50" width="50"/>
				                <p class="msg">안녕하세요</p>
				                <span class="time">오전 10:05</span>
				            </div>
				        </div>
				        <div class="item mymsg">
				            <div class="box">
				                <p class="msg">안녕하세요</p>
				                <span class="time">오전 10:05</span>
				            </div>
				        </div>
				    </div>
				</div>
					<input type="text" class="mymsg" id="mymsg" placeholder="메시지 입력" onkeyup="buttonActive()" ><input id="sendButton" type="button" value="전송" disabled/>
		        	<input type="text" class="yourmsg" placeholder="내용 입력">			        
			    </div>
			</div>
		</div>
	</div>
 -->

<!-- 모달 HTML -->
<div class="modal" id="chatBoard" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">채팅</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 여기 모달 내용 -->
                <div class="chat_wrap">
                    <div class="inner" id="inner">
                        <div class="item">
                        	<img src="/resources/image/user/20240912055934151.png" alt="User Avatar" class="img-circle" style="" height="50" width="50"/>
			                <div class="box">
			                    <p class="msg">안녕하세요</p>
			                    <span class="time">오전 10:05</span>
			                </div>
			            </div>
			            <div class="item mymsg">
			                <div class="box">
			                    <p class="msg">안녕하세요</p>
			                    <span class="time">오전 10:05</span>
			                </div>
			            </div> 
                    </div>
                    <input type="text" class="mymsg" id="mymsg" placeholder="메시지 입력" onkeyup="buttonActive()" ><input id="sendButton" type="button" value="전송" disabled/>
                    <div class="container">
						<div class="col-6">
							
						</div>
						<div>
							<div id="msgArea" class="col">
							
							</div>
							<div class="col-6">
							<div class="input-group mb-3">
								<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
								<div class="input-group-append">
									
								</div>
							</div>
							</div>
						</div>
						<div class="col-6">
						</div>
					</div>
                </div>
            </div>
            <input type="hidden" value="${user.userImage}" id="uImage"/>
            <input type="hidden" value="" id="self"/>
            <input type="hidden" value="" id="uuu"/>
            <input type="hidden" value="" id="newDate"/>
            <input type="hidden" id="firstChatRoomNum"/>
            <input type="hidden" id="firstRecipient"/>
            <input type="hidden" id="firstSelfImage"/>
            <input type="hidden" id="firstSender" />
            <input type="hidden" id="firstUserImage"/>
            <input type="hidden" id="firstSessionId"/>
        </div>
    </div>
</div>








<script type="text/javascript">

//전송 버튼 누르는 이벤트
$("#sendButton").on("click", function(e) {
	var sender = document.querySelector('#firstSender').value
	var selfImage = document.querySelector('#firstSelfImage').value
	var chatRoomNum = document.querySelector('#firstChatRoomNum').value
	var recipient = document.querySelector('#firstRecipient').value
	var userImage = document.querySelector('#firstUserImage').value
	var sessionId = document.querySelector('#firstSessionId').value
	var message = document.querySelector('#mymsg').value
	$.ajax({
		url : "/sendMessage",
		type : "GET",
		data : {
			"sender":sender,
			"selfImage":selfImage,
			"chatRoomNum":chatRoomNum,
			"recipient":recipient,
			"userImage":userImage,
			"sessionId":sessionId,
			"message":message,
			},
		success: function(data){
			sendMessage();
			$('#mymsg').val('')		
			
		}
		});
	
	$('#inner').scrollTop($('#inner')[0].scrollHeight);
	$("#sendButton").attr("disabled", true);	
});

var sock = new SockJS('http://localhost:8080/chat');

sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

function sendMessage() {
	sock.send($("#mymsg").val());
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	
	var arr = data.split(":");
	
	for(var i=0; i<arr.length; i++){
		console.log('arr[' + i + ']: ' + arr[i]);
	}
	
/* 	var cur_session = '${userid}'; //현재 세션에 로그인 한 사람 */
	var cur_session = '${user.userId}'; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	var image;
	const uImage = document.getElementById('uImage').value;
	var self = document.getElementById('self').value;
	var uuu = document.getElementById('uuu').value;
	var newDate = document.getElementById('newDate').value;
	sessionId = arr[0];
	message = arr[1];
	console.log("sessionId : " + sessionId);
    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if(sessionId == cur_session){
		
		
		
		/* var str = "<div class='col-6'>";
		str += "<div class='alert alert-secondary'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
		 */
		
		const chatBody = document.querySelector('#inner');
		var stri = "<div class='item mymsg'>";
		stri += "<div class='box'>";
		stri += "<p class='msg'>" + message + "</p>";
		stri += "<span class='time'>" + newDate + "</span>";
		stri += "</div></div>";

		chatBody.innerHTML += stri;
		
	}
	else{
		if(uImage == self){
			image = uuu;
		}else{
			image = self;
		}
		
		/* var str = "<div class='col-6'>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str); */
		
		const chatBody = document.querySelector('#inner');
		var stri = "<div class='item'>";
		stri += "<img src='"  
    		+ image +
       	  "' alt='User Avatar' class='img-circle' height='50' width='50'/>";
		stri += "<div class='box'>";
		stri += "<p class='msg'>" + message + "</p>";
		stri += "<span class='time'>" + newDate + "</span>";
		stri += "</div></div>";

		chatBody.innerHTML += stri;
	}
	
	$('#inner').scrollTop($('#inner')[0].scrollHeight);
}
//채팅창에서 나갔을 때
function onClose(evt) {
	
	/* var user = '${pr.username}'; */
	/* var user = '${user.userId}';
	var str = user + " 님이 퇴장하셨습니다.";
	
	$("#msgArea").append(str); */
}
//채팅창에 들어왔을 때
function onOpen(evt) {
	
/* 	var user = '${pr.username}'; */
	/* var user = '${user.userId}';
	var str = user + "님이 입장하셨습니다.";
	
	$("#msgArea").append(str); */
}

</script>
</body>
</html>