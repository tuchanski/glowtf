from sqlalchemy import DATE, INTEGER, ForeignKey, func, extract
from sqlalchemy.orm import  mapped_column, Mapped
from datetime import datetime
from services.base import Base
from models.coupons import Coupons
from models.user import User

class Sale(Base):
    __tablename__ = "sale"
    sale_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    date: Mapped[datetime] = mapped_column('date', DATE, nullable=False)
    user_id: Mapped[int] = mapped_column('id_user', INTEGER, ForeignKey(User.user_id), nullable=False)
    coupons_id: Mapped[int] = mapped_column('id_coupon', INTEGER, ForeignKey(Coupons.coupons_id))
    price: Mapped[int] = mapped_column('price', INTEGER, nullable=False)

    @classmethod
    def average_spending_per_customer(cls, session):
        return session.query(func.avg(cls.price).label('average_spending_per_customer')).scalar()
    
    @classmethod
    def purchase_frequency_by_user(cls, session):
        return session.query(cls.user_id, func.count(cls.user_id).label('purchase_frequency')).group_by(cls.user_id).all()
    
    @classmethod
    def get_average_transaction_amount(cls, session):
        result = session.query(func.avg(cls.price).label('average_transaction_amount')).one_or_none()
        return result.average_transaction_amount if result else None
    
    @classmethod
    def get_transaction_counts_by_month(cls, session):
        result = (session.query(
                    extract('year', cls.date).label('year'),
                    extract('month', cls.date).label('month'),
                    func.count('*').label('transaction_count'))
                  .group_by(extract('year', cls.date), extract('month', cls.date))
                  .all())
        return result
    
    @classmethod
    def get_transaction_counts_by_quarter(cls, session):
        result = (session.query(
                    extract('year', cls.date).label('year'),
                    func.quarter(cls.date).label('quarter'),
                    func.count('*').label('transaction_count'))
                  .group_by(extract('year', cls.date), func.quarter(cls.date))
                  .all())
        return result

    
