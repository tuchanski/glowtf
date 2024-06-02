from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base
from models.wishlist import Wishlist
from models.hat import Hat

class Wishlist_Has_Hat(Base):
    __tablename__ = "wishlist_has_hat"
    wishlist_has_hat_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    wishlist_id: Mapped[int] = mapped_column('id_wishlist', INTEGER, ForeignKey(Wishlist.id_user), nullable=False)
    hat_id: Mapped[int] = mapped_column('id_hat', INTEGER, ForeignKey(Hat.hat_id), nullable=False)
