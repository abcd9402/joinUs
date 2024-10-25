package co.jyy.project.VO;

import java.util.List;

import co.jyy.project.security.UserinfoAuth;
import lombok.Data;

@Data
public class UserVO {
	private String userId;
	private String password;
	private String name;
	private String gender;
	private String mail;
	private String userImage;
	
	
	private int addressNumber; 
	private String address; 
	private String addressDetail;
	
	private List<UserinfoAuth> securityAuthList;
	private String enabled;

}
