from sqlalchemy import DATE, VARCHAR, INTEGER, SMALLINT, BOOLEAN, CHAR, Enum, SmallInteger, ForeignKey
from sqlalchemy.orm import DeclarativeBase, mapped_column, Mapped
from datetime import datetime
from connection import engine

class Base(DeclarativeBase):
    pass

class User(Base):
    __tablename__ = "user"
    user_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, 
                                         autoincrement=True, nullable=False, unique=True)
    name: Mapped[str] = mapped_column(VARCHAR(100), nullable=False)
    cpf: Mapped[int] = mapped_column(CHAR(11), nullable=False)
    email: Mapped[str] = mapped_column(VARCHAR(50), nullable=False)
    password: Mapped[str] = mapped_column(VARCHAR(30), nullable=False)
    admin: Mapped[int] = mapped_column(SMALLINT, nullable=False)

class Cart(Base):
    #__tablename__: "cart"
    #user_id: Mapped[int] = mapped_column('id', INTEGER, ForeignKey(User.user_id), primary_key=True)
    #date: Mapped[datetime] = mapped_column(DATE, nullable=False)
    pass

Base.metadata.drop_all(bind=engine)
Base.metadata.create_all(bind=engine) # Cria todas as tabelas ligadas pela Base caso não existam
