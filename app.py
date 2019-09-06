# coding=utf-8
from dao.userDao import userDao 

dat = userDao.get_all()
for d  in dat:
    print d
