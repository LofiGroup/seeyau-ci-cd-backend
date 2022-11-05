import string
import random

characters = string.ascii_letters + string.digits + string.punctuation


def generate_random_string(size: int, chars=characters):
    return ''.join(random.choice(chars) for _ in range(size))
