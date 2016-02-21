package edu.cqupt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.cqupt.exception.CquptException;
import edu.cqupt.mapper.UserMapper;
import edu.cqupt.po.user.User;
import edu.cqupt.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	public <T> User findUserByProperties(T prop) {

		User user = new User();
		if (prop instanceof Integer) {
			user.setUid((Integer) prop);
		}

		if (prop instanceof String) {
			String temp = (String) prop;
			if (temp.matches("\\w+@\\w+\\.\\w+")) {
				user.setEmail(temp);
			} else if (temp.length() == 64) {
				user.setCode(temp);
			} else {
				user.setUsername(temp);
			}
		}

		return userMapper.findUserByProperties(user);
	}

	public void addUser(User form) {
		userMapper.addUser(form);

	}

	public void updateState(User user) {
		userMapper.updateState(user);

	}

	public void deleteUser(Integer uid) {
		userMapper.deleteUser(uid);
	}

	public User login(User form) throws CquptException {
		User user = userMapper.findUserByProperties(form);
		if (user == null) {
			throw new CquptException("该用户没有注册");
		} else if (!user.getPassword().equals(form.getPassword())) {
			throw new CquptException("密码错误");
		}
		if (user.getState() != 1) {
			throw new CquptException("该用户还没有激活，请到邮箱激活");
		}
		return user;
	}

	public List<User> findAllUser() {
		return userMapper.findAllUser();

	}

}
