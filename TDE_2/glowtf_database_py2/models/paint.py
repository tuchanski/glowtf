from sqlalchemy import VARCHAR, INTEGER
from sqlalchemy.orm import  mapped_column, Mapped
from services.base import Base

class Paint(Base):
    __tablename__ = "paint"
    paint_id: Mapped[int] = mapped_column('paint', INTEGER, primary_key=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(128), nullable=False)
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256), nullable=False)
    hex_color: Mapped[str] = mapped_column('hex_color', VARCHAR(6))