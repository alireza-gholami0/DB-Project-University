from re import escape
from flask import Flask, request, jsonify
from json import dumps
from flask_mysqldb import MySQL
import MySQLdb
from datetime import datetime

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
            # cur.execute(f'''select FoodSchedule_date from foodschedule where idFoodSchedule = {food_schedule_id}
            #             ''')
            # date = date = datetime.strptime(cur.fetchone(), "%Y-%m-%d").date()
            # now = datetime.now()
            # if (date < now):
            #     return {'status': 'unsuccessful', 'msg': 'can not reserve passed meels'}, 400
            cur.execute(
                f'''INSERT INTO student_has_foodschedule values ({username}, {food_schedule_id})''')
            mysql.connection.commit()
            return {'status': 'success'}
        except MySQLdb.IntegrityError as e:
            return {'status': 'unsuccessful', 'msg': 'already reserved'}, 400
        except Exception as e:
            return {'status': 'unsuccessful'},401
    if request.method == 'DELETE':
        cur = mysql.connection.cursor()
        username = data['username']
        food_schedule_id = data['food_schedulec_id']
        try:
            # cur.execute(f'''select FoodSchedule_date from foodschedule where idFoodSchedule = {food_schedule_id}
            #             ''')
            # date = date = datetime.strptime(cur.fetchone(), "%Y-%m-%d").date()
            # now = datetime.now()
            # if (date < now):
            #     return {'status': 'unsuccessful', 'msg': 'can not cancel passed meels'}, 400
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

@app.route('/add_professor_mark', methods=['POST'])
def add_professor_mark():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data['username']
    idsection = data['idsection']
    professor_mark = data['professor_mark']
    cur.execute(f'''SELECT distinct ss.* FROM student stu, student_has_section ss, term t, section s
            WHERE stu.ssn=ss.student_ssn AND ss.Student_ssn = {username} AND ss.Section_idSection = {idsection} AND ss.is_removerd = 0 
            AND t.idterm = s.Term_idTerm AND t.is_current = 1''')
    account = cur.fetchone()
    if account:
        try:
            cur.execute(
                f'''UPDATE student_has_section SET professor_mark = {professor_mark} WHERE Student_ssn = {username} AND Section_idSection = {idsection}''')
            mysql.connection.commit()
            return {'status': 'success'}
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}
    else:
        msg = 'You are not the student of this section or section is removed or section is not in the current term!'
        return {'msg': msg}, 401


@app.route('/add_student_mark', methods=['POST'])
def add_student_mark():
    data = request.get_json()
    if not login_check_professor(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data['username']
    idsection = data['idsection']
    student_ssn = data['student_ssn']
    student_mark = data['student_mark']
    cur.execute(f'''SELECT distinct ss.* FROM section s, student_has_section ss, professor p,  term t
            WHERE s.Professor_idProfessor = p.idprofessor AND s.Professor_idProfessor = {username} AND s.idsection = {idsection}
            AND ss.Section_idSection = {idsection} AND ss.is_signed = 0 AND ss.is_removerd = 0
            AND t.is_current = 1''')
    account = cur.fetchone()
    if account:
        try:
            cur.execute(
                f'''UPDATE student_has_section SET student_mark = {student_mark} WHERE Student_ssn = {student_ssn} AND Section_idSection = {idsection};''')
            mysql.connection.commit()
            cur.execute(
                f'''UPDATE student_has_section SET student_mark = {student_mark} WHERE Student_ssn = {student_ssn} AND Section_idSection = {idsection};''')
            mysql.connection.commit()
            return {'status': 'success'}
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}
    else:
        msg = 'You are not the professor of this section  or section is removed or section is not in the current term!'
        return {'msg': msg}, 401

@app.route('/remove_section', methods=['POST'])
def remove_section():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data['username']
    idsection = data['idsection']

    cur.execute(f'''SELECT distinct ss.* FROM student stu, student_has_section ss, term t, section s
            WHERE stu.ssn=ss.student_ssn AND ss.Student_ssn = {username} AND ss.Section_idSection = {idsection} AND ss.is_removerd = 0 
            AND t.idterm = s.Term_idTerm AND t.is_current = 1''')
    section_student = cur.fetchone()
    if section_student:
        try:
            cur.execute(
                f'''UPDATE student_has_section SET is_removerd = 1 WHERE Student_ssn = {username} AND Section_idSection = {idsection}''')
            mysql.connection.commit()
            return {'status': 'success'}
        except Exception as e:
            print(e)
            return {'status': 'unsuccessful'}
    else:
        msg = 'You are not the student of this section or section is removed or section is not in the current term!'
        return {'msg': msg}, 401

@app.route('/show_meet', methods=['GET'])
def show_meet():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data['username']
    cur.execute(f'''SELECT c.Course_name, count(m.Student_ssn) as Number_of_absences
                    FROM meet m, section s, course c
                    where m.Student_ssn = {username} and s.idsection = m.Section_idSection and s.Course_idCourse = c.idcourse
                    group by c.Course_name;''')

    rv = cur.fetchall()
    print(rv)
    return dumps(rv, default=str)



@app.route('/professors/submitMeet/student/<studentId>', methods=['POST'])
def professor_submit_student_meet(studentId):
    data = request.get_json()
    if not login_check_professor(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    presence = data["presence"]
    date = datetime.now().strftime('%Y-%m-%d')
    # TODO: check if professor has access to section
    sectionId = data["sectionId"]

    try:
        cur.execute(f'''INSERT INTO meet (Student_ssn,Section_idSection,presence,date) values ({studentId}, {sectionId}, presence, "{date}")''')
        mysql.connection.commit()
        return {'status': 'success'}
    except Exception as e:
        print(e)
        return {'status': 'unsuccessful'}

@app.route('/students/edit', methods=['PATCH'])
def edit_student_profile():
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
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
    cur = mysql.connection.cursor()
    username = data["username"]

    try:
        cur.execute(f'''SELECT Professor_idProfessor,Section_idSection,text,date FROM notificatoin n, student_has_section shs
                where n.Section_idSection = shs.Section_idSection and shs.Student_ssn = {username};''')
        rv = cur.fetchall()
        return dumps(rv,default=str)
    except Exception as e:
        print(e)
        return {'status': 'unsuccessful'}

@app.route('/professors/send_notification', methods=['POST'])
def professor_send_notification():
    data = request.get_json()
    if not login_check_professor(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
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

@app.route('/students/views/<view_name>', methods=['GET'])
def get_student_view(view_name):
    data = request.get_json()
    if not login_check_student(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data["username"]

    try:
        cur.execute(f'''SELECT * FROM {escape(view_name)} WHERE ssn = {username}"''')
        mysql.connection.commit()
        rt = cur.fetchall()
        return dumps(rt, default=str)
    except Exception as e:
        print(e)
        return {'status': 'unsuccessful'}

@app.route('/professors/views/<view_name>', methods=['GET'])
def get_professor_view(view_name):
    data = request.get_json()
    if not login_check_professor(data):
        msg = 'Incorrect username / password !'
        return {'msg': msg}, 401
    cur = mysql.connection.cursor()
    username = data["username"]

    try:
        cur.execute(f'''SELECT * FROM {escape(view_name)} WHERE idProfessor = {username}"''')
        mysql.connection.commit()
        rt = cur.fetchall()
        return dumps(rt, default=str)
    except Exception as e:
        print(e)
        return {'status': 'unsuccessful'}

@app.route('/views/<view_name>', methods=['GET'])
def get_general_view(view_name):
    cur = mysql.connection.cursor()

    try:
        cur.execute(f'''SELECT * FROM {escape(view_name)}"''')
        mysql.connection.commit()
        rt = cur.fetchall()
        return dumps(rt, default=str)
    except Exception as e:
        print(e)
        return {'status': 'unsuccessful'}
if __name__ == '__main__':
    app.run(debug=True)
