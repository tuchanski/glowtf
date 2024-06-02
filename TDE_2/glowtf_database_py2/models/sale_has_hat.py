from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base
from models.sale import Sale
from models.hat import Hat

class Sale_Has_Hat(Base):
    __tablename__ = "sale_has_hat"
    sale_has_hat_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    sale_id: Mapped[int] = mapped_column('id_sale', INTEGER, ForeignKey(Sale.sale_id), nullable=False)
    hat_id: Mapped[int] = mapped_column('id_hat', INTEGER, ForeignKey(Hat.hat_id), nullable=False)
    price: Mapped[int] = mapped_column('price', INTEGER, nullable=False)
