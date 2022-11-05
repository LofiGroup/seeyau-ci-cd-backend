import os

from fastapi import FastAPI, Depends, UploadFile
from fastapi.staticfiles import StaticFiles
import uvicorn

from android import android_router

IS_DEBUG_VERSION = os.getenv("IS_DEBUG_VERSION", False)

if IS_DEBUG_VERSION:
    app = FastAPI()
else:
    app = FastAPI(docs_url=None, redoc_url=None)

app.mount("/static", StaticFiles(directory="static"), name="static")
app.include_router(android_router)


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000, log_level="info", debug=True)
