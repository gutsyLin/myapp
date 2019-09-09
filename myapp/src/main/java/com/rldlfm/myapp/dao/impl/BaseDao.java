package com.rldlfm.myapp.dao.impl;

import javax.annotation.Resource;
import org.springframework.orm.hibernate5.HibernateTemplate;

/**
 * may for hibernate
 * 
 * @author Lin
 */
public class BaseDao {

    @Resource
    protected HibernateTemplate hibernateTemplate;

}
