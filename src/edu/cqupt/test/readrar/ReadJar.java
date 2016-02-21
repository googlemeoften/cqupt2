package edu.cqupt.test.readrar;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.JarURLConnection;
import java.net.URL;
import java.util.Enumeration;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;


public class ReadJar {

	public static void main(String[] args) throws Exception {
		String baseDirName = "F://";
		try {
			// 判断目录是否存在
			File baseDir = new File(baseDirName);
			if (!baseDir.exists() || !baseDir.isDirectory()) {
				System.out.println("文件查找失败：" + baseDirName + "不是一个目录！");
			} else {
				String[] filelist = baseDir.list();

				for (int i = 0; i < filelist.length; i++) {
					if (filelist[i].contains("test.jar")) {// 查找含有你的txt的jar包
						JarFile localJarFile = new JarFile(new File(baseDirName
								+ File.separator + filelist[i]));
						Enumeration<JarEntry> entries = localJarFile.entries();

						while (entries.hasMoreElements()) {
							JarEntry jarEntry = entries.nextElement();
							String entryName = jarEntry.getName();
							System.out.println(entryName);
							if (jarEntry.isDirectory()) {
								System.out.println(jarEntry.getName());
							} else if (entryName.endsWith(".java")) {

								InputStream is = testUri(entryName);
								BufferedReader br = new BufferedReader(
										new InputStreamReader(is));

								String con = null;
								while ((con = br.readLine()) != null) {
									System.out.println(con);
								}
							}
						}
					}
				}
			}

		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

	}

	public static InputStream testUri(String name) throws Exception {
		URL url = new URL("jar:file:F:/test.jar!/" + name);
		JarURLConnection jarConnection = (JarURLConnection) url
				.openConnection();
		InputStream in = jarConnection.getInputStream();// ("!/META-INF/MANIFEST.MF"));
		return in;
	}
}
