package com.study.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class WebProjectConfigInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	/** 
	 *  加载驱动应用后端的中间层和数据层组件
	 */
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[]{RootConfig.class};
	}
	/** 指定配置类
	 *  加载包含web组件的bean,如控制机器、视图解析器以及映射处理器
	 */
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[]{WebConfig.class};
	}

	//将DispatcherServlet 映射到“/”
	@Override
	protected String[] getServletMappings() {
		 return new String[] { "/" }; 
	}
	
	
}
