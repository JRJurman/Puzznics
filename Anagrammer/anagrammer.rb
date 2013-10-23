#anagrammer.rb by Jesse Jurman
def parse(word, char='') #form a regex parsable version of the word
  word.chomp.upcase.split('').sort.join(char) end
def loadDict(dictFile, reg) # takes in a dictionary file and a block to check lines with
  res = []
  File.open(dictFile).each_line { |word| res += [word.chomp] if reg.match(parse(word)) }
  res.sort_by {|x| -x.size }
end # returns a list of valid words, reverse ordered by size (largest first)
def solve(dictFile, anagram) # takes in a filename and a string of letters (the anagram)
  filter = /^#{parse(anagram, '?')}?$/
  res = loadDict(dictFile, filter )
end # returns the largest valid word from the anagram
