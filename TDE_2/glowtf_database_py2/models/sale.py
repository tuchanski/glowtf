from sqlalchemy import DATE, INTEGER, ForeignKey
from sqlalchemy.orm import  mapped_column, Mapped
from datetime import datetime
from services.base import Base
from models.coupons import Coupons
from models.user import User

class Sale(Base):
    __tablename__ = "sale"
    sale_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    date: Mapped[datetime] = mapped_column('date', DATE, nullable=False)
    user_id: Mapped[int] = mapped_column('id_user', INTEGER, ForeignKey(User.user_id), nullable=False)
    coupons_id: Mapped[int] = mapped_column('id_coupon', INTEGER, ForeignKey(Coupons.coupons_id))
    price: Mapped[int] = mapped_column('price', INTEGER, nullable=False)

    
