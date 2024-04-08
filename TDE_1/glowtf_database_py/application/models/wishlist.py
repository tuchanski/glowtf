from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from base import Base
from user import User

class Wishlist(Base): # OK
    __tablename__ = "wishlist"
    wishlist_id: Mapped[int] = mapped_column('id_user', INTEGER, ForeignKey(User.user_id), primary_key=True)
