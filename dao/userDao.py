from util.db_helper import session
from model.user import User

from flask import current_app


class UserDao(object):
    def get_all(self):
        return session.query(User)

    def insert(self, user):
        session.add(user)
        session.commit()

    def select_by_name(self, name):
        sql = session.query(User.name).filter(User.name == name)
        current_app.logger.info(sql)

userDao = UserDao()

