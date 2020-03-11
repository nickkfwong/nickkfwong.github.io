---
layout: post
title: "Setup a simple rest api with Flask-RESTful (1)"
date: "2020-03-10 22:36:17 +0800"
categories: notes flask
---
# Environemnt
- Windows 10
- Pycharm 2019.3.3
- Python 3.7.8

# Lib
- Flask 1.1.1
- Flask-RESTful 0.3.8

# The project
```
flask-app
 |- venv
 |- app.py
```

# Setup
- Install Flask-RESTful
- Freeze requirements
    `pip freeze > ./requirements.txt`

# Add Api
- Create Api
  ```Python
  app = Flask(__name__)
  # Create the api from app #
  api = Api(app)
  ```
- Define a resource with a GET method
  ```Python
  # Return a 200 response in json
  # { 'message' : 'HELLO WOLRD' }
  class HelloWorld(Resource):
    def get(self):
        return {'message': 'HELLO WORLD'}
  ```

- Define the route to the resource
  ```Python
  # Route the endpoint /HelloWorld to the HelloWolrd Resource
  api.add_resource(HelloWorld, '/HelloWorld')
  ```

# Code Snapshot
  ```Python
  from flask import Flask, escape, request
  from flask_restful import Resource, Api

  # setup
  app = Flask(__name__)
  api = Api(app)

  # resource
  class HelloWorld(Resource):
      def get(self):
          return {'message': 'HELLO WORLD'}


  # route
  api.add_resource(HelloWorld, '/HelloWorld')

  if __name__ == '__main__':
      app.run()
  ```
