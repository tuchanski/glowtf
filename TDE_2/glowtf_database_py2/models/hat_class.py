from sqlalchemy import INTEGER, INTEGER, VARCHAR, func
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base

class Hat_Class(Base): 
    __tablename__= "class"
    class_id: Mapped[int] = mapped_column('hat_id', INTEGER, autoincrement=True, primary_key=True)
    class_name: Mapped[str] = mapped_column('class_name', VARCHAR(50))

    @classmethod
    def get_class_with_most_purchases(cls, session):
        # Importações dentro do método para evitar importação circular
        from models.hat_has_class import Hat_Has_Class
        from models.sale_has_hat import Sale_Has_Hat
        result = session.query(Hat_Class.class_name, func.count(Hat_Has_Class.hat_id).label('total_purchases')) \
            .join(Hat_Has_Class, Hat_Class.class_id == Hat_Has_Class.class_id) \
            .join(Sale_Has_Hat, Hat_Has_Class.hat_id == Sale_Has_Hat.hat_id) \
            .group_by(Hat_Class.class_name) \
            .order_by(func.count(Hat_Has_Class.hat_id).desc()) \
            .limit(1) \
            .all()
        return result
