import ConfigParser
import os

class Config(object):    
    def __init__(self):
        self.cfg = ConfigParser.ConfigParser()
        self.cfg.read('config.ini')
    
    def get(self, session, key, type_=None):
        out = None
        if type_ == type(int):
            out = self.cfg.getint(session, key)
        else:
            out = self.cfg.get(session, key)
        return out
cfg = Config()


class DBconfig(object):
    def __init__(self):
        section = 'db'
        self.username= cfg.get(section, 'username')
        self.password = cfg.get(section, 'password')
        self.ip = cfg.get(section, 'ip')
        self.database = cfg.get(section, 'database')
        self.url = 'mysql+pymysql://%s:%s@%s/%s' % (
                self.username, self.password, self.ip, self.database)
      
db_cfg = DBconfig()
