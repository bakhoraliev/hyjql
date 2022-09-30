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

## About JQL

- [Get started with Advanced Search and JQL](https://www.atlassian.com/software/jira/guides/expand-jira/jql)
- [What is advanced searching in Jira Cloud?](https://support.atlassian.com/jira-software-cloud/docs/what-is-advanced-searching-in-jira-cloud/)
- [JQL Cheat Sheet](https://3kllhk1ibq34qk6sp3bhtox1-wpengine.netdna-ssl.com/wp-content/uploads/2017/12/atlassian-jql-cheat-sheet-2.pdf)
