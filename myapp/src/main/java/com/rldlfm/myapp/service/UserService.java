package com.rldlfm.myapp.service;

import com.rldlfm.myapp.entity.User;

/**
 *
 * @author Lin
 */
public interface UserService {
    
    /**
     *  添加一个用户
     * 
     * @param user 用户信息
     * @return true/false 成功/失败
     */
    boolean addUser(User user);
    
    /**
     * 用户登录动作
     * 
     * @param user 用户信息
     * @return true/false 成功/失败
     */
    boolean doLogin(User user);
    
    /**
     * 根据用户名, 判断一个用户是否存在
     * 
     * @param user 用户实体类 
     * @return true/false 存在/不存在
     */
    boolean userExists(User user);
}
