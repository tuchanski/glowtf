from sqlalchemy import VARCHAR, TINYINT
from sqlalchemy.orm import  mapped_column, Mapped
from base import Base

class Paint(Base): # OK
    __tablename__ = "paint"
    paint_id: Mapped[int] = mapped_column('paint', TINYINT, primary_key=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(128), nullable=False)
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256), nullable=False)
