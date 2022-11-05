from fastapi import UploadFile


def save_file(file_name: str, file: UploadFile) -> str:
    file_location = f"static/{file_name}"
    with open(file_location, "wb+") as file_object:
        file_object.write(file.file.read())

    return file_name
