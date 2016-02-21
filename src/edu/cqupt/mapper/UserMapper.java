package edu.cqupt.mapper;

import java.util.List;

import edu.cqupt.po.user.User;

public interface UserMapper {
	//通过用户名进行查找
	public User findUserByProperties(User user);
	//添加用户
	public void addUser(User form);
	//激活用户
	public void updateState(User user);
	//删除用户
	public void deleteUser(Integer uid);
	//查询所有用户
	public List<User> findAllUser();
}
