---
layout: post
title: "Setup a simple web with Flask (2) - Simple html template"
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
 |- templates
    |- hello.html
 |- venv
 |- app.py
```

# Create html templates
- Add a `templates` directory
- Add a new Hello.html in `templates`
  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Title</title>
  </head>
  <body>
  {% if name %}
      <h1>Hello, {{ name }}</h1>
  {% else %}
      <h1>Hello, World!</h1>
  {% endif %}
  </body>
  </html>
  ```

# Create the route
### Route with query params
  ```Python
  # import render_template
  from flask import Flask, request, render_template

  @app.route('/hello')
  def hello():
    # get query param 'name'
    name = request.args.get("name")
    return render_template('hello.html', name=name)
  ```
  ```
  # Default value
  http://127.0.0.1:5000/hello
  > Hello, World!

  # Endpoint route is not used. Use default value
  http://127.0.0.1:5000/hello/JOHN
  > Hello, World!

  # Use query param
  http://127.0.0.1:5000/hello?name=JOHN
  > Hello, JOHN
  ```
### Route with endpoint route
  ```Python
  @app.route('/hello')
  @app.route('/hello/<name>')
  def hello(name=None):
    return render_template('hello.html', name=name)
  ```
  ```
  # Default value
  http://127.0.0.1:5000/hello
  > Hello, World!

  # Use the endpoint route /JOHN
  http://127.0.0.1:5000/hello/JOHN
  > Hello, JOHN

  # Query param is not handled. Use default value
  http://127.0.0.1:5000/hello?name=JOHN
  > Hello, World!
  ```
