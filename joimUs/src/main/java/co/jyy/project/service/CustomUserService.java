package co.jyy.project.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import co.jyy.project.DAO.UserDAO;
import co.jyy.project.VO.CustomUser;
import co.jyy.project.VO.UserVO;

@Service
public class CustomUserService implements UserDetailsService {
	
	@Autowired
	UserDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String memberid) throws UsernameNotFoundException {
		
		
		
		System.out.println("loadUserByUsername");
		UserVO dto = dao.idCheck(memberid);
		System.out.println(dto+"loadUserByUsername");
		if(dto == null) {
			throw new UsernameNotFoundException("Invalid User");
		}
		
		System.out.println("유저 : " + dto);
		 
		
		CustomUser user = new CustomUser(dto);

		System.out.println(user.toString());

		return user;
	}

}
