from flask import render_template

from base import app

@app.route('/register/ui/')
def register_ui():
    return render_template('register.html')
