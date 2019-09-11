from flask import render_template, request, jsonify

from base import app
from dao import userDao
from model import User


@app.route('/register/ui/')
def register_ui():
    return render_template('register.html')


@app.route('/register/validate_name', methods=['POST'])
def validate_name():
    name = request.form.get('username')
    user = userDao.select_by_name(name)
    ret = {}
    if user is not None:
        ret['ifExisted'] = True
    else:
        ret['ifExisted'] = False
    return jsonify(ret)


@app.route('/register/do/', methods=['POST'])
def register_do():
   username = request.form.get("username")
   password = request.form.get("password")
   if username is not None and password is not None:
        user = User()
        user.name = username
        user.password = password
        userDao.insert(user)
   return jsonify({"succeed":True})
