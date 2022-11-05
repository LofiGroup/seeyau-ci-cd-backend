import os

from fastapi import Depends, HTTPException, status, APIRouter
from fastapi.security import OAuth2PasswordBearer, OAuth2AuthorizationCodeBearer, HTTPAuthorizationCredentials

oauth_scheme = OAuth2AuthorizationCodeBearer(tokenUrl="token", authorizationUrl="auth")
credentials_exception = HTTPException(
    status_code=status.HTTP_401_UNAUTHORIZED,
    detail="Could not validate credentials",
    headers={"WWW-Authenticate": "Bearer"},
)

ACCESS_TOKEN = os.getenv("ADMIN_ACCESS_TOKEN")


auth_router = APIRouter()


def verify_access_token(token: str):
    if token != ACCESS_TOKEN:
        raise credentials_exception
