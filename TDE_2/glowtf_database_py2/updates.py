# Rode esse arquivo após app.py

from sqlalchemy import create_engine, update
from sqlalchemy.orm import sessionmaker
from database import DatabaseManager
from models import *

USER = "root"
PASSWD = ""  # Altere para sua senha do MySQL
HOST = "localhost" 
PORT = 3306  
DATABASE = "glowtfdb"

db_manager = DatabaseManager(USER, PASSWD, HOST, PORT, DATABASE)
engine = create_engine(db_manager.url)

# Cria a sessão
Session = sessionmaker(bind=engine)
session = Session()

try:
    # 1)
    session.query(User).filter(User.user_id == 3).update({"name": "Charlie Brown Jr."})
    print("O nome do usuário de ID 3 foi alterado com sucesso!")

    # 2)
    session.query(Hat).filter(Hat.hat_id == 2).update({Hat.price: (130)})
    session.commit()
    print("O preço foi atualizado para 130 com sucesso!")

    # 3)
    session.query(Coupons).filter_by(coupons_id=1).update({"discount": 25})
    session.commit()
    print("O desconto do cupom de ID = 1 foi alterado para 25%!")

    # 4)
    session.query(Hat_Class).filter_by(class_id=1).update({"class_name": "Sniper Elite"})
    session.commit()
    print("O nome da classe de id = 1 foi atualizado com sucesso!")

    # 5)
    session.query(Paint).filter_by(paint_id=3).update({"hex_color": "FF0000"})
    session.commit()
    print("A cor da pintura com id = 3 foi alterada com sucesso!")

except Exception as e:
    print("Ocorreu um erro durante a atualização:", str(e))
