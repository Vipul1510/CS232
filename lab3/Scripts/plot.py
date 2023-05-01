from subprocess import Popen
import numpy as np
import matplotlib.pyplot as plt
import time
s = int(input())
for exp in range(1):
    cmd = {
        0 : "ijk",
        1 : "ikj",
        2 : "jik",
        3 : "jki",
        4 : "kij",
        5 : "kji"
    }
    clock_cycles = [[],[],[],[],[],[]]
    times = [[],[],[],[],[],[]]
    x = []

    for l in range(4, s):
        a = 2**l
        x.append(2**l)

        input_file = open("in.txt", "w")
        input_file.write(f"{a}\n{a}\n{a}\n{a}\n")
        for i in range(2*a):
            for j in range(a):
                input_file.write(f"{np.random.randint(1,10000)}\n")
        input_file.close()

        for m in range(6):
            dt_started = time.time()
            f = Popen(f"./matrix-{cmd[m]}.o < in.txt > test_{cmd[m]}-{a}.txt", shell = True)
            f.wait()
            dt_ended = time.time()
            g = open(f"test_{cmd[m]}-{a}.txt", "r")
            clock_cycles[m].append(int(g.readline()))
            times[m].append(dt_ended - dt_started)

    plt.figure(exp)
    for i in range(6):
        plt.plot(x,clock_cycles[i], label=f"{cmd[i]}")
        plt.xlabel('Size of Matrix')
        plt.ylabel('Cycles taken')
    plt.legend()
    plt.savefig(f"experiment_{exp}.png")

    plt.figure(exp+37)
    for i in range(6):
        plt.plot(x,times[i], label=f"{cmd[i]}")
        plt.xlabel('Size of Matrix')
        plt.ylabel('time taken (in seconds)')
    plt.legend()
    plt.savefig(f"time_{exp}.png")
    for i in range(6):
        print(times[i])
    