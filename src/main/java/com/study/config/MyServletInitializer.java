package com.study.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.filter.CharacterEncodingFilter;

public class MyServletInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		FilterRegistration.Dynamic characterEncoding=servletContext.addFilter("characterEncoding", CharacterEncodingFilter.class);  
        characterEncoding.setInitParameter("forceEncoding", "true");  
        characterEncoding.setInitParameter("encoding", "UTF-8");  
        characterEncoding.addMappingForUrlPatterns(null, true, "/*");  
        
        servletContext.addListener(RequestContextListener.class);
        
	}

}
