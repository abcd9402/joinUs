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
	public UserVO findId(String userId) {
		try {
			UserVO uVO;	
			uVO = UMapper.findId(userId);
			return uVO;
		} catch (Exception e) {
			System.out.println("nulllll");
			UserVO uVO=null;
			return uVO;
		}
		
		
		
					
		
	}

	@Override
	public void insertUser(UserVO uVO) {
		
		UMapper.insertUser(uVO);
		
	}

	@Override
	public void insertAddress(AddressVO aVO) {
		
		UMapper.insertAddress(aVO);
	}
	
	
	
	

}
