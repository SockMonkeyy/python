## opening and closing a text file and reading the contents

# f = open("python/basics/lst.txt")
# content = f.read()
# f.close()
# print(content)


# # # opening and closing a text file and reading the contents ***f.close() not
# # # not required when **with as**
# with open("python/bear.txt", "w") as f:
#     content = f.write("The American black bear (Ursus americanus) is a medium-sized bear native to North America. It is the continent's smallest and most widely distributed bear species. American black bears are omnivores, with their diets varying greatly depending on season and location. They typically live in largely forested areas, but do leave forests in search of food. Sometimes they become attracted to human communities because of the immediate availability of food. The American black bear is the world's most common bear species.")
# print(content)


# # Printing a specified amount of characters from a txt file
# with open("bear.txt") as f:
#     content = f.read(90)
# print(content)

# # returns the number of occurences in a file

# def foo(character, filepath="python/parts.txt"):
#     f = open(filepath)
#     content = f.read()
#     return content.count(character)

# foo("o", "python/parts.txt" )


# # # Copying the first 90 characters of one txt file to another txt file
# with open("python/bear.txt") as f:
#     content = f.read(90)
#     with open("python/bear2.txt", "w") as file:
#         content2 = file.write(f"\n{content}")
# print(content2)


# # #  Adding the  characters of one txt file to another txt file
# with open("python/bear.txt") as f:
#     content = f.read()
#     with open("python/bear2.txt", "a") as file:
#         content2 = file.write(f"\n{content}")
# print(content2)

import time
# # # Adding data to a list
with open("python/data.txt", "a+") as file:
    file.seek(0)
    content = file.read()
    file.seek(0)
    file.write(content)
    print(content)
    # time.sleep(10)
    # print(content)
    # file.write(content)
    # time.sleep(10)
    # print(content)
    # file.write(content)
 

#  # Cheatsheet: File Processing
# In this section, you learned that:

# You can read an existing file with Python:

# with open("file.txt") as file:
#     content = file.read()
# You can create a new file with Python and write some text on it:

# with open("file.txt", "w") as file:
#     content = file.write("Sample text")
# You can append text to an existing file without overwriting it:

# with open("file.txt", "a") as file:
#     content = file.write("More sample text")
# You can both append and read a file with:

# with open("file.txt", "a+") as file:
#     content = file.write("Even more sample text")
#     file.seek(0)
#     content = file.read()