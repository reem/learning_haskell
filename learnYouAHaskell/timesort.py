import numpy.random as nprnd

def main():
    rlist = nprnd.randint(10**7, size=10**7)
    slist = sorted(rlist)
    print "Done."

if __name__ == '__main__':
    main()
