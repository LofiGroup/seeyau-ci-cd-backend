import os

from fastapi import APIRouter, Depends, UploadFile, File
from fastapi.responses import FileResponse

from utils.file import save_file
from utils.random_utils import generate_random_string
from auth import verify_upload_access_token, decrypt_token, generate_token, credentials_exception
import utils.time_utils as Time

base_url = os.getenv("BASE_URL")

android_router = APIRouter(
    prefix="/android",
)


@android_router.post("/upload-apk")
async def upload_apk(access_token: str, version: str, file: UploadFile):
    verify_upload_access_token(access_token)
    filename = f"plum_{version}.apk"
    save_file(filename, file)

    download_token = generate_token(filename, 2*Time.month)
    return {"url": f"{base_url}/android/get-apk?access_token={download_token}"}


@android_router.get("/get-apk", response_model=FileResponse)
async def get_apk(access_token: str):
    file_name = decrypt_token(access_token)
    if file_name is None:
        raise credentials_exception

    return f"static/{file_name}"
