package edu.cqupt.utils;

import java.util.UUID;

public class UUIDUtils {
	public static String uuid(){
		String str=UUID.randomUUID().toString();
		str=str.replace("-", "");
		return str;
	}
}
