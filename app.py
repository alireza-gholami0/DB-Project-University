from datetime import datetime
from flask import Flask, request, jsonify
from flask_mysqldb import MySQL
from json import dumps

app = Flask(__name__)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'password'
app.config['MYSQL_DB'] = 'university'
app.config['MYSQL_HOST'] = '127.0.0.1' 
mysql = MySQL(app)


def login_check_student(data) -> bool:
    try:
        username = data['username']
        password = data['password']
        cur = mysql.connection.cursor()
        cur.execute(f'''SELECT * FROM student
            WHERE ssn = {username} AND student_password = "{password}"''')
        account = cur.fetchone()
        if account:
            return True
        else:
            return False
    except Exception as e:
        print(e)
        return False

def login_check_professor(data) -> bool:
    try:
        username = data['username']
        password = data['password']
        cur = mysql.connection.cursor()
        cur.execute(f'''SELECT * FROM professor
            WHERE idProfessor = {username} AND password = {password}''')
        account = cur.fetchone()
        if account:
            return True
        else:
            return False
    except:
        return False

@app.route('/reserve_food', methods=['POST'])
def reserve_food():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    if request.method == 'POST':
        cur = mysql.connection.cursor()
        username = data['username']
        food_schedule_id = data['food_schedule_id']
        try:
            cur.execute(f'''INSERT INTO student_has_foodschedule values ({username}, {food_schedule_id})''')
            mysql.connection.commit()
            return {'status': 'success'}
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}


@app.route('/exam_schedule', methods=['GET'])
def exam_schedule():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data['username']
    cur.execute(f'''SELECT e.section_idsection, e.Exam_date, e.Exam_time FROM student s, student_has_exam she, exam e
                    where s.ssn = {username} and s.ssn = she.Student_ssn and e.idExam = she.Exam_idExam ;''')
    
    rv = cur.fetchall()
    return jsonify(rv)


@app.route('/students/edit', methods=['PATCH'])
def edit_student_profile():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    if request.method == 'PATCH':
        cur = mysql.connection.cursor()

        set_params= []
        set_params.append("student_name="+data["student_name"] if "student_name" in data else "")
        set_params.append("student_email="+data["student_email"] if "student_email" in data else "")
        set_params.append("student_city="+data["student_city"] if "student_city" in data else "")
        set_params.append("student_phone="+data["student_phone"] if "student_phone" in data else "")
        set_params.append("student_address="+data["student_address"] if "student_address" in data else "")

        try:
            cur.execute(f"UPDATE student SET "+ ",".join(set_params))
            mysql.connection.commit()
            return {'status': 'success'}
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}

@app.route('/professors/edit', methods=['PATCH'])
def edit_professor_profile():
    data = request.get_json()
    if not login_check_professor(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    if request.method == 'PATCH':
        cur = mysql.connection.cursor()

        set_params= []
        set_params.append("name="+data["professor_name"] if "professor_name" in data else "")
        set_params.append("email="+data["professor_email"] if "professor_email" in data else "")
        set_params.append("city="+data["professor_city"] if "professor_city" in data else "")
        set_params.append("phone_number="+data["professor_phone"] if "professor_phone" in data else "")
        set_params.append("address="+data["professor_address"] if "professor_address" in data else "")
        set_params.append("office="+data["professor_office"] if "professor_office" in data else "")

        try:
            cur.execute(f"UPDATE professor SET "+ ",".join(set_params))
            mysql.connection.commit()
            return {'status': 'success'}
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}


@app.route('/students/section_selection', methods=['POST'])
def student_section_selection():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    if request.method == 'POST':
        cur = mysql.connection.cursor()
        username = data["username"]
        sectionIds = data["sectionIds"]


        # TODO: more checks before query
        try:
            for id in sectionIds:
                cur.execute(f'''INSERT INTO student_has_section (Student_ssn,Section_idSection) values ({username}, {id})''')
            mysql.connection.commit()
            return {'status': 'success'}
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}


@app.route('/students/notifications', methods=['GET'])
def get_student_notifications():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    if request.method == 'GET':
        cur = mysql.connection.cursor()
        username = data["username"]

        try:
            cur.execute(f'''SELECT Professor_idProfessor,Section_idSection,text,date FROM notificatoin n, student_has_section shs
                    where n.Section_idSection = shs.Section_idSection and shs.Student_ssn = {username};''')
            rv = cur.fetchall()
            return dumps(rv)
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}

@app.route('/professors/send_notification', methods=['POST'])
def professor_send_notification():
    data = request.get_json()
    if login_check_professor(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    if request.method == 'POST':
        cur = mysql.connection.cursor()
        username = data["username"]
        text = data["text"]
        # TODO: check if professor has access to section
        sectionId = data["sectionId"]
        date = datetime.now().strftime('%Y-%m-%d')

        try:
            cur.execute(f'''INSERT INTO notificatoin (Professor_idProfessor,Section_idSection,text,date) values ({username}, {sectionId}, "{text}", "{date}")''')
            mysql.connection.commit()
            return {'status': 'success'}
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}

if __name__ == '__main__':
    app.run(debug=True)
