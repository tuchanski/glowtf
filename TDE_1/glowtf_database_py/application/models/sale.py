from sqlalchemy import DATE, INTEGER, ForeignKey
from sqlalchemy.orm import  mapped_column, Mapped
from datetime import datetime
from base import Base
from coupons import Coupons
from user import User

class Sale(Base): # OK
    __tablename__ = "sale"
    sale_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    date: Mapped[datetime] = mapped_column('date', DATE, nullable=False)
    user_id: Mapped[int] = mapped_column('id_user', INTEGER, ForeignKey(User.user_id), nullable=False)
    coupons_id: Mapped[int] = mapped_column('id_coupon', INTEGER, ForeignKey(Coupons.coupons_id))
