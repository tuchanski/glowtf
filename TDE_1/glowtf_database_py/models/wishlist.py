from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base
from models.user import User

class Wishlist(Base):
    __tablename__ = "wishlist"
    wishlist_id: Mapped[int] = mapped_column('id_user', INTEGER, ForeignKey(User.user_id), primary_key=True)
