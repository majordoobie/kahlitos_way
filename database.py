from contextlib import contextmanager

from sqlalchemy import Boolean, Column, DateTime, Float, create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm.session import Session

from config import DATABASE_URI

Base = declarative_base()


# Model
class TankUpdate(Base):
    __tablename__ = "tank_update"
    update_date = Column(DateTime, primary_key=True)

    # Left side
    left_side_temp = Column(Float)
    left_side_humidity = Column(Float)

    # Right side
    right_side_temp = Column(Float)
    right_side_humidity = Column(Float)

    # heat lamp status
    heat_lamp_on = Column(Boolean)

    def __repr__(self):
        return f"{self.update_date} {self.left_side_temp}"


# Create an engine object, create the databases if they don't exist, create a session factory
ENGINE = create_engine(DATABASE_URI)
Base.metadata.create_all(bind=ENGINE)
SESSION = sessionmaker(bind=ENGINE)


@contextmanager
def session_scope() -> Session:
    """
    Function that takes the engine object and returns a session context

    Returns
    -------
    session: Session
        Transaction session to interact with the database
    """
    session = SESSION()
    try:
        yield session
        session.commit()
    except:
        session.rollback()
        raise
    finally:
        session.close()
