package com.bdqn.zmj.dao;

import java.util.List;

import com.bdqn.zmj.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	
	//全查询
	List<User> selectAll(@Param("userId") String userId, @Param("userName") String userName);


	List<User> getList(@Param("start") int start, @Param("limit") int limit, @Param("userId") String userId, @Param("userName") String userName);

}
