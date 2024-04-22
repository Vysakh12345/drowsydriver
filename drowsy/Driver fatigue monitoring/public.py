from flask import *
from database import *

public=Blueprint('public',__name__)

@public.route('/')
def homepage():
    return render_template('homepage.html')

@public.route('/login',methods=['get','post'])
def login():
    if 'login' in request.form:
        username=request.form['username']
        password=request.form['password']
        qry="select * from login where username='%s' and password='%s'"%(username,password)
        res=select(qry)
        session['lid']=res[0]['login_id']
        if res[0]['usertype']=='admin':
            return redirect(url_for('admin.adminhome'))
        

        if res[0]['usertype']=='car':
            a="select * from user where login_id='%s'"%(session['lid'])
            res=select(a)
            session['uid']=res[0]['user_id']
            return redirect(url_for('car.carhome'))

        if res[0]['usertype']=='emergency':
            return redirect(url_for('emergency.emergencyhome'))

    return render_template('login.html')

@public.route('/user',methods=['get','post'])
def register():
    
    if 'register' in request.form:
        fnm=request.form['fname']
        lnm=request.form['lname']
        un=request.form['username']
        ps=request.form['password']
        vn=request.form['vno']
        ph=request.form['phone']
        em=request.form['email']

        qry1="insert into login values(null,'%s','%s','user')"%(un,ps)
        res=insert(qry1)

        qry="insert into user values(null,'%s','%s','%s','%s','%s','%s')"%(fnm,lnm,vn,ph,em,res)
        insert(qry)
        return '''<script>alert("Registration Successfull!");window.location="/user"</script>'''
    
    return render_template('user.html')