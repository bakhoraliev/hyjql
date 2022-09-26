# HyJQL

JQL query builder for Hy and Python.

## What is Hy?

From [Hy](https://github.com/hylang/hy) documentation:

> Hy is a Lisp dialect that's embedded in Python. Since Hy transforms its Lisp code into Python abstract syntax tree (AST) objects, you have the whole beautiful world of Python at your fingertips, in Lisp form.

## Quickstart

There are simple queries from JQL documentation.

From hy:

```Hy
(import hyjql :as jql)

;; project == "Test"
(jql.format {:equals ["project" "Test"]})
;; project == "Test" and assignee == currentUser()
(jql.format {:and [{:equals ["project" "Test"]}
                     {:equals ["assignee" "currentUser()"]}]})
```

From Python:

```python
import hyjql as jql

# project == "Test"
jql.format({"equals": ["project" "Test"]})
# project == "Test" and assignee == currentUser()
jql.format({
  "and": [
    {"equals": ["project" "Test"]},
    {"equals": ["assignee" "currentUser()"]},
  ],
})
```

## Installation

Simply add `hyjql` as a dependency to your project:

```bash
pip install hyjql
```
