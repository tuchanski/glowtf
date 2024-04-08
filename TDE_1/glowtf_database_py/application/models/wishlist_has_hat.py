from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from base import Base
from wishlist import Wishlist
from hat import Hat

class Wishlist_Has_Hat(Base): # OK
    __tablename__ = "wishlist_has_hat"
    wishlist_id: Mapped[int] = mapped_column('id_wishlist', INTEGER, ForeignKey(Wishlist.wishlist_id), nullable=False)
    hat_id: Mapped[int] = mapped_column('id_hat', INTEGER, ForeignKey(Hat.hat_id), nullable=False)
    product_game_id: Mapped[int] = mapped_column('id_product_game', INTEGER, nullable=False)
    product_steam_api_id: Mapped[int] = mapped_column('id_product_steam_api', INTEGER, nullable=False)
