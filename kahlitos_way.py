from fastapi import FastAPI
from sqlalchemy import desc
import uvicorn

from database import session_scope, TankUpdate

khalito_client = FastAPI()


@khalito_client.get("/")
def read_root():
    return {"Hello": "Not world?"}


@khalito_client.get("/status")
async def read_status():
    with session_scope() as session:
        update = session.query(TankUpdate).order_by(desc(TankUpdate.update_date)).limit(1)

    update: TankUpdate = update[0]
    return update.to_dict


if __name__ == "__main__":
    uvicorn.run("khalitos_way:khalito_client", host="0.0.0.0", port=8000, log_level="info", reload=True)
