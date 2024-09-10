from fastapi import FastAPI
from sqlalchemy import desc
import uvicorn

from database import session_scope, TankUpdate

kahlito_client = FastAPI()


@kahlito_client.get("/")
def read_root():
    with session_scope() as session:
        update = None


@kahlito_client.get("/status")
async def read_status():
    with session_scope() as session:
        update = session.query(TankUpdate).order_by(desc(TankUpdate.update)).limit(2)

    dict_list = []
    for result in update:
        update: TankUpdate = result
        dict_list.append(update.to_dict)

    return dict_list


if __name__ == "__main__":
    uvicorn.run("kahlitos_way:kahlito_client", host="0.0.0.0", port=8000, log_level="info")
