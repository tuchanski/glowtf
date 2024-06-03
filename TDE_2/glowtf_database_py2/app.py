from services.database import DatabaseManager
from sqlalchemy.orm import sessionmaker
from datetime import datetime

from config import config
from inserts_data import data
from models import *

# Gerenciador do banco
db_manager = DatabaseManager(config.USER, config.PASSWD, config.HOST, config.PORT, config.DATABASE)
db_manager.setup_database() # Dropa e Cria DB

# Criando sessão
Session = sessionmaker(bind=db_manager.engine)
session = Session()

# Inserindo dados
try:
    session.add_all(data.user_data)
    session.commit()

    session.add_all(data.paint_data)
    session.commit()

    session.add_all(data.hats_data)
    session.commit()

    session.add_all(data.coupon_data)
    session.commit()

    session.add_all(data.class_data)
    session.commit()

    session.add_all(data.hat_has_class_data)
    session.commit()

    session.add_all(data.cart_data)
    session.commit()

    session.add_all(data.wishlist_data)
    session.commit()

    session.add_all(data.sale_data)
    session.commit()

    session.add_all(data.cart_has_hat_data)
    session.commit()

    session.add_all(data.sale_has_hat_data)
    session.commit()

    session.add_all(data.wishlist_has_hat_data)
    session.commit()

except Exception as e:
     print("Ocorreu um erro durante a inserção de dados:", str(e))

finally:
    session.close()
