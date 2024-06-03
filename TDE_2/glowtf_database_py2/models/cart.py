from sqlalchemy import DATETIME,  INTEGER,  ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from datetime import datetime

from services.base import Base
from models.user import User

class Cart(Base):
    __tablename__ = "cart"
    id_user: Mapped[int] = mapped_column('id_user', INTEGER, ForeignKey(User.user_id), primary_key=True)
    date: Mapped[datetime] = mapped_column('date', DATETIME, nullable=False)
