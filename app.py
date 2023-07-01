from flask import Flask, request, jsonify, session
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'password'
app.config['MYSQL_DB'] = ''
app.config['MYSQL_HOST'] = 'localhost' 
app.secret_key = 'super secret key'
mysql = MySQL(app)


def login_check_student(request) -> bool:
    username = request.json['username']
    password = request.json['password']
    cur = mysql.connection.cursor()
    cur.execute(f'''SELECT * FROM student
        WHERE ssn = {username} AND student_password = {password}''')
    account = cur.fetchone()
    if account:
        return 1
    else:
        return 0

def login_check_professor(request) -> bool:
    username = request.json['username']
    password = request.json['password']
    cur = mysql.connection.cursor()
    cur.execute(f'''SELECT * FROM professor
        WHERE idProfessor = {username} AND password = {password}''')
    account = cur.fetchone()
    if account:
        return True
    else:
        return False

@app.route('/reserve_food', methods=['POST'])
def product_categories():
    if not login_check_student(request):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    if request.method == 'POST':
        cur = mysql.connection.cursor()
        data = request.get_json()
        # cur.execute('''SELECT * FROM reserve;''')
        rv = cur.fetchall()
        return jsonify(rv)



if __name__ == '__main__':
    app.run(debug=True)