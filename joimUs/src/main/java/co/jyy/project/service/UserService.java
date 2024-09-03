package co.jyy.project.service;

import org.springframework.stereotype.Service;

import co.jyy.project.VO.AddressVO;
import co.jyy.project.VO.UserVO;

@Service
public interface UserService {
	
	
	//test
	public UserVO User_Test();

	//유저 id 가져오기
	public UserVO findId(String userId);
	
	//유저 회원가입
	public void insertUser(UserVO uVO);
	
	//주소 정보 삽입
	public void insertAddress(AddressVO aVO);
}
