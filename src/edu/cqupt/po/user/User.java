package edu.cqupt.po.user;

/**
 * 
 * <p>
 * Description:用户
 * </p>
 * 
 * @author dave
 * @date 2015-9-3
 */
public class User {
	private Integer uid;// 用户id
	private String username;// 用户姓名
	private String password;// 用户密码
	private String email;// 邮箱
	private String code;// 激活码
	private Integer state;// 激活状态

	public User() {
		super();
	}

	public User(Integer uid, String username, String password, String email,
			String code, Integer state) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.code = code;
		this.state = state;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", email=" + email + ", code=" + code + ", state="
				+ state + "]";
	}

}
