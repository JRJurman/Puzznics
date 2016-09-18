/* pseudo code

read in the list of all words
store them in a dictionary based on letters used (sorted)

greedy solution:
start by looking for a single word to substitute (from 0 to length)
bring back the end marker until we find one that works

take the end that wasn't used, and recurse
*/

/* log
start - 5:03
stop -  5:16 (laundry)
start - 5:24
first solution -  6:09
second solution - 6:42
third solution -  6:59
*/

// read files from filesystem
var fs = require('fs');

// example input
// assumption that no puncuation exists
example = "Help someone stole my purse";

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

// find anagram
function generateAnagram(word, dictionary) {
  if (word.length == 0) {
    return "";
  }

  for (var i = word.length; i > 0; i--) {
    var key = word.substring(0, i).split("").sort().join("");
    if (dictionary[key] != undefined) {
      return dictionary[key] + " " + generateAnagram(word.substring(i), dictionary);
    }
  }
  return "-- ERROR --"
}
