package edu.cqupt.service;

import java.util.List;

import edu.cqupt.exception.CquptException;
import edu.cqupt.po.user.User;

/**
 * 
 * <p>Description:用户业务层</p>
 * @author dave
 * @date 2015-9-3
 */
public interface UserService {
	//通过用户名进行查找
	public <T> User findUserByProperties(T prop);
	//添加用户
	public void addUser(User form);
	//激活用户
	public void updateState(User user);
	//删除用户
	public void deleteUser(Integer uid);
	
	public User login(User form) throws CquptException;
	
	public List<User> findAllUser();
}
