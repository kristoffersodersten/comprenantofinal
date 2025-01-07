import asyncio
import websockets
import sys
import whisper
from googletrans import Translator
import logging
import torch
import coremltools as ct

# Set up logging
logging.basicConfig(level=logging.WARNING)

# Determine the device to use
device = "mps" if torch.backends.mps.is_available() else "cpu"
print(f"MPS available: {torch.backends.mps.is_available()}")

try:
    # Load the model, specifying the device
    model = whisper.load_model("tiny").to(device)
except Exception as e:
    print(f"Error loading model on MPS: {e}")
    # Fallback to CPU if MPS fails
    device = "cpu"
    model = whisper.load_model("tiny").to(device)

async def test_websocket():
    uri = "ws://127.0.0.1:8000/ws/transcribe"
    async with websockets.connect(uri) as websocket:
        with open("sample_audio.wav", "rb") as audio:
            await websocket.send(audio.read())
        response = await websocket.recv()
        print(f"Transcription: {response}")

        # Initialize the translator
        translator = Translator()
        # Translate the transcribed text from English to Spanish
        translated_text = translator.translate(response, src='en', dest='es').text
        print(f"Translated text: {translated_text}")

print(sys.path)

result = model.transcribe("sample_audio.wav", language="en")
print(f"Detected language: {result['language']}")

asyncio.run(test_websocket())

mlmodel = ct.convert(model, inputs=[ct.TensorType(name="input", shape=(1, 80, 3000))])
mlmodel.save("Whisper.mlmodel")
