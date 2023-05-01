import random
a=int(input('Enter matrix size '))
afile = open("Random.txt", "w" )
for i in range(4):
    line = str(a)+"\n"
    afile.write(line)   
for i in range(2*a*a):
    line = str(random.randint(1, 1000))+"\n"
    afile.write(line)

afile.close()

