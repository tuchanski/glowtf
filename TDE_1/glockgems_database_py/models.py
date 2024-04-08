from sqlalchemy import DATE, VARCHAR, INTEGER, CHAR, ForeignKey, DOUBLE, BIGINT, TINYINT, FLOAT
from sqlalchemy.orm import DeclarativeBase, mapped_column, Mapped
from datetime import datetime
from connection import engine

class Base(DeclarativeBase):
    pass

class Coupons(Base): # OK
    __tablename__ = "coupons"
    coupons_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    expiration_date: Mapped[datetime] = mapped_column('expiration_date', DATE, nullable=False)
    discount: Mapped[float] = mapped_column('discount', DOUBLE, nullable=False)
    uses: Mapped[int] = mapped_column('uses', BIGINT, autoincrement=True)
    start_date: Mapped[datetime] = mapped_column('start_date', DATE, nullable=False)
    code_name: Mapped[str] = mapped_column('code_name', VARCHAR(20), nullable=False)

class User(Base): # OK
    __tablename__ = "user"
    user_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(100), nullable=False)
    cpf: Mapped[int] = mapped_column('cpf', CHAR(11), nullable=False)
    email: Mapped[str] = mapped_column('email', VARCHAR(50), nullable=False)
    password: Mapped[str] = mapped_column('password', VARCHAR(30), nullable=False)
    admin: Mapped[int] = mapped_column('admin', TINYINT, nullable=False)

class Wishlist(Base): # OK
    __tablename__ = "wishlist"
    wishlist_id: Mapped[int] = mapped_column('id_user', INTEGER, ForeignKey(User.user_id), primary_key=True)

class Cart(Base): # OK
    __tablename__ = "cart"
    cart_id: Mapped[int] = mapped_column('id', INTEGER, ForeignKey(User.user_id), primary_key=True)
    date: Mapped[datetime] = mapped_column('date', DATE, nullable=False)
    
class Sale(Base): # OK
    __tablename__ = "sale"
    sale_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    date: Mapped[datetime] = mapped_column('date', DATE, nullable=False)
    user_id: Mapped[int] = mapped_column('id_user', INTEGER, ForeignKey(User.user_id), nullable=False)
    coupons_id: Mapped[int] = mapped_column('id_coupon', INTEGER, ForeignKey(Coupons.coupons_id))

class Paint(Base): # OK
    __tablename__ = "paint"
    paint_id: Mapped[int] = mapped_column('paint', TINYINT, primary_key=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(128), nullable=False)
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256), nullable=False)

class Hat(Base): # OK
    __tablename__ = "hat"
    hat_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    inventory: Mapped[int] = mapped_column('inventory', INTEGER, nullable=False)
    price: Mapped[float] = mapped_column('price', FLOAT, nullable=False)
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256), nullable=False)
    name: Mapped[str] = mapped_column('name', VARCHAR(256), nullable=False)
    paint: Mapped[int] = mapped_column('paint', TINYINT, ForeignKey(Paint.paint_id))
    description: Mapped[str] = mapped_column('description', VARCHAR(1024), nullable=False)

class Hat_Class(Base):  # OK
    __tablename__= "hat_class"
    hat_id: Mapped[int] = mapped_column('hat_id', INTEGER, ForeignKey(Hat.hat_id), primary_key=True)
    scout: Mapped[int] = mapped_column('scout', TINYINT)
    soldier: Mapped[int] = mapped_column('soldier', TINYINT)
    pyro: Mapped[int] = mapped_column('pyro', TINYINT)
    demoman: Mapped[int] = mapped_column('demoman', TINYINT)
    heavy: Mapped[int] = mapped_column('heavy', TINYINT)
    engineer: Mapped[int] = mapped_column('engineer', TINYINT)
    medic: Mapped[int] = mapped_column('medic', TINYINT)
    sniper: Mapped[int] = mapped_column('sniper', TINYINT)
    spy: Mapped[int] = mapped_column('spy', TINYINT)

class Cart_has_Hat(Base): # OK
    __tablename__ = "cart_has_hat"
    cart_id: Mapped[int] = mapped_column('id_cart', INTEGER, ForeignKey(Cart.cart_id), autoincrement=True)
    hat_id: Mapped[int] = mapped_column('id_hat', INTEGER, ForeignKey(Hat.hat_id))

class Sale_Has_Hat(Base): # OK
    __tablename__ = "sale_has_hat"
    sale_id: Mapped[int] = mapped_column('id_sale', INTEGER, ForeignKey(Sale.sale_id), nullable=False)
    hat_id: Mapped[int] = mapped_column('id_hat', INTEGER, ForeignKey(Hat.hat_id), nullable=False)

class Wishlist_Has_Hat(Base): # OK
    __tablename__ = "wishlist_has_hat"
    wishlist_id: Mapped[int] = mapped_column('id_wishlist', INTEGER, ForeignKey(Wishlist.wishlist_id), nullable=False)
    hat_id: Mapped[int] = mapped_column('id_hat', INTEGER, ForeignKey(Hat.hat_id), nullable=False)
    product_game_id: Mapped[int] = mapped_column('id_product_game', INTEGER, nullable=False)
    product_steam_api_id: Mapped[int] = mapped_column('id_product_steam_api', INTEGER, nullable=False)

Base.metadata.drop_all(bind=engine)
Base.metadata.create_all(bind=engine) # Cria todas as tabelas ligadas pela Base caso não existam
