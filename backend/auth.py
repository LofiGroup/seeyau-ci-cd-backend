import os
import jwt

from fastapi import Depends, HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer, OAuth2AuthorizationCodeBearer, HTTPAuthorizationCredentials

from utils.time_utils import current_time_in_millis

oauth_scheme = OAuth2AuthorizationCodeBearer(tokenUrl="token", authorizationUrl="auth")
credentials_exception = HTTPException(
    status_code=status.HTTP_401_UNAUTHORIZED,
    detail="Could not validate credentials",
    headers={"WWW-Authenticate": "Bearer"},
)

JWT_SIGNING_KEY = os.getenv("JWT_SIGNING_KEY")

ADMIN_ACCESS_TOKEN = os.getenv("ADMIN_ACCESS_TOKEN")
auth_router = APIRouter()


def verify_upload_access_token(token: str):
    if token != ADMIN_ACCESS_TOKEN:
        raise credentials_exception


def decrypt_token(token: str) -> str | None:
    try:
        payload = jwt.decode(token, JWT_SIGNING_KEY, algorithms=["HS256"])

        data: str = payload.get("sub")
        if data is None:
            return None
    except jwt.ExpiredSignatureError:
        return None
    except jwt.PyJWTError:
        return None
    return data


def generate_token(data: str, expiry: int) -> str:
    expires_in = (current_time_in_millis() + expiry) // 1000
    data = {"sub": data, "exp": expires_in}
    token = jwt.encode(data, JWT_SIGNING_KEY, algorithm="HS256")
    return token
