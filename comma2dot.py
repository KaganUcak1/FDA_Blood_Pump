import os

root_folder_path = ".\_vectorFieldImpellarInside"

for subdir, dirs, files in os.walk(root_folder_path):
    for filename in files:
        file_path = os.path.join(subdir, filename)
        print(file_path)
        if file_path.endswith(".txt"):
            with open(file_path, 'r') as file:
                text = file.read()
            with open(file_path, 'w') as file:
                file.write(text.replace(",", "."))
