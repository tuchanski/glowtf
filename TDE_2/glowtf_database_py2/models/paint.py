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
    def get_top_selling_paint(cls, session):
        from models import Sale_Has_Hat
        from models import Hat
        result = session.query(
            cls.name.label('paint_name'),
            func.count(Sale_Has_Hat.hat_id).label('total_sales')
        ).join(Hat, cls.paint_id == Hat.paint
        ).join(Sale_Has_Hat, Hat.hat_id == Sale_Has_Hat.hat_id
        ).group_by(cls.name
        ).order_by(func.count(Sale_Has_Hat.hat_id).desc()
        ).limit(1).first()
        return result
    
    @classmethod
    def get_least_selling_paint(cls, session):
        from models import Sale_Has_Hat
        from models import Hat
        result = session.query(
            cls.name.label('paint_name'),
            func.count(Sale_Has_Hat.hat_id).label('total_sales')
        ).join(Hat, cls.paint_id == Hat.paint
        ).join(Sale_Has_Hat, Hat.hat_id == Sale_Has_Hat.hat_id
        ).group_by(cls.name
        ).order_by(func.count(Sale_Has_Hat.hat_id).asc()
        ).limit(1).first()
        return result