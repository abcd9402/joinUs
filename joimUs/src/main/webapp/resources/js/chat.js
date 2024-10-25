/**
 * 241023  chat폴더 파일 관련 js
 */


function initHeader(id){
	console.log('initHeader');
	
	
	
	$.ajax({
		url : "/chatYN",
		type : "GET",
		data : {"id":id,
			},
		success: function(data){
		if(data == "Y"){
			console.log("Y");
			document.getElementById('navbarText').style.animation = 'blink 1s infinite';
		}else{
			console.log("N");
			document.getElementById('navbarText').style.animation = 'none';
		}
			
		}
		});
}

function chatList(id){
	console.log('chatList: '+id);
	
	
	$.ajax({
		url : "/chatList",
		type : "GET",
		data : {"id":id,
			},
		success: function(data){
			
			var popUrl = "../chatList?id="+id;

		    window.open(popUrl, "_blank", "width=500, height=500");
		    
		}
		});
}



function openChatList(){
	console.log("openChatList");
	var reciever = myform.userId.value;
	var sender = myform.applyId.value;
	
	
	$.ajax({
		url : "/chatRoomInsert",
		type : "GET",
		data : {
			"sender" : sender,
			"reciever" : reciever,
		},
		success: function(data){
			console.log(data);
			if(data == "success"){
				var popUrl = "../chatList?id="+sender;

			    window.open(popUrl, "_blank", "width=500, height=500");
			    $('#applyEnd').modal('hide');
			}
					
		}
	});
	
}


function openChatRoom(num,id){
	console.log("openChatRoom: "+num);
	console.log("openChatRoom: "+id);
	const uImage = document.getElementById('uImage').value;
	var image;
	console.log("openChatRoom: "+uImage);
	$.ajax({
		url : "/chatRoomIn",
		type : "POST",
		data : {
			"num" : num,
			"id" : id,
		},
		success: function(data){
			console.log(data);
			if(data != ""){
				const chatBody = document.querySelector('#inner');
				chatBody.innerHTML='';
				data.forEach(apply => {
					if(id == apply.sender){
						
						chatBody.innerHTML+= `<div class="item mymsg">
										                <div class="box">
								                    <p class="msg">` + apply.message + `</p>
								                    <span class="time">` + apply.date + `</span>
								                </div>
								            </div>`;
					}else{
						if(uImage == apply.selfImage){
							image = apply.userImage;
						}else{
							image = apply.selfImage;
						}

						chatBody.innerHTML+=`<div class="item">
						                    	<img src="` + 
						                    		image
						                    	 + `" alt="User Avatar" class="img-circle" style="" height="50" width="50"/>
								                <div class="box">
								                    <p class="msg">` + apply.message + `</p>
								                    <span class="time">` + apply.date + `</span>
								                </div>
								            </div>`
					}
					document.querySelector('#self').value=apply.selfImage;
					document.querySelector('#uuu').value=apply.userImage;
					document.querySelector('#newDate').value=apply.date;
				});
				document.querySelector('#firstSender').value=data[0].sender;
				document.querySelector('#firstSelfImage').value=data[0].selfImage;
				document.querySelector('#firstChatRoomNum').value=data[0].chatRoomNum;
				document.querySelector('#firstRecipient').value=data[0].recipient;
				document.querySelector('#firstUserImage').value=data[0].userImage;
				document.querySelector('#firstSessionId').value=data[0].sessionId;
				$('#chatBoard').modal('show');
			}
					
		}
	});
	
	
	
}


function mouseOver(num){
	
	  const element = document.getElementById('chat'+num);
	  element.style.backgroundColor = '#dee2e6';
}

function mouseOut(num){
	
	  const element = document.getElementById('chat'+num);
	  element.style.backgroundColor = 'white';

}



function buttonActive(){
	
	const button = document.getElementById('sendButton');
	const message = document.getElementById('mymsg');
	
	if(message.value == ''){
		
		$("#sendButton").attr("disabled", true);	
		button.style.backgroundColor = '#dee2e6';
		
	}else{
		$("#sendButton").attr("disabled", false);
		button.style.backgroundColor = '#fff176';
	}
	
	
}