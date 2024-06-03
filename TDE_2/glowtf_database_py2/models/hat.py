from sqlalchemy import  VARCHAR, INTEGER,  ForeignKey, func
from sqlalchemy.orm import  mapped_column, Mapped
from services.base import Base
from models.paint import Paint

class Hat(Base):
    __tablename__ = "hat"
    hat_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    inventory: Mapped[int] = mapped_column('inventory', INTEGER, nullable=False)
    price: Mapped[int] = mapped_column('price', INTEGER, nullable=False) # Em (inteiro) centavos p/ evitar perda de precisão
    promo_image: Mapped[str] = mapped_column('promo_image', VARCHAR(256), nullable=False)
    name: Mapped[str] = mapped_column('name', VARCHAR(256), nullable=False)
    paint: Mapped[int] = mapped_column('paint_id', INTEGER, ForeignKey(Paint.paint_id), nullable=True)
    description: Mapped[str] = mapped_column('description', VARCHAR(1024), nullable=False)
    wiki: Mapped[str] = mapped_column('wiki', VARCHAR(256), nullable=False)

    @classmethod
    def get_top_selling_hat(cls, session):
        from models import Sale_Has_Hat
        result = session.query(
            cls.name.label('hat_name'),
            func.count(Sale_Has_Hat.hat_id).label('total_sales')
        ).join(Sale_Has_Hat, cls.hat_id == Sale_Has_Hat.hat_id
        ).group_by(cls.name
        ).order_by(func.count(Sale_Has_Hat.hat_id).desc()
        ).limit(1).first()
        return result
    
    @classmethod
    def get_least_selling_hat(cls, session):
        from models import Sale_Has_Hat
        result = session.query(
            cls.name.label('hat_name'),
            func.count(Sale_Has_Hat.hat_id).label('total_sales')
        ).join(Sale_Has_Hat, cls.hat_id == Sale_Has_Hat.hat_id
        ).group_by(cls.name
        ).order_by(func.count(Sale_Has_Hat.hat_id).asc()
        ).limit(1).first()
        return result
