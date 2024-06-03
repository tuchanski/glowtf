# Atenção -> Executar após a criação do banco com app.py
# Atenção -> Rodar antes de updates.py

from services.database import DatabaseManager
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import *
from config import config

db_manager = DatabaseManager(config.USER, config.PASSWD, config.HOST, config.PORT, config.DATABASE)
engine = create_engine(db_manager.url)

# Cria a sessão
Session = sessionmaker(bind=engine)
session = Session()

try:
    delete_query1 = session.query(Cart_has_Hat).filter_by(cart_has_hat_id=4).delete()
    session.commit()
    if delete_query1:
        print("Deletada entrada da tabela 'cart_has_hat' com ID 4 com sucesso!")
    else:
        print("Erro no delete #1.")

    delete_query2 = session.query(Sale_Has_Hat).filter_by(sale_has_hat_id=4).delete()
    session.commit()
    if delete_query2:
        print("Deletada entrada da tabela 'sale_has_hat' com ID 4 com sucesso!")
    else:
        print("Erro no delete #2.")

    delete_query3 = session.query(Coupons).filter_by(coupons_id=8).delete()
    session.commit()
    if delete_query3:
        print("Deletado cupom com ID 8 com sucesso!")
    else:
        print("Erro no delete #3.")

    delete_query4 = session.query(Hat_Has_Class).filter_by(class_id=2).delete()
    session.commit()
    if delete_query4:
        print("Deletadas entradas da tabela 'hat_has_class' com class_id 2 com sucesso!")
    else:
        print("Erro no delete #4.")

    delete_query5 = session.query(Wishlist_Has_Hat).filter_by(wishlist_has_hat_id=6).delete()
    session.commit()
    if delete_query5:
        print("Deletadas entrada da tabela 'wishlist_has_hat' com ID 6 com sucesso!")
    else:
        print("Erro no delete #5.")
    
except Exception as e:
    print("Ocorreu um erro durante a atualização:", str(e))

finally:
    session.close()
