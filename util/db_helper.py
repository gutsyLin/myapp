from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from config import db_cfg
from model.base import Base

engine = create_engine(db_cfg.url, encoding='utf-8', echo=True)
Base.metadata.create_all(engine)
Session = sessionmaker(bind=engine)
session = Session()

