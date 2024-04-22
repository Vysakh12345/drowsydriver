from flask import *
from public import public
from admin import admin
from car import car
from user import user

from emergency import emergency
from api import api

app=Flask(__name__)
app.secret_key="njj"

app.register_blueprint(user)
app.register_blueprint(public)
app.register_blueprint(admin)
app.register_blueprint(car)
app.register_blueprint(emergency)
app.register_blueprint(api)



app.run(debug=True,port=5002,host="0.0.0.0")   