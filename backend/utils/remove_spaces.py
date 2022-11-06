def remove_spaces(string: str) -> str:
    result = ""
    for char in string:
        if char != " ":
            result += char

    return result


if __name__ == "__main__":
    print("Print the string")
    result = remove_spaces(input())
    print(result)
