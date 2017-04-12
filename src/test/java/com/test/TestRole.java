package com.test;

import org.junit.Test;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;



public class TestRole extends SpringTestCase {
	
	@Test
	public void testPassword(){
		Md5PasswordEncoder md5=new Md5PasswordEncoder();
		System.out.println(md5.encodePassword("admin", null));
	}
	
}
