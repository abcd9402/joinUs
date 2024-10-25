package co.jyy.project.controller;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.jyy.project.VO.ChatRoomVO;
import co.jyy.project.VO.ChatVO;
import co.jyy.project.VO.CustomUser;
import co.jyy.project.VO.UserVO;
import co.jyy.project.service.ChatService;
import co.jyy.project.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class ChatController {
	
	private final ChatService cService;

	@GetMapping("/chatt")
	public String chat(Model model,HttpSession session) {
		
	    		
		log.info("!!!!!!!!!!!!");
		UserVO uVO = (UserVO)session.getAttribute("user");
		if (uVO != null) {
	        CustomUser customUser = new CustomUser(uVO);
	        UsernamePasswordAuthenticationToken authentication =
	                new UsernamePasswordAuthenticationToken(customUser, null, customUser.getAuthorities());

	        // SecurityContextHolder에 인증 정보 설정
	        SecurityContextHolder.getContext().setAuthentication(authentication);
	        // HttpSession에 SecurityContext 저장
	        session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
	        System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
	        log.info("SecurityContextHolder에 인증 정보 설정됨: " + authentication.getName());
	        log.info("HttpSession에 저장된 SecurityContext: " + session.getAttribute("SPRING_SECURITY_CONTEXT"));
	    } else {
	        log.warn("세션에 사용자 정보가 없습니다.");
	    }
		
		CustomUser Customs = new CustomUser(uVO);
		
		UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(Customs, null, Customs.getAuthorities());

        // SecurityContextHolder에 인증 정보 설정
        SecurityContextHolder.getContext().setAuthentication(authentication);
		System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		CustomUser user =  new CustomUser(uVO);
		System.out.println("User: "+user);
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUsername());
		
		model.addAttribute("userid", user.getUsername());
		
		return "chat";
	}
	
	//안읽은 채팅 있는지 확인
	@GetMapping("/chatYN")
	@ResponseBody
	public String chatYN(Model model,HttpSession session,HttpServletRequest request) {
		
		System.out.println("chatYN");
		String id = request.getParameter("id");
		System.out.println(id);
		List<ChatVO> cVO = cService.readYN(id);
		int num = 0;
		
		if(cVO == null) {
			return "N";
		}else {
			
			for(ChatVO cvo2: cVO) {
				System.out.println(cvo2);
				if(cvo2.getSender().equals(id)  && cvo2.getReadYN().equals("R") ) {
					num++;
					
				}else if(!cvo2.getSender().equals(id)   && cvo2.getReadYN().equals("N")) {
					num++;
					
				}
			}
			System.out.println(num);
			if(num != 0) {
				return "Y";
			}else {
				return "N";
			}
		}
		
	}
	
	
	@GetMapping("/chatList")
	public String chatList(Model model,HttpSession session,HttpServletRequest request) {
		System.out.println("chatList");
		System.out.println(request.getParameter("id"));
		String id = request.getParameter("id");
		
		
		List<ChatRoomVO> chatRoomVO = cService.chatList(id);
		if(chatRoomVO == null) {
			System.out.println("null");
		}else {
			
			System.out.println(chatRoomVO);
			model.addAttribute("list",chatRoomVO);
		}
		UserVO UVO =(UserVO)session.getAttribute("user");
		session.setAttribute("user", UVO);
		
		return "chatList";
	}
	
	
	@ResponseBody
	@GetMapping("/chatRoomInsert")
	public String chatRoomInsert(Model model,HttpSession session,HttpServletRequest request) {
		
		String sender = request.getParameter("sender");
		String reciever = request.getParameter("reciever");
		System.out.println(sender+": "+reciever);
		ChatRoomVO chatRoomVO = new ChatRoomVO();
		chatRoomVO.setRecipient(reciever);
		chatRoomVO.setSender(sender);
		chatRoomVO.setMessage("채팅을 시작합니다.");
		System.out.println(chatRoomVO);
		cService.chatRoomInsert(chatRoomVO);
		
		
		return "success";
	}
	
	/* @PostMapping("/chatRoomIn") */
	@ResponseBody
	@RequestMapping(value="/chatRoomIn", method=RequestMethod.POST , produces = "application/json; charset=UTF-8")
	public String chatRoomIn(Model model,HttpSession session,HttpServletRequest request) throws Exception {
		System.out.println("chatRoomIn");
		
		int num = Integer.valueOf(request.getParameter("num"));
		String id = request.getParameter("id");
		System.out.println("num: "+num);
		int i = 0;
		
		List<ChatVO> CVO = cService.chatCommentList(num);
			for(ChatVO cvo2 : CVO) {
				i++;
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				System.out.println(cvo2.getCreateDate());
				cvo2.setDate(format.format(cvo2.getCreateDate()));
				if(CVO.size() == i ) {
					cvo2.setSessionId(id);
					cService.readUpdate(cvo2);
					ChatVO lastCVO = cvo2;
					System.out.println("last: "+lastCVO);
					model.addAttribute("lastCVO", lastCVO);
				}
			}
	
		
		ObjectMapper mapper = new ObjectMapper();
        String resultJson = mapper.writeValueAsString(CVO);
        
        
        UserVO uVO = (UserVO)session.getAttribute("user");
        
        if (uVO != null) {
	        CustomUser customUser = new CustomUser(uVO);
	        UsernamePasswordAuthenticationToken authentication =
	                new UsernamePasswordAuthenticationToken(customUser, null, customUser.getAuthorities());

	        // SecurityContextHolder에 인증 정보 설정
	        SecurityContextHolder.getContext().setAuthentication(authentication);
	        // HttpSession에 SecurityContext 저장
	        session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
	        
	        log.info("SecurityContextHolder에 인증 정보 설정됨: " + authentication.getName());
	        log.info("HttpSession에 저장된 SecurityContext: " + session.getAttribute("SPRING_SECURITY_CONTEXT"));
	    } else {
	        log.warn("세션에 사용자 정보가 없습니다.");
	    }
		
		
		return resultJson;
		
	}
	
	@ResponseBody
	@GetMapping("/sendMessage")
	public String sendMessage(Model model,HttpSession session,HttpServletRequest request) {
		
		System.out.println("sendMessage");
		UserVO uvo = (UserVO)session.getAttribute("user");
		
		ChatVO CVO = new ChatVO();
		CVO.setChatRoomNum( Integer.valueOf(request.getParameter("chatRoomNum")));
		CVO.setUserImage(request.getParameter("userImage"));
		if(uvo.getUserId().equals(request.getParameter("sender"))) {
			CVO.setRecipient(request.getParameter("recipient"));
			CVO.setSender(request.getParameter("sender"));
		}else {
			CVO.setRecipient(request.getParameter("sender"));
			CVO.setSender(request.getParameter("recipient"));	
		}
		CVO.setSelfImage(request.getParameter("selfImage"));
		CVO.setSessionId(request.getParameter("sessionId"));
		CVO.setMessage(request.getParameter("message"));
		System.out.println("CVO!!!!: "+CVO);
		
		cService.insertChat(CVO);
		
		
		return "success";
	}
	
	
	
	
}