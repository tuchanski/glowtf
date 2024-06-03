from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base
from models.cart import Cart
from models.hat import Hat

class Cart_has_Hat(Base): 
    __tablename__ = "cart_has_hat"
    cart_has_hat_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    cart_id: Mapped[int] = mapped_column('id_user', INTEGER, ForeignKey(Cart.id_user), nullable=False)
    hat_id: Mapped[int] = mapped_column('id_hat', INTEGER, ForeignKey(Hat.hat_id), nullable=False)
