import re
import os

root_folder_path = ".\_figure4_data"

for subdir, dirs, files in os.walk(root_folder_path):
    for foldername in dirs:
        print(foldername)
# Define the regular expression
        regex = re.compile(r"^(.*Time=......)(.*)$")

        # Find the match in the folder name
        match = regex.match(foldername)

        if match:
            # Get the parts of the folder name
            prefix = match.group(1)
            suffix = match.group(2)
            
            # Create the new folder name
            new_folder_name = root_folder_path+"\\" + suffix
            
            # Rename the folder
            os.rename(root_folder_path+"\\"+foldername, new_folder_name)
