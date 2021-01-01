from scipy import stats
import numpy as np

printall = False

prots = "http quic".split()
abrs = "Bola Buffer_Based MPC_Fast MPC_Robust Pensieve".split()

def printstat(a, b, m, n, o):
    z = o
    p = "" if z.pvalue > 0.05 else "*"
    if 0 == len(p) or printall:
        print(a, b, z, p)

print("\nQoE\n", "="*5)
for ab in abrs:
    dt = [[float(x) for x in open("newexp/data/qoe_"+ab+"_"+p+".dat")] for p in prots]
    x = stats.ttest_ind(*dt)
    y = stats.ranksums(*dt)
    z = stats.mannwhitneyu(*dt)
    printstat(ab, prots, x, y, z)#, np.mean(dt[0]), np.mean(dt[1]), np.std(dt[0]), np.std(dt[1]))


print("\nRebuf\n", "="*5)
for ab in abrs:
    dt = [[float(x) for x in open("newexp/data/rebuf_"+ab+"_"+p+".dat")] for p in prots]
    x = stats.ttest_ind(*dt)
    y = stats.ranksums(*dt)
    z = stats.mannwhitneyu(*dt)
    printstat(ab, prots, x, y, z)#, np.mean(dt[0]), np.mean(dt[1]), np.std(dt[0]), np.std(dt[1]))


print("\nSmoothness\n", "="*5)
for ab in abrs:
    dt = [[float(x) for x in open("newexp/data/smoothness_"+ab+"_"+p+".dat")] for p in prots]
    x = stats.ttest_ind(*dt)
    y = stats.ranksums(*dt)
    z = stats.mannwhitneyu(*dt)
    printstat(ab, prots, x, y, z)#, np.mean(dt[0]), np.mean(dt[1]), np.std(dt[0]), np.std(dt[1]))


print("\nQuality\n", "="*5)
for ab in abrs:
    dt = [[float(x) for x in open("newexp/data/bitrate_"+ab+"_"+p+".dat")] for p in prots]
    x = stats.ttest_ind(*dt)
    y = stats.ranksums(*dt)
    z = stats.mannwhitneyu(*dt)
    printstat(ab, prots, x, y, z)#, np.mean(dt[0]), np.mean(dt[1]), np.std(dt[0]), np.std(dt[1]))

def getColumns(fpth, cols):
    with open(fpth) as fp:
        lins = [l.split() for l in fp if not l.startswith("#")]
        lins = [[float(l[i]) for i in cols] for l in lins]
        lins = np.array(lins).transpose()
        lins = {x: lins[i] for i,x in enumerate(cols)}
        return lins

print("\nThroughput, wait\n", "="*5)
dt = [getColumns("proof/comp/"+p +".dat", [3, 2, 1]) for p in prots]
dt1 = [d[3]*8/(d[2]-d[1]) for d in dt]
dt2 = [(d[2]-d[1]) for d in dt]
x = stats.ttest_ind(*dt1)
y = stats.ranksums(*dt1)
z = stats.mannwhitneyu(*dt1)
printstat("Throughput", prots, x, y, z)#, np.mean(dt[0]), np.mean(dt[1]), np.std(dt[0]), np.std(dt[1]))
x = stats.ttest_ind(*dt2)
y = stats.ranksums(*dt2)
z = stats.mannwhitneyu(*dt2)
w = stats.mannwhitneyu(*dt2)
printstat("wait", prots, x, y, z)#, np.mean(dt[0]), np.mean(dt[1]), np.std(dt[0]), np.std(dt[1]))

print("\nFor each interval\n")
intervals = "500 1000 2000 4000 8000".split()
for i, it in enumerate(intervals):
    dt = [getColumns("proof/uhoodM/2/"+p+".dat", [i+1])[i+1] for p in prots]
    x = stats.ttest_ind(*dt)
    y = stats.ranksums(*dt)
    z = stats.mannwhitneyu(*dt)
    printstat(it, prots, x, y, z)#, np.mean(dt[0]), np.mean(dt[1]), np.std(dt[0]), np.std(dt[1]))

print("\nFor each interval\n")
prots = "http quic2".split()
for i, it in enumerate(intervals):
    dt = [getColumns("proof/uhoodM/2/"+p+".dat", [i+1])[i+1] for p in prots]
    x = stats.ttest_ind(*dt)
    y = stats.ranksums(*dt)
    z = stats.mannwhitneyu(*dt)
    printstat(it, prots, x, y, z)#, np.mean(dt[0]), np.mean(dt[1]), np.std(dt[0]), np.std(dt[1]))


