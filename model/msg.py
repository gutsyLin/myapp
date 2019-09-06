from sqlalchemy import Column, Integer, String, Binary

from base import Base

class Msg(Base):
    __tablename__ = 'msg'
    id = Column(Integer, primary_key=True)
    content = Column(String(32))

