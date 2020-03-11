---
layout: post
title: "Setup a simple web with Flask (1)"
date: "2020-03-10 22:36:17 +0800"
categories: notes flask
---
# Environemnt
- Windows 10
- Pycharm 2019.3.3
- Python 3.7.8

# Lib
- Flask 1.1.1

# The project
```
flask-app
 |- venv
 |- app.py
```

# Setup
- Start new project named flask-app
- Create new virtual environment using Python 3.7
- Install Flask
- Freeze requirements
    `pip freeze > ./requirements.txt`

# Create the sample app
- Add new Python file `app.py` as entry point
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

# Start from Terminal
- Setup environment in Terminal
  ```
  (venv) ~\flask-app > set FLASK_APP=app.py
  (venv) ~\flask-app > set FLASK_ENV=development
  ```
- Run the app
  ```
  (venv) ~\flask-app > flask run

  * Serving Flask app "app.py" (lazy loading)
  * Environment: development
  * Debug mode: on
  * Restarting with stat
  * Debugger is active!
  * Debugger PIN: 236-829-430
  * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
  ```

# Start from PyCharm
- Setup environment from Run/Debug config:
  `environment variables: FLASK_ENV=development`

- Right-click app.py > select `Run 'app'` or `Debug 'app'`

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
