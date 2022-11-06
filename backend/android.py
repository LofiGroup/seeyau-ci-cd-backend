import os

from fastapi import APIRouter, Depends, UploadFile, File

from utils.file import save_file
from utils.random_utils import generate_random_string
from auth import verify_access_token

base_url = os.getenv("BASE_URL")

android_router = APIRouter(
    prefix="/android",
)


@android_router.post("/upload-apk")
async def upload_apk(access_token: str, version: str, file: UploadFile = File(media_type="application/octet-stream")):
    verify_access_token(access_token)
    filename = f"plum{version}_{generate_random_string(30, False)}"
    save_file(filename, file)
    return {"url": f"{base_url}/static/{filename}.apk"}
