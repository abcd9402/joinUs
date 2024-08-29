package co.jyy.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import co.jyy.project.VO.UserVO;
import co.jyy.project.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {

	private final UserService UService;
	
	
	@GetMapping("/join")
	public String join() {
		System.out.println("컨트롤");
		UserVO UVO = UService.User_Test();
		
		System.out.println(UVO);
		
		return "/join";
		
		
	}
}
