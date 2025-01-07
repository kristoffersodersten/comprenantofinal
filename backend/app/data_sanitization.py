from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['POST'])
def handle_data():
    try:
        data = request.get_json()
        # Sanitize input
        sanitized_data = {key: str(value).strip() for key, value in data.items()}
        return jsonify({"status": "success", "data": sanitized_data})
    except Exception as e:
        return jsonify({"error": "Invalid input", "details": str(e)}), 400

if __name__ == "__main__":
    app.run(debug=True) 