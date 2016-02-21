package edu.cqupt.test.reflect;

import org.junit.Test;

import edu.cqupt.po.user.User;

public class TestClass {

	@Test
	public void testClass() throws ClassNotFoundException, InstantiationException, IllegalAccessException{
		Class clazz=Class.forName("edu.cqupt.po.user.User");
		User user=(User) clazz.newInstance();
		user.setUsername("dave");
		System.out.println(user.getUsername());
	}
	
}
