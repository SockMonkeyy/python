def sentenceMaker(phrase):
 
    questions = ("how", "what", "why", "when", "where", "does", "who")

    capitalized = phrase.capitalize()
 
    if phrase.startswith(questions):
     return "{}?".format(capitalized)
    else:
        return "{}.".format(capitalized)

phrases = []

while True:
    userInput = input("Say something: ").lower()
    if userInput == ".end":
        break
    else:
        phrases.append(sentenceMaker(userInput))

print(" ".join(phrases))
    
