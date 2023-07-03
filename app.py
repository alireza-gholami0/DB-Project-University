from json import dumps
import MySQLdb
from flask import Flask, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'password'
app.config['MYSQL_DB'] = 'university'
app.config['MYSQL_HOST'] = 'localhost'
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
            WHERE idProfessor = {username} AND password = "{password}"''')
        account = cur.fetchone()
        if account:
            return True
        else:
            return False
    except Exception as e:
        print(e)
        return False


@app.route('/reserve_food', methods=['PUT', 'DELETE'])
def reserve_food():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    if request.method == 'PUT':
        cur = mysql.connection.cursor()
        username = data['username']
        food_schedule_id = data['food_schedulec_id']
        try:
            cur.execute(
                f'''INSERT INTO student_has_foodschedule values ({username}, {food_schedule_id})''')
            mysql.connection.commit()
            return {'status': 'success'}
        except MySQLdb.IntegrityError as e:
            return {'status': 'unsuccessful', 'msg': 'already reserved'}, 400
        except Exception as e:
            return {'status': 'unsuccessful'},
    if request.method == 'DELETE':
        cur = mysql.connection.cursor()
        username = data['username']
        food_schedule_id = data['food_schedulec_id']
        try:
            cur.execute(
                f'''DELETE FROM student_has_foodschedule where Student_ssn = {username} and  FoodSchedule_idFoodSchedule = {food_schedule_id}''')
            mysql.connection.commit()
            return {'status': 'success'}
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}, 400


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
    rt = {'desc': ['seciton id', 'exam date', 'exam time'],
          'data': rv}
    print(rt)
    return dumps(rt, default=str)


@app.route('/grade_report', methods=['GET'])
def grade_report():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data['username']
    cur.execute(f'''SELECT c.Course_name, section_idsection,student_mark,is_passed,is_removerd,is_signed
                FROM course as c,section as s, student_has_section as shs
                where shs.student_ssn = {username} and shs.Section_idSection = s.idSection  and s.Course_idCourse = c.idcourse; ;''')

    rv = cur.fetchall()
    rt = {'desc': ['course name', 'section id', 'student mark', 'is passed', 'is removed', 'is signed'],
          'data': rv}
    print(rt)
    return dumps(rt, default=str)


@app.route('/add_section', methods=['PUT'])
def add_section():
    data = request.get_json()
    if not login_check_professor(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()

    username = data['username']
    dep_id = data["dep_id"]
    term_id = data["term_id"]
    course_id = data["course_id"]
    prffesor_id = data["proffesor_id"]
    exam_date = data["exam_date"]
    capacity = data["Section_capacity"]
    exam_time = data["exam_time"]
    cur.execute(f'''select idDepartment from department where idDepartment = {dep_id} and Manager_idProfessor = {username}
                ''')
    id = cur.fetchone()
    if not id:
        msg = 'not authorized'
        return {'msg': msg}, 401

    try:
        cur.execute(f'''insert into section(Term_idTerm,Course_idCourse,Professor_idProfessor,exam_date,Section_capacity,exam_time) 
                    values({term_id}, {course_id},{prffesor_id},"{exam_date}",{capacity},"{exam_time}");''')

        mysql.connection.commit()
        return {'status': 'success'}
    except Exception as e:
        print(e)
        return {'status': 'unsuccessful'}, 400


@app.route('/class_schedule', methods=['GET'])
def class_schedule():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data['username']
    cur.execute(f'''SELECT d.section_idsection, d.day_of_week, d.time, c.Course_name FROM
                    student s, student_has_section shs, dates d , section sc , course c
                    where s.ssn = {username} and s.ssn = shs.Student_ssn and shs.Section_idSection = d.Section_idSection
                    and shs.Section_idSection = sc.idSection and sc.Course_idCourse = c.idCourse ;''')

    rv = cur.fetchall()
    print(rv)
    return dumps(rv, default=str)

@app.route('/prof_class_schedule', methods=['GET'])
def prof_class_schedule():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
   
    cur.execute(f'''SELECT p.name, d.section_idsection, d.day_of_week, d.time, c.Course_name FROM
                    professor p, section sc , course c , dates d
                    where  p.idProfessor = sc.Professor_idProfessor and sc.Course_idCourse = c.idCourse
                    and sc.idSection = d.Section_idSection ;''')

    rv = cur.fetchall()
    print(rv)
    return dumps(rv, default=str)

@app.route('/prof_average', methods=['GET'])
def prof_average():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
   
    cur.execute(f'''SELECT name, avg_mark FROM
                    professor ;''')

    rv = cur.fetchall()
    print(rv)
    return dumps(rv, default=str)


@app.route('/inventory_increase', methods=['PUT'])
def inventory_increase():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    
    cur = mysql.connection.cursor()
    username = data['username']
    count = data['count']
    try:
        cur.execute(
            f'''SELECT student_balance FROM student where ssn = {username}''')
        before = cur.fetchall()
        cur.execute(
            f'''UPDATE student SET student_balance = student_balance +  {count} where ssn = {username}''')
        mysql.connection.commit()
        cur.execute(
            f'''SELECT student_balance FROM student where  ssn = {username} ''')
        mysql.connection.commit()
        rv = cur.fetchall()
        print(rv)
        dict = {
            "before balance": before,
            "new balance ": rv
            }
        
        return dumps(dict, default=str)
    
    except Exception as e:
        print(e)
        return {'status': 'unsuccessful'}
    

@app.route('/unit_info', methods=['GET'])
def unit_info():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data['username']
    cur.execute(f'''SELECT c.idCourse, d.roomno, p.name , f.Factuly_name , c.Course_name FROM
                    dates d , section sc , course c , professor p , department dt , factuly f
                    where sc.Course_idCourse = c.idCourse and sc.Professor_idProfessor = p.idProfessor 
                    and d.Section_idSection = sc.idSection and  c.Department_idDepartment = dt.idDepartment 
                    and dt.Factuly_idFactuly = f.idFactuly  ;''')

    rv = cur.fetchall()
    print(rv)
    return dumps(rv, default=str) 




if __name__ == '__main__':
    app.run(debug=True)
