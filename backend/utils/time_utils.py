import time

minute: int = 60000
hours: int = 60 * minute
day: int = 24 * hours
month: int = 30 * day
year: int = 365 * day


def current_time_in_millis():
    return time.time_ns() // 1_000_000
