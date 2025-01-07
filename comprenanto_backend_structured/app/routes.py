from flask import jsonify, request
from . import create_app

app = create_app()

@app.route('/api/data', methods=['POST'])
def handle_data():
    try:
        data = request.get_json()
        # Sanitize input
        sanitized_data = {key: str(value).strip() for key, value in data.items()}
        return jsonify({"status": "success", "data": sanitized_data})
    except Exception as e:
        return jsonify({"error": "Invalid input", "details": str(e)}), 400

@app.route('/submit', methods=['POST'])
def submit_form():
    # CSRF token automatically verified
    return "Form submitted successfully!"
