# Rodar após app.py (p/ criar banco populado)

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
     print( "#1 -> Gênero dos Clientes")
     result_first_query = User.count_users_by_gender(session)
     for row in result_first_query:
          print(f"Gênero: {row.gender}, Total de Usuários: {row.total_users}")
     print("*" * 40)

     print( "#2 -> Estado onde moram os clientes")
     result_second_query = User.count_users_by_state(session)
     for row in result_second_query:
          print(f"Estado: {row.state}, Total de Usuários: {row.total_users}")
     print("*" * 40)

     print( "#3 -> Média de gasto por cliente")
     result_third_query = Sale.average_spending_per_customer(session)
     print(f"Média de gastos por cliente: {result_third_query:.2f}")
     print("*" * 40)

     print( "#4 -> Frequência de compras de cliente")
     result_fourth_query = Sale.purchase_frequency_by_user(session)
     for id_user, frequency in result_fourth_query:
          print(f"ID do Usuário: {id_user}, Frequência de Compra: {frequency}")
     print("*" * 40)

     print( "#5 -> Classe de chapéu com mais compras vendas")
     result_fifth_query = Hat_Class.get_class_with_most_purchases(session)
     for class_name, total_purchases in result_fifth_query:
          print(f"Nome da Classe: {class_name}, Total de Compras: {total_purchases}")
     print("*" * 40)

     print( "#6 -> Valor médio gasto por transação")
     result_sixth_query = Sale.get_average_transaction_amount(session)
     print(f'A média do valor das transações é: {result_sixth_query:.2f}')
     print("*" * 40)

     print( "#7 -> Número de vendas agrupadas por mês e ano")
     result_seventh_query = Sale.get_transaction_counts_by_month(session)
     for result in result_seventh_query:
          print(f"Ano: {result.year}, Mês: {result.month}, Contagem de Transações: {result.transaction_count}")
     print("*" * 40)

     print( "#8 -> Número de vendas agrupadas por quadrimestre e ano")
     result_eighth_query = Sale.get_transaction_counts_by_quarter(session)
     for result in result_eighth_query:
          print(f"Ano: {result.year}, Trimestre: {result.quarter}, Contagem de Transações: {result.transaction_count}")
     print("*" * 40)

     # 9 COM PROBLEMA!!!
     print( "#9 -> Tinta mais vendida")
     result_ninth_query = Paint.find_best_selling_paint(session)
     print("Tinta mais vendida:", result_ninth_query[0])
     print("Total de vendas:", result_ninth_query[1])
     print("*" * 40)


except Exception as e:
     print("Ocorreu um erro durante a atualização:", str(e))
