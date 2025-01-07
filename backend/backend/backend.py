import os
import requests
from flask import Flask, jsonify, request
from google.cloud import texttospeech

# Load environment variables
GROQ_API_BASE_URL = os.getenv("GROQ_API_BASE_URL")
GROQ_API_KEY = os.getenv("GROQ_API_KEY")

if not GROQ_API_BASE_URL or not GROQ_API_KEY:
    raise EnvironmentError("GROQ_API_BASE_URL and GROQ_API_KEY must be set")

# Initialize Flask app
app = Flask(__name__)

# Headers for GROQ API
headers = {
    "Authorization": f"Bearer {GROQ_API_KEY}",
    "Content-Type": "application/json",
}

# Forward requests to the backend
BACKEND_URL = "https://your-backend-domain.com"  # Use HTTPS

@app.route("/content", methods=["GET"])
def get_content():
    """Fetch content from the GROQ API."""
    try:
        response = requests.get(f"{GROQ_API_BASE_URL}/content", headers=headers)
        response.raise_for_status()
        return jsonify(response.json())
    except requests.RequestException as e:
        return jsonify({"error": f"Error fetching content: {str(e)}"}), 500


@app.route("/clean", methods=["POST"])
def clean_text():
    """Clean up filler words or unwanted content from the provided text."""
    data = request.json
    text = data.get("text", "")
    if not text:
        return jsonify({"error": "No text provided"}), 400

    try:
        response = requests.post(
            f"{GROQ_API_BASE_URL}/clean", headers=headers, json={"text": text}
        )
        response.raise_for_status()
        return jsonify(response.json())
    except requests.RequestException as e:
        return jsonify({"error": f"Groq API error: {str(e)}"}), 500


@app.route("/translate", methods=["POST"])
def translate_text():
    """Translate the provided text into the target language."""
    data = request.json
    text = data.get("text", "")
    target_language = data.get("language", "en")  # Default to English
    if not text:
        return jsonify({"error": "No text provided"}), 400

    try:
        response = requests.post(
            f"{GROQ_API_BASE_URL}/translate",
            headers=headers,
            json={"text": text, "language": target_language},
        )
        response.raise_for_status()
        return jsonify(response.json())
    except requests.RequestException as e:
        return jsonify({"error": f"Groq API error: {str(e)}"}), 500


@app.route("/transcribe", methods=["POST"])
def transcribe_audio():
    """Transcribe an audio file using the GROQ API."""
    data = request.json
    audio_file = data.get('audio_file')  # Receive the audio file from the front-end
    language = data.get('language', 'auto')  # Default to 'auto' if no language is specified

    if not audio_file:
        return jsonify({"error": "No audio file provided"}), 400

    try:
        response = requests.post(
            f"{GROQ_API_BASE_URL}/transcribe",
            headers=headers,
            json={'audio_file': audio_file, 'language': language}
        )
        response.raise_for_status()
        return jsonify(response.json())
    except requests.RequestException as e:
        return jsonify({'error': f'Groq API error: {str(e)}'}), 500


@app.route("/synthesize", methods=["POST"])
def synthesize_speech():
    """Synthesize speech from text using Google TTS."""
    data = request.json
    text = data.get("text", "")
    if not text:
        return jsonify({"error": "No text provided"}), 400

    try:
        client = texttospeech.TextToSpeechClient()
        synthesis_input = texttospeech.SynthesisInput(text=text)
        voice = texttospeech.VoiceSelectionParams(
            language_code="en-US", ssml_gender=texttospeech.SsmlVoiceGender.NEUTRAL
        )
        audio_config = texttospeech.AudioConfig(
            audio_encoding=texttospeech.AudioEncoding.MP3
        )
        response = client.synthesize_speech(
            input=synthesis_input, voice=voice, audio_config=audio_config
        )

        output_file = "output.mp3"
        with open(output_file, "wb") as out:
            out.write(response.audio_content)

        return jsonify({"message": f"Audio content written to {output_file}"})
    except Exception as e:
        return jsonify({"error": f"Google TTS error: {str(e)}"}), 500


@app.route('/text-to-speech', methods=['POST'])
def text_to_speech_proxy():
    data = request.json
    response = requests.post(f"{BACKEND_URL}/text-to-speech", json=data)
    return jsonify(response.json()), response.status_code


if __name__ == "__main__":
    context = ('cert.pem', 'key.pem')  # Path to your SSL certificate and key
    app.run(debug=True, port=5000, ssl_context=context)
