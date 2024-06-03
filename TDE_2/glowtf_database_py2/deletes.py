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

# Terminar Deletes

try:

    # 1)
    session.query(Cart_has_Hat).filter_by(cart_has_hat_id=4).delete()
    session.commit()
    print("Deletada entrada da tabela 'cart_has_hat' com ID 4 com sucesso!")

    # 2)
    session.query(Sale_Has_Hat).filter_by(sale_has_hat_id=4).delete()
    session.commit()
    print("Deletada entrada da tabela 'sale_has_hat' com ID 4 com sucesso!")

    # 3)
    session.query(Coupons).filter_by(coupons_id=8).delete()
    session.commit()
    print("Deletado cupom com ID 8 com sucesso!")

    # 4)
    session.query(Hat_Has_Class).filter_by(class_id=2).delete()
    session.commit()
    print("Deletadas entradas da tabela 'hat_has_class' com class_id 2 com sucesso!")

    # 5)
    session.query(Wishlist_Has_Hat).filter_by(wishlist_has_hat_id=6).delete()
    session.commit()
    print("Deletadas entrada da tabela 'wishlist_has_hat' com ID 6 com sucesso!")
    
except Exception as e:
    print("Ocorreu um erro durante a atualização:", str(e))
