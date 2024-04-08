from sqlalchemy import INTEGER, ForeignKey, TINYINT
from sqlalchemy.orm import mapped_column, Mapped
from base import Base
from hat import Hat

class Hat_Class(Base):  # OK
    __tablename__= "hat_class"
    hat_id: Mapped[int] = mapped_column('hat_id', INTEGER, ForeignKey(Hat.hat_id), primary_key=True)
    scout: Mapped[int] = mapped_column('scout', TINYINT)
    soldier: Mapped[int] = mapped_column('soldier', TINYINT)
    pyro: Mapped[int] = mapped_column('pyro', TINYINT)
    demoman: Mapped[int] = mapped_column('demoman', TINYINT)
    heavy: Mapped[int] = mapped_column('heavy', TINYINT)
    engineer: Mapped[int] = mapped_column('engineer', TINYINT)
    medic: Mapped[int] = mapped_column('medic', TINYINT)
    sniper: Mapped[int] = mapped_column('sniper', TINYINT)
    spy: Mapped[int] = mapped_column('spy', TINYINT)
