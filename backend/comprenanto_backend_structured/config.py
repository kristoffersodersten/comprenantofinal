import os

# Basic configuration
class Config:
    SECRET_KEY = os.environ.get("SECRET_KEY", "your_secret_key") # Use environment variable for production
    GROQ_API_KEY = os.environ.get("GROQ_API_KEY", "your_groq_api_key") # Use environment variable for production
    GOOGLE_APPLICATION_CREDENTIALS = os.environ.get("GOOGLE_APPLICATION_CREDENTIALS", "path/to/your/google/credentials.json") # Use environment variable for production
    DEBUG = os.environ.get("DEBUG", True) # Use environment variable for production
    
    # Add other configuration variables here
