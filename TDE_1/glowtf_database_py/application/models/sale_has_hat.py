from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from base import Base
from sale import Sale
from hat import Hat

class Sale_Has_Hat(Base): # OK
    __tablename__ = "sale_has_hat"
    sale_id: Mapped[int] = mapped_column('id_sale', INTEGER, ForeignKey(Sale.sale_id), nullable=False)
    hat_id: Mapped[int] = mapped_column('id_hat', INTEGER, ForeignKey(Hat.hat_id), nullable=False)
