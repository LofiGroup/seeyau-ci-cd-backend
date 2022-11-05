import os

from fastapi import APIRouter, Depends, UploadFile

from utils.file import save_file
from utils.random import generate_random_string
from auth import verify_access_token

base_url = os.getenv("BASE_URL")

android_router = APIRouter(
    prefix="/android",
)


@android_router.post("/upload-apk")
async def upload_apk(file: UploadFile, access_token: str):
    verify_access_token(access_token)
    filename = "plum_" + generate_random_string(30)
    save_file(filename, file)
    return {"url": f"{base_url}/static/{filename}.apk"}
