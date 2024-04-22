from flask import *
from database import *
from detection import *

user=Blueprint("user",__name__)

@user.route("/userhome")
def usershome():

    return render_template("userhome.html")

@user.route("/user_view_message")
def userviewmssg():
    data={}
    qry="select * from message where user_id='%s'"%(session['uid'])
    res=select(qry)
    data['view']=res


    return render_template("user_view_messages.html",data=data)

@user.route("/detect_drowsiness")
def detect_drowsiness():
    data={}
    qry="select * from detection where user_id='%s'"%(session['uid'])
    res=select(qry)
    data['view']=res
    
    return render_template("viewdetection.html",data=data)

@user.route('/camstarts/',methods=['get','post'])
def camstarts():
	data={}
	detect(session['lid'])
	return render_template('userhome.html',data=data)








# @user.route("/useradd_emergency",methods=['get','post'])
# def addemergency():
#     if 'ad' in request.form:
#         emergency=request.form['emer']

#         qry="insert into emergencies values(null,'%s','%s',curdate(),'pending','image')"%(session['uid'],emergency)
#         insert(qry)
     
#     return render_template("user_add_emergency.html")