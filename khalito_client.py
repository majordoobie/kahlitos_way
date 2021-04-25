from fastapi import FastAPI
from typing import Optional
from pydantic import BaseModel
import uvicorn

khalito_client = FastAPI()


class KhaloStatus(BaseModel):
    left_side_temp: float
    left_side_humidity: float
    right_side_temp: float
    left_side_humidity: float
    heat_lamp_on: bool


@khalito_client.get("/")
def read_root():
    return {"Hello": "World"}


@khalito_client.get("/status")
async def read_status():
    return {"Hello": "World"}


if __name__ == "__main__":
    uvicorn.run("khalito_client:khalito_client", host="0.0.0.0", port=8000, log_level="info")
