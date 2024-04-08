from sqlalchemy import INTEGER, ForeignKey, INTEGER
from sqlalchemy.orm import mapped_column, Mapped
from services.base import Base
from models.hat import Hat

class Hat_Class(Base): 
    __tablename__= "hat_class"
    hat_id: Mapped[int] = mapped_column('hat_id', INTEGER, ForeignKey(Hat.hat_id), primary_key=True)
    scout: Mapped[int] = mapped_column('scout', INTEGER)
    soldier: Mapped[int] = mapped_column('soldier', INTEGER)
    pyro: Mapped[int] = mapped_column('pyro', INTEGER)
    demoman: Mapped[int] = mapped_column('demoman', INTEGER)
    heavy: Mapped[int] = mapped_column('heavy', INTEGER)
    engineer: Mapped[int] = mapped_column('engineer', INTEGER)
    medic: Mapped[int] = mapped_column('medic', INTEGER)
    sniper: Mapped[int] = mapped_column('sniper', INTEGER)
    spy: Mapped[int] = mapped_column('spy', INTEGER)
