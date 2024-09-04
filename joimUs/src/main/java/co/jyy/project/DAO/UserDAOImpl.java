package co.jyy.project.DAO;

import org.springframework.stereotype.Repository;

import co.jyy.project.VO.AddressVO;
import co.jyy.project.VO.UserVO;
import co.jyy.project.mapper.UserMapper;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserDAOImpl  implements UserDAO{
	
	private final UserMapper UMapper;

	@Override
	public UserVO User_Test() {
		return UMapper.User_Test();
	}

	@Override
	public UserVO idCheck(String userId) {
		
		UserVO uVO;	
		try {
			uVO = UMapper.idCheck(userId);
		} catch (NullPointerException e) {
			System.out.println("nulllll");
			uVO=null;
		}
		return uVO;
	}

	@Override
	public void insertUser(UserVO uVO) {
		
		UMapper.insertUser(uVO);
		
	}

	@Override
	public void insertAddress(AddressVO aVO) {
		
		UMapper.insertAddress(aVO);
	}

	@Override
	public UserVO findId(String param1, String param2) {
		
//		UserVO uVO;
//		System.out.println("doa: "+param1+param2);
//		uVO = UMapper.findId(param1, param2);
		
		UserVO uVO;
		System.out.println("doa: "+param1+param2);
		try {
			uVO = UMapper.findId(param1, param2);	
		}catch(NullPointerException e) {
			uVO=null;
		}
		
		
		
		return uVO;
		
		
	}

	@Override
	public UserVO sendMail(String userId, String name, String mail) {
		UserVO uVO;
		try {
			uVO = UMapper.sendMail(userId, name,mail);	
		}catch(NullPointerException e) {
			uVO=null;
		}
		return uVO;
	}

	@Override
	public UserVO login(String userId, String password) {
		UserVO uVO;
		try {
			uVO = UMapper.login(userId,password);	
		}catch(NullPointerException e) {
			uVO=null;
		}
		return uVO;
	}
	
	
	
	

}
