package com.rldlfm.myapp.service.impl;

import com.rldlfm.myapp.service.UserService;
import com.rldlfm.myapp.entity.User;
import com.rldlfm.myapp.mapper.UserMapper;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Lin
 */
@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

    @Resource
    UserMapper userMapper;

    @Override
    @Transactional
    public boolean addUser(User user) {
        return userMapper.insert(user) == 1;
    }

    public boolean loginSucceed(User user) {
        User u = userMapper.selectByNameAndPassword(user);
        return u != null;
    }

    @Override
    public boolean userExists(User user) {
        return userMapper.selectCountByUserName(user) == 1;
    }

    @Override
    public boolean doLogin(User user) {
        return userMapper.selectByNameAndPassword(user) != null;
    }
}
