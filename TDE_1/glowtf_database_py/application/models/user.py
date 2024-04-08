from sqlalchemy import VARCHAR, INTEGER, CHAR, TINYINT
from sqlalchemy.orm import mapped_column, Mapped
from base import Base

class User(Base): # OK
    __tablename__ = "user"
    user_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(100), nullable=False)
    cpf: Mapped[int] = mapped_column('cpf', CHAR(11), nullable=False)
    email: Mapped[str] = mapped_column('email', VARCHAR(50), nullable=False)
    password: Mapped[str] = mapped_column('password', VARCHAR(30), nullable=False)
    admin: Mapped[int] = mapped_column('admin', TINYINT, nullable=False)
