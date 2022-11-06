import string
import random


not_special_characters = "%+-./:=@_"

all_characters = string.ascii_letters + string.digits + string.punctuation
excluding_special_characters = string.ascii_letters + string.digits + not_special_characters
letters_and_digits = string.ascii_letters + string.digits


def generate_random_string(size: int, chars=excluding_special_characters):
    return ''.join(random.choice(chars) for _ in range(size))


if __name__ == "__main__":
    print("Enter password size:")
    size = int(input())

    print(
"""
Choose character set:
1) All characters
2) Exclude special characters(default)
3) Letters and digits
"""
    )

    option = input()
    match option:
        case "1":
            chars = all_characters
        case "3":
            chars = letters_and_digits
        case _:
            chars = excluding_special_characters

    password = generate_random_string(size, chars)
    print(f"Generated:\n{password}")
