package com.rldlfm.myapp.mapper;

import com.rldlfm.myapp.entity.User;
import javax.annotation.Resource;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Lin
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
@TransactionConfiguration
@Transactional
public class UserMapperTest {

    @Resource
    UserMapper userMapper;

    public UserMapperTest() {
    }

    @Test
    public void testDeleteByPrimaryKey() {
    }

    @Test
    public void testInsert() {
        User usr = new User();
        usr.setUsername("name");
        usr.setPassword("password");
        int changeCount = userMapper.insertSelective(usr);
        assertTrue(changeCount == 1);
    }

    @Test
    public void testInsertSelective() {
        User u =  userMapper.selectByPrimaryKey(414);
    }
}
