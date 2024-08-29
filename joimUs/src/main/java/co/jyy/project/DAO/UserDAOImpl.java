package co.jyy.project.DAO;

import org.springframework.stereotype.Repository;



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
	
	
	
	

}
