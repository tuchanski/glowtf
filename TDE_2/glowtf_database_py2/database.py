from sqlalchemy import create_engine
from sqlalchemy_utils import database_exists, create_database
from services.base import Base
from models import *

class DatabaseManager:
    def __init__(self, user, passwd, host, port, database):
        self.user = user
        self.passwd = passwd
        self.host = host
        self.port = port
        self.database = database
        self.url = f'mysql+pymysql://{self.user}:{self.passwd}@{self.host}:{self.port}/{self.database}'
        self.engine = None

    def setup_database(self):
        if not database_exists(url=self.url):
            create_database(url=self.url)
            print(f"Banco de dados {self.database} criado")
        else:
            print(f"O banco de dados {self.database} já existe")

        self.engine = create_engine(self.url, echo=True)
        self._reset_database()

    def _reset_database(self):
        Base.metadata.drop_all(bind=self.engine)
        Base.metadata.create_all(bind=self.engine)
