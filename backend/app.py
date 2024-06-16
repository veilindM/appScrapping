from flask import Flask, request, jsonify
from flask_cors import CORS
from scrapping_module import scrape_products

app = Flask(__name__)
CORS(app)

@app.route('/', methods=['GET'])
def home():
    return "Welcome to the scraping app!"

@app.route('/scrape', methods=['POST'])
def scrape():
    data = request.get_json()
    product_name = data.get('product_name')
    pages = data.get('pages')
    
    try:
        filename = scrape_products(product_name, pages)
        return jsonify({"status": "success", "filename": filename})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, port=5000)
