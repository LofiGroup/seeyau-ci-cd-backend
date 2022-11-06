import string
import random

not_special_characters = "%+-./:=@_"

all_characters = string.ascii_letters + string.digits + string.punctuation
excluding_special_characters = string.ascii_letters + string.digits + not_special_characters


def generate_random_string(size: int, include_special_characters=True):
    if include_special_characters:
        chars = all_characters
    else:
        chars = excluding_special_characters
    return ''.join(random.choice(chars) for _ in range(size))


if __name__ == "__main__":
    print("Enter password size:")
    size = int(input())

    password = generate_random_string(size, False)
    print(f"Generated:\n{password}")
