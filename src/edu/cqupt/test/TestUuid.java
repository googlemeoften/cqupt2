package edu.cqupt.test;

import java.io.File;

import org.junit.Test;

import edu.cqupt.utils.UUIDUtils;

public class TestUuid {
	
	@Test
	public void testUUID(){
		System.out.println(UUIDUtils.uuid());
	}
	@Test
	public void path(){
		 String path = Thread.currentThread().getContextClassLoader()
                 .getResource("").getPath();
		 System.out.println(path);
	}
	
	@Test
	public void testTheIndex(){
		String str="projectImage/ecfcd165c3f6476e9b7fcc7217bdfda9.jpg";
		System.out.println(theIndex(str, "/"));
	}
	
	
	
	@Test
	public void deleteFile(){
		
		
		File file=new File("F://","a.txt");
		System.out.println(file.exists());;
		String s="D:\\tomcat\\webapps\\dave_spring2\\newsContent\\";
		String s2="/ca37ff8ff8ef4dc1a31ddbb7df1f2cea.txt";
		File f3=new File(s,s2);
		System.out.println(f3.exists());;
		f3.delete();
	}
	
	
	private String theIndex(String str, String mark) {

		int index = str.lastIndexOf(mark);
		return str.substring(index + 1);
	}
}
