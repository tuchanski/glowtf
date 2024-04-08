from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from base import Base
from cart import Cart
from hat import Hat


class Cart_has_Hat(Base): # OK
    __tablename__ = "cart_has_hat"
    cart_id: Mapped[int] = mapped_column('id_cart', INTEGER, ForeignKey(Cart.cart_id), autoincrement=True)
    hat_id: Mapped[int] = mapped_column('id_hat', INTEGER, ForeignKey(Hat.hat_id))
