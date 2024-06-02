from sqlalchemy import DATE, VARCHAR, INTEGER, BIGINT, func
from sqlalchemy.orm import  mapped_column, Mapped
from datetime import datetime
from services.base import Base

class Coupons(Base):
    __tablename__ = "coupons"
    coupons_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    expiration_date: Mapped[datetime] = mapped_column('expiration_date', DATE, nullable=False)
    discount: Mapped[int] = mapped_column('discount', INTEGER, nullable=False) # Inteiro p/ evitar perda de precisão.
    uses: Mapped[int] = mapped_column('uses', BIGINT)
    start_date: Mapped[datetime] = mapped_column('start_date', DATE, nullable=False)
    code_name: Mapped[str] = mapped_column('code_name', VARCHAR(20), nullable=False, unique=True)

    @classmethod
    def get_most_used_coupon(cls, session):
        from models import Sale
        result = session.query(
            cls.code_name.label('code_name'),
            func.count(Sale.sale_id).label('usage_count')
        ).join(Sale, cls.coupons_id == Sale.coupons_id
        ).group_by(cls.code_name
        ).order_by(func.count(Sale.sale_id).desc()
        ).limit(1).first()
        return result
    
    @classmethod
    def get_least_used_coupon(cls, session):
        from models import Sale
        result = session.query(
            cls.code_name.label('code_name'),
            func.count(Sale.sale_id).label('usage_count')
        ).join(Sale, cls.coupons_id == Sale.coupons_id
        ).group_by(cls.code_name
        ).order_by(func.count(Sale.sale_id).asc()
        ).limit(1).first()
        return result
