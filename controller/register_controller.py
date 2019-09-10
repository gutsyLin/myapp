from flask import render_template, request, jsonify

from base import app

@app.route('/register/ui/')
def register_ui():
    return render_template('register.html')

@app.route('/register/validate_name')
def validate_name():
    name = request.form.get('username')
    return jsonify(name)
