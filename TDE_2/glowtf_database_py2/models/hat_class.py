from sqlalchemy import INTEGER, INTEGER, VARCHAR
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base
from models.hat import Hat

class Hat_Class(Base): 
    __tablename__= "class"
    class_id: Mapped[int] = mapped_column('hat_id', INTEGER, autoincrement=True, primary_key=True)
    class_name: Mapped[str] = mapped_column('class_name', VARCHAR(50))
