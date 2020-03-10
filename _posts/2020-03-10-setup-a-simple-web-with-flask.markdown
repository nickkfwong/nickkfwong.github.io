---
layout: post
title: "Setup a simple web with Flask"
date: "2020-03-10 22:36:17 +0800"
---
# Environemnt
- Python 3.7.8
- Pycharm 2019.3.3
- Flask 1.1.1

# Setup project
- Start New Project
> flask-app

- Create new virtual environment using Python 3.7
> flask-app
> |- venv

- Install Flask
- Freeze requirements
    `pip freeze > ./requirement.txt`

# Create the sample app
- Add new entry point app.py
> flask-app
> |- venv
> |- app.py

- Add sample code
  ```Python
  from flask import Flask, escape, request

  app = Flask(__name__)


  @app.route('/')
  def hello():
      name = request.args.get("name", "World")
      return f'Hello, {escape(name)}!'


  if __name__ == '__main__':
      app.run()

  ```

- Start the app in Terminal
  ```
  (venv) ~\flask-app > set FLASK_APP=app.py
  (venv) ~\flask-app > set FLASK_ENV=development
  (venv) ~\flask-app > flask run

  * Serving Flask app "app.py" (lazy loading)
  * Environment: development
  * Debug mode: on
  * Restarting with stat
  * Debugger is active!
  * Debugger PIN: 236-829-430
  * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
  ```

- Start the app in PyCharm
  > Run/Debug config setup: 
  > `environment variables: FLASK_ENV=development`
  ```
  C:\Dev\Projects\python\flask-app\venv\Scripts\python.exe C:/Dev/Projects/python/flask-app/app.py
  * Serving Flask app "app" (lazy loading)
  * Environment: development
  * Debug mode: on
  * Restarting with stat
  * Debugger is active!
  * Debugger PIN: 291-607-367
  * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
  ```
