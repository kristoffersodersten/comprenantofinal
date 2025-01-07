from flask import Flask
from flask_wtf.csrf import CSRFProtect

app = Flask(__name__)

# Initialize CSRF protection
csrf = CSRFProtect()
csrf.init_app(app)

@app.route('/submit', methods=['POST'])
def submit_form():
    # CSRF token automatically verified
    return "Form submitted successfully!"

if __name__ == "__main__":
    app.run(debug=True) 