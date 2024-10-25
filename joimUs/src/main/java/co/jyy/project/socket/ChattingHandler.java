package co.jyy.project.socket;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import co.jyy.project.VO.UserVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class ChattingHandler extends TextWebSocketHandler{

	/*
	 * private List<WebSocketSession> sessionList = new
	 * ArrayList<WebSocketSession>();
	 */
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionEstablished");
//	    // WebSocketSession에서 Authentication 가져오기
//        Authentication auth = (Authentication) session.getAttributes().get("auth");
//        log.info("WebSocketSession에 저장된 auth: " + auth);
//
//	    if (auth != null) {
//	        UserDetails userDetails = (UserDetails) auth.getPrincipal();
//	        log.info(userDetails.getUsername() + "님이 입장하셨습니다.");
//	    } else {
//	        log.warn("WebSocketSession에 인증 정보가 없습니다.");
//	    }
//        log.info(auth);
//        if (auth != null) {
//            UserDetails userDetails = (UserDetails) auth.getPrincipal();
//            log.info(userDetails.getUsername() + "님이 입장하셨습니다.");
//        }
//		sessionList.add(session); 
//		log.info(session+"/bbbbbbbbbbbbbbbbbbbbbbb");
//		log.info(session.getPrincipal()+"/bbbbbbbbbbbbbbbbbbbbbbb");
//		log.info(session.getAttributes());
//		log.info(session.getAttributes().get("user"));
//		UserVO uVO = (UserVO)session.getAttributes().get("user");
//		log.info(uVO.getUserId());
//
//		log.info(sessionList);
//		log.info("aaaaaaaaaaaaaaaaaaaaaa");
//		
////		log.info(session.getPrincipal().getName() + "님이 입장하셨습니다.");
//		log.info(uVO.getUserId() + "님이 입장하셨습니다.");
//	}
	    // WebSocketSession에서 Authentication 가져오기
	    Authentication auth = (Authentication) session.getAttributes().get("auth");
	    log.info("WebSocketSession에 저장된 auth: " + auth);

	    if (auth != null) {
	        // Principal을 WebSocketSession에 설정
	        session.getAttributes().put("principal", auth.getPrincipal());
	        
	        UserDetails userDetails = (UserDetails) auth.getPrincipal();
	        log.info(userDetails.getUsername() + "님이 입장하셨습니다.");
	    } else {
	        log.warn("WebSocketSession에 인증 정보가 없습니다.");
	    }

	    sessionList.add(session);
	    log.info(session);
	    log.info(session.getAttributes());
	    
	    // Principal을 사용하여 메시지를 전송
	    UserVO uVO = (UserVO) session.getAttributes().get("user");
	    log.info(uVO.getUserId() + "님이 입장하셨습니다.");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log.info("#ChattingHandler, handleMessage");
//		UserVO uVO = (UserVO)session.getAttributes().get("user");
//		/* log.info(session.getId() + ": " + message); */
//		 log.info(uVO.getUserId() + ": " + message); 
//		
//		/*
//		 * for(WebSocketSession s : sessionList) { s.sendMessage(new
//		 * TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
//		 * }
//		 */
//		 for(WebSocketSession s : sessionList) {
//				s.sendMessage(new TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
//			}
		  try {
		        // 메시지 처리 로직
			// Principal 가져오기
			    UserDetails userDetails = (UserDetails) session.getAttributes().get("principal");
			    if (userDetails != null) {
			        log.info(userDetails.getUsername() + ": " + message);
			        
			        for (WebSocketSession s : sessionList) {
			            s.sendMessage(new TextMessage(userDetails.getUsername() + ":" + message.getPayload()));
			        }
			    } else {
			        log.warn("Principal이 없습니다.");
			    }
		    } catch (Exception e) {
		        // 예외 로깅
		        System.out.println(e);
		        // 클라이언트에게 에러 메시지 전송 (선택 사항)
		        session.sendMessage(new TextMessage("Error processing your message"));
		    }
//	}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionClosed");
		UserVO uVO = (UserVO)session.getAttributes().get("user");
//		log.info(session.getPrincipal().getName() + "님이 퇴장하셨습니다.");
		log.info(uVO.getUserId() + "님이 퇴장하셨습니다.");
		sessionList.remove(session);
		
//		log.info(session.getPrincipal().getName() + "님이 퇴장하셨습니다.");
		log.info(uVO.getUserId() + "님이 퇴장하셨습니다.");
	}
}
