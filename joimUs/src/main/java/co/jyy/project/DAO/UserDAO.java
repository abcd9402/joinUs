package co.jyy.project.DAO;

import co.jyy.project.VO.AddressVO;
import co.jyy.project.VO.UserVO;

public interface UserDAO {

	
	public UserVO User_Test();
	
	public UserVO findId(String userId);
	
	public void insertUser(UserVO uVO);
	
	public void insertAddress(AddressVO aVO);
}
