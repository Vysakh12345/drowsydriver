from flask import *
from car import *
from detection import *

car=Blueprint('car',__name__)

@car.route('/carhome',methods=['get','post'])
def carhome():
    return render_template('car.html')

@car.route('/drowsiness',methods=['get','post'])
def detdrow():
    data={}

    l="select * from detection where user_id=(select user_id from user where login_id='%s')"%(session['lid'])
    data['view']=select(l)

    return render_template('drowsiness.html',data=data)

@car.route('/homepage',methods=['get','post'])
def logout():
    return render_template('homepage.html')



