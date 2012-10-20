""" http://www.reddit.com/r/dailyprogrammer/comments/10l8ay/9272012_challenge_101_easy_nonrepeating_years/ """

"""This challenge comes to us from user skeeto
Write a program to count the number years in an inclusive 
range of years that have no repeated digits. For example, 
2012 has a repeated digit (2) while 2013 does not. Given 
the range [1980, 1987], your program would return 7 (1980, 
1982, 1983, 1984, 1985, 1986, 1987). Bonus: Compute the longest 
run of years of repeated digits and the longest run of years 
of non-repeated digits for [1000, 2013]."""

""" yearCheck - takes in two ints, and returns 
the years that have non repeating characters """
def yearCheck(startYear, endYear):
    res = []
    for year in range(startYear, endYear+1):
        yearStr = str(year)
        if not charCheck(yearStr):
            res.append(year)
    return res
    
""" charCheck - takes in a string and checks if 
there are duplicate characters
returns True if duplicates exists """
def charCheck(pString):
    check = False
    for i in range(len(pString)):
          check = pString[i] in pString[i+1:]
          if (check):
              break
    return check

print(yearCheck(1980, 1987))
print(yearCheck(1900, 2000))