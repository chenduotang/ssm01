package com.bdqn.zmj.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bdqn.zmj.entity.User;
import com.bdqn.zmj.service.UserService;
import com.bdqn.zmj.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService service;

    @RequestMapping("/userinfo")
    @ResponseBody
    public Page<User> userinfo(int page,int limit,String userId,String userName) {
        Page<User> data = service.list(page,limit,userId,userName);
        return data;
    }
}
