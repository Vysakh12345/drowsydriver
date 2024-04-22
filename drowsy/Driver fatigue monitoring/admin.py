from flask import *
from admin import *

from database import *

admin=Blueprint('admin',__name__)

@admin.route('/adminhome',methods=['get','post'])
def adminhome():
    return render_template('adminhome.html')

@admin.route('/registeremergency',methods=['get','post'])
def registeremergency():

    if 'register' in request.form:
        fnm=request.form['fname']
        lnm=request.form['lname']
        uname=request.form['uname']
        pswd=request.form['pswd']
        type=request.form['type']
        ph=request.form['phone']
        em=request.form['email']

        qry1="insert into login values(null,'%s','%s','emergency')"%(uname,pswd)
        lid=insert(qry1)

        qry="insert into registeremergency values(null,'%s','%s','%s','%s','%s','%s')"%(fnm,lnm,type,ph,em,lid)
        insert(qry)

    return render_template('registeremergency.html')

@admin.route('/viewcar', methods=['get', 'post'])
def show():

    data={}
    qry="select * from user"
    data['show']=select(qry)
    
    return render_template('viewcar.html',data=data)

@admin.route('/viewdetection',methods=['get','post'])
def warning():
    
    data={}
    qry="select * from detection"
    data['vie']=select(qry)

    return render_template('viewdetection.html',data=data)

@admin.route('/accidents',methods=['get','post'])
def detection():

    data={}
    qry="select * from emergencies inner join user using(user_id)"
    data['det']=select(qry)

    return render_template('accidents.html',data=data)

@admin.route('/warning',methods=['get','post'])
def message():

    id=request.args['id']

    if 'send' in request.form:
        description=request.form['warning']

        qry="insert into message values(null,'%s','%s','pending',curdate())"%(id,description)
        insert(qry)

    return render_template('warning.html')

@admin.route('/homepage',methods=['get','post'])
def logout():
    return render_template('homepage.html')