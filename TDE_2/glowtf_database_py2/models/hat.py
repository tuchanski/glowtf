from sqlalchemy import  VARCHAR, INTEGER,  ForeignKey
from sqlalchemy.orm import  mapped_column, Mapped
from services.base import Base
from models.paint import Paint

class Hat(Base):
    __tablename__ = "hat"
    hat_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    inventory: Mapped[int] = mapped_column('inventory', INTEGER, nullable=False)
    price: Mapped[int] = mapped_column('price', INTEGER, nullable=False) # Em (inteiro) centavos p/ evitar perda de precisão
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256), nullable=False)
    name: Mapped[str] = mapped_column('name', VARCHAR(256), nullable=False)
    paint: Mapped[int] = mapped_column('paint_id', INTEGER, ForeignKey(Paint.paint_id), nullable=True)
    description: Mapped[str] = mapped_column('description', VARCHAR(1024), nullable=False)
    wiki: Mapped[str] = mapped_column('wiki', VARCHAR(256), nullable=False)
