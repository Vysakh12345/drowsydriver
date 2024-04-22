from flask import *
from database import *

import demjson
import uuid

api=Blueprint("api",__name__)



@api.route("/user_login")
def login():
    data={}

    username=request.args['uname']
    pwd=request.args['pwd']

    print(username,pwd)

    qry="select * from login where username='%s' and password='%s'"%(username,pwd)
    res=select(qry)

    

    if res:
        data['status']='success'
        data['data']=res
    else:
        data['status']='failed'


    return str(data)


        
@api.route("/userreg")
def userreg():
    data={}
    fname=request.args['fname']
    lname=request.args['lname']
    venumber=request.args['vno']
    phone=request.args['phone']
    email=request.args['mail']
    latti=request.args['latitude']
    longi=request.args['longitude']
    username=request.args['uname']
    pwd=request.args['pwd']

    qry="insert into login values(null,'%s','%s','user')"%(username,pwd)
    print(qry)
    id=insert(qry)

    qry1="insert into user values(null,'%s','%s','%s','%s','%s','%s')"%(id,fname,lname,venumber,phone,email)
    res=insert(qry1)
    print(qry1)

    if res:
        data['status']="success"
    else :
        data['status']='failled'

    return str(data)

@api.route('/viewmessg')
def viewmessages():
    data={}
    
    logid = request.args['logid']

    qry="select * from message inner join user using(user_id) where login_id='%s'"%(logid)
    res=select(qry)
    print(res)

    if res:
        data['status']="success"
        data['data']=res
    else:
        data['status']='failed'
    data['method']="viewmessages"

    return str(data)


@api.route('/accidentdetect',methods=['get','post'])
def accidentdetect():
    data = {}
    logid = request.args['logid'] 	
    latitude = request.args['latitude']
    longitude = request.args['longitude']
    # date = request.args['date']
    # status = request.args['status']
    import datetime
    x = datetime.datetime.now()
    print(x)

    q="select * from accident where user_id=(select user_id from user where login_id='%s') and datetime like '%s'" %(logid,x)

    print(q)
    res=select(q)
    if res:
        data['status'] = 'failed'
    else:
        print("HII")
        q = "insert into accident values(null,(select user_id from user where login_id='%s'),'%s','%s','%s','Pending')" % (logid,latitude,longitude,x)
        id = insert(q)
        if id > 0:
            data['status'] = 'success'
        else:
            data['status'] = 'failed'
    data['method']="accidentdetect"
    return str(data)


# @api.route('/emergency')
# def emergency():
# 	data={}
# 	lati=request.args['lati']
# 	longi=request.args['longi']
# 	uid=request.args['uid']
# 	q="insert into emergencies values(null,(select user_id from user where loginid='%s'),'%s','%s')"%(uid,lati,longi)
# 	insert(q)
# 	data['status']='sent'
# 	return str(data)

@api.route('/upload_image',methods=['get','post'])
def upload_image():

	data={}
	image=request.files['image']
	path="static/uploads/"+str(uuid.uuid4())+image.filename
	image.save(path)
	logid=request.form['logid']
	lati=request.form['lati']
	logi=request.form['logi']

	q= "INSERT into emergencies values(null,(SELECT user_id FROM user where login_id='%s'),'emergency',now(),'pending','%s','%s','%s')"% (logid,lati,logi,path)
	print(q)
	id=insert(q)
	if id>0:
		data['status'] = 'success'
	else:
		data['status'] = 'failed'
	data['method'] = 'upload_image'
	return demjson.encode(data)


@api.route('/viewstatus')
def viewstatus():
    data={}
    
    logid = request.args['loginid']

    qry="select * from emergencies where user_id=(SELECT user_id FROM user where login_id='%s')"%(logid)
    res=select(qry)
    print(res)

    if res:
        data['status']="success"
        data['data']=res
    else:
        data['status']='failed'
    data['method']="viewstatus"

    return str(data)
