from sqlalchemy import VARCHAR, INTEGER, func
from sqlalchemy.orm import  mapped_column, Mapped
from services.base import Base

class Paint(Base):
    __tablename__ = "paint"
    paint_id: Mapped[int] = mapped_column('paint', INTEGER, primary_key=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(128), nullable=False)
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256), nullable=False)
    hex_color: Mapped[str] = mapped_column('hex_color', VARCHAR(6))

    @classmethod
    def find_best_selling_paint(cls, session):
        from models import Hat
        from models import Sale_Has_Hat

        best_selling_paint = session.query(cls.name, func.count(Sale_Has_Hat.hat_id)).\
            select_from(cls).\
            join(Hat).\
            join(Sale_Has_Hat).\
            group_by(cls.name).\
            order_by(func.count(Sale_Has_Hat.hat_id).desc()).\
            first()

        return best_selling_paint