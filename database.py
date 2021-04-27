from contextlib import contextmanager

from sqlalchemy import Boolean, Column, BIGINT, DateTime, Float, create_engine, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm.session import Session

from config import DATABASE_URI

Base = declarative_base()


# Model
class TankUpdate(Base):
    __tablename__ = "tank_update"
    id = Column(BIGINT, primary_key=True, autoincrement=True)
    update = Column(DateTime)
    successful_read = Column(Boolean)
    sensor_side = Column(String)
    sensor_temp = Column(Float)
    sensor_humidity = Column(String)
    heat_lamp_on = Column(Boolean)

    def __repr__(self):
        return f"{self.update_date} {self.sensor_side} {self.sensor_temp}"

    @property
    def to_dict(self):
        return {
            "update": self.update.strftime("%m-%d-%y %H:%M"),
            "successful_read": self.successful_read,
            "sensor_side": self.sensor_side,
            "sensor_temp": self.sensor_temp,
            "sensor_humidity": self.sensor_humidity,
            "heat_lamp_on": self.heat_lamp_on
        }


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
