from sqlalchemy import  VARCHAR, INTEGER,  ForeignKey, TINYINT, FLOAT
from sqlalchemy.orm import  mapped_column, Mapped
from base import Base
from paint import Paint

class Hat(Base): # OK
    __tablename__ = "hat"
    hat_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    inventory: Mapped[int] = mapped_column('inventory', INTEGER, nullable=False)
    price: Mapped[float] = mapped_column('price', FLOAT, nullable=False)
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256), nullable=False)
    name: Mapped[str] = mapped_column('name', VARCHAR(256), nullable=False)
    paint: Mapped[int] = mapped_column('paint', TINYINT, ForeignKey(Paint.paint_id))
    description: Mapped[str] = mapped_column('description', VARCHAR(1024), nullable=False)
