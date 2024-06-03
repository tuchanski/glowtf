from models import *
from datetime import datetime

paint_data = [
    Paint(name='O Amargo Sabor de Derrota e Limão', promo_image='O_Amargo_Sabor_de_Derrota_e_Limao.png', hex_color='2EB52E'),
    Paint(name='Uma Extraordinária Abundância de Matiz', promo_image='Uma_Extraordinaria_Abundancia_de_Matiz.png', hex_color='BCBEBC'),
    Paint(name='A Cor das Calças de Negócios de um Cavalheiro', promo_image='A_Cor_das_Calcas_de_Negocios_de_um_Cavalheiro.png', hex_color='C7C277'),
    Paint(name='Cinza Bigode Envelhecido', promo_image='Cinza_Bigode_Envelhecido.png', hex_color='6F716F'),
    Paint(name='Cor 216 190 216', promo_image='Cor_216_190_216.png', hex_color='C4AFC4'),
    Paint(name='Depois das Oito', promo_image='Depois_das_Oito.png', hex_color='292922'),
    Paint(name='Ganância do Zepheniah', promo_image='Ganancia_do_Zepheniah.png', hex_color='3A4534')
]

user_data = [
    User(name='Alice Smith',gender='Feminino',state='RS',cpf='12345678901',email='alice@example.com',password='password123',admin=False,steam_id='12345678901234567'),
    User(name='Bob Johnson',gender='Masculino', state='PR',cpf='23456789012',email='bob@example.com',password='password456',admin=False,steam_id='23456789012345678'),
    User(name='Charlie Brown',gender='Masculino',state='SC',cpf='34567890123',email='charlie@example.com',password='password789',admin=False,steam_id='34567890123456789'),
    User(name='Admin User',gender='Feminino',state='SP',cpf='45678901234',email='admin@example.com',password='adminpass',admin=True,steam_id='45678901234567890'),
    User(name='Markus Persson',gender='Masculino',state='PB',cpf='84678602234',email='mojang@example.com',password='minepass',admin=False,steam_id='85345601734362860'),
    User(name='Antonio Galarda', gender='Masculino',state='SC',cpf='88856684013',email='galarda@example.com', password='password873',admin=False, steam_id='55622902232562495')
]

coupon_data = [
    Coupons(expiration_date=datetime(2024, 6, 30), discount=20, uses=100, start_date=datetime(2024, 5, 17), code_name='PAOTASTICO2024'),
    Coupons(expiration_date=datetime(2024, 7, 31), discount=15, uses=200, start_date=datetime(2024, 5, 17), code_name='VERDEAMARGO'),
    Coupons(expiration_date=datetime(2024, 8, 31), discount=10, uses=150, start_date=datetime(2024, 5, 17), code_name='SUMMERDEAL2024'),
    Coupons(expiration_date=datetime(2024, 9, 30), discount=25, uses=50, start_date=datetime(2024, 5, 17), code_name='FALLSALE2024'),
    Coupons(expiration_date=datetime(2024, 10, 31), discount=30, uses=75, start_date=datetime(2024, 5, 17), code_name='HALLOWEEN2024'),
    Coupons(expiration_date=datetime(2024, 12, 31), discount=50, uses=25, start_date=datetime(2024, 5, 17), code_name='YEAREND2024'),
    Coupons(expiration_date=datetime(2024, 12, 31), discount=50, uses=100, start_date=datetime(2024, 2, 2), code_name='FREEFIRE1000'),
    Coupons(expiration_date=datetime(2024, 12, 12), discount=90, uses=1, start_date=datetime(2024, 12, 12), code_name='THATSPOGG')
]

class_data = [
    Hat_Class(class_name='Scout'),
    Hat_Class(class_name='Soldier'),
    Hat_Class(class_name='Pyro'),
    Hat_Class(class_name='Demoman'),
    Hat_Class(class_name='Heavy'),
    Hat_Class(class_name='Engineer'),
    Hat_Class(class_name='Medic'),
    Hat_Class(class_name='Sniper'),
    Hat_Class(class_name='Spy')
]

hats_data = [
    Hat(inventory=50, price=100, promo_image='soldier_helmet_large.png', name='Chapéu Fedora', paint=None, description='Um elegante chapéu fedora.', wiki='https://wiki.teamfortress.com/wiki/Fedora'),
    Hat(inventory=40, price=120, promo_image='heavy_helmet_large.png', name='Capacete Mercenário', paint=None, description='Um capacete resistente usado pelos mercenários.', wiki='https://wiki.teamfortress.com/wiki/Mercenary_Helmet'),
    Hat(inventory=30, price=80, promo_image='pyro_hat_large.png', name='Boné Brigadeiro', paint=None, description='Um boné usado pelos oficiais de brigada.', wiki='https://wiki.teamfortress.com/wiki/Brigade_Helm'),
    Hat(inventory=20, price=150, promo_image='sniper_hat_large.png', name='Cartola Aristocrata', paint=None, description='Uma cartola usada pelos aristocratas.', wiki='https://wiki.teamfortress.com/wiki/Aristocrat%27s_Hat'),
    Hat(inventory=25, price=90, promo_image='scout_hat_large.png', name='Boina Béret', paint=None, description='Uma boina estilosa para os soldados.', wiki='https://wiki.teamfortress.com/wiki/Beret'),
    Hat(inventory=60, price=70, promo_image='engineer_hat_large.png', name='Chapéu de Palha', paint=None, description='Um chapéu de palha perfeito para o verão.', wiki='https://wiki.teamfortress.com/wiki/Straw_Hat'),
    Hat(inventory=45, price=110, promo_image='spy_hat_large.png', name='Elmet Costureiro', paint=None, description='Um capacete usado por costureiros de elite.', wiki='https://wiki.teamfortress.com/wiki/Costume_helmet'),
    Hat(inventory=35, price=130, promo_image='demo_helmet_large.png', name='Capacete Medieval', paint=None, description='Um capacete usado por cavaleiros medievais.', wiki='https://wiki.teamfortress.com/wiki/Medieval_Helmet')
]

hat_has_class_data = [
    Hat_Has_Class(hat_id=1, class_id=2),
    Hat_Has_Class(hat_id=1, class_id=5),
    Hat_Has_Class(hat_id=2, class_id=5),
    Hat_Has_Class(hat_id=2, class_id=4),
    Hat_Has_Class(hat_id=3, class_id=3),
    Hat_Has_Class(hat_id=3, class_id=4),
    Hat_Has_Class(hat_id=4, class_id=8),
    Hat_Has_Class(hat_id=4, class_id=9),
    Hat_Has_Class(hat_id=5, class_id=1),
    Hat_Has_Class(hat_id=5, class_id=3),
    Hat_Has_Class(hat_id=6, class_id=6),
    Hat_Has_Class(hat_id=6, class_id=7),
    Hat_Has_Class(hat_id=7, class_id=7),
    Hat_Has_Class(hat_id=7, class_id=8),
    Hat_Has_Class(hat_id=8, class_id=9),
    Hat_Has_Class(hat_id=8, class_id=2)
]

wishlist_data = [
    Wishlist(id_user=1),
    Wishlist(id_user=2),
    Wishlist(id_user=3),
    Wishlist(id_user=4),
    Wishlist(id_user=5),
    Wishlist(id_user=6)
]

cart_data = [
    Cart(id_user=1, date=datetime(2024, 5, 1, 10, 0, 0)),
    Cart(id_user=2, date=datetime(2024, 5, 2, 11, 0, 0)),
    Cart(id_user=3, date=datetime(2024, 5, 3, 12, 0, 0)),
    Cart(id_user=4, date=datetime(2024, 5, 4, 13, 0, 0)),
    Cart(id_user=5, date=datetime(2024, 5, 5, 14, 0, 0)),
    Cart(id_user=6, date=datetime(2024, 5, 6, 15, 0, 0))
]

sale_data = [
    Sale(date=datetime(2024, 5, 1), user_id=1, coupons_id=1, price=80),
    Sale(date=datetime(2024, 5, 2), user_id=2, coupons_id=2, price=102),
    Sale(date=datetime(2024, 5, 3), user_id=3, coupons_id=3, price=72),
    Sale(date=datetime(2024, 5, 4), user_id=4, coupons_id=4, price=112),
    Sale(date=datetime(2024, 5, 5), user_id=5, coupons_id=5, price=63),
    Sale(date=datetime(2024, 5, 6), user_id=6, coupons_id=6, price=35)
]

cart_has_hat_data = [
    Cart_has_Hat(cart_id=1, hat_id=1),
    Cart_has_Hat(cart_id=2, hat_id=2),
    Cart_has_Hat(cart_id=3, hat_id=3),
    Cart_has_Hat(cart_id=4, hat_id=4),
    Cart_has_Hat(cart_id=5, hat_id=5),
    Cart_has_Hat(cart_id=6, hat_id=6)
]

sale_has_hat_data = [
    Sale_Has_Hat(sale_id=1, hat_id=1, price=100),
    Sale_Has_Hat(sale_id=2, hat_id=2, price=200),
    Sale_Has_Hat(sale_id=3, hat_id=3, price=120),
    Sale_Has_Hat(sale_id=4, hat_id=4, price=100),
    Sale_Has_Hat(sale_id=5, hat_id=5, price=100),
    Sale_Has_Hat(sale_id=6, hat_id=6, price=120)
]

wishlist_has_hat_data = [
    Wishlist_Has_Hat(wishlist_id=1, hat_id=1),
    Wishlist_Has_Hat(wishlist_id=2, hat_id=2),
    Wishlist_Has_Hat(wishlist_id=3, hat_id=3),
    Wishlist_Has_Hat(wishlist_id=4, hat_id=4),
    Wishlist_Has_Hat(wishlist_id=5, hat_id=5),
    Wishlist_Has_Hat(wishlist_id=6, hat_id=6)
]
