from flask import Flask
from .security import csrf
from .error_handlers import handle_bad_request
from .logging_middleware import log_request_info, log_response_info

def create_app():
    app = Flask(__name__)

    # Initialize CSRF protection
    csrf.init_app(app)

    # Register error handlers
    app.register_error_handler(CustomBadRequest, handle_bad_request)

    # Register logging middleware
    app.before_request(log_request_info)
    app.after_request(log_response_info)

    return app
