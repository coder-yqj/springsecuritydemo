package com.study.tag;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

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


	@SuppressWarnings("static-access")
	@Override  
    public int doStartTag() {  
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request
				.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		//获取当前登录名
		String name = securityContextImpl.getAuthentication().getName();
		
		//如果数据库里有该链接，并且该用户的权限拥有该链接，则显示 。如果数据库没有该链接则不显示
		ResourcesService resourcesService= (ResourcesService) SpringWiredBean.getInstance().getBeanById("resourcesService");
		List<Resources> queryAll = resourcesService.queryAll();
		boolean flag = true;
		for (Resources resources : queryAll) {
			if(resources.getResUrl().equals(buttonUrl))
				flag = false;
		}
        if(flag) //数据库中没有该链接，直接显示
        	return EVAL_BODY_INCLUDE;
        else{
        	Resources resources = new Resources();
        	resources.setUsername(name);
        	resources.setResUrl(buttonUrl);
        	List<Resources> resourcesList = resourcesService.loadMenu(resources);
        	if(resourcesList.size()>0)	return EVAL_BODY_INCLUDE;//数据库中有该链接，并且该用户拥有该角色，显示
        }
		return this.SKIP_BODY;  //不显示
    }  
}
