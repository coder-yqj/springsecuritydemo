package com.study.security;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Component;



@Component
public class MyFilterSecurityInterceptor extends AbstractSecurityInterceptor implements Filter {
	@Autowired
	private MySecurityMetadataSource securityMetadataSource;
	@Autowired
	private MyAccessDecisionManager accessDecisionManager;
// 	@Resource(name="myAuthenticationManager")
//    private AuthenticationManager authenticationManager;  
	
	@Resource
	private AuthenticationConfiguration authenticationConfiguration;
	
//	@Autowired
//	public void setAuthenticationConfiguration(AuthenticationConfiguration authenticationConfiguration) {
//	     this.authenticationConfiguration = authenticationConfiguration;
//	}
	
	@PostConstruct
	public void init() throws Exception{
		super.setAccessDecisionManager(accessDecisionManager);
		super.setAuthenticationManager(authenticationConfiguration.getAuthenticationManager());   
	}
	
	@Override
	public SecurityMetadataSource obtainSecurityMetadataSource() {
		return this.securityMetadataSource;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		FilterInvocation fi = new FilterInvocation(request, response, chain);
		invoke(fi);
	}
	
	private void invoke(FilterInvocation fi) throws IOException, ServletException {
		// object为FilterInvocation对象
                  //super.beforeInvocation(fi);源码
		//1.获取请求资源的权限
		//执行Collection<ConfigAttribute> attributes = SecurityMetadataSource.getAttributes(object);
		//2.是否拥有权限
		//this.accessDecisionManager.decide(authenticated, object, attributes);
//		System.err.println(" ---------------  MySecurityFilter invoke--------------- ");
		InterceptorStatusToken token = super.beforeInvocation(fi);
		try {
			fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		} finally {
			super.afterInvocation(token, null);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
	}
	
	public void destroy() {
		
	}

	@Override
	public Class<? extends Object> getSecureObjectClass() {
		//下面的MyAccessDecisionManager的supports方面必须放回true,否则会提醒类型错误
		return FilterInvocation.class;
	}
}