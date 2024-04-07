from sqlalchemy import DATE, VARCHAR, INTEGER, CHAR, ForeignKey, DOUBLE, BIGINT, TINYINT, FLOAT
from sqlalchemy.orm import DeclarativeBase, mapped_column, Mapped
from datetime import datetime
from connection import engine

# ATENCAO - FALTA REVISAR A QUESTAO DAS PK - ALGUMAS ENTIDADES TEM MAIS DE UMA.
# ATE O MOMENTO, IGUAL AO MODELO LOGICO APRESENTADO PELO GIOVANNI - SALVO ALGUMAS MARCACOES.
# - Guilherme

class Base(DeclarativeBase):
    pass

class Coupons(Base): # COMPLETO, REVISADO
    __tablename__ = "coupons"
    coupons_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    expiration_date: Mapped[DATE] = mapped_column('expiration_date', DATE, nullable=False)
    discount: Mapped[float] = mapped_column('discount', DOUBLE)
    uses: Mapped[int] = mapped_column('uses', BIGINT, autoincrement=True)
    start_date: Mapped[datetime] = mapped_column('start_date', DATE)
    char_name: Mapped[str] = mapped_column('char_name', VARCHAR(45), nullable=False)

class Wishlist(Base): # COMPLETO, REVISADO
    __tablename__ = "wishlist"
    user_id: Mapped[int] = mapped_column('user_id', INTEGER, primary_key=True, autoincrement=True)

class Cart(Base): # COMPLETO, REVISADO
    __tablename__ = "cart"
    user_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    date: Mapped[datetime] = mapped_column(DATE, nullable=False)

class User(Base): # COMPLETO, REVISADO
    __tablename__ = "user"
    user_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(100), nullable=False)
    cpf: Mapped[int] = mapped_column('cpf', CHAR(11), nullable=False)
    email: Mapped[str] = mapped_column('email', VARCHAR(50), nullable=False)
    password: Mapped[str] = mapped_column('password', VARCHAR(30), nullable=False)
    admin: Mapped[int] = mapped_column('admin', TINYINT, nullable=False)
    cart_id: Mapped[int] = mapped_column('cart_id', INTEGER, ForeignKey(Cart.user_id), nullable=False)
    wishlist_id: Mapped[int] = mapped_column('wishlist_id', INTEGER, ForeignKey(Wishlist.user_id), nullable=False)
    
class Sale(Base): # COMPLETO, REVISADO
    __tablename__ = "sale"
    sale_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    date: Mapped[DATE] = mapped_column('date', DATE, nullable=False)
    user_id: Mapped[int] = mapped_column('user_id', INTEGER, ForeignKey(User.user_id), primary_key=True)
    coupons_id: Mapped[int] = mapped_column('coupons_id', INTEGER, ForeignKey(Coupons.coupons_id), primary_key=True)

class Paint(Base): # COMPLETO, REVISADO
    __tablename__ = "paint"
    paint_id: Mapped[int] = mapped_column('paint', TINYINT, primary_key=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(128), nullable=False)
    paintcol: Mapped[str] = mapped_column('paintcol', VARCHAR(45), nullable=False)
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256))

class Hat(Base): # COMPLETO, REVISADO
    __tablename__ = "hat"
    hat_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    inventory: Mapped[int] = mapped_column('hat', INTEGER, nullable=False, unique=True)
    price: Mapped[float] = mapped_column('price', FLOAT, nullable=False)
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256))
    name: Mapped[str] = mapped_column('name', VARCHAR(256))
    paint: Mapped[int] = mapped_column('paint', TINYINT, ForeignKey(Paint.paint_id), primary_key=True)
    description: Mapped[str] = mapped_column('description', VARCHAR(1024), nullable=False)

class Hat_Class(Base): # COMPLETO, REVISADO
    __tablename__= "hat_class"
    hat_id: Mapped[int] = mapped_column('id', INTEGER, ForeignKey(Hat.hat_id), primary_key=True)
    scout: Mapped[int] = mapped_column('scout', TINYINT)
    soldier: Mapped[int] = mapped_column('soldier', TINYINT)
    pyro: Mapped[int] = mapped_column('pyro', TINYINT)
    demoman: Mapped[int] = mapped_column('demoman', TINYINT)
    heavy: Mapped[int] = mapped_column('heavy', TINYINT)
    engineer: Mapped[int] = mapped_column('engineer', TINYINT)
    medic: Mapped[int] = mapped_column('medic', TINYINT)
    sniper: Mapped[int] = mapped_column('sniper', TINYINT)
    spy: Mapped[int] = mapped_column('spy', TINYINT)

class Cart_has_Hat(Base): # COMPLETO, REVISADO
    __tablename__ = "cart_has_hat"
    cart_id: Mapped[int] = mapped_column('cart_id', INTEGER, ForeignKey(Cart.user_id), primary_key=True, unique=True, autoincrement=True)
    hat_id: Mapped[int] = mapped_column('hat_id', INTEGER, ForeignKey(Hat.hat_id), primary_key=True, unique=True)

class Sale_Has_Hat(Base): # COMPLETO, REVISADO
    __tablename__ = "sale_has_hat"
    sale_id: Mapped[int] = mapped_column('sale_id', INTEGER, ForeignKey(Sale.sale_id), primary_key=True, unique=True)
    hat_id: Mapped[int] = mapped_column('hat_id', INTEGER, ForeignKey(Hat.hat_id), primary_key=True, unique=True)

class Wishlist_Has_Hat(Base): # COMPLETO, REVISADO
    __tablename__ = "wishlist_has_hat"
    wishlist_id: Mapped[int] = mapped_column('wishlist_id', INTEGER, ForeignKey(Wishlist.user_id), primary_key=True, unique=True)
    hat_id: Mapped[int] = mapped_column('hat_id', INTEGER, ForeignKey(Hat.hat_id), primary_key=True, unique=True)
    product_game_id: Mapped[int] = mapped_column('product_game_id', INTEGER, primary_key=True)
    product_steam_api_id: Mapped[int] = mapped_column('product_steam_api_id', primary_key=True)


Base.metadata.drop_all(bind=engine)
Base.metadata.create_all(bind=engine) # Cria todas as tabelas ligadas pela Base caso não existam
