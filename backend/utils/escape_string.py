chars_to_escape = ["\"", "$", "\\", "`"]


def escape(string: str) -> str:
    result = ""

    for char in string:
        if char in chars_to_escape:
            result += f"\\{char}"
        else:
            result += char
    return result


if __name__ == "__main__":
    print("Print the string to escape")
    result = escape(input())
    print(result)

