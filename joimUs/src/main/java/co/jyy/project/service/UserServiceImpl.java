package co.jyy.project.service;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;



import co.jyy.project.DAO.UserDAO;
import co.jyy.project.VO.UserVO;
import lombok.RequiredArgsConstructor;

@Repository
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final UserDAO UDao;
	
	
	@Override
	public UserVO User_Test() {

		
		return UDao.User_Test();
	}
	
	
}
