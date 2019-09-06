from sqlalchemy import Column, Integer, String, Binary

from base import Base

class User(Base):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True)
    name = Column(String(16))
    password = Column(String(32))
    
    def __repr__(self):
        return '<User(id=%d, name="%s", password="%s")>' %(
                    self.id, self.name, self.password)
