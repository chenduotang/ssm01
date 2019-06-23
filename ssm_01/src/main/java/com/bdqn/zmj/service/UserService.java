package com.bdqn.zmj.service;

import java.util.List;

import com.bdqn.zmj.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bdqn.zmj.dao.UserMapper;
import com.bdqn.zmj.entity.User;

@Service
public class UserService {
	
	@Autowired
	UserMapper mapper;

	public Page<User> list(int page,int limit,String userId,String userName){
		//计算起始索引
		int start = limit*(page-1);
		List<User> list = mapper.getList(start, limit, userId, userName);

		//封装分页数据
		Page<User> p = new Page<>();
		p.setMsg("数据请求成功!");
		p.setCount(mapper.selectAll(userId,userName).size());
		p.setData(list);
		return p;
	}
}
