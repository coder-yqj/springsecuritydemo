package com.study.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
/**
 * 配置Delegating-FilterProxy
 * 继承AbstractSecurityWebApplicationInitializer会自动注册DelegatingFilterProxy
 * 等价于xml配置
 * <filter>
		<filter-name>springSecurityFilterChain</filter-name>
		<filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
	</filter>
 * 
 *
 */
public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer{
}
