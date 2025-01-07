import logging
from flask import request

logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

def log_request_info():
    logging.info("Headers: %s", request.headers)
    logging.info("Body: %s", request.get_data())

def log_response_info(response):
    logging.info("Response status: %s", response.status)
    logging.info("Response body: %s", response.get_data(as_text=True))
    return response
