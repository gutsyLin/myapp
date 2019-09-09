package com.rldlfm.myapp.web.controller;

import com.rldlfm.myapp.service.UserService;
import com.rldlfm.myapp.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Lin
 */
@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    UserService userService;

    @RequestMapping("/ui")
    public String ui() {
        return "login/register";
    }

    @RequestMapping("/validateUsername")
    public void validateUsername(User user, ModelMap map) {
        boolean userExists = userService.userExists(user);
        map.put("ifExisted", userExists);
    }

    @RequestMapping("/doRegister")
    public void doRegister(User user, ModelMap map) {
        boolean ifSucceed = false;
        String msg = "";

        boolean userExists = userService.userExists(user);
        if (!userExists) {
            ifSucceed = userService.addUser(user);
        } else {
            msg = "该用户名已被占用, 请换个用户名!";
        }
        map.put("ifSucceed", ifSucceed);
        map.put("msg", msg);
    }


}
