import string
import random

all_characters = string.ascii_letters + string.digits + string.punctuation
only_digits_and_letters = string.ascii_letters + string.digits


def generate_random_string(size: int, include_punctuations=True):
    if include_punctuations:
        chars = all_characters
    else:
        chars = only_digits_and_letters
    return ''.join(random.choice(chars) for _ in range(size))


if __name__ == "__main__":
    print("Enter password size:")
    size = int(input())

    password = generate_random_string(size)
    print(f"Generated:\n{password}")
