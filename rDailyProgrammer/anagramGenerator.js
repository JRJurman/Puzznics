/* pseudo code

read in the list of all words
store them in a dictionary based on letters used (sorted)

split down the middle, (our anagram builder only generates two words)
find a word with the first set of letters (sorted)
find a word with the second set of letters (sorted)

if no word exists, run the function on that half (recursion)
*/

/* log
start - 5:03
stop -  5:16 (laundry)
start - 5:24
first solution - 6:09
*/

// read files from filesystem
var fs = require('fs');

// example input
// assumption that no puncuation exists
// example = "The Morse Code";

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
  for (var splitIndex = 0; splitIndex < prepExample.length; splitIndex++) {
    console.log(generateAnagram(prepExample, splitIndex, dictionary));
  }
});

// function to transform a word into two words with the same letters
function generateAnagram(word, split, dictionary) {

  // prep word for processing

  // split the word in half
  var leftSplit = word.substring(0, split);
  var rightSplit = word.substring(split);

  // sort both words by letters, to be used in the dictionary
  var leftKey = leftSplit.split("").sort().join("");
  var rightKey = rightSplit.split("").sort().join("");

  // use the keys to see if there are words we can use
  var leftValue = dictionary[leftKey];
  var rightValue = dictionary[rightKey];

  // if either were undefined, we can't make an anagram with this split
  if (leftValue == undefined || rightValue == undefined) {
    return false
  }

  return leftValue + " " + rightValue;

}
