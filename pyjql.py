class field:
    """
    JQL lets you search for a value in a specific field.
    Each field in Jira has a corresponding JQL name.
    """
    def __init__(self, name: str):
        self.__name = name

    def __getattr__(self, name: str) -> "field":
        return field(f"{self.__name}.{name}")

    def __getitem__(self, key: str) -> "field":
        return field(f"{self.__name}[{key}]")

    def __str__(self) -> str:
        return self.__name

    def __repr__(self) -> str:
        return self.__str__()


class function:
    """
    Function in JQL appears as a word followed by parentheses,
    which may contain one or more explicit values or Jira fields.
    """
    def __init__(self, name: str, *args):
        self.__name = name
        self.__args = args

    def __str__(self) -> str:
        args = filter(lambda arg: arg is not None, self.__args)
        return f"{self.__name}({', '.join(args)})"

    def __repr__(self) -> str:
        return self.__str__()


class keyword:
    """
    Keyword in JQL is a word or phrase that does (or is) any of the following:
        - joins two or more clauses together to form a complex JQL query
        - alters the logic of one or more clauses
        - alters the logic of operators
        - has an explicit definition in a JQL query
        - performs a specific function that alters the results of a JQL query
    """
    def __init__(self, keyword: str, left, right):
        self.__keyword = keyword
        self.__left = left
        self.__right = right

    def __str__(self) -> str:
        return f"{self.__left} {self.__keyword} {self.__right}".strip()


class operator:
    """
    Operator in JQL is one or more symbols or words,
    which compares the value of a field on its left with one or more values (or functions) on its right,
    such that only true results are retrieved by the clause.
    """
    def __init__(self, operator: str, left: field, right: int | str | function | None):
        self.__operator = operator
        self.__left = left
        self.__right = right

    def __str__(self) -> str:
        return f"{self.__left} {self.__operator} {self.__right}".strip()

    def __repr__(self) -> str:
        return self.__str__()


__all__ = [
    "field",
    "function",
    "keyword",
    "operator",
]
