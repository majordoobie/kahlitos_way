from fastapi import FastAPI
from uvicorn import run

kahlitos_app = FastAPI()


@kahlitos_app.get("/")
async def root():
    return {"message": "Hello World"}


@kahlitos_app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}

if __name__ == "__main__":
    run("main:kahlitos_app", host="localhost", port=8000, log_level="info")
