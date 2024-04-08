from sqlalchemy.orm import Session, scoped_session, sessionmaker
from sqlalchemy import create_engine
from urllib.parse import quote # Converte a senha e caracteres especiais
from sqlalchemy_utils import database_exists, create_database

USER = "root"
PASSWD = quote("") # Senha do servidor MYSQL
HOST = "localhost" # 127.0.0.1
PORT = 3306 # Porta padrão mysql
DATABASE = "glockgems"

url = f'mysql+pymysql://{USER}:{PASSWD}@{HOST}:{PORT}/{DATABASE}'

if not database_exists(url=url):
    create_database(url=url)
else:
    print(f"O banco de dados {DATABASE} já existe")

engine = create_engine(url = url, echo = True) # echo = True para testar
session = scoped_session(sessionmaker(bind = engine, autoflush = False))
