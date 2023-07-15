#import the packages required.
import random as rand
#allows for random generation
import string
#allows for string manipulation
import time
#allows for pausing, at the end we need it.
randomchar=(''.join(rand.choices(string.ascii_uppercase, k=5)))
randomnumb=(''.join(rand.choices(string.digits, k=6)))
#python is stupid and can't just generate a random string with numbers and digits, instead, we need to do this.
onlyinput =input("please enter the first 3 letters of your computers model. any other characters will be ignored.")
#get the one and only input
threeletters=str.upper(onlyinput[:3])
#get the first 3 letters. discard the rest. we don't need it.
output1 = threeletters + "-" + randomchar + randomnumb
#join our 3 letter input, a dash and our random together. then print it.
print ("your unique computer name is:", output1)
print ("this program will automatically close in 60 seconds.")
time.sleep(60)
#pause so the user can actually read it.