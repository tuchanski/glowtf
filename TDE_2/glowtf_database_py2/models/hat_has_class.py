from sqlalchemy import INTEGER, ForeignKey
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base
from models.hat_class import Hat_Class

# Adicionado PK em hat_has_classes -> Não gera sem.
class Hat_Has_Class(Base):
    __tablename__ = "hat_has_class"
    hat_has_class_pk: Mapped[int] = mapped_column('hat_has_class_pk', INTEGER, primary_key=True, autoincrement=True)
    hat_id: Mapped[int] = mapped_column('hat_id', INTEGER, nullable=False)
    class_id: Mapped[int] = mapped_column('class_id', INTEGER, ForeignKey(Hat_Class.class_id),nullable=False)
