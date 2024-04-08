from sqlalchemy import VARCHAR, INTEGER, CHAR, Enum, BOOLEAN
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base

class User(Base):
    __tablename__ = "user"
    user_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(100), nullable=False)
    gender: Mapped[enumerate] = mapped_column('gender', Enum('Male', 'Female', 'Other'), nullable=False) 
    state: Mapped[str] = mapped_column('state', CHAR(2), nullable=False)
    cpf: Mapped[int] = mapped_column('cpf', CHAR(11), nullable=False, unique=True)
    email: Mapped[str] = mapped_column('email', VARCHAR(50), nullable=False, unique=True)
    password: Mapped[str] = mapped_column('password', VARCHAR(30), nullable=False)
    admin: Mapped[bool] = mapped_column('admin', BOOLEAN, nullable=False)
    steam_id: Mapped[str] = mapped_column('id_steam', CHAR(17), nullable=False)
