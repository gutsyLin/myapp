from util.db_helper import session
from model.user import User

class UserDao(object):
    def get_all(self):
        return session.query(User)
        
    def insert(self, user):
        session.add(user)
        session.commit()

userDao = UserDao()

