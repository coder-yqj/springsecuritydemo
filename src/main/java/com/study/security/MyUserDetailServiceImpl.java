package com.study.security;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.study.model.Role;
import com.study.model.User;
import com.study.service.UserService;

@Component("myUserDetailService")
public class MyUserDetailServiceImpl implements UserDetailsService{

	@Resource
	private UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		System.out.println("用户username:"+username);
		User user = userService.FindUserWithRolesByName(username);
		System.out.println("user:"+user);
		if(user ==null)
            throw new UsernameNotFoundException(username+" not exist!");  
		Set<GrantedAuthority> authSet = new HashSet<GrantedAuthority>();
		Set<Role> roles = user.getRoles();
		for (Role role : roles) {
			authSet.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleKey()));
		}
		return new org.springframework.security.core.userdetails.User(user.getUsername(), 
				user.getPassword(), 
				user.getEnable()==1?true:false, 
				true, 
				true,
				true,
				authSet);
	}

}
