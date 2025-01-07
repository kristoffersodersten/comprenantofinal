import os
import requests
from flask import Flask, jsonify, request

# Load environment variables
GROQ_API_BASE_URL = os.getenv("GROQ_API_BASE_URL")
GROQ_API_KEY = os.getenv("GROQ_API_KEY")

headers = {
    "Authorization": f"Bearer {GROQ_API_KEY}",
    "Content-Type": "application/json",
}

app = Flask(__name__)

# Forward requests to the backend
BACKEND_URL = "https://your-backend-domain.com"  # Use HTTPS

@app.route("/content", methods=["GET"])
def get_content():
    # Existing code for fetching content
    pass


@app.route("/clean", methods=["POST"])
def clean_text():
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


@app.route('/text-to-speech', methods=['POST'])
def text_to_speech_proxy():
    data = request.json
    response = requests.post(f"{BACKEND_URL}/text-to-speech", json=data)
    return jsonify(response.json()), response.status_code


if __name__ == "__main__":
    context = ('cert.pem', 'key.pem')  # Path to your SSL certificate and key
    app.run(debug=True, port=5000, ssl_context=context)
