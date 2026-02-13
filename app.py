from flask import Flask, jsonify

# Create the Flask instance
app = Flask(__name__)

@app.route('/')
def home():
    return jsonify(message="Flask CI/CD Template is Live!", status="Success")

@app.route('/health')
def health():
    return jsonify(status="UP"), 200

# This "if" block is crucial! It prevents circular imports during testing.
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)