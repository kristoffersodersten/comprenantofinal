from flask import jsonify
from werkzeug.exceptions import BadRequest
import json

class CustomBadRequest(BadRequest):
    def get_response(self, environ=None):
        response = super().get_response(environ)
        response.data = json.dumps({
            "error": "Bad Request",
            "message": self.description
        })
        response.content_type = "application/json"
        return response

def handle_bad_request(e):
    return e.get_response()
