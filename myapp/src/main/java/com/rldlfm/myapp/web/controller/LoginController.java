package com.rldlfm.myapp.web.controller;

import com.rldlfm.myapp.service.UserService;
import com.rldlfm.myapp.entity.User;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Lin
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Resource
    UserService userService;
    
    @RequestMapping("/ui")
    public String ui(ModelMap model) {
        return "login/login";
    }

    @RequestMapping("/doLogin")
    public void doLogin(User user, ModelMap model) {
        String password = user.getPassword();        
        boolean isLogined = userService.doLogin(user);
        model.put("isLogined", isLogined);
    }

}
