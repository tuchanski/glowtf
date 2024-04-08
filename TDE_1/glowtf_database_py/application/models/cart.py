from sqlalchemy import DATE,  INTEGER,  ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from datetime import datetime
from base import Base
from user import User

class Cart(Base): # OK
    __tablename__ = "cart"
    cart_id: Mapped[int] = mapped_column('id', INTEGER, ForeignKey(User.user_id), primary_key=True)
    date: Mapped[datetime] = mapped_column('date', DATE, nullable=False)
