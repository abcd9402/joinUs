package co.jyy.project.DAO;

import co.jyy.project.VO.AddressVO;
import co.jyy.project.VO.UserVO;

public interface UserDAO {

	
	public UserVO User_Test();
	
	public UserVO idCheck(String userId);
	
	public void insertUser(UserVO uVO);
	
	public void insertAddress(AddressVO aVO);
	
	public UserVO findId(String name,String mail);
	
	public UserVO sendMail(String userId,String name,String mail);
	
	public UserVO login(String userId,String password);
	
	public AddressVO userAddress(UserVO UVO);
}
