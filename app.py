from json import dumps
import MySQLdb
from flask import Flask, request
from flask_mysqldb import MySQL

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
                f'''DELETE FROM student_has_foodschedule where Student_ssn = {username}''')
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


if __name__ == '__main__':
    app.run(debug=True)

