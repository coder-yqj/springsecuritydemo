package com.study.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.dao.RoleDao;
import com.study.dao.UserDao;
import com.study.model.Role;
import com.study.model.RoleResources;
import com.study.model.URole;
import com.study.model.User;
import com.study.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
	
	@Resource
	private RoleDao roleDao;
	@Resource
	private UserDao userDao;
	
	@Override
	public PageInfo<Role> selectByPage(Role role,int start, int length) {
		int page = start/length+1;  
		//分页查询
        PageHelper.startPage(page, length);
        List<Role> rolelist = roleDao.queryAll(role);
        return new PageInfo<>(rolelist);
	}

	@Override
	public List<URole> queryRoleListWithUser(Integer id) {
		return roleDao.queryRoleListWithUser(id);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
	public void saveRoleResources(RoleResources roleResources) {
		String roleId = roleResources.getRoleId();
		String resourcesIds = roleResources.getResourcesId();
		//先删除
		roleDao.deleteRoleResources(Integer.valueOf(roleId));
		//添加
		if(!StringUtils.isEmpty(resourcesIds)){
			String[] resourcesIdArray = resourcesIds.split(",");
			for (String resourcesId : resourcesIdArray) {
				roleResources.setResourcesId(resourcesId);
				roleDao.addRoleResources(roleResources);
			}
		}
	}

	@Override
	public void addRole(Role role) {
		roleDao.addEntity(role);
	}

	@Override
	public void delRole(Integer id) {
		roleDao.deleteEntity(id);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
	public void testTransactional(){
		User user = new User();
		user.setId(3);
		user.setUsername("user2");
		user.setPassword(new Md5PasswordEncoder().encodePassword("user2", null));
		userDao.editEntity(user);
		int i=1/0;
		Role role = new Role();
		role.setId(4);
		role.setRoleDesc("测试角色");
		roleDao.editEntity(role);
	}
	
}
