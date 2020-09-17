import os

abrs = "bola pensieve fmpc rmpc".split()
powerlow = "PowerEnvEnergy.dat PowerMeasureEnergy.dat".split()
legends = "BOLA Pensieve F-MPC R-MPC".split()

maxD = 0
minD = None
duration = None

datas = []
for i, a in enumerate(abrs):
    dt = []
    for j, b in enumerate(powerlow):
        with open(os.path.join(a, b)) as fp:
            line = fp.readline().strip().split()
            p = float(line[1])
            d = float(line[4])
            dt += [p]
            maxD = p if p > maxD else maxD
            minD = p if minD is None or p < minD else minD
            duration = d if duration is None else duration
            assert duration == d
    datas += [[legends[i]] + dt]

spj = duration/minD
extPlayTime = spj*(maxD-minD)
datas = [["EnDASH", minD, extPlayTime]]
for i, a in enumerate(abrs):
    dt = []
    b = powerlow[1]
    with open(os.path.join(a, b)) as fp:
        p = float(fp.readline().strip().split()[1])
        dt += [p]
        spj = duration/p
        extPlayTime = spj*(maxD-p)
        dt += [extPlayTime]
        datas += [[legends[i]] + dt]

print(duration)

with open("EnergyConsumption.dat", "w") as fp:
    for x in datas:
        print(*x, file=fp)
