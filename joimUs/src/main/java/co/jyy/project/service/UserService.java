package co.jyy.project.service;

import org.springframework.stereotype.Service;

import co.jyy.project.VO.AddressVO;
import co.jyy.project.VO.UserVO;

@Service
public interface UserService {
	
	
	//test
	public UserVO User_Test();

	//유저 id 중복 확인
	public UserVO idCheck(String userId);
	
	//유저 회원가입
	public void insertUser(UserVO uVO);
	
	//주소 정보 삽입
	public void insertAddress(AddressVO aVO);
	
	
	//아이디 찾기
	public UserVO findId(String name,String mail);
	
	//인증번호 메일 보내기
	public UserVO sendMail(String userId,String name,String mail);
	
	//로그인
	public UserVO login(String userId,String password);
	
	
	public AddressVO userAddress(UserVO UVO);
}
