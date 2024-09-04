package co.jyy.project.service;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;



import co.jyy.project.DAO.UserDAO;
import co.jyy.project.VO.AddressVO;
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


	@Override
	public UserVO idCheck(String userId) {
		
		return UDao.idCheck(userId);
	}


	@Override
	public void insertUser(UserVO uVO) {
		
		UDao.insertUser(uVO);
	}


	@Override
	public void insertAddress(AddressVO aVO) {
	
		UDao.insertAddress(aVO);
	}


	@Override
	public UserVO findId(String name, String mail) {
		 UserVO uVO;
		 uVO =UDao.findId(name,mail);
		return uVO;
	}


	@Override
	public UserVO sendMail(String userId, String name, String mail) {
		 UserVO uVO;
		 uVO =UDao.sendMail(userId,name,mail);
		return uVO;
	}


	@Override
	public UserVO login(String userId, String password) {
		 UserVO uVO;
		 uVO =UDao.login(userId,password);
		return uVO;
	}
	
	
}
