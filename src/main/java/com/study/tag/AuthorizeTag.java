package com.study.tag;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.study.dao.ResourcesDao;
import com.study.model.Resources;
import com.study.service.ResourcesService;
import com.study.util.SpringWiredBean;
/**
 * 自定义标签  用于前台判断按钮权限 
 * @author A
 *
 */
public class AuthorizeTag extends BodyTagSupport {
	private static final long serialVersionUID = 1L;  
	
	private String buttonUrl;  
	
    public String getButtonUrl() {
		return buttonUrl;
	}


	public void setButtonUrl(String buttonUrl) {
		this.buttonUrl = buttonUrl;
	}


	@Override  
    public int doStartTag() {  
		
		
		System.out.println("=============================================="+buttonUrl);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request
				.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		String name = securityContextImpl.getAuthentication().getName();
		System.out.println("+++++++++++++++++++++++++++++++"+name);
		ResourcesService resourcesService= (ResourcesService) SpringWiredBean.getInstance().getBeanById("resourcesService");
		List<Resources> resourcesList = resourcesService.loadMenu(name,null);
		System.out.println(resourcesList+"=-=-=-=");
		
        // 如果URL不空就显示URL，否则就不显  
        if (null != buttonUrl && !"".equals(buttonUrl)) {  
            return EVAL_BODY_INCLUDE;  
        }  
        return this.SKIP_BODY;  
    }  
}
