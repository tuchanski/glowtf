from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column
from services.base import Base
from models.user import User

class Wishlist(Base):
    __tablename__ = "wishlist"
    id_user: Mapped[int] = mapped_column(INTEGER, ForeignKey(User.user_id), primary_key=True)

    def __init__(self, id_user: int):
        self.id_user = id_user
