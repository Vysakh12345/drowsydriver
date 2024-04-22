from flask import *
from database import *



emergency=Blueprint('emergency',__name__)



@emergency.route('/emergencyhome',methods=['get','post'])
def emergencyhome():

    return render_template('emergency.html')

@emergency.route('/viewemergency',methods=['get','post'])
def viewemergency():

    data={}
    qry="select * from emergencies"
    data['det']=select(qry)

    return render_template('viewemergency.html',data=data)

@emergency.route('/homepage',methods=['get','post'])
def logout():
    return render_template('homepage.html')