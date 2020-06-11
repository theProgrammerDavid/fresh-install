#!/usr/bin/python3
import os
import sys
fs = open("common.txt")
package_list = fs.read().strip().split("\n")
fs.close()
package_manager = None
supported_PM = ["apt", "apt-get", "pacman"]
for i in supported_PM:
    if i in sys.argv:
        package_manager = i
        break
if not package_manager:
    package_manager = input("What is your package manager? ").lower()
    if package_manager not in supported_PM:
        sys.exit("Sorry, that package manager isn't supported!")
if "--all" in sys.argv:
    final_list = package_list
else:
    final_list = []
    for i in package_list:
        choice = input(f"Do you want to install {i}? (Y/n) ")
        if choice.strip().lower() != "n":
            final_list.append(i)
print(f"These packages will now be installed...\n{', '.join(final_list)}")
if package_manager == "apt" or package_manager == "apt-get":
    os.system("sudo apt update")
    for i in final_list:
        os.system(f"sudo {package_manager} install -y {i}")
elif package_manager == "pacman":
    os.system("sudo pacman -Sy")
    for i in final_list:
        os.system(f"sudo {package_manager} -S {i} --noconfirm")
print("Done!")
