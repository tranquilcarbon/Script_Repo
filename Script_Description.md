# Batch

## Copy_Files.bat
allows you to copy files from one location (the source) to another (the destination).
Uses Xcopy with the switches /Y (overwrites without asking), /E (copys subfolders, even if empty)

## Name_based_organizer.bat
Another AI Script. Organizes files into folders based on file name. first, it is organized into one of four folders (0 - 9, A - H, I - P, Q - Z). 

After this is done, it then sorts the files into folders With their first letter (for example, Apple.txt gets sorted into A, Cat.jpg sorted into C)
# old-broken
## Find_File_Hash.bat
A older, batch version of the find file hash script. Does the same thing but in a far more inefficient way!

## fontgen.py
earlier in 2023 i experimented using AI To generate a easy to use way to generate sample pages to show fonts in action, however, the script suffered from many problems including not actually working, I determined the project to take too much time compared to just making each page myself.

## gethashes.ps1
A older powershell file hashing script. It does the job i guess?

# Powershell
## AlphaGroupFiles.ps1
Another AI Script, this script requests a file. after this, the script will request a number. this number will be the maximum amount of files in a folder (for example  15 files per folder.) once provided, the script will then go through and get the second letter and make a folder, moving that many files into it and repeating until done. This is intended to be used in conjunction with Name_based_organizer.bat
## Delete_Folders.ps1

Specify a folder path (for example, C:\Users\Admin\Test.) After asking if you are sure, the script will then delete the folder and all contents.

## Hash_Rename
Enter a folder path, once you have entered it, the script will then go through and generate a hash checksum for each file and rename it to the hash. I used this to create a easy way to check for duplicates in my wallpapers folder.

## NewHasher.ps1
A file hashing utility, provide a folder path (for example C:\windows\) and it will go through the folder and any subfolders, hashing any files inside. Uses get-filehash and gets MD5 (insecure), SHA1 (insecure) and SHA256

## Speedtest

A few weeks ago, i was having network issues on my PC, i thought it was my router, but it turns out it was the cables, anyway, this script allows you to use speedtest-cli (Windows version) to run a speed test. it then writes to a text file showing the results. for best usage, alter the script server list located at the top of the script to lservers more close to your location.
# Python

## Random_PC_Name
Allows you to create a random computer name that conforms to windows's limits (15 characters, no special), type in your computer model and press enter. the name will be generated.

