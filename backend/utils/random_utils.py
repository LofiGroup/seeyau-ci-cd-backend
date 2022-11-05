import string
import random

characters = string.ascii_letters + string.digits + string.punctuation


def generate_random_string(size: int, chars=characters):
    return ''.join(random.choice(chars) for _ in range(size))


if __name__ == "__main__":
    print("Enter password size:")
    size = int(input())

    password = generate_random_string(size)
    print(f"Generated:\n{password}")
