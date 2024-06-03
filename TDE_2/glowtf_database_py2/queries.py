# Atenção -> Executar após a criação do banco com app.py

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

     print( "#9 -> Tinta mais vendida")
     result_ninth_query = Paint.get_top_selling_paint(session)
     if result_ninth_query:
          print(f"Nome da tinta: {result_ninth_query.paint_name}, Vendas totais: {result_ninth_query.total_sales}")
     else:
          print("Todas foram igualmente vendidas.")
     print("*" * 40)

     print( "#10 -> Tinta menos vendida")
     result_tenth_query = Paint.get_least_selling_paint(session)
     if result_tenth_query:
          print(f"Nome da tinta: {result_tenth_query.paint_name}, Vendas totais: {result_tenth_query.total_sales}")
     else:
          print("Todas foram igualmente vendidas.")
     print("*" * 40)

     print( "#11 -> Chapéu mais vendido")
     result_eleventh_query = Hat.get_top_selling_hat(session)
     if result_eleventh_query:
          print(f"Nome do chapéu: {result_eleventh_query.hat_name}, Total de vendas: {result_eleventh_query.total_sales}")
     else:
          print("Todos foram igualmente vendidas.")
     print("*" * 40)

     print( "#12 -> Chapéu menos vendido")
     result_twelfth_query = Hat.get_least_selling_hat(session)
     if result_twelfth_query:
          print(f"Nome do chapéu: {result_eleventh_query.hat_name}, Total de vendas: {result_eleventh_query.total_sales}")
     else:
          print("Todos foram igualmente vendidas.")
     print("*" * 40)

     print( "#13 -> Cupom com maior número de usos")
     result_thirteenth_query = Coupons.get_most_used_coupon(session)
     if result_thirteenth_query:
          print(f"Código do cupom: {result_thirteenth_query.code_name}, Usos: {result_thirteenth_query.usage_count}")
     print("*" * 40)

     print( "#14 -> Cupom com menor número de usos")
     result_fourteenth_query = Coupons.get_least_used_coupon(session)
     if result_fourteenth_query:
          print(f"Código do cupom: {result_fourteenth_query.code_name}, Usos: {result_fourteenth_query.usage_count}")
     print("*" * 40)

     print( "#15 -> Dia do mês com maior número de vendas")
     result_fifteenth_query = Sale.get_day_with_most_sales(session)
     if result_fifteenth_query:
          print(f"Dia do mês: {result_fifteenth_query.day_of_month}, Total de vendas: {result_fifteenth_query.transaction_count}")
     print("*" * 40)

     print( "#16 -> Dia do mês com menor número de vendas")
     result_sixteenth_query = Sale.get_day_with_least_sales(session)
     if result_sixteenth_query:
          print(f"Dia do mês: {result_sixteenth_query.day_of_month}, Total de vendas: {result_sixteenth_query.transaction_count}")
     print("*" * 40)

     print( "#17 -> Ano com mais vendas")
     result_seventeenth_query = Sale.get_year_with_most_sales(session)
     if result_seventeenth_query:
          print(f"Ano: {result_seventeenth_query.year}, Total de vendas: {result_seventeenth_query.total_sales}")
     print("*" * 40)

     print( "#18 -> Mês com mais vendas")
     result_eighteenth_query = Sale.get_month_with_highest_sales(session)
     if result_eighteenth_query:
          print(f"Ano: {result_eighteenth_query.year}, Mês: {result_eighteenth_query.month}, Total de vendas: {result_eighteenth_query.total_sales}")
     print("*" * 40)

     print( "#19 -> Dia com mais vendas")
     result_nineteenth_query = Sale.get_day_with_highest_sales(session)
     if result_nineteenth_query:
          print(f"Dia: {result_nineteenth_query.day}, Mês: {result_nineteenth_query.month}, Ano: {result_nineteenth_query.year}, Total de vendas: {result_nineteenth_query.total_sales}")
     print("*" * 40)

     print( "#20 -> Número de transações por usuário")
     result_twentieth_query = User.get_transaction_count_per_user(session)
     if result_twentieth_query:
          for row in result_twentieth_query:
               user_name = row.user_name
               transaction_count = row.transaction_count
               print(f"Usuário: {user_name}, Número de transações: {transaction_count}")
     else:
          print("Nenhum dado encontrado!")
     print("*" * 40)

except Exception as e:
     print("Ocorreu um erro durante a atualização:", str(e))

finally:
     session.close()