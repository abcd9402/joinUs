package co.jyy.project.mapper;

import co.jyy.project.VO.AddressVO;
import co.jyy.project.VO.UserVO;

public interface UserMapper {

	
	public UserVO User_Test();  
	
	public UserVO findId(String userId);
	
	public void insertUser(UserVO uVO);
	
	public void insertAddress(AddressVO aVO);
}
