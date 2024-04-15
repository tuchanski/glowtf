from sqlalchemy import create_engine
from sqlalchemy_utils import database_exists, create_database
from services.base import Base

import models

USER = "root"
PASSWD = "root"  # Senha do servidor MYSQL
HOST = "localhost"  # 127.0.0.1
PORT = 3306  # Porta padrão mysql
DATABASE = "glowtf"

url = f'mysql+pymysql://{USER}:{PASSWD}@{HOST}:{PORT}/{DATABASE}'

if not database_exists(url=url):
    create_database(url=url)
else:
    print(f"O banco de dados {DATABASE} já existe")

engine = create_engine(url, echo=True) 

Base.metadata.drop_all(bind=engine)
Base.metadata.create_all(bind=engine) 
