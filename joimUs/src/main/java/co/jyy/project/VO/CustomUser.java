package co.jyy.project.VO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import co.jyy.project.security.UserinfoAuth;
import lombok.Data;
import lombok.Getter;

@Data
public class CustomUser implements UserDetails, Serializable {

    private static final long serialVersionUID = 174726374856727L;

    private String userId;
    private String userName;
    private String password;
    private String enabled;
    private String userImage;
	// 인증된 사용자의 권한 정보가 저장될 필드
	private List<GrantedAuthority> userinfoAuthList;
	
	// 기존에 사용중인 Userinfo 객체의 값을 현재 클래스의 필드에 저장
	public CustomUser(UserVO userinfo) {
		System.out.println("customUser");
		System.out.println(userinfo);
		this.userId = userinfo.getUserId();
		this.userName = userinfo.getUserId();
	    this.password = userinfo.getPassword();
	    this.enabled = userinfo.getEnabled();
	    this.userImage = userinfo.getUserImage();
	    
		//사용자의 권한을 GrantedAuthority 객체로 생성하여 저장
//		this.userinfoAuthList= new ArrayList<GrantedAuthority>();  
//		
//		for (UserinfoAuth auth : userinfo.getSecurityAuthList()) {  
//			userinfoAuthList.add(new SimpleGrantedAuthority(auth.getAuth()));
//		}
		
	}
	   // 인증된 사용자의 권한 정보를 반환
	   @Override  
	   public Collection<? extends GrantedAuthority> getAuthorities() {  
//	      return userinfoAuthList;
		    List<GrantedAuthority> authorities = new ArrayList();
		    authorities.add(new SimpleGrantedAuthority(this.getUserId()));
		    return authorities;
	   }

	   // 인증된 사용자의 비밀번호를 반환
	   @Override  
	   public String getPassword() { 
	      return password;
	   }

	   // 인증된 사용자의 아이디를 반환
	   @Override  
	   public String getUsername() {  
	      return userId;
	   }
	   
	   
	   

	   // 인증 사용자의 계정 유효 기간 정보를 반환
	   // false: 기간 만료 
	   @Override  
	   public boolean isAccountNonExpired() {  
	      return true;
	   }

	   // 인증 사용자의 계정 잠금 상태를 반환
	   // false: 잠금 상태
	   @Override  
	   public boolean isAccountNonLocked() {  
	      return true;
	   }

	   // 인증 사용자의 비밀번호 유효 기간 상태를 반환
	   // false: 기간 만료
	   @Override
	   public boolean isCredentialsNonExpired() {  
	      return true;
	   }

	   // 인증 사용자의 활성화 상태를 반환
	   // false: 비활성화 상태
	   // enabled.equals("1") 의 값은 개인이 설정한 값으로 커스터마이징해주세요.
	   @Override
	   public boolean isEnabled() { 
		   if (enabled.equals("1")) {
				return false;
			} else {
				return true;
			}
	   }
	
}