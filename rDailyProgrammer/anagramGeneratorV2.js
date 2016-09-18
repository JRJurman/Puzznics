/* pseudo code

read in the list of all words
store them in a dictionary based on letters used (sorted)

split the word by groups of 4 characters
sort the characters for each group,
  and see if they can be used as keys in the dictionary

if none are undefined, return the result, joined by spaces
otherwise, return false
*/

/* log
start - 5:03
stop -  5:16 (laundry)
start - 5:24
first solution -  6:09
second solution - 6:42
third solution -
*/

// read files from filesystem
var fs = require('fs');

// example input
// assumption that no puncuation exists
example = "The Morse Code";

// read in the dictionary of words
fs.readFile('./dictionary.txt', function(err, data){
  var dictionary = data.toString().split("\r\n").reduce(function(dict, word) {
    var newEntry = {};
    newEntry[word.split("").sort().join("")] = word;
    // ignore the fact that we have collisions
    // it's not important for this solution
    return Object.assign(dict, newEntry);
  }, {});

  // prep example by making it all uppercase, and removing spaces
  var prepExample = example.toUpperCase().split(" ").join("");
  console.log(generateAnagram(prepExample, dictionary));
});

// function to split word into groups of characters that are less than 5 long
function splitIntoGroups(word) {
  if (word.length <= 6) {
    return [word];
  }
  if (word.length > 6) {
    var leftSplit = splitIntoGroups(word.substring(0, word.length/2));
    var rightSplit = splitIntoGroups(word.substring(word.length/2));
    return [].concat(leftSplit).concat(rightSplit);
  }
}

// function to transform a word into two words with the same letters
function generateAnagram(word, dictionary) {
  var wordGroups = splitIntoGroups(word);
  return wordGroups.reduce(function(finalAnagram, group) {
    var key = group.split("").sort().join("");
    var anagram = dictionary[key];
    if (anagram == undefined) { anagram = "-- ERROR --"}
    return finalAnagram.concat(anagram);
  }, []).join(" ");
}
