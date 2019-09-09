from flask import render_template, jsonify, request

from base import app

@app.route('/')
def index():
    return render_template('login.html')
    
@app.route('/login/do/', methods=['POST', 'GET'])
def do_login():
    username = request.form.get('username')
    password = request.form.get('password')
    return jsonify(request.form)
