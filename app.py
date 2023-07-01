from flask import Flask, request, jsonify, session
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '1234567p'
app.config['MYSQL_DB'] = ''
app.config['MYSQL_HOST'] = 'localhost' 
app.secret_key = 'super secret key'
mysql = MySQL(app)

@app.route('/product_categories', methods=['GET'])
def product_categories():
    if request.method == 'GET':
        cur = mysql.connection.cursor()
        cur.execute('''SELECT * FROM product_category;''')
        rv = cur.fetchall()
        return jsonify(rv)


if __name__ == '__main__':
    app.run(debug=True)