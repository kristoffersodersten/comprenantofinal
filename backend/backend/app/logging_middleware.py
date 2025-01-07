import logging
from flask import Flask, request

app = Flask(__name__)

# Set up logging
logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

@app.before_request
def log_request_info():
    logging.info("Headers: %s", request.headers)
    logging.info("Body: %s", request.get_data())

@app.after_request
def log_response_info(response):
    logging.info("Response status: %s", response.status)
    logging.info("Response body: %s", response.get_data(as_text=True))
    return response

if __name__ == "__main__":
    app.run(debug=True) 