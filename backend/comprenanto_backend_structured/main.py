from fastapi import FastAPI, Request, UploadFile, File, HTTPException
from fastapi.security import HTTPBasic, HTTPBasicCredentials
from typing import Dict
import os
import json
import re
import secrets
from datetime import datetime, timedelta
from jose import jwt
from config import Config
from dotenv import load_dotenv
import ssl
import Security

# Load environment variables from .env file
load_dotenv(dotenv_path=os.path.join(os.path.dirname(__file__), 'env', '.env'))

app = FastAPI()
security = HTTPBasic()
config = Config()

# In-memory user database (replace with a real database in production)
users = {
    "user@example.com": {"password": "password123", "id": 1}
}

# JWT settings
JWT_SECRET = config.SECRET_KEY
JWT_ALGORITHM = "HS256"
JWT_EXPIRY_MINUTES = 30

def create_jwt_token(user_id: int) -> str:
    payload = {
        "user_id": user_id,
        "exp": datetime.utcnow() + timedelta(minutes=JWT_EXPIRY_MINUTES)
    }
    return jwt.encode(payload, JWT_SECRET, algorithm=JWT_ALGORITHM)

def authenticate_user(credentials: HTTPBasicCredentials) -> Dict:
    user = users.get(credentials.username)
    if user and user["password"] == credentials.password:
        return user
    raise HTTPException(status_code=401, detail="Invalid credentials")

@app.post("/api/auth/login")
async def login(credentials: HTTPBasicCredentials = security):
    user = authenticate_user(credentials)
    token = create_jwt_token(user["id"])
    return {"token": token, "expires_in": JWT_EXPIRY_MINUTES * 60}

@app.post("/api/auth/register")
async def register(request: Request):
    data = await request.json()
    username = data.get("username")
    password = data.get("password")
    if not username or not password:
        raise HTTPException(status_code=400, detail="Username and password are required")
    if username in users:
        raise HTTPException(status_code=400, detail="User already exists")
    
    user_id = len(users) + 1
    users[username] = {"password": password, "id": user_id}
    return {"message": "User registered successfully"}

@app.post("/api/transcribe")
async def transcribe(request: Request):
    data = await request.json()
    audio = data.get("audio")
    language = data.get("language", "auto")
    # Placeholder for Groq STT
    return {"transcription": f"Transcription service not implemented. Received audio: {audio[:20]}..., language: {language}"}

@app.post("/api/translate")
async def translate_text(request: Request):
    data = await request.json()
    text = data.get("text")
    source_language = data.get("source_language", "auto")
    target_language = data.get("target_language")
    # Placeholder for Groq translation
    return {"translated_text": f"Translation service not implemented. Received text: {text}, source: {source_language}, target: {target_language}"}

@app.post("/api/text/cleanup")
async def cleanup_text(request: Request):
    data = await request.json()
    text = data.get("text", "")
    # Remove filler words and extra spaces
    clean_text = re.sub(r'\b(umm|uhh|so|like)\b\s*', '', text, flags=re.IGNORECASE)
    clean_text = re.sub(r'\s+', ' ', clean_text).strip()
    return {"clean_text": clean_text}

@app.get("/api/health")
async def health_check():
    return {"status": "ok", "uptime": "Server is running"}

@app.get("/api/version")
async def version():
    return {
        "backend_version": "0.1.0",
        "whisper_version": "V3 Turbo",
        "groq_version": "2.1.5"
    }

@app.post("/api/audio/upload")
async def upload_audio(audio: UploadFile = File(...)):
    file_name = audio.filename
    file_url = f"/audio/{file_name}"
    return {"file_url": file_url}

@app.post("/api/groq/stt")
async def groq_stt(request: Request):
    data = await request.json()
    audio_file = data.get("audio_file")
    language = data.get("language", "en")
    # Placeholder for Groq STT
    return {"transcription": f"STT service not implemented. Received audio: {audio_file[:20]}..., language: {language}"}

# Placeholder for middleware
# You can add your middleware logic here
# For example:
# @app.middleware("http")
# async def add_process_time_header(request: Request, call_next):
#     start_time = time.time()
#     response = await call_next(request)
#     process_time = time.time() - start_time
#     response.headers["X-Process-Time"] = str(process_time)
#     return response

if __name__ == "__main__":
    import uvicorn
    
    # Load SSL/TLS certificates if they exist
    certfile = os.path.join(os.path.dirname(__file__), "certs", "cert.pem")
    keyfile = os.path.join(os.path.dirname(__file__), "certs", "key.pem")
    
    ssl_options = None
    if os.path.exists(certfile) and os.path.exists(keyfile):
        ssl_options = {
            "certfile": certfile,
            "keyfile": keyfile,
            "ssl_version": ssl.PROTOCOL_TLSv1_2,
        }
    
    uvicorn.run(app, host="0.0.0.0", port=8000, ssl=ssl_options)
