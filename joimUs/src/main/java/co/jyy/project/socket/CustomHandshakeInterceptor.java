package co.jyy.project.socket;



import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import co.jyy.project.VO.UserVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomHandshakeInterceptor implements HandshakeInterceptor {
    
	 

	    @Override
	    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
	                                   WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
	        // ServerHttpRequest를 ServletServerHttpRequest로 캐스팅하여 HttpSession을 가져옵니다.
          log.info("beforeHandshake");
//	        if (request instanceof ServletServerHttpRequest) {
//	            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
//	            HttpSession session = servletRequest.getServletRequest().getSession(false); // HttpSession 가져오기
//
//	            if (session != null) {
//	                // HttpSession에서 SecurityContext 가져오기
//	                SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
//
//	                if (securityContext != null) {
//	                    Authentication authentication = securityContext.getAuthentication();
//	                    if (authentication != null && authentication.isAuthenticated()) {
//	                        // WebSocketSession의 attributes에 인증 정보 저장
//	                        attributes.put("auth", authentication);
//	                        log.info("Before Handshake - Authentication 저장됨: " + authentication.getName());
//	                        log.info("Before Handshake - Authentication 저장됨: " + authentication);
//	                    } else {
//	                        log.warn("인증 정보가 없습니다.");
//	                    }
//	                } else {
//	                    log.warn("SecurityContext가 HttpSession에서 null입니다.");
//	                }
//	            } else {
//	                log.warn("HttpSession이 없습니다.");
//	            }
//	        }
//	        
//	        if (request instanceof ServletServerHttpRequest) {
//	            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
//	            HttpSession session = servletRequest.getServletRequest().getSession(false);
//
//	            if (session != null) {
//	                log.info("HttpSession ID: " + session.getId());
//	                log.info("HttpSession ID: " + session.getAttribute("user"));
//	            } else {
//	                log.warn("HttpSession이 없습니다.");
//	            }
//	        }
//	        return true;
//          
//      }
          if (request instanceof ServletServerHttpRequest) {
              ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
              HttpSession session = servletRequest.getServletRequest().getSession(false); // HttpSession 가져오기

              if (session != null) {
                  // HttpSession에서 SecurityContext 가져오기
                  SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");

                  if (securityContext != null) {
                      Authentication authentication = securityContext.getAuthentication();
                      if (authentication != null && authentication.isAuthenticated()) {
                          // WebSocketSession의 attributes에 인증 정보 저장
                          attributes.put("auth", authentication);
                          log.info("Before Handshake - Authentication 저장됨: " + authentication.getName());
                          log.info("Before Handshake - Authentication 저장됨: " + authentication);
                      } else {
                          log.warn("인증 정보가 없습니다.");
                      }
                  } else {
                      log.warn("SecurityContext가 HttpSession에서 null입니다.");
                  }
              } else {
                  log.warn("HttpSession이 없습니다.");
              }
          }

          return true; // 핸드셰이크 진행
      }

      // HttpSession을 가져오는 유틸리티 메소드
      private HttpSession getSession(ServerHttpRequest request) {
          // HttpServletRequest로 변환
          HttpServletRequest servletRequest = ((ServletServerHttpRequest) request).getServletRequest();
          return servletRequest.getSession(false); // false는 세션이 없을 경우 null 반환
          
	    }

	    @Override
	    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
	                               WebSocketHandler wsHandler, Exception ex) {
	        log.info("After Handshake 호출됨");
	    }
	}