from sqlalchemy import VARCHAR, INTEGER, CHAR, Enum, BOOLEAN, func
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base

class User(Base):
    __tablename__ = "user"
    user_id: Mapped[int] = mapped_column('id', INTEGER, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column('name', VARCHAR(100), nullable=False)
    gender: Mapped[enumerate] = mapped_column('gender', Enum('Masculino', 'Feminino', 'Outro'), nullable=False) 
    state: Mapped[str] = mapped_column('state', CHAR(2), nullable=False)
    cpf: Mapped[int] = mapped_column('cpf', CHAR(11), nullable=False, unique=True)
    email: Mapped[str] = mapped_column('email', VARCHAR(50), nullable=False, unique=True)
    password: Mapped[str] = mapped_column('password', VARCHAR(30), nullable=False)
    admin: Mapped[bool] = mapped_column('admin', BOOLEAN, nullable=False)
    steam_id: Mapped[str] = mapped_column('id_steam', CHAR(17), nullable=False)

    def __repr__(self):
            return (
                f"<User(id={self.id}, name={self.name}, gender={self.gender}, "
                f"state={self.state}, cpf={self.cpf}, email={self.email}, "
                f"password={self.password}, admin={self.admin}, steam_id={self.steam_id})>"
            )
            
    @classmethod
    def count_users_by_gender(cls, session):
        return session.query(cls.gender, func.count(cls.user_id).label('total_users')).group_by(cls.gender).all()
    
    @classmethod
    def count_users_by_state(cls, session):
        return session.query(cls.state, func.count(cls.user_id).label('total_users')).group_by(cls.state).all()
    
    @classmethod
    def get_transaction_count_per_user(cls, session):
        from models import Sale
        result = session.query(
            cls.name.label('user_name'),
            func.count(Sale.sale_id).label('transaction_count')
        ).outerjoin(
            Sale, User.user_id == Sale.user_id
        ).group_by(
            User.user_id
        ).all()
        return result
        