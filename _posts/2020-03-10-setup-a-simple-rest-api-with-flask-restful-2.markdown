---
layout: post
title: "Setup a simple rest api with Flask-RESTful (2)"
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

# Build Simple Api
### POST - create resource
- Define argument on web request
  ```Python
  from flask_restful import Resource, Api, abort, reqparse

  req_parser = reqparse.RequestParser()
  # make task mandatory
  req_parser.add_argument('task', required=True)

  ```

- Define a resource collection
  ```Python
  todos = {}

  def get_next_id(collection):
    return len(collection) + 1

  class Todos(Resource):
    def get(self):
        return todos

    def post(self):
        args = req_parser.parse_args()

        # the args is a json:
        # { "task" : "some task name" }
        task = {'task': args['task']}

        # get an unique id as the dict key
        id = get_next_id(todos)

        # add to the dict
        todos[id] = task

        # return the resource, with HTTP 201 Created
        return todos[id], 201

  ```

- Define the endpoint
  ```
  api.add_resource(Todos, '/todos/')
  ```

- Call the endpoint with curl
  ```Bash
  # -i
  # > make curl output the response
  #
  # -H "Content-Type: application/json"
  # > required for posting a json string
  #
  # -d "{\"task\":\"xyz\"}"
  # > the data to be sent
  #
  # http://localhost:5000/todos/
  # > the endpoint for creating the Resource
  #
  # * NOTE *
  # In Windows, the json string has to be double-quoted (" "),
  # so the double-quote for the json properties need to be escaped by using \"
  # ie. '{ "key" : "value"}' becomes "{\"key\":\"value\"}"
  (venv) C:\Dev\Projects\python\flask-app>curl -i -H "Content-Type: application/json" -X POST -d "{\"task\":\"my task name\"}" http://localhost:5000/todos/
  HTTP/1.0 201 CREATED
  Content-Type: application/json
  Content-Length: 22
  Server: Werkzeug/1.0.0 Python/3.7.6
  Date: Wed, 11 Mar 2020 10:37:46 GMT
  {
      "task": "my task name"
  }
  ```

### PUT - update existing resource
- TBC


# Code Snapshot
  ```Python
  from flask import Flask, escape, request
  # let import reqparse
  from flask_restful import Resource, Api, reqparse

  app = Flask(__name__)
  api = Api(app)

  # make task mandatory for the post request
  req_parser = reqparse.RequestParser()
  req_parser.add_argument('task', required=True)

  # the resource collection
  todos = {}


  def get_next_id(collection):
      return len(collection) + 1


  class Todos(Resource):
      def get(self):
          return todos

      def post(self):
          # parse the args based on what we defined before
          args = req_parser.parse_args()

          # the args is a json:
          # { "task" : "some task name" }
          task = {'task': args['task']}

          # get an unique id as the dict key
          id = get_next_id(todos)

          # add to the dict
          todos[id] = task

          # return the resource, with HTTP 201 Created
          return todos[id], 201


  # resource routing
  api.add_resource(Todos, '/todos/')


  if __name__ == '__main__':
      app.run()
  ```

# Notes
#### Get json object without RequestParser
```Python
# Accessing Json object with Flask instead of Flask-RESTful
data = request.get_json()
todos[id] = data
```

# Reference Doc
[reqparse](https://flask-restful.readthedocs.io/en/latest/reqparse.html#)
